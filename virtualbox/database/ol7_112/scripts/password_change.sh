function password_change {
  USERNAME=$1
  PASSWORD=$2

  # Change the password
  echo -e "$PASSWORD\n$PASSWORD" | passwd "$USERNAME"
  if [ $? -eq 0 ]; then
     echo "Password for user '$USERNAME' changed successfully."
  else
     echo "Failed to change password for user '$USERNAME'."
  fi
}

password_change root Nithin#0712
password_change oracle oracle

