Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9433A3F8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 10:49:57 +0100 (CET)
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLNNj-0006CW-DH
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 05:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLNMQ-0005kI-Uz
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 05:48:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLNMO-0001Bm-Lw
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 05:48:34 -0400
Received: by mail-wm1-x329.google.com with SMTP id g20so6316628wmk.3
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 01:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZM45qkfxTkG0jSIsFwzT+w2Vx23zCKdoH13kkl71EjE=;
 b=BgAA4OpQSLgxH4DbQPBY3JGL2RuzwxHag63Lzzs050Jk3XxWbqALKgEEi9oFDGiGok
 KdjdMwtIg0wBjSPmsk9KaMEJ/qaoLyLLes+yoPf1nSiULTHR9a8kZXFL4M1bzknhc/GB
 k4Rp5TDhUqZZFd3BJ7SCMKqgFGdQc9qa6UnRmKz3af2Wz1slKcmNTfbqFenUZowIc/yN
 eabKsKqLG4trMQA/6UsykuSpNyhLXRS3EANKUqa2n+kCQB4AmfgMDxixndHf60x6kk0U
 NaPoDxKN6CZ1dgTF7DPD4de7aMzfwes362utSB1rgW6xMFaErz7AuPyJOef1THUOmwlC
 MVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZM45qkfxTkG0jSIsFwzT+w2Vx23zCKdoH13kkl71EjE=;
 b=rihgCZmetnfFwo5g5SVgs72yt1pbcK7LLkvzgoQJpSqX/BHeDlUXlgRqfng14SidJ3
 +wCv45GyNVRrRMIDBFp6APTQS8dkoraSvHUKIFK/IgORY+DxB75vnih6IKvQeLol+Uxf
 GinehXg7YJyhykfO2dCsvVgj5xkoYFEHQ4iTBXJ4dCruIOouHPe2jhQXa72tiXm/AYdT
 908hoBKNhYP4QH1NfKNW1JKT2A+p8KqALecd5i8Kg2URBuJDNFQzCaV+Dyg2UT84Vu9c
 WbdUCHpurfS/jl+yvyVBK/zZQzRi2PI0NlBiXvvHvbWjWaxmXDKEiqh4p0mlrJVvF95a
 xmwA==
X-Gm-Message-State: AOAM531HNhBOoLVzDsCa8103OXNuRTauHTqSReBna/OdcCSh4Fi7xZIJ
 v4kvu9LLeyaPzCi8wqZlw0t3Jp3j9CBQj8fTBRE=
X-Google-Smtp-Source: ABdhPJzkiP35XeBeLxJekqp15AcXyjWTILSFPzohv4r8pZPDkBj6kMQMfJVUhwapmH6u4rQOLgeG53oQ1WpsvmNRqs0=
X-Received: by 2002:a1c:9a92:: with SMTP id
 c140mr20532646wme.167.1615715311110; 
 Sun, 14 Mar 2021 01:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20210314091236.44313-1-mail@knazarov.com>
In-Reply-To: <20210314091236.44313-1-mail@knazarov.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sun, 14 Mar 2021 18:48:20 +0900
Message-ID: <CAMVc7JXXiBxrewA4XN3K88aFqxph=_Bwnk-5JNcr89oHKC-r4g@mail.gmail.com>
Subject: Re: [PATCH v2] edid: add support for DisplayID extension (5k
 resolution)
To: Konstantin Nazarov <mail@knazarov.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=8814=E6=97=A5(=E6=97=A5) 18:12 Konstantin Nazarov <mai=
l@knazarov.com>:
>
> The Detailed Timing Descriptor has only 12 bits to store the
> resolution. This limits the guest to 4095 pixels.
>
> This patch adds support for the DisplayID extension, that has 2 full
> bytes for that purpose, thus allowing 5k resolutions and above.
>
> Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
> Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
> ---
>  hw/display/edid-generate.c | 156 +++++++++++++++++++++++++++++--------
>  hw/display/vga-pci.c       |   2 +-
>  qemu-edid.c                |   2 +-
>  3 files changed, 124 insertions(+), 36 deletions(-)
>
> diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
> index b0ce583d436..db1e319e2dc 100644
> --- a/hw/display/edid-generate.c
> +++ b/hw/display/edid-generate.c
> @@ -44,6 +44,35 @@ static const struct edid_mode {
>      { .xres =3D  640,   .yres =3D  480,   .byte  =3D 35,   .bit =3D 5 },
>  };
>
> +typedef struct Timings {
> +    uint32_t xfront;
> +    uint32_t xsync;
> +    uint32_t xblank;
> +
> +    uint32_t yfront;
> +    uint32_t ysync;
> +    uint32_t yblank;
> +
> +    uint64_t clock;
> +} Timings;
> +
> +static void generate_timings(Timings *timings, uint32_t refresh_rate,
> +                             uint32_t xres, uint32_t yres)
> +{
> +    /* pull some realistic looking timings out of thin air */
> +    timings->xfront =3D xres * 25 / 100;
> +    timings->xsync  =3D xres *  3 / 100;
> +    timings->xblank =3D xres * 35 / 100;
> +
> +    timings->yfront =3D yres *  5 / 1000;
> +    timings->ysync  =3D yres *  5 / 1000;
> +    timings->yblank =3D yres * 35 / 1000;
> +
> +    timings->clock  =3D ((uint64_t)refresh_rate *
> +                       (xres + timings->xblank) *
> +                       (yres + timings->yblank)) / 10000000;
> +}
> +
>  static void edid_ext_dta(uint8_t *dta)
>  {
>      dta[0] =3D 0x02;
> @@ -129,17 +158,17 @@ static void edid_fill_modes(uint8_t *edid, uint8_t =
*xtra3, uint8_t *dta,
>      }
>  }
>
> -static void edid_checksum(uint8_t *edid)
> +static void edid_checksum(uint8_t *edid, size_t len)
>  {
>      uint32_t sum =3D 0;
>      int i;
>
> -    for (i =3D 0; i < 127; i++) {
> +    for (i =3D 0; i < len; i++) {
>          sum +=3D edid[i];
>      }
>      sum &=3D 0xff;
>      if (sum) {
> -        edid[127] =3D 0x100 - sum;
> +        edid[len] =3D 0x100 - sum;
>      }
>  }
>
> @@ -180,8 +209,8 @@ static void edid_desc_ranges(uint8_t *desc)
>      desc[7] =3D  30;
>      desc[8] =3D 160;
>
> -    /* max dot clock (1200 MHz) */
> -    desc[9] =3D 1200 / 10;
> +    /* max dot clock (2550 MHz) */
> +    desc[9] =3D 2550 / 10;
>
>      /* no extended timing information */
>      desc[10] =3D 0x01;
> @@ -207,38 +236,29 @@ static void edid_desc_timing(uint8_t *desc, uint32_=
t refresh_rate,
>                               uint32_t xres, uint32_t yres,
>                               uint32_t xmm, uint32_t ymm)
>  {
> -    /* pull some realistic looking timings out of thin air */
> -    uint32_t xfront =3D xres * 25 / 100;
> -    uint32_t xsync  =3D xres *  3 / 100;
> -    uint32_t xblank =3D xres * 35 / 100;
> -
> -    uint32_t yfront =3D yres *  5 / 1000;
> -    uint32_t ysync  =3D yres *  5 / 1000;
> -    uint32_t yblank =3D yres * 35 / 1000;
> -
> -    uint64_t clock  =3D (uint64_t)refresh_rate * (xres + xblank) * (yres=
 + yblank);
> -
> -    stl_le_p(desc, clock / 10000000);
> +    Timings timings;
> +    generate_timings(&timings, refresh_rate, xres, yres);
> +    stl_le_p(desc, timings.clock);
>
>      desc[2] =3D xres   & 0xff;
> -    desc[3] =3D xblank & 0xff;
> +    desc[3] =3D timings.xblank & 0xff;
>      desc[4] =3D (((xres   & 0xf00) >> 4) |
> -               ((xblank & 0xf00) >> 8));
> +               ((timings.xblank & 0xf00) >> 8));
>
>      desc[5] =3D yres   & 0xff;
> -    desc[6] =3D yblank & 0xff;
> +    desc[6] =3D timings.yblank & 0xff;
>      desc[7] =3D (((yres   & 0xf00) >> 4) |
> -               ((yblank & 0xf00) >> 8));
> +               ((timings.yblank & 0xf00) >> 8));
>
> -    desc[8] =3D xfront & 0xff;
> -    desc[9] =3D xsync  & 0xff;
> +    desc[8] =3D timings.xfront & 0xff;
> +    desc[9] =3D timings.xsync  & 0xff;
>
> -    desc[10] =3D (((yfront & 0x00f) << 4) |
> -                ((ysync  & 0x00f) << 0));
> -    desc[11] =3D (((xfront & 0x300) >> 2) |
> -                ((xsync  & 0x300) >> 4) |
> -                ((yfront & 0x030) >> 2) |
> -                ((ysync  & 0x030) >> 4));
> +    desc[10] =3D (((timings.yfront & 0x00f) << 4) |
> +                ((timings.ysync  & 0x00f) << 0));
> +    desc[11] =3D (((timings.xfront & 0x300) >> 2) |
> +                ((timings.xsync  & 0x300) >> 4) |
> +                ((timings.yfront & 0x030) >> 2) |
> +                ((timings.ysync  & 0x030) >> 4));
>
>      desc[12] =3D xmm & 0xff;
>      desc[13] =3D ymm & 0xff;
> @@ -296,15 +316,61 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t=
 res)
>      return res * 254 / 10 / dpi;
>  }
>
> +static void dummy_displayid(uint8_t *did)
> +{
> +    did[0] =3D 0x70; /* display id extension */
> +    did[1] =3D 0x13; /* version 1.3 */
> +    did[2] =3D 4;    /* length */
> +    did[3] =3D 0x03; /* product type (0x03 =3D=3D standalone display dev=
ice) */
> +    edid_checksum(did + 1, did[2] + 4);
> +}
> +
> +static void qemu_displayid_generate(uint8_t *did, uint32_t refresh_rate,
> +                                    uint32_t xres, uint32_t yres,
> +                                    uint32_t xmm, uint32_t ymm)
> +{
> +    Timings timings;
> +    generate_timings(&timings, refresh_rate, xres, yres);
> +
> +    did[0] =3D 0x70; /* display id extension */
> +    did[1] =3D 0x13; /* version 1.3 */
> +    did[2] =3D 23;   /* length */
> +    did[3] =3D 0x03; /* product type (0x03 =3D=3D standalone display dev=
ice) */
> +
> +    did[5] =3D 0x03; /* Detailed Timings Data Block */
> +    did[6] =3D 0x00; /* revision */
> +    did[7] =3D 0x14; /* block length */
> +
> +    did[8]  =3D timings.clock  & 0xff;
> +    did[9]  =3D (timings.clock & 0xff00) >> 8;
> +    did[10] =3D (timings.clock & 0xff0000) >> 16;
> +
> +    did[11] =3D 0x88; /* leave aspect ratio undefined */
> +
> +    stw_le_p(did + 12, 0xffff & (xres - 1));
> +    stw_le_p(did + 14, 0xffff & (timings.xblank - 1));
> +    stw_le_p(did + 16, 0xffff & (timings.xfront - 1));
> +    stw_le_p(did + 18, 0xffff & (timings.xsync - 1));
> +
> +    stw_le_p(did + 20, 0xffff & (yres - 1));
> +    stw_le_p(did + 22, 0xffff & (timings.yblank - 1));
> +    stw_le_p(did + 24, 0xffff & (timings.yfront - 1));
> +    stw_le_p(did + 26, 0xffff & (timings.ysync - 1));
> +
> +    edid_checksum(did + 1, did[2] + 4);
> +}
> +
>  void qemu_edid_generate(uint8_t *edid, size_t size,
>                          qemu_edid_info *info)
>  {
>      uint32_t desc =3D 54;
>      uint8_t *xtra3 =3D NULL;
>      uint8_t *dta =3D NULL;
> +    uint8_t *did =3D NULL;
>      uint32_t width_mm, height_mm;
>      uint32_t refresh_rate =3D info->refresh_rate ? info->refresh_rate : =
75000;
>      uint32_t dpi =3D 100; /* if no width_mm/height_mm */
> +    uint32_t large_screen =3D 0;
>
>      /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D set defaults  =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
>
> @@ -320,6 +386,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
>      if (!info->prefy) {
>          info->prefy =3D 768;
>      }
> +    if (info->prefx >=3D 4096 || info->prefy >=3D 4096) {
> +        large_screen =3D 1;
> +    }
>      if (info->width_mm && info->height_mm) {
>          width_mm =3D info->width_mm;
>          height_mm =3D info->height_mm;
> @@ -401,9 +470,12 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
>
>      /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D descriptor blocks =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
>
> -    edid_desc_timing(edid + desc, refresh_rate, info->prefx, info->prefy=
,
> -                     width_mm, height_mm);
> -    desc +=3D 18;
> +    /* The DTD section has only 12 bits to store the resolution */
> +    if (!large_screen) {
> +        edid_desc_timing(edid + desc, refresh_rate, info->prefx, info->p=
refy,
> +                         width_mm, height_mm);
> +        desc +=3D 18;
> +    }
>
>      edid_desc_ranges(edid + desc);
>      desc +=3D 18;
> @@ -429,12 +501,28 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
>          desc +=3D 18;
>      }
>
> +    /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D display id extensio=
ns =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> +
> +    if (size >=3D 384) {
> +        did =3D edid + 256;
> +        dummy_displayid(did);
> +        edid[126]++;
> +
> +        if (large_screen) {
> +            qemu_displayid_generate(did, refresh_rate, info->prefx, info=
->prefy,
> +                                    width_mm, height_mm);
> +        }
> +    }
> +
>      /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D finish up =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
>
>      edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
> -    edid_checksum(edid);
> +    edid_checksum(edid, 127);
>      if (dta) {
> -        edid_checksum(dta);
> +        edid_checksum(dta, 127);
> +    }
> +    if (did) {
> +        edid_checksum(did, 127);
>      }
>  }
>
> diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
> index 48d29630ab7..62fb5c38c1f 100644
> --- a/hw/display/vga-pci.c
> +++ b/hw/display/vga-pci.c
> @@ -49,7 +49,7 @@ struct PCIVGAState {
>      qemu_edid_info edid_info;
>      MemoryRegion mmio;
>      MemoryRegion mrs[4];
> -    uint8_t edid[256];
> +    uint8_t edid[384];
>  };
>
>  #define TYPE_PCI_VGA "pci-vga"
> diff --git a/qemu-edid.c b/qemu-edid.c
> index 1cd6a951723..028f2d181a1 100644
> --- a/qemu-edid.c
> +++ b/qemu-edid.c
> @@ -41,7 +41,7 @@ static void usage(FILE *out)
>  int main(int argc, char *argv[])
>  {
>      FILE *outfile =3D NULL;
> -    uint8_t blob[256];
> +    uint8_t blob[384];
>      uint32_t dpi =3D 100;
>      int rc;
>
> --
> 2.24.3 (Apple Git-128)
>

It looks good to me.

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

