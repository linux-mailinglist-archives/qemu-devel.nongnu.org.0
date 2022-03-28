Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0863F4E90E0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:14:47 +0200 (CEST)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlSY-0003No-4G
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:14:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlQI-0002Qw-Kh
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:12:29 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=40910
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlQG-0006wk-2l
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:12:26 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z8so24846881ybh.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vbZTUE3w+OHXmU+zmX9lDlYAc35V1rdIsjWszz2GshI=;
 b=PTJbX99NdsV6CochF1UQ4gg9SkFbx2yqPKH1u2g1IVeZccPcF6w06Z5IxC2c91VAMj
 CSpmeTsbIg9vmD+ANbIPAaOAFX/lmzOkr3IO0Nyjhelk9L4zSftiFXPgynr/KdJ2Qn99
 9bu6Y2RHCPUOvIsKbxyfhrG3qAdTctQkeqSq/FSjNa4lT2BV2sR3C88ESDH59AEqIA2b
 FIvmwt29qkLF6GZ13l4eI74tbpn0J/tlc4nEW/ogwJu2fTx1dT2XTBpbUoENvO3W5hE3
 93zwkuJSUsGwrnqIiqFzUW9y4rMbkLCmuwxEq5Xe14YurEteUgJmyjtY3u1h3Q4Sk0BW
 y8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vbZTUE3w+OHXmU+zmX9lDlYAc35V1rdIsjWszz2GshI=;
 b=jQVuDEkUVNgowYRlgi52+UUVnLlyJKNUb4rB25GpI9SDPIC4fdxrEREUGM7H+RF1fj
 66To3N2FqqpSTRS4Am6hQr6YwUyji1Pcy379kf7JUZbOHA3TowHW8tom09q6H3aZSk87
 c9Igb0MhxqpxnQJPAnqKg59uMgdB3cWPMOTc4lUDV4srho50F6cgH4M2V1yiSYLa7+Ca
 Y9UIwYL7ZqxnKh+duwj+7GjmgRvRzy0K3oBGbda6IvUQUDxPCBdbVpBNwRVKkg6rTorj
 pxk/Qz5y9HambaJzveKTwx8nZfldtSJDyFKqGy3w0kUVOCLOfwLvnXKtt4vsukltZBV8
 eMRQ==
X-Gm-Message-State: AOAM531wTJofE4x/+SlKG5YrSUWujc/LqI8mJCPjfi8l2tbj7XrEyPNa
 Yjxr74Z5syckxY5m5YllxH5c0fnfimnI2IvQo9mYPA==
X-Google-Smtp-Source: ABdhPJy05wkf4NUhu7ttvMKsmBOVRbHi/8bPBLxwQRyFx7kZJqasN2s9EjE4wjmwdj8ODZIYaaEWixbdu805VOJmmy0=
X-Received: by 2002:a05:6902:150d:b0:634:5046:d294 with SMTP id
 q13-20020a056902150d00b006345046d294mr21044234ybu.140.1648458743135; Mon, 28
 Mar 2022 02:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-3-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 09:12:09 +0000
Message-ID: <CAFEAcA8Bqf8Jaqdx5PP_37ZY68cyUUyZagY1JcxCSFSiVGURuQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm/digic: fix format-truncation warning
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 09:47, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ../hw/arm/digic.c: In function =E2=80=98digic_init=E2=80=99:
> ../hw/arm/digic.c:45:54: error: =E2=80=98%d=E2=80=99 directive output may=
 be truncated writing between 1 and 11 bytes into a region of size 5 [-Werr=
or=3Dformat-truncation=3D]
>    45 |         snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
>       |                                                      ^~
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/arm/digic.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 614232165cdc..6df554797734 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -39,10 +39,7 @@ static void digic_init(Object *obj)
>      object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm9=
46"));
>
>      for (i =3D 0; i < DIGIC4_NB_TIMERS; i++) {
> -#define DIGIC_TIMER_NAME_MLEN    11
> -        char name[DIGIC_TIMER_NAME_MLEN];
> -
> -        snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
> +        g_autofree char *name =3D g_strdup_printf("timer[%d]", i);
>          object_initialize_child(obj, name, &s->timer[i], TYPE_DIGIC_TIME=
R);
>      }

This is a clear compiler false positive, given that DIGIC4_NB_TIMERS is 3.
But this is a nicer way to write the code than the static array anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

