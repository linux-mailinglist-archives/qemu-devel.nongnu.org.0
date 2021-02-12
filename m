Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717B31A76B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:21:25 +0100 (CET)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgoV-0000Tf-MK
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgkk-0006Z2-T0; Fri, 12 Feb 2021 17:17:32 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:43892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgki-0004NJ-5C; Fri, 12 Feb 2021 17:17:30 -0500
Received: by mail-io1-xd35.google.com with SMTP id f20so742640ioo.10;
 Fri, 12 Feb 2021 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9VJgn9poCJO7YH3yJ2p3of4Us8s4GJwP9JwGaSbIpSc=;
 b=JNPBsDxPKDsLIWAy0tlz34nKWH9goSq8Bkud2jgfj6Qlwy51d/9Oz9V3rpmUzb43IG
 h3Xa/aDmWCzMyd5y62xJ0MSvIiKtZbkNlAXOupvkmJ+LNhb3fSXQYFCFEPtmVDM5ncZd
 T/EWGk8Qks9KofcZ3drWMDJArEkcDM66WhsqupXBdNno7rqIWN5KGQl4bAt0TXTy7zxN
 55jmPFu2+W5pnrFwebRHP9ca9+6y5WlRT153jEqbw4/iZgdpEaRvps7Ie5t1pssR4psu
 46CyS0cZstCSOfSxzYz6EeSX4icDpCu81KNxHs88x7c6aBTmzoMoViw88PhcIbfGi+Gj
 AY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9VJgn9poCJO7YH3yJ2p3of4Us8s4GJwP9JwGaSbIpSc=;
 b=AO00WmpVPZBqh+t07P67PPpLEiJebAfTvchW/jrmyDVEOwL3mazhwwlAglNH37vx1i
 pGTdM77qVWOz2Q16NG6d7nyj5sPe/R7XSu8h3NJ3Y8+fgPEi4OgPwqp5Yoo8hhM52OKH
 3c/9XOnfIuRUiKHz144LMVry0J14OfYc+HGGkv9oVcIRYmLj/UZoij9leJXFZVwLvq90
 NUWmgH3ePDJEZl/qVMbDCVqxXH2EL4g4kq3dzMGgkUFzY5W/i4RM0aAux/clTpri+MyP
 gpKatTHwO5Zrx7cwx9/8RJWaN+PX03rM+xHm9K5qe5MHYRQTXAsC4DZKIovl0zDWYZ2e
 xYkg==
X-Gm-Message-State: AOAM53141aSAvkbwMgKqhzsC+AQGmh6PPBLLhN953rr18D8YhKciCg4C
 W2FiCqyQ6RhjBTw5MkAWvMVCWJt4DoqFkFGRrIk=
X-Google-Smtp-Source: ABdhPJxDhXIbuwkqNUl4JZNo9V2zz9CekyYhymXQFIDrK7P5rbdzEtBpn/TEnq1ekGfk92HKZj6ciX3h7m8moqbtmnU=
X-Received: by 2002:a02:5148:: with SMTP id s69mr4653255jaa.8.1613168246301;
 Fri, 12 Feb 2021 14:17:26 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-13-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-13-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:16:45 -0800
Message-ID: <CAKmqyKPG1RrxeN=SCWOdoTOYJS3C8V6no9ydVEa9GS9-2dZnMg@mail.gmail.com>
Subject: Re: [RFC PATCH 12/15] sd: emmc: Support boot area in emmc image
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:15 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> This assumes a specially constructued image:
>
>   dd if=3D/dev/zero of=3Dmmc-bootarea.img count=3D2 bs=3D1M
>   dd if=3Du-boot-spl.bin of=3Dmmc-bootarea.img conv=3Dnotrunc
>   dd if=3Du-boot.bin of=3Dmmc-bootarea.img conv=3Dnotrunc count=3D64 bs=
=3D1K
>   cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
>   truncate --size 16GB mmc.img
>   truncate --size 128MB mmc-bootarea.img

Could we document this somewhere user accessible?

Alistair

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [clg: - changes on the definition names ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> [spb: use data_start property to access right emmc partition,
>       Clean up PARTITION_ENABLE support as incomplete,
>       Fix commit message to be generic.]
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/sd/sd.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 54fba7b..55c1104 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1045,6 +1045,34 @@ static void sd_lock_command(SDState *sd)
>          sd->card_status &=3D ~CARD_IS_LOCKED;
>  }
>
> +/*
> + * This requires a disk image that has two boot partitions inserted at t=
he
> + * beginning of it. The size of the boot partitions are configured in th=
e
> + * ext_csd structure, which is hardcoded in qemu. They are currently set=
 to
> + * 1MB each.
> + */
> +static uint32_t sd_bootpart_offset(SDState *sd)
> +{
> +    unsigned int access =3D sd->ext_csd[EXT_CSD_PART_CONFIG] &
> +        EXT_CSD_PART_CONFIG_ACC_MASK;
> +    unsigned int boot_capacity =3D sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
> +
> +    if (!sd->emmc) {
> +        return 0;
> +    }
> +
> +    switch (access) {
> +    case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
> +        return boot_capacity * 2;
> +    case EXT_CSD_PART_CONFIG_ACC_BOOT0:
> +        return 0;
> +    case EXT_CSD_PART_CONFIG_ACC_BOOT0 + 1:
> +        return boot_capacity * 1;
> +    default:
> +         g_assert_not_reached();
> +    }
> +}
> +
>  static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>  {
>      uint32_t rca =3D 0x0000;
> @@ -1360,6 +1388,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>                  return sd_r1;
>              }
>
> +            if (sd->emmc) {
> +                addr +=3D sd_bootpart_offset(sd);
> +            }
>              sd->state =3D sd_sendingdata_state;
>              sd->data_start =3D addr;
>              sd->data_offset =3D 0;
> @@ -1379,6 +1410,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>                  return sd_r1;
>              }
>
> +            if (sd->emmc) {
> +                addr +=3D sd_bootpart_offset(sd);
> +            }
>              sd->state =3D sd_sendingdata_state;
>              sd->data_start =3D addr;
>              sd->data_offset =3D 0;
> @@ -1435,6 +1469,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>                  return sd_r1;
>              }
>
> +            if (sd->emmc) {
> +                addr +=3D sd_bootpart_offset(sd);
> +            }
>              sd->state =3D sd_receivingdata_state;
>              sd->data_start =3D addr;
>              sd->data_offset =3D 0;
> @@ -1465,6 +1502,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,=
 SDRequest req)
>                  return sd_r1;
>              }
>
> +            if (sd->emmc) {
> +                addr +=3D sd_bootpart_offset(sd);
> +            }
>              sd->state =3D sd_receivingdata_state;
>              sd->data_start =3D addr;
>              sd->data_offset =3D 0;
> --
> 2.7.4
>
>

