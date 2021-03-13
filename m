Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BC339DFB
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 13:05:12 +0100 (CET)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL315-0004HO-MC
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 07:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lL2zU-0003hf-9H
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:03:32 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lL2zS-0005t2-Qd
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 07:03:32 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so6203145wrx.9
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 04:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qmm08d3mm4mKG5dozEasWWtVWpTNYS5BnYo2b8fxEjw=;
 b=fV8EX8Reyh2CI++vyXyYr2PYI5rmgdi8vGNtAgD1vwcBlrkXnghZ6o4XqB5nA/Pb/n
 cWlLw++JGiRSW4XaUNfuv2U+yb/7gxGP/S/ZfiKyXCfyFaWAFSNpA9Ip4pYzj6QQbJIq
 qRn563wY29Wikdfoc3dFsFpIXKqGJIlGGXh/HZG4Lvp8ZuYAhSOlQ6CbbU5EThBNqgar
 +5wOhALjZ3cDt71j687YfAeRlGRWENch6PzOfgB6ZSxbwFhDQMgmhgX7juMGBu9LCNvv
 RKIYueSOXhYyg0vbCoMqHWfzPlgF/oBwz0m+ZOoCo/sl4Hv6B2wNuo0LPS0sfhfBtauK
 fgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qmm08d3mm4mKG5dozEasWWtVWpTNYS5BnYo2b8fxEjw=;
 b=AA6GQOH3XeNaY2O2v2f7LIs79guam5Km9U5G56KhYKilujFPb0yJGKrBPzr1QVpfkE
 Hkp2FQRQ6CLTpWW4rIDbBebJd4xF5NgcyJmq6pAeLu6X8Xu/EHGNofM+keSVfdlbNZDs
 eRDF38cZp6HsDF3O63IlILO+3hsgzUyxQ6apSRkn2jKtNEFVBxNm/fktQ5wtzXCfkEXG
 CthCgc9f9D5l8DBtdMyElfUC2uedPMVTSDDvym4esv62VB0kjqoHrSQnvMvRT662CG/4
 g4J2M3fmk2wY+M2nxCD72gGKIw91QWH6cUlyIGuPdCkBRcXQ5HLp293dgLeKUAgNd3Je
 RVEA==
X-Gm-Message-State: AOAM531VqiTMT+DrRqH5hea9DlapeA+zH1Ot0Bj+bbd2R/pKCK7OPh9G
 XE8GDTNhkVJzmiDRm6G7fkEDgy7LGyn5hbRUjv8=
X-Google-Smtp-Source: ABdhPJwynA2v3hD8FAs5TxZ0/B5ucrWLAtL9Ipvoh7wcuLeHg7cPl9sYmZC5+B+cg7998zrADXt7PXx192ErWRTa43E=
X-Received: by 2002:adf:ef08:: with SMTP id e8mr19549955wro.200.1615637008897; 
 Sat, 13 Mar 2021 04:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20210313104432.3591-1-mail@knazarov.com>
In-Reply-To: <20210313104432.3591-1-mail@knazarov.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sat, 13 Mar 2021 21:03:18 +0900
Message-ID: <CAMVc7JUDnhbb+uK5=LZAT35HnWB6gfQ-11+pxGp_bCKtOSAW1A@mail.gmail.com>
Subject: Re: [PATCH] edid: add support for DisplayID extension (5k resolution)
To: Konstantin Nazarov <mail@knazarov.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-wr1-x435.google.com
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

The logic looks good to me. I have a few style nitpicks.

2021=E5=B9=B43=E6=9C=8813=E6=97=A5(=E5=9C=9F) 19:45 Konstantin Nazarov <mai=
l@knazarov.com>:
> +struct timings {
> +    uint32_t xfront;
> +    uint32_t xsync;
> +    uint32_t xblank;
> +
> +    uint32_t yfront;
> +    uint32_t ysync;
> +    uint32_t yblank;
> +
> +    uint64_t clock;
> +};

doc/devel/style.rst says:
> Typedefs are used to eliminate the redundant 'struct' keyword, since type
> names have a different style than other identifiers ("CamelCase" versus
> "snake_case").  Each named struct type should have a CamelCase name and a
> corresponding typedef.

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
> +
>

The added empty line is redundant.

>      if (dta) {
> -        edid_checksum(dta);
> +        edid_checksum(dta, 127);
>      }
> +    if (did) {
> +        edid_checksum(did, 127);
> +    }
> +
>  }

This function didn't have an empty line at its end. Please remove it.

Regards,
Akihiko Odaki

