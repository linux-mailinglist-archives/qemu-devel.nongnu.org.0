Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D655E3C83F9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 13:37:16 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3dCV-0004aE-6w
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 07:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m3dB1-0003ok-R0
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:35:43 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:40708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m3dB0-0007wz-8K
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 07:35:43 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 j4-20020a4ac5440000b029025992521cf0so517757ooq.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QmQ1WOUM+mHgFsXxuuXqqWQP/uRQMrBwnztEpevbTsM=;
 b=Ves+JOsY8u85ciQR78/LH/zCmhz8M2yhdIuZ03a38WvYJ12RgIiBHskRlfjJsfIt9E
 MqJg68Svlb5520QplSOsx3VcRLP2y1C2pjkrG1MKZ3HNSTDTK6rs+O1OqR2avL+RQExJ
 u9m/iPxbDUQ/4Q0GUEyFA8dUPclUJVlIFAvv/kVPbLV5/QPi/lt1Zmywq3HULiuJtq2Y
 gnE5pM/m8YiaVDerZB77CYyKr6MjyT8baWcxwGaROL9oMSzQi9mGl+9SOsduusamDiiR
 VyWV2jPMx38jfjMKCIav4re/d+mTRfzTM2Fm0vWrEaeqG3A4Kn7Hkq/zmxjlq3AuRxY4
 Zj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QmQ1WOUM+mHgFsXxuuXqqWQP/uRQMrBwnztEpevbTsM=;
 b=USLrDWm1JHwqGhAgHH5TWVjv8o8jNkZaXbS3iNYiBzzWvF75u1rnASaMeM6D9UOXoU
 ARihuiopfvpETSiI1HUYCPF8A74rbiMbVIlr6FENJdqA7wwtIyZcbySn+0K7nHKi5Kmy
 aTmVhLLrzIZO1n202oheaQOj4sQo2kpd06A8Gj09W1OsowMBrKvspxy8LvJUG2crzKqX
 /7YiPzK6u3iCwPvry4er1U3ft40lTfZ6FnnEEHar7oib5buNt2u57NEvYrnye0cschPK
 Mf6snSbNjEBg1GesTbdTig7V9UQM/GLV1N+qeh3OdipADTRMgKp2iNyS5rmgexeYPDNb
 v6EQ==
X-Gm-Message-State: AOAM533YEV6K22H3i7sea/UajUQrAtX3EgKJZUgKfhLx6VLlFuIdpHLG
 G2onzLo1Fqcq8KT5D/RK02nW9pt+wvGuwuKyapQ=
X-Google-Smtp-Source: ABdhPJxemHN670ecGH+W06jWfjqJxlm62Prv4Xr7/r2Owo8CTBaMGJg6dBvIabHIuYG+6zDGBUIw3BmDNu270XQG0GU=
X-Received: by 2002:a4a:241a:: with SMTP id m26mr7629839oof.76.1626262541024; 
 Wed, 14 Jul 2021 04:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210714093719.21429-1-alex.bennee@linaro.org>
 <20210714100628.10460-1-alex.bennee@linaro.org>
In-Reply-To: <20210714100628.10460-1-alex.bennee@linaro.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 14 Jul 2021 20:35:30 +0900
Message-ID: <CAMVc7JWdA56X4ggKhZ7AdM0i5+0Xp4pbdvynswgJv+-anhDk5Q@mail.gmail.com>
Subject: Re: [PATCH v1 21/21] contrib/gitdm: add more individual contributor
 entries.
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2b.google.com
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
Cc: Li Qiang <liq3ea@gmail.com>, Li Qiang <liq3ea@163.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 Chetan Pant <chetan4windows@gmail.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am Akihiko Odaki <akihiko.odaki@gmail.com> and an individual developer.

Regards,
Akihiko Odaki

On Wed, Jul 14, 2021 at 7:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Again this is guess work based on public websites.
>
>  - Chetan lists himself as a freelancer on twitter.
>  - Akihiko lists themselves as an individual developer on GitHub
>  - Jiaxun's website looks like a personal one
>
> [AJB: Won't merge without confirmation from appropriate people.]
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
> Cc: Li Qiang <liq3ea@gmail.com>
> Cc: Li Qiang <liq3ea@163.com>
> Cc: Chetan Pant <chetan4windows@gmail.com>
> Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  contrib/gitdm/group-map-individuals | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-ma=
p-individuals
> index 36bbb77c39..853fb98bc3 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -29,3 +29,9 @@ mrolnik@gmail.com
>  huth@tuxfamily.org
>  jhogan@kernel.org
>  atar4qemu@gmail.com
> +dirty.ice.hu@gmail.com
> +liq3ea@163.com
> +liq3ea@gmail.com
> +chetan4windows@gmail.com
> +akihiko.odaki@gmail.com
> +jiaxun.yang@flygoat.com
> --
> 2.20.1
>

