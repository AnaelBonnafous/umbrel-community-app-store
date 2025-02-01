GLUETUN_ENV_FILE="${EXPORTS_APP_DIR}/.env"

if [[ ! -f "${GLUETUN_ENV_FILE}" ]]; then
	if [[ -z "${VPN_SERVICE_PROVIDER}" ]]; then
    VPN_SERVICE_PROVIDER="ivpn"
  fi

  if [[ -z "${VPN_TYPE}" ]]; then
    VPN_TYPE="openvpn"
  fi

  if [[ "${VPN_TYPE}" == "openvpn" ]]; then
    if [[ -z ${OPENVPN_USER+x} ]] || [[ -z ${OPENVPN_PASSWORD+x} ]]; then
      OPENVPN_USER=""
      OPENVPN_PASSWORD=""
    fi
  elif [[ "${VPN_TYPE}" == "wireguard" ]]; then
    if [[ -z ${WIREGUARD_PRIVATE_KEY+x} ]] || [[ -z ${WIREGUARD_ADDRESSES+x} ]]; then
      WIREGUARD_PRIVATE_KEY="wOEI9rqqbDwnN8/Bpp22sVz48T71vJ4fYmFWujulwUU="
      WIREGUARD_ADDRESSES="10.64.222.21/32"
    fi
  fi

  echo "export APP_VPN_SERVICE_PROVIDER='${VPN_SERVICE_PROVIDER}'"		>  "${GLUETUN_ENV_FILE}"
  echo "export APP_VPN_TYPE='${VPN_TYPE}'"                            >> "${GLUETUN_ENV_FILE}"
  echo "export APP_OPENVPN_USER='${OPENVPN_USER}'"                    >> "${GLUETUN_ENV_FILE}"
  echo "export APP_OPENVPN_PASSWORD='${OPENVPN_PASSWORD}'"	          >> "${GLUETUN_ENV_FILE}"
  echo "export APP_WIREGUARD_PRIVATE_KEY='${WIREGUARD_PRIVATE_KEY}'"	>> "${GLUETUN_ENV_FILE}"
  echo "export APP_WIREGUARD_ADDRESSES='${WIREGUARD_ADDRESSES}'"	    >> "${GLUETUN_ENV_FILE}"
fi

. "${GLUETUN_ENV_FILE}"