Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A97DF77B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 23:30:25 +0200 (CEST)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMfFw-0002Sc-AY
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 17:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iMfEf-0001me-JM
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 17:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iMfEd-0008Mz-Tr
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 17:29:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iMfEd-0008MT-KQ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 17:29:03 -0400
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EFD6D2A09A8
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 21:29:01 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id f11so888499otf.9
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 14:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wvHv4/pASEk9u1Yc3VAQShnjIXIMbC1uUMd2o+6Ac5w=;
 b=nPTytQcb4aGfJTDA+DzxF1IlhNi+hxFlSXfWU4qhe8xia05L2RcWdR9WWqotyPAsbu
 wVjfPvQHN6CiNTHriwKvKr5Dp1pCPXd8nACLd/2nn5OccnjO0Ajysb/PWFUeqHpJRhL4
 ZReibjUthYaEn2CAERf/mHV8MHIFPr3XoTjsVPle+vVL3DaKThyLpclwjx7b1Vdn21gu
 b/5Z52OmJtRwkUgj2SyReqYNZ6p+cXkpIqJscvEBhh0UVGWmrPHtFrakuSZ4sqblkHJb
 hdEuD926tAi7ByzEr5RGKR5qaI/DTH6KEWjhy03QIBVuunpqiyLqDFGWBvkeZq83/art
 GCpQ==
X-Gm-Message-State: APjAAAXvLShkiU36Pm/7RnwQKTLRM4SiV2Km0Qg/NwORp5nOjvpm4ikb
 cMDlmyXQcVULLPmtzppdxHZj8PoVjr3umbaKyZfs96eLqXdAgMpVu7ASxTWTh7ZuAXyMDAAVcWI
 AeYXdd5FuIhPo8vKSmphDB6fDLhXRNKI=
X-Received: by 2002:a9d:7147:: with SMTP id y7mr37840otj.62.1571693341137;
 Mon, 21 Oct 2019 14:29:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbAtfOc03Xkqpm3Yi8fNLmWyop4d8OWUEWn8zd6prTXJTnETmc4GnIwQNgiB6YCjJDS5HmmDOfTkmsqZbJgrk=
X-Received: by 2002:a9d:7147:: with SMTP id y7mr37815otj.62.1571693340887;
 Mon, 21 Oct 2019 14:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-10-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-10-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 21 Oct 2019 23:28:49 +0200
Message-ID: <CAMxuvazBjHBB+ZBcx4Rfk2N2WNjGqmjiLEiwB7x_5-oBF4JPWg@mail.gmail.com>
Subject: Re: [PATCH 09/14] smbus-eeprom: remove PROP_PTR
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Oct 18, 2019 at 5:43 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Instead, set the initial data field directly. Since it is only 256
> bytes, let's simply copy it to avoid invalid pointers issues.

Actually, the commit message is wrong. The patch used to introduce a
init_data[256] array, and copy initial data there, but I changed my
mind because of the risk to introduce regression as the original
buffer may have changed.

I will rephrase.

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/i2c/smbus_eeprom.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> index 54c86a0112..533c728b3b 100644
> --- a/hw/i2c/smbus_eeprom.c
> +++ b/hw/i2c/smbus_eeprom.c
> @@ -44,7 +44,7 @@
>  typedef struct SMBusEEPROMDevice {
>      SMBusDevice smbusdev;
>      uint8_t data[SMBUS_EEPROM_SIZE];
> -    void *init_data;
> +    uint8_t *init_data;
>      uint8_t offset;
>      bool accessed;
>  } SMBusEEPROMDevice;
> @@ -129,14 +129,14 @@ static void smbus_eeprom_reset(DeviceState *dev)
>
>  static void smbus_eeprom_realize(DeviceState *dev, Error **errp)
>  {
> +    SMBusEEPROMDevice *eeprom =3D SMBUS_EEPROM(dev);
> +
>      smbus_eeprom_reset(dev);
> +    if (eeprom->init_data =3D=3D NULL) {
> +        error_setg(errp, "init_data cannot be NULL");
> +    }
>  }
>
> -static Property smbus_eeprom_properties[] =3D {
> -    DEFINE_PROP_PTR("data", SMBusEEPROMDevice, init_data),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>  static void smbus_eeprom_class_initfn(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -146,9 +146,8 @@ static void smbus_eeprom_class_initfn(ObjectClass *kl=
ass, void *data)
>      dc->reset =3D smbus_eeprom_reset;
>      sc->receive_byte =3D eeprom_receive_byte;
>      sc->write_data =3D eeprom_write_data;
> -    dc->props =3D smbus_eeprom_properties;
>      dc->vmsd =3D &vmstate_smbus_eeprom;
> -    /* Reason: pointer property "data" */
> +    /* Reason: init_data */
>      dc->user_creatable =3D false;
>  }
>
> @@ -172,7 +171,7 @@ void smbus_eeprom_init_one(I2CBus *smbus, uint8_t add=
ress, uint8_t *eeprom_buf)
>
>      dev =3D qdev_create((BusState *) smbus, TYPE_SMBUS_EEPROM);
>      qdev_prop_set_uint8(dev, "address", address);
> -    qdev_prop_set_ptr(dev, "data", eeprom_buf);
> +    SMBUS_EEPROM(dev)->init_data =3D eeprom_buf;
>      qdev_init_nofail(dev);
>  }
>
> --
> 2.23.0.606.g08da6496b6
>

