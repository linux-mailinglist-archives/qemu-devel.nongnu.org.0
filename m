Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B103216656A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 18:53:40 +0100 (CET)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4q15-0003mO-Qu
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 12:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4q07-0003Jx-Qi
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:52:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4q06-0002ny-O9
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:52:39 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4q06-0002nc-IZ
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:52:38 -0500
Received: by mail-oi1-x244.google.com with SMTP id p125so28393060oif.10
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 09:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NTib0i3ZmZmHWf0sfEYyRftDJz7/bDCOOfO8RltpuB8=;
 b=qkBSCu3xV1qE6Ydgug4cpW3h9m/i9sIqkqLmzY10hSiYeRdrfEqPt7i0d4M3djlrCc
 mIIPRimgKcecp5JzhAIVm49v3p9qiP2BEr5/m+bihpxyN3CCqsnTB3XO7qM3g1MElSGt
 MzEnG/m0KidF5McRFA+tfW4ytXyLYKfkMD3npC0UCxVitRHR5EyJs0ganxcZLW2QK44m
 kDTlA9mfFZTzl7KY0UqfbA58Oxf3vSfXSyHAIpDPC21LEgkWqJLU/GrKDTwXm+GNAf3f
 7xEkH7zTACr7uLi1yJMuEXgbKBfM8TFPLVAequCRooz54GEsWmqsla9FpQQ3IAe/4i5r
 gMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NTib0i3ZmZmHWf0sfEYyRftDJz7/bDCOOfO8RltpuB8=;
 b=lTwNK041ojgERjI53MoGBx+i9hS+zO4NOHdlvTNd1IcQIOXaqt7mf85o8Hrrd4XlE+
 3to+MSo5CMPwgvKJqKuhygtPTj8u6HuRqQeRIe591831DqqMcES5wKojg/Wl9yBkrJZ4
 sHXS64SoiRE33fAknxQremU9aFqa0hBD8aEbnKYJCj1vlevzVq7kQYqgn8KHqdOhmXEh
 xSHflXBFsJbj+5dsh3KeaB/A2WTF3dRBTH0ZpYSp3ewvfthccU89O0hYRHUjfgcZ3ZIf
 ypxu8SPQy9IoIVvTkn7IFWzjqRz5mjb18WG9cId1+O+GV6HK6FzFQsqfcwx0vGTFajT7
 MhKg==
X-Gm-Message-State: APjAAAVz/wH8sZla0XQrRGdh6NaGmO7PLA0JNY5ZNz7T2QgjBsqbWFi6
 FuHApj6e0/umpFEKBNMWbI5uGMvJCD37vOl1j+If7gAp
X-Google-Smtp-Source: APXvYqztOgP3dWfKlOCNkj4Y+7/icLT9nyUeBa45jhdHCNrkz3JSWrUPO5xU3tzM/7XXhpZrPoa9wVKpHq2sVfKB0So=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2868214oie.146.1582221157756; 
 Thu, 20 Feb 2020 09:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20200214181547.21408-1-richard.henderson@linaro.org>
In-Reply-To: <20200214181547.21408-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 17:52:26 +0000
Message-ID: <CAFEAcA_zfnpbpfuvua4e9we6C0MpxZj-vY7VuoM_25=zz9m-qg@mail.gmail.com>
Subject: Re: [PATCH 00/19] target/arm: vfp feature and decodetree cleanup
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Feb 2020 at 18:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The main goal of the patchset is to move the ARM_FEATURE_VFP
> test from outside of the disas_vfp_insn() to inside each of
> the trans_* functions, so that we get the proper ISA check
> for each case.
>
> At the end of that, it is easy to eliminate all of the remaining
> tests vs ARM_FEATURE_VFP* in favor of the preferred ISAR tests.
>
> Finally, there are a couple of cleanups to vfp.decode to make
> things a bit more legible.
>
>
> r~
>
>
> Richard Henderson (19):
>   target/arm: Fix field extract from MVFR[0-2]
>   target/arm: Rename isar_feature_aa32_simd_r32
>   target/arm: Use isar_feature_aa32_simd_r32 more places
>   target/arm: Set MVFR0.FPSP for ARMv5 cpus
>   target/arm: Add isar_feature_aa32_simd_r16
>   target/arm: Rename isar_feature_aa32_fpdp_v2
>   target/arm: Add isar_feature_aa32_{fpsp_v2,fpsp_v3,fpdp_v3}
>   target/arm: Perform fpdp_v2 check first
>   target/arm: Replace ARM_FEATURE_VFP3 checks with fp{sp,dp}_v3
>   target/arm: Add missing checks for fpsp_v2
>   target/arm: Replace ARM_FEATURE_VFP4 with isar_feature_aa32_simdfmac
>   target/arm: Remove ARM_FEATURE_VFP check from disas_vfp_insn
>   target/arm: Move VLLDM and VLSTM to vfp.decode
>   target/arm: Move the vfp decodetree calls next to the base isa
>   linux-user/arm: Replace ARM_FEATURE_VFP* tests for HWCAP
>   target/arm: Remove ARM_FEATURE_VFP*
>   target/arm: Add formats for some vfp 2 and 3-register insns
>   target/arm: Split VFM decode
>   target/arm: Split VMINMAXNM decode

Hi; patch 1 here already has a version in my PMU patchset.
I've applied patches 2-10 to target-arm.next, with one or
two minor fixups for things like the checkpatch long-line
warning and a typo here or there in commit message or comment
(expect a pullreq either today or tomorrow). Patches 11-19
I've sent reviewed-by tags or comments on.

thanks
-- PMM

