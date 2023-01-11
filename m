Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18EF6655BE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWBb-0005vV-78; Wed, 11 Jan 2023 03:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pFWBW-0005rM-Lm
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:10:10 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pFWBU-0000fM-W6
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:10:10 -0500
Received: by mail-lf1-x136.google.com with SMTP id b3so22334840lfv.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 00:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4G7gxU1gbv2bkVQZ/VZvtNUpBYuQg3gOPz6fRhqs0jM=;
 b=BZgHKVcXI+HM5cFHwkMzYEHV/bUSJNc3PeKTg0dT3Mq/LVG0Rxf779FiUX1jOjAlvy
 VTPLf1643Ql1eoSg+Rom8iyzjIDucnJFMruvey+aAbw2Kt9U1HxQuaFuqcGvPfOGr80A
 sdD20N9/g6hbudHoxzzx/JzrPi0cCNB7hNwnUaZx3MUHuZ1a+H+jeL51fTjjVYR/vQvZ
 DdI4CV0+pGSUxg+Ud9CBF7u2+E+vryPcdJkAwdcUNt7ysNG4WJnIElm1P58kBLGjNQiP
 Lfr/xddeTWUqqkONQi1Fq1YFkGPiKLv7p2NnqfepJ4TS+EUeJiNX7aGYQhKCzVdAeLnZ
 IupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4G7gxU1gbv2bkVQZ/VZvtNUpBYuQg3gOPz6fRhqs0jM=;
 b=uWFhLhX6LtNSxBeKBuSS/+kSDcC2w9F7h0wN+djZ2W1lU0kVkq7AmLHze6fKfNDEod
 ctnvSGf59BY3MmYEa9p8SkcCC7DjCyqBd9BJDJEaTSE2MEqTJYYbUJUIRHyW40rVmc5H
 wM4FZG4W/7x8buhMJQ4AjM8TWzEXFH6WQp51AD6gKYGo0Ag6QojsL/BWZt2YadTklCfb
 ZzXcmSQOxUWG1iUfdRZBT0IdTEoYd9RXzOu2JuTSqo3tEoaO1p9L+CSAhGclxpuw37Bn
 X4GDyi8yvv8x2WyDFe9Tw0gpRfnmnW9zIGEOjoCjPio1c/KI/IH3l2QClkS6beU5S+tQ
 G1FQ==
X-Gm-Message-State: AFqh2kqPQyJTWFh3sM54+mvOXWqA0DfQTzApsSf+FytI4p5N1MxqVQer
 Dn3V8QBxnEL/QkkmiDYlOYcPu/JhtPeSr6k2msw=
X-Google-Smtp-Source: AMrXdXv7R42NE5A/B0qH2KrLPqkD+0fVMZC6DH4LVUkM3hyEhCvRHOaNykegQTYpjKlkZwmOCHsdmkZTzq6T/pk+eNI=
X-Received: by 2002:ac2:5381:0:b0:4cc:8554:ad9f with SMTP id
 g1-20020ac25381000000b004cc8554ad9fmr990063lfh.356.1673424606093; Wed, 11 Jan
 2023 00:10:06 -0800 (PST)
MIME-Version: 1.0
References: <47a155d76238fb1bae401dd77428c9125f37e0d2.camel@secunet.com>
In-Reply-To: <47a155d76238fb1bae401dd77428c9125f37e0d2.camel@secunet.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 11 Jan 2023 12:09:54 +0400
Message-ID: <CAJ+F1CL0AsqRyDB+e8dqeCYexs5geBQc3byyqbq5VEq1XQ8oXA@mail.gmail.com>
Subject: Re: [PATCH] usb-ccid: make ids and descriptor configurable
To: "Ripke, Klaus" <klaus.ripke@secunet.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Klaus

On Tue, Jan 10, 2023 at 7:49 PM Ripke, Klaus <klaus.ripke@secunet.com> wrot=
e:
>
> Signed-off-by: Klaus Ripke <klaus.ripke@secunet.com>
>
> hw/usb/dev-smartcard-reader.c:
> Set static values from env vars QEMU_CCID_VENDOR/PRODUCT_ID and
> _DESCRIPTOR

We don't use environment variables to configure devices. Please add
properties to ccid_properties[] instead.

thanks

>
> ---
>  hw/usb/dev-smartcard-reader.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-
> reader.c
> index 28164d89be..0632ab44c6 100644
> --- a/hw/usb/dev-smartcard-reader.c
> +++ b/hw/usb/dev-smartcard-reader.c
> @@ -323,7 +323,7 @@ struct USBCCIDState {
>   *   0dc3:1004 Athena Smartcard Solutions, Inc.
>   */
>
> -static const uint8_t qemu_ccid_descriptor[] =3D {
> +static uint8_t qemu_ccid_descriptor[] =3D {
>          /* Smart Card Device Class Descriptor */
>          0x36,       /* u8  bLength; */
>          0x21,       /* u8  bDescriptorType; Functional */
> @@ -472,7 +472,7 @@ static const USBDescDevice desc_device =3D {
>      },
>  };
>
> -static const USBDesc desc_ccid =3D {
> +static USBDesc desc_ccid =3D {
>      .id =3D {
>          .idVendor          =3D CCID_VENDOR_ID,
>          .idProduct         =3D CCID_PRODUCT_ID,
> @@ -1437,12 +1437,33 @@ static Property ccid_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static void env_uint16(uint16_t *val, const char *env)
> +{
> +    const char *str =3D getenv(env);
> +    if (str) {
> +        *val =3D qemu_strtoul(str, NULL, 16);
> +    }
> +}
> +
>  static void ccid_class_initfn(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>      USBDeviceClass *uc =3D USB_DEVICE_CLASS(klass);
>      HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(klass);
> -
> +    const char *dsc =3D getenv("QEMU_CCID_DESCRIPTOR");
> +
> +    if (dsc) {
> +        unsigned int idx =3D 0;
> +        unsigned int val =3D 0;
> +        int off =3D 0;
> +        for (; 2 =3D=3D sscanf(dsc, "%u:%x%n", &idx, &val, &off); dsc +=
=3D
> off) {
> +            if (idx < sizeof qemu_ccid_descriptor) {
> +                qemu_ccid_descriptor[idx] =3D val;
> +            }
> +        }
> +    }
> +    env_uint16(&desc_ccid.id.idVendor, "QEMU_CCID_VENDOR_ID");
> +    env_uint16(&desc_ccid.id.idProduct, "QEMU_CCID_PRODUCT_ID");
>      uc->realize        =3D ccid_realize;
>      uc->product_desc   =3D "QEMU USB CCID";
>      uc->usb_desc       =3D &desc_ccid;
> --
> 2.34.1
>
>
>
> --
> Klaus Ripke
> Senior Developer
> Public Authorities Division
> secunet Security Networks AG
>
> Telefon:  +49 201 5454-2982



--=20
Marc-Andr=C3=A9 Lureau

