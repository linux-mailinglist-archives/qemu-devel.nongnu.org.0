Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0A5BEE12
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:58:37 +0200 (CEST)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajO8-0006xb-FD
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaecN-0005x2-UI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:53:00 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaecM-0001up-A9
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:52:59 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z2so4257472edi.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=6k+UR6vpkzUD5ujSlALjelL/Gh07HL86g44Qa+1GFR8=;
 b=Ti+xALDulbbpFKnWzsjqyRsDzYGFwRuVR6yfDwvem/v2KFH6plhgUkdklcXzHGOVSX
 3cw9GN4ptoC7ARLuSTeHfS1+WqIT/PnueeT5GxQ/xmrmiBMYZNrwQSQyCYuGxpIOs9p1
 q6XP4Jhm7FSB7/SkThkdyk3cLUD+oMzr1x/q6H0y+GdhI6BM1mK2oi6KvPHr1MlEXpPZ
 wfmFz18HT/BG6inNLqaFXqntOmq7hHzaV1Jp1GQxY9+OGA0A0Sp514UqN5D6v8JypNsP
 xn7AuvRCgC7IKVfRY9m5v+XYe776mAXKwimve6kP40z+RYAF297KU7lOx9JG0ELA60np
 VASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6k+UR6vpkzUD5ujSlALjelL/Gh07HL86g44Qa+1GFR8=;
 b=AsH5V/I4cucw9/GJMjQndeqQGUahkAOAKhNPMHuf16EnansVk4/uWPT+wOmTWs/awC
 BzXz3UVOQL3Wt4Mo/ENa8TOhmSn+cgJNYowCFIrzFUFJteWZBzzT2TPSrGjXsOTO5PDk
 FTS5tXeS38uHVvjXrANSkro5WiJs/ljS0hJX0fYLShV1aM7uk2FtziTmZ271kqCww4on
 XF9/Kd0qP0anq5sMeQKgXoVYSCd8uhk5nDpeRqCHDELfIxANOmBqXG9EQrRwvzv9YF3v
 3SfvIIXf6oRwU5JAWqqt3N4WQC3dnYFxKvDS037VKEKN2e9uYgqp9pOKu4/ZWRb3pc+F
 9ZJQ==
X-Gm-Message-State: ACrzQf2HpbtqgG0zadJjyitw6bvxpuBzAtV7qBwADKJH5y+rBDMWSfqu
 CxSPb9f9lLvKTYVWNtyvhWX5F/xNlOPTranE8pozOA==
X-Google-Smtp-Source: AMsMyM7YiRpp8URugRWj9R60nHGAIIuozuwQD+387epoyalbRQbnblzcJI2YJXaXOMS7Ngkox26kqvhLn9Kkoi+ogjM=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr20812656edc.149.1663685576726; Tue, 20
 Sep 2022 07:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-18-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:52:45 +0100
Message-ID: <CAFEAcA-wQk1af=VWxBFmDSSmicn_qjcy88M5wns-SL8LqWXHUw@mail.gmail.com>
Subject: Re: [PATCH v2 17/66] target/arm: Add is_secure parameter to
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Mon, 22 Aug 2022 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_lpae,
> using the new parameter instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -2334,7 +2334,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong a=
ddress,
>              memset(result, 0, sizeof(*result));
>
>              ret =3D get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx=
,
> -                                     is_el0, result, fi);
> +                                     ipa_secure, is_el0, result, fi);
>              fi->s2addr =3D ipa;

Depending on how we change patch 2, this may want to be looking at
something other than ipa_secure.

thanks
-- PMM

