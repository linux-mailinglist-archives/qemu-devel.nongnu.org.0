Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DFE6FC78A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:09:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwN5w-00085h-Az; Tue, 09 May 2023 09:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN5u-00085S-As
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:09:30 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwN5r-0004ox-BC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:09:30 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50db7ec8188so1323426a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683637766; x=1686229766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mZeLJgQI3/hHjwUiusQ1k8tjn2JhOq5B3wXRjAT89Z0=;
 b=lTQlE2SeTsQQ0K2LtS/CaFBvGxf7U0+Qb6tE+3Cs66HcaCTkf2l9a/D++p2Itc86uF
 5fd6DqEkBWievs4oe3RbXXGtsyLv7h5bl882eCMAGr9z7hc8+URzauhlKkC0nlFOT93w
 Emn+MqL3qglvWw2LTywXgRSuSa9/eKPywquCdOMYBEvFDt7rS+v/pI2UVnzZAzB16Nl3
 G+VXLyUFDzE8QCgNo8qFDuIdLh8umw+rlaQGJWLHoLCp0EfDDWeKVN93H9vwgmF4eoKI
 lRUsfH6CPvdVW3x5+YX+I7BJr4zuKTR1pR9uKmPGqsL28MbHMpy8A4M6IFwsyCTCssOQ
 a5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683637766; x=1686229766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mZeLJgQI3/hHjwUiusQ1k8tjn2JhOq5B3wXRjAT89Z0=;
 b=USh+pQGBnCxl8lJ9iYtZRuJd9UiHUiwTU1KHOOV63rnuQatcFs2DQstNwBQhQs1qAl
 28w0wxjIszXk8piXREcstK+o9RfbJBxIidDJFssNpqvSS5FnadaAs4MkCi/apsgAZaF3
 XNMRNA2Dd38V5e66xrPnH8XYcNxO2lb6TDK4pw+/MoyqIQtoO+ph09vszkoT4RDZMWTd
 731odgOwdQg8Uw5oh0AeZYABwti4kSiHngMtFB3AZkj9WL2dSk+gGECWPoo3L546oDLI
 2jiTdh47NP/5l3jrbzBsK+e12Qxwf0ZwGwpEkquDIzF+TqCFXNwq4Jz5xEX1wL1mJKod
 /wyQ==
X-Gm-Message-State: AC+VfDwT/2btK5kcWp8VZK69+lCg5p9H//ItvAThJCaL7v2Ohs15YbBX
 WL76vGZVLeY0ypIimXxqHEUKKfYxaGZ+4fygl1KymLwtZ7CcTb1u
X-Google-Smtp-Source: ACHHUZ4jYq6kTQM9UFu7djFHdjbaI8Cf8/60ZmCZUzcPKPF7DibHJTJS/211STO5H3q6DMqo6F2wTfhcYIz9HWMW8Ek=
X-Received: by 2002:a05:6402:3d9:b0:50b:c45d:5808 with SMTP id
 t25-20020a05640203d900b0050bc45d5808mr12590994edw.41.1683637765486; Tue, 09
 May 2023 06:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230421163734.1152076-1-peter.maydell@linaro.org>
In-Reply-To: <20230421163734.1152076-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:09:14 +0100
Message-ID: <CAFEAcA93yaLBAyj=TOzqjzAN2Y6M376UrV_bC8rHxHz_tj7phg@mail.gmail.com>
Subject: Re: [PATCH] docs: Convert u2f.txt to rST
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping for review, please?

thanks
-- PMM

On Fri, 21 Apr 2023 at 17:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Convert the u2f.txt file to rST, and place it in the right place
> in our manual layout. The old text didn't fit very well into our
> manual style, so the new version ends up looking like a rewrite,
> although some of the original text is preserved:
>
>  * the 'building' section of the old file is removed, since we
>    generally assume that users have already built QEMU
>  * some rather verbose text has been cut back
>  * document the passthrough device first, on the assumption
>    that's most likely to be of interest to users
>  * cut back on the duplication of text between sections
>  * format example command lines etc with rST
>
> As it's a short document it seemed simplest to do this all
> in one go rather than try to do a minimal syntactic conversion
> and then clean up the wording and layout.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/device-emulation.rst |   1 +
>  docs/system/devices/usb-u2f.rst  |  93 ++++++++++++++++++++++++++
>  docs/system/devices/usb.rst      |   2 +-
>  docs/u2f.txt                     | 110 -------------------------------
>  4 files changed, 95 insertions(+), 111 deletions(-)
>  create mode 100644 docs/system/devices/usb-u2f.rst
>  delete mode 100644 docs/u2f.txt
>
> diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
> index c1b1934e3d3..8d4a1821fa7 100644
> --- a/docs/system/device-emulation.rst
> +++ b/docs/system/device-emulation.rst
> @@ -93,4 +93,5 @@ Emulated Devices
>     devices/virtio-pmem.rst
>     devices/vhost-user-rng.rst
>     devices/canokey.rst
> +   devices/usb-u2f.rst
>     devices/igb.rst
> diff --git a/docs/system/devices/usb-u2f.rst b/docs/system/devices/usb-u2f.rst
> new file mode 100644
> index 00000000000..4f57d5c8c34
> --- /dev/null
> +++ b/docs/system/devices/usb-u2f.rst
> @@ -0,0 +1,93 @@
> +Universal Second Factor (U2F) USB Key Device
> +============================================
> +
> +U2F is an open authentication standard that enables relying parties
> +exposed to the internet to offer a strong second factor option for end
> +user authentication.
> +
> +The second factor is provided by a device implementing the U2F
> +protocol. In case of a USB U2F security key, it is a USB HID device
> +that implements the U2F protocol.
> +
> +QEMU supports both pass-through of a host U2F key device to a VM,
> +and software emulation of a U2F key.
> +
> +``u2f-passthru``
> +----------------
> +
> +The ``u2f-passthru`` device allows you to connect a real hardware
> +U2F key on your host to a guest VM. All requests made from the guest
> +are passed through to the physical security key connected to the
> +host machine and vice versa.
> +
> +In addition, the dedicated pass-through allows you to share a single
> +U2F security key with several guest VMs, which is not possible with a
> +simple host device assignment pass-through.
> +
> +You can specify the host U2F key to use with the ``hidraw``
> +option, which takes the host path to a Linux ``/dev/hidrawN`` device:
> +
> +.. parsed-literal::
> +   |qemu_system| -usb -device u2f-passthru,hidraw=/dev/hidraw0
> +
> +If you don't specify the device, the ``u2f-passthru`` device will
> +autoscan to take the first U2F device it finds on the host (this
> +requires a working libudev):
> +
> +.. parsed-literal::
> +   |qemu_system| -usb -device u2f-passthru
> +
> +``u2f-emulated``
> +----------------
> +
> +``u2f-emulated`` is a completely software emulated U2F device.
> +It uses `libu2f-emu <https://github.com/MattGorko/libu2f-emu>`__
> +for the U2F key emulation. libu2f-emu
> +provides a complete implementation of the U2F protocol device part for
> +all specified transports given by the FIDO Alliance.
> +
> +To work, an emulated U2F device must have four elements:
> +
> + * ec x509 certificate
> + * ec private key
> + * counter (four bytes value)
> + * 48 bytes of entropy (random bits)
> +
> +To use this type of device, these have to be configured, and these
> +four elements must be passed one way or another.
> +
> +Assuming that you have a working libu2f-emu installed on the host,
> +there are three possible ways to configure the ``u2f-emulated`` device:
> +
> + * ephemeral
> + * setup directory
> + * manual
> +
> +Ephemeral is the simplest way to configure; it lets the device generate
> +all the elements it needs for a single use of the lifetime of the device.
> +It is the default if you do not pass any other options to the device.
> +
> +.. parsed-literal::
> +   |qemu_system| -usb -device u2f-emulated
> +
> +You can pass the device the path of a setup directory on the host
> +using the ``dir`` option; the directory must contain these four files:
> +
> + * ``certificate.pem``: ec x509 certificate
> + * ``private-key.pem``: ec private key
> + * ``counter``: counter value
> + * ``entropy``: 48 bytes of entropy
> +
> +.. parsed-literal::
> +   |qemu_system| -usb -device u2f-emulated,dir=$dir
> +
> +You can also manually pass the device the paths to each of these files,
> +if you don't want them all to be in the same directory, using the options
> +
> + * ``cert``
> + * ``priv``
> + * ``counter``
> + * ``entropy``
> +
> +.. parsed-literal::
> +   |qemu_system| -usb -device u2f-emulated,cert=$DIR1/$FILE1,priv=$DIR2/$FILE2,counter=$DIR3/$FILE3,entropy=$DIR4/$FILE4
> diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
> index 74166810731..a6ca7b0c375 100644
> --- a/docs/system/devices/usb.rst
> +++ b/docs/system/devices/usb.rst
> @@ -207,7 +207,7 @@ option or the ``device_add`` monitor command. Available devices are:
>     USB audio device
>
>  ``u2f-{emulated,passthru}``
> -   Universal Second Factor device
> +   :doc:`usb-u2f`
>
>  ``canokey``
>     An Open-source Secure Key implementing FIDO2, OpenPGP, PIV and more.
> diff --git a/docs/u2f.txt b/docs/u2f.txt
> deleted file mode 100644
> index 7f5813a0b72..00000000000
> --- a/docs/u2f.txt
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -QEMU U2F Key Device Documentation.
> -
> -Contents
> -1. USB U2F key device
> -2. Building
> -3. Using u2f-emulated
> -4. Using u2f-passthru
> -5. Libu2f-emu
> -
> -1. USB U2F key device
> -
> -U2F is an open authentication standard that enables relying parties
> -exposed to the internet to offer a strong second factor option for end
> -user authentication.
> -
> -The standard brings many advantages to both parties, client and server,
> -allowing to reduce over-reliance on passwords, it increases authentication
> -security and simplifies passwords.
> -
> -The second factor is materialized by a device implementing the U2F
> -protocol. In case of a USB U2F security key, it is a USB HID device
> -that implements the U2F protocol.
> -
> -In QEMU, the USB U2F key device offers a dedicated support of U2F, allowing
> -guest USB FIDO/U2F security keys operating in two possible modes:
> -pass-through and emulated.
> -
> -The pass-through mode consists of passing all requests made from the guest
> -to the physical security key connected to the host machine and vice versa.
> -In addition, the dedicated pass-through allows to have a U2F security key
> -shared on several guests which is not possible with a simple host device
> -assignment pass-through.
> -
> -The emulated mode consists of completely emulating the behavior of an
> -U2F device through software part. Libu2f-emu is used for that.
> -
> -
> -2. Building
> -
> -To ensure the build of the u2f-emulated device variant which depends
> -on libu2f-emu: configuring and building:
> -
> -    ./configure --enable-u2f && make
> -
> -The pass-through mode is built by default on Linux. To take advantage
> -of the autoscan option it provides, make sure you have a working libudev
> -installed on the host.
> -
> -
> -3. Using u2f-emulated
> -
> -To work, an emulated U2F device must have four elements:
> - * ec x509 certificate
> - * ec private key
> - * counter (four bytes value)
> - * 48 bytes of entropy (random bits)
> -
> -To use this type of device, this one has to be configured, and these
> -four elements must be passed one way or another.
> -
> -Assuming that you have a working libu2f-emu installed on the host.
> -There are three possible ways of configurations:
> - * ephemeral
> - * setup directory
> - * manual
> -
> -Ephemeral is the simplest way to configure, it lets the device generate
> -all the elements it needs for a single use of the lifetime of the device.
> -
> -    qemu -usb -device u2f-emulated
> -
> -Setup directory allows to configure the device from a directory containing
> -four files:
> - * certificate.pem: ec x509 certificate
> - * private-key.pem: ec private key
> - * counter: counter value
> - * entropy: 48 bytes of entropy
> -
> -    qemu -usb -device u2f-emulated,dir=$dir
> -
> -Manual allows to configure the device more finely by specifying each
> -of the elements necessary for the device:
> - * cert
> - * priv
> - * counter
> - * entropy
> -
> -    qemu -usb -device u2f-emulated,cert=$DIR1/$FILE1,priv=$DIR2/$FILE2,counter=$DIR3/$FILE3,entropy=$DIR4/$FILE4
> -
> -
> -4. Using u2f-passthru
> -
> -On the host specify the u2f-passthru device with a suitable hidraw:
> -
> -    qemu -usb -device u2f-passthru,hidraw=/dev/hidraw0
> -
> -Alternately, the u2f-passthru device can autoscan to take the first
> -U2F device it finds on the host (this requires a working libudev):
> -
> -    qemu -usb -device u2f-passthru
> -
> -
> -5. Libu2f-emu
> -
> -The u2f-emulated device uses libu2f-emu for the U2F key emulation. Libu2f-emu
> -implements completely the U2F protocol device part for all specified
> -transport given by the FIDO Alliance.
> -
> -For more information about libu2f-emu see this page:
> -https://github.com/MattGorko/libu2f-emu.
> --

