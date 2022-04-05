Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E194F3C67
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:44:12 +0200 (CEST)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nblLn-0007Is-DB
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nblFB-00015m-Jg
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:37:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nblF8-0004fN-EV
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:37:21 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 92CDC20770;
 Tue,  5 Apr 2022 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649173036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wC5bjALiPPU6isNhpWWxsJ4yFKh4yzdsR8cbsaGgJBI=;
 b=D29VACQwCvhBVHW/RwMN2/c2cEuvLy8BPZAlyGa2aCzgQ+twlHmsu7YkeJFmxfngmlpN7n
 hiRaGbCZ9wNZORy2Dep7Eo7oOXYsyoP1Uh03WKCKFwDYDHiKzKz3h0HWpRs0VQXCTN9XbE
 HtbzMSIJOboHW0xSfD6RCo2vOxGc0vI=
Message-ID: <4aa036b5-e1c0-e7bf-3213-0ca1322042d5@greensocs.com>
Date: Tue, 5 Apr 2022 17:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs/ccid: convert to restructuredText
Content-Language: en-US-large
To: oxr463@gmx.us, qemu-devel@nongnu.org
References: <20220405142906.21382-1-oxr463@gmx.us>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220405142906.21382-1-oxr463@gmx.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Lucas Ramage <lucas.ramage@infinite-omicron.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/5/22 16:29, oxr463@gmx.us wrote:
> From: Lucas Ramage <lucas.ramage@infinite-omicron.com>
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
> Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>

Provided 2 minors tweaks (see below: missing empty line, and empty line 
at EOF),
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Note that I'm not competent regarding the content of this doc. But it 
corresponds to the previous version and the doc generation works.

> ---
>   docs/ccid.txt                    | 182 -------------------------------
>   docs/system/device-emulation.rst |   1 +
>   docs/system/devices/ccid.rst     | 171 +++++++++++++++++++++++++++++
>   3 files changed, 172 insertions(+), 182 deletions(-)
>   delete mode 100644 docs/ccid.txt
>   create mode 100644 docs/system/devices/ccid.rst
> 
> diff --git a/docs/ccid.txt b/docs/ccid.txt
> deleted file mode 100644
> index 2b85b1bd42..0000000000
> --- a/docs/ccid.txt
> +++ /dev/null
> @@ -1,182 +0,0 @@
> -QEMU CCID Device Documentation.
> -
> -Contents
> -1. USB CCID device
> -2. Building
> -3. Using ccid-card-emulated with hardware
> -4. Using ccid-card-emulated with certificates
> -5. Using ccid-card-passthru with client side hardware
> -6. Using ccid-card-passthru with client side certificates
> -7. Passthrough protocol scenario
> -8. libcacard
> -
> -1. USB CCID device
> -
> -The USB CCID device is a USB device implementing the CCID specification, which
> -lets one connect smart card readers that implement the same spec. For more
> -information see the specification:
> -
> - Universal Serial Bus
> - Device Class: Smart Card
> - CCID
> - Specification for
> - Integrated Circuit(s) Cards Interface Devices
> - Revision 1.1
> - April 22rd, 2005
> -
> -Smartcards are used for authentication, single sign on, decryption in
> -public/private schemes and digital signatures. A smartcard reader on the client
> -cannot be used on a guest with simple usb passthrough since it will then not be
> -available on the client, possibly locking the computer when it is "removed". On
> -the other hand this device can let you use the smartcard on both the client and
> -the guest machine. It is also possible to have a completely virtual smart card
> -reader and smart card (i.e. not backed by a physical device) using this device.
> -
> -2. Building
> -
> -The cryptographic functions and access to the physical card is done via the
> -libcacard library, whose development package must be installed prior to
> -building QEMU:
> -
> -In redhat/fedora:
> -    yum install libcacard-devel
> -In ubuntu:
> -    apt-get install libcacard-dev
> -
> -Configuring and building:
> -    ./configure --enable-smartcard && make
> -
> -
> -3. Using ccid-card-emulated with hardware
> -
> -Assuming you have a working smartcard on the host with the current
> -user, using libcacard, QEMU acts as another client using ccid-card-emulated:
> -
> -    qemu -usb -device usb-ccid -device ccid-card-emulated
> -
> -
> -4. Using ccid-card-emulated with certificates stored in files
> -
> -You must create the CA and card certificates. This is a one time process.
> -We use NSS certificates:
> -
> -    mkdir fake-smartcard
> -    cd fake-smartcard
> -    certutil -N -d sql:$PWD
> -    certutil -S -d sql:$PWD -s "CN=Fake Smart Card CA" -x -t TC,TC,TC -n fake-smartcard-ca
> -    certutil -S -d sql:$PWD -t ,, -s "CN=John Doe" -n id-cert -c fake-smartcard-ca
> -    certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (signing)" --nsCertType smime -n signing-cert -c fake-smartcard-ca
> -    certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (encryption)" --nsCertType sslClient -n encryption-cert -c fake-smartcard-ca
> -
> -Note: you must have exactly three certificates.
> -
> -You can use the emulated card type with the certificates backend:
> -
> -    qemu -usb -device usb-ccid -device ccid-card-emulated,backend=certificates,db=sql:$PWD,cert1=id-cert,cert2=signing-cert,cert3=encryption-cert
> -
> -To use the certificates in the guest, export the CA certificate:
> -
> -    certutil -L -r -d sql:$PWD -o fake-smartcard-ca.cer -n fake-smartcard-ca
> -
> -and import it in the guest:
> -
> -    certutil -A -d /etc/pki/nssdb -i fake-smartcard-ca.cer -t TC,TC,TC -n fake-smartcard-ca
> -
> -In a Linux guest you can then use the CoolKey PKCS #11 module to access
> -the card:
> -
> -    certutil -d /etc/pki/nssdb -L -h all
> -
> -It will prompt you for the PIN (which is the password you assigned to the
> -certificate database early on), and then show you all three certificates
> -together with the manually imported CA cert:
> -
> -    Certificate Nickname                        Trust Attributes
> -    fake-smartcard-ca                           CT,C,C
> -    John Doe:CAC ID Certificate                 u,u,u
> -    John Doe:CAC Email Signature Certificate    u,u,u
> -    John Doe:CAC Email Encryption Certificate   u,u,u
> -
> -If this does not happen, CoolKey is not installed or not registered with
> -NSS.  Registration can be done from Firefox or the command line:
> -
> -    modutil -dbdir /etc/pki/nssdb -add "CAC Module" -libfile /usr/lib64/pkcs11/libcoolkeypk11.so
> -    modutil -dbdir /etc/pki/nssdb -list
> -
> -
> -5. Using ccid-card-passthru with client side hardware
> -
> -on the host specify the ccid-card-passthru device with a suitable chardev:
> -
> -    qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
> -         -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
> -
> -on the client run vscclient, built when you built QEMU:
> -
> -    vscclient <qemu-host> 2001
> -
> -
> -6. Using ccid-card-passthru with client side certificates
> -
> -This case is not particularly useful, but you can use it to debug
> -your setup if #4 works but #5 does not.
> -
> -Follow instructions as per #4, except run QEMU and vscclient as follows:
> -Run qemu as per #5, and run vscclient from the "fake-smartcard"
> -directory as follows:
> -
> -    qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
> -         -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
> -    vscclient -e "db=\"sql:$PWD\" use_hw=no soft=(,Test,CAC,,id-cert,signing-cert,encryption-cert)" <qemu-host> 2001
> -
> -
> -7. Passthrough protocol scenario
> -
> -This is a typical interchange of messages when using the passthru card device.
> -usb-ccid is a usb device. It defaults to an unattached usb device on startup.
> -usb-ccid expects a chardev and expects the protocol defined in
> -cac_card/vscard_common.h to be passed over that.
> -The usb-ccid device can be in one of three modes:
> - * detached
> - * attached with no card
> - * attached with card
> -
> -A typical interchange is: (the arrow shows who started each exchange, it can be client
> -originated or guest originated)
> -
> -client event      |      vscclient           |    passthru    |     usb-ccid  |  guest event
> -----------------------------------------------------------------------------------------------
> -                  |      VSC_Init            |                |               |
> -                  |      VSC_ReaderAdd       |                |     attach    |
> -                  |                          |                |               |  sees new usb device.
> -card inserted ->  |                          |                |               |
> -                  |      VSC_ATR             |   insert       |     insert    |  see new card
> -                  |                          |                |               |
> -                  |      VSC_APDU            |   VSC_APDU     |               | <- guest sends APDU
> -client<->physical |                          |                |               |
> -card APDU exchange|                          |                |               |
> -client response ->|      VSC_APDU            |   VSC_APDU     |               |  receive APDU response
> -                                                    ...
> -                                    [APDU<->APDU repeats several times]
> -                                                    ...
> -card removed  ->  |                          |                |               |
> -                  |      VSC_CardRemove      |   remove       |    remove     |   card removed
> -                                                    ...
> -                                    [(card insert, apdu's, card remove) repeat]
> -                                                    ...
> -kill/quit         |                          |                |               |
> -  vscclient       |                          |                |               |
> -                  |      VSC_ReaderRemove    |                |    detach     |
> -                  |                          |                |               |   usb device removed.
> -
> -
> -8. libcacard
> -
> -Both ccid-card-emulated and vscclient use libcacard as the card emulator.
> -libcacard implements a completely virtual CAC (DoD standard for smart
> -cards) compliant card and uses NSS to retrieve certificates and do
> -any encryption.  The backend can then be a real reader and card, or
> -certificates stored in files.
> -
> -For documentation of the library see docs/libcacard.txt.
> -
> diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
> index 0b3a3d73ad..ae8dd233e8 100644
> --- a/docs/system/device-emulation.rst
> +++ b/docs/system/device-emulation.rst
> @@ -83,6 +83,7 @@ Emulated Devices
>      :maxdepth: 1
> 
>      devices/can.rst
> +   devices/ccid.rst
>      devices/ivshmem.rst
>      devices/net.rst
>      devices/nvme.rst
> diff --git a/docs/system/devices/ccid.rst b/docs/system/devices/ccid.rst
> new file mode 100644
> index 0000000000..0290265a18
> --- /dev/null
> +++ b/docs/system/devices/ccid.rst
> @@ -0,0 +1,171 @@
> +Chip Card Interface Device (CCID)
> +=================================
> +
> +USB CCID device
> +---------------
> +The USB CCID device is a USB device implementing the CCID specification, which
> +lets one connect smart card readers that implement the same spec. For more
> +information see the specification::
> +
> +  Universal Serial Bus
> +  Device Class: Smart Card
> +  CCID
> +  Specification for
> +  Integrated Circuit(s) Cards Interface Devices
> +  Revision 1.1
> +  April 22rd, 2005
> +
> +Smartcards are used for authentication, single sign on, decryption in
> +public/private schemes and digital signatures. A smartcard reader on the client
> +cannot be used on a guest with simple usb passthrough since it will then not be
> +available on the client, possibly locking the computer when it is "removed". On
> +the other hand this device can let you use the smartcard on both the client and
> +the guest machine. It is also possible to have a completely virtual smart card
> +reader and smart card (i.e. not backed by a physical device) using this device.
> +
> +Building
> +--------
> +The cryptographic functions and access to the physical card is done via the
> +libcacard library, whose development package must be installed prior to
> +building QEMU:
> +
> +In redhat/fedora::
> +
> +  yum install libcacard-devel
> +
> +In ubuntu::
> +
> +  apt-get install libcacard-dev
> +
> +Configuring and building::
> +
> +  ./configure --enable-smartcard && make
> +
> +Using ccid-card-emulated with hardware
> +--------------------------------------
> +Assuming you have a working smartcard on the host with the current
> +user, using libcacard, QEMU acts as another client using ccid-card-emulated::
> +
> +  qemu -usb -device usb-ccid -device ccid-card-emulated
> +
> +Using ccid-card-emulated with certificates stored in files
> +----------------------------------------------------------
> +You must create the CA and card certificates. This is a one time process.
> +We use NSS certificates::
> +
> +  mkdir fake-smartcard
> +  cd fake-smartcard
> +  certutil -N -d sql:$PWD
> +  certutil -S -d sql:$PWD -s "CN=Fake Smart Card CA" -x -t TC,TC,TC -n fake-smartcard-ca
> +  certutil -S -d sql:$PWD -t ,, -s "CN=John Doe" -n id-cert -c fake-smartcard-ca
> +  certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (signing)" --nsCertType smime -n signing-cert -c fake-smartcard-ca
> +  certutil -S -d sql:$PWD -t ,, -s "CN=John Doe (encryption)" --nsCertType sslClient -n encryption-cert -c fake-smartcard-ca
> +
> +Note: you must have exactly three certificates.
> +
> +You can use the emulated card type with the certificates backend::
> +
> +  qemu -usb -device usb-ccid -device ccid-card-emulated,backend=certificates,db=sql:$PWD,cert1=id-cert,cert2=signing-cert,cert3=encryption-cert
> +
> +To use the certificates in the guest, export the CA certificate::
> +
> +  certutil -L -r -d sql:$PWD -o fake-smartcard-ca.cer -n fake-smartcard-ca
> +
> +and import it in the guest::
> +
> +  certutil -A -d /etc/pki/nssdb -i fake-smartcard-ca.cer -t TC,TC,TC -n fake-smartcard-ca
> +
> +In a Linux guest you can then use the CoolKey PKCS #11 module to access
> +the card::
> +
> +  certutil -d /etc/pki/nssdb -L -h all
> +
> +It will prompt you for the PIN (which is the password you assigned to the
> +certificate database early on), and then show you all three certificates
> +together with the manually imported CA cert::
> +
> +  Certificate Nickname                        Trust Attributes
> +  fake-smartcard-ca                           CT,C,C
> +  John Doe:CAC ID Certificate                 u,u,u
> +  John Doe:CAC Email Signature Certificate    u,u,u
> +  John Doe:CAC Email Encryption Certificate   u,u,u
> +
> +If this does not happen, CoolKey is not installed or not registered with
> +NSS. Registration can be done from Firefox or the command line::
> +
> +  modutil -dbdir /etc/pki/nssdb -add "CAC Module" -libfile /usr/lib64/pkcs11/libcoolkeypk11.so
> +  modutil -dbdir /etc/pki/nssdb -list
> +
> +Using ccid-card-passthru with client side hardware
> +--------------------------------------------------
> +On the host specify the ccid-card-passthru device with a suitable chardev::
> +
> +  qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
> +       -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
> +
> +On the client run vscclient, built when you built QEMU::
> +
> +  vscclient <qemu-host> 2001
> +
> +Using ccid-card-passthru with client side certificates
> +------------------------------------------------------
> +This case is not particularly useful, but you can use it to debug
> +your setup.
> +
> +Follow instructions above, except run QEMU and vscclient as follows.
> +
> +Run qemu as per above, and run vscclient from the "fake-smartcard"
> +directory as follows::
> +
> +  qemu -chardev socket,server=on,host=0.0.0.0,port=2001,id=ccid,wait=off \
> +       -usb -device usb-ccid -device ccid-card-passthru,chardev=ccid
> +  vscclient -e "db=\"sql:$PWD\" use_hw=no soft=(,Test,CAC,,id-cert,signing-cert,encryption-cert)" <qemu-host> 2001
> +
> +
> +Passthrough protocol scenario
> +-----------------------------
> +This is a typical interchange of messages when using the passthru card device.
> +usb-ccid is a usb device. It defaults to an unattached usb device on startup.
> +usb-ccid expects a chardev and expects the protocol defined in
> +cac_card/vscard_common.h to be passed over that.
> +The usb-ccid device can be in one of three modes:

Empty line missing here, so that the bullet list below works.

> +* detached
> +* attached with no card
> +* attached with card > +
> +A typical interchange is (the arrow shows who started each exchange, it can be client
> +originated or guest originated)::
> +
> +  client event        |      vscclient           |    passthru    |     usb-ccid  |  guest event
> +  ------------------------------------------------------------------------------------------------
> +                      |      VSC_Init            |                |               |
> +                      |      VSC_ReaderAdd       |                |     attach    |
> +                      |                          |                |               |  sees new usb device.
> +    card inserted ->  |                          |                |               |
> +                      |      VSC_ATR             |   insert       |     insert    |  see new card
> +                      |                          |                |               |
> +                      |      VSC_APDU            |   VSC_APDU     |               | <- guest sends APDU
> +  client <-> physical |                          |                |               |
> +   card APDU exchange |                          |                |               |
> +   client response -> |      VSC_APDU            |   VSC_APDU     |               |  receive APDU response
> +                                                        ...
> +                                        [APDU<->APDU repeats several times]
> +                                                        ...
> +     card removed  -> |                          |                |               |
> +                      |      VSC_CardRemove      |   remove       |    remove     |   card removed
> +                                                        ...
> +                                        [(card insert, apdu's, card remove) repeat]
> +                                                        ...
> +    kill/quit         |                          |                |               |
> +      vscclient       |                          |                |               |
> +                      |      VSC_ReaderRemove    |                |    detach     |
> +                      |                          |                |               |   usb device removed.
> +
> +libcacard
> +---------
> +Both ccid-card-emulated and vscclient use libcacard as the card emulator.
> +libcacard implements a completely virtual CAC (DoD standard for smart
> +cards) compliant card and uses NSS to retrieve certificates and do
> +any encryption. The backend can then be a real reader and card, or
> +certificates stored in files.
> +

Empty line at end of line should be removed I think.

> --
> 2.34.1
> 
> 

Regards,
--
Damien

