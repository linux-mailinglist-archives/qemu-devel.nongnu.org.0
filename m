Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126265EA87E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:34:34 +0200 (CEST)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpBo-0008Bz-S8
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoqM-0005oj-OY
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:12:28 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoqK-0002Ev-Dx
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:12:21 -0400
Received: by mail-ej1-x634.google.com with SMTP id 13so14383314ejn.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=CaidAlZg7Soxbuuw8bz/PaW5WGaWf4hBqsAlpPWMAgw=;
 b=U5+CH5pCxU/6zO47d3U4bxBT5yzU6XpTnlFNYa2qXI4T4zNuHSJyb9gjLDN/2Ejj2p
 yWgBW8JHPHn+us3lP+1O2jcV2hrIIEKfAEyXreHDzFIca3pbJQwL+I2OssikSMQ1xucH
 UVUaJNJYiYPLEPJTUJqfb2RYVY97agH+VkuS5YrxeE/2IIs/DeVs9Yf/0ptTdjGOs1xg
 RLphL/mofhhG+Fyz+KaiqQbfuxoo7X/SUPaOJeale5yguyvR8DvmY4AqbP/FxKuUrXim
 njS3m57Wn0gJ7gM+vdFW7odms9FT/n2DxN7VeOPgHZ5zns55ChsgcTN+C4NOHkWzjJRU
 6UNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CaidAlZg7Soxbuuw8bz/PaW5WGaWf4hBqsAlpPWMAgw=;
 b=CvXKEpm+lnfaKwlCFBSRsix9ihOv9FQkQgf/PeykBGVILSu/TXZfh9/4jfgjdjtWO/
 mth/qyJvaCZ4sQqJ8wuyxQU2V2OqacYutFxQfYOhlECfwEGLmZF06Bex6MyKvPYenwju
 0p8etuypa6AAtuYuqdyAvZTlW8NJwnCnME4YfR6j7k3hU0Om5sncIzstKRTJs9/HEUf9
 Px62AhLxpTMxlAfAdSyRQbhMO0IuksgRVc4VlkWOJprtJ7LduUjRbQmh1fK4ADO2xlFH
 omWlSC3ZieBpClULcDvqM+hexhStaSgkURLBRgJZt5ay1FdgFx+KrZknwgQ/HQFNI4ct
 Z+tg==
X-Gm-Message-State: ACrzQf2SyjvUw9mg7hMmM+NagaZc4XAl4LNu+G+nVojTgbX41I2nSJYA
 AKppJ/lxsYN9AfmYP1WowAyqI0JxQqDjLi773b1p6g==
X-Google-Smtp-Source: AMsMyM6XONsSo7iCMaXINRY4adAyyGJG6rotK70Osc/TgyBKo04fPSemc5cBP5lkJFyY8kdtGvyc/A0CuKSmxyZXoDg=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr18027217ejc.619.1664201539159; Mon, 26
 Sep 2022 07:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-3-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:12:08 +0100
Message-ID: <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] target/arm: enable tracking of CPU index in
 MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Both arm_cpu_tlb_fill (for normal IO) and
> arm_cpu_get_phys_page_attrs_debug (for debug access) come through
> get_phys_addr which is setting the other memory attributes for the
> transaction. As these are all by definition CPU accesses we can also
> set the requested_type/index as appropriate.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/ptw.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 3261039d93..644d450662 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2315,6 +2315,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong a=
ddress,
>  {
>      ARMMMUIdx s1_mmu_idx =3D stage_1_mmu_idx(mmu_idx);
>
> +    attrs->requester_type =3D MEMTXATTRS_CPU;
> +    attrs->requester_id =3D env_cpu(env)->cpu_index;
> +

This only catches the case where the memory access is
done via something that does a virtual-to-physical translation.
It misses memory accesses done directly on physical addresses,
such as those in arm_ldl_ptw() and arm_ldq_ptw(), plus various
M-profile specific ones.

thanks
-- PMM

