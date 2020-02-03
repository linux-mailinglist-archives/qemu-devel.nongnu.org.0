Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C351150EF4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 18:52:59 +0100 (CET)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyfu6-0006eJ-7e
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 12:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iyft4-0006FL-D4
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:51:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iyft2-0007o9-HK
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:51:54 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iyft2-0007ja-7F
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:51:52 -0500
Received: by mail-wr1-x443.google.com with SMTP id m16so19392579wrx.11
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 09:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=xcPOlY6NnaMtfaZwmhIIq/8SjB6GXVUdK6Rgd0shcpU=;
 b=N8jMoAHRj9wbhy4Ufbf+es1jKGyJX+3E+/q8bR/uE6+/OPM7cNzzA2pKS6ajI1WM4d
 cs5Esvkp4+BTE7HuJ8rOU0Gye7gXsQ0nEaSBUhF36O+DiVjESiTiGoB8qSQlOd3GZ1yz
 mxr0ag8KbvgC5OI9Sxen2VpIT3vaE+X8Oi1as4oKhiehfsiKIfBaPAhZGAdkI8zNNZbH
 +51aLUT0Jnykn2byZBhZXvazSWydcX+6PUI+i80vC5/6SPE5ZkQNOOQjKfCdqoR+lDW0
 gl9y96Waf0x05vnrJIQutjN4PfGXtNvk90JwOshwUamggyvarLExe3qWMeU/JtvNjtYs
 ahgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=xcPOlY6NnaMtfaZwmhIIq/8SjB6GXVUdK6Rgd0shcpU=;
 b=TPlbyhQSp81toooRTsCkxNV2qdtQun9SuYM6I9m2UuzV2cuf+HbEN780iHnTe7rajB
 piCQ5pE54LsD3qZcsuAoFFM/YFfqUfc1Mmtz8GmVNsOqRTeuXd6ynLeGi5jL+oTnbyB0
 3vc3yTrFG9jqhTl2v9PZ6RTd0k3/IYQrWAolGXAQsmPAp/eLJyTPHup3Pf4RBjvAf2Om
 2xSbZ8Z5OjUf15p7OlDihSSOmzE/BzNt+3KvtEP3bS/iOR3DeVbzWCwffD0UO5wz1mAu
 hKLA4SlvQUtZxHqXK5U4QphSvchIUMlOAWzz5IBko+jIs3r8zbRzwWVGlJ6SPB5GiJye
 QaqA==
X-Gm-Message-State: APjAAAUudZADHW1jdUSxUpkewqkqyKKmhptvn0hV6y5IJ6hg7KrgPmEe
 gkxLtrFhXNElwVID58zSFa6ZibNFBX8=
X-Google-Smtp-Source: APXvYqzryot5xVaCMiCNePoz8Tkj+WwpacVzjprsw6t9h8m0MMmxGdshqoARDBYTVtzsKRzEjBL/Hg==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr16516896wrt.408.1580752310709; 
 Mon, 03 Feb 2020 09:51:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d23sm26925483wra.30.2020.02.03.09.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 09:51:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98D221FF87;
 Mon,  3 Feb 2020 17:51:48 +0000 (GMT)
References: <20200201192916.31796-1-richard.henderson@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 00/41] target/arm: Implement ARMv8.1-VHE
In-reply-to: <20200201192916.31796-1-richard.henderson@linaro.org>
Date: Mon, 03 Feb 2020 17:51:48 +0000
Message-ID: <878slja79n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Version 6 moves vhe_reginfo[] to file scope, and one tweak
> to the vhe register access masking that Peter asked for.
>
> All patches now have reviews.

I was re-testing and I was able to boot my guest Image+buildroot.
However the busybox crashes after login so I'm unable to do stuff in the
guests userspace. I seem to recall we saw this last time but I can't
remember what the problem was.

>
>
> r~
>
>
> Alex Benn=C3=A9e (1):
>   target/arm: check TGE and E2H flags for EL0 pauth traps
>
> Richard Henderson (40):
>   target/arm: Define isar_feature_aa64_vh
>   target/arm: Enable HCR_E2H for VHE
>   target/arm: Add CONTEXTIDR_EL2
>   target/arm: Add TTBR1_EL2
>   target/arm: Update CNTVCT_EL0 for VHE
>   target/arm: Split out vae1_tlbmask
>   target/arm: Split out alle1_tlbmask
>   target/arm: Simplify tlb_force_broadcast alternatives
>   target/arm: Rename ARMMMUIdx*_S12NSE* to ARMMMUIdx*_E10_*
>   target/arm: Rename ARMMMUIdx_S2NS to ARMMMUIdx_Stage2
>   target/arm: Rename ARMMMUIdx_S1NSE* to ARMMMUIdx_Stage1_E*
>   target/arm: Rename ARMMMUIdx_S1SE[01] to ARMMMUIdx_SE10_[01]
>   target/arm: Rename ARMMMUIdx*_S1E3 to ARMMMUIdx*_SE3
>   target/arm: Rename ARMMMUIdx_S1E2 to ARMMMUIdx_E2
>   target/arm: Recover 4 bits from TBFLAGs
>   target/arm: Expand TBFLAG_ANY.MMUIDX to 4 bits
>   target/arm: Rearrange ARMMMUIdxBit
>   target/arm: Tidy ARMMMUIdx m-profile definitions
>   target/arm: Reorganize ARMMMUIdx
>   target/arm: Add regime_has_2_ranges
>   target/arm: Update arm_mmu_idx for VHE
>   target/arm: Update arm_sctlr for VHE
>   target/arm: Update aa64_zva_access for EL2
>   target/arm: Update ctr_el0_access for EL2
>   target/arm: Add the hypervisor virtual counter
>   target/arm: Update timer access for VHE
>   target/arm: Update define_one_arm_cp_reg_with_opaque for VHE
>   target/arm: Add VHE system register redirection and aliasing
>   target/arm: Add VHE timer register redirection and aliasing
>   target/arm: Flush tlb for ASID changes in EL2&0 translation regime
>   target/arm: Flush tlbs for E2&0 translation regime
>   target/arm: Update arm_phys_excp_target_el for TGE
>   target/arm: Update {fp,sve}_exception_el for VHE
>   target/arm: Update get_a64_user_mem_index for VHE
>   target/arm: Update arm_cpu_do_interrupt_aarch64 for VHE
>   target/arm: Enable ARMv8.1-VHE in -cpu max
>   target/arm: Move arm_excp_unmasked to cpu.c
>   target/arm: Pass more cpu state to arm_excp_unmasked
>   target/arm: Use bool for unmasked in arm_excp_unmasked
>   target/arm: Raise only one interrupt in arm_cpu_exec_interrupt
>
>  target/arm/cpu-param.h     |    2 +-
>  target/arm/cpu-qom.h       |    1 +
>  target/arm/cpu.h           |  423 +++++--------
>  target/arm/internals.h     |   73 ++-
>  target/arm/translate.h     |    4 +-
>  target/arm/cpu.c           |  162 ++++-
>  target/arm/cpu64.c         |    1 +
>  target/arm/debug_helper.c  |   50 +-
>  target/arm/helper-a64.c    |    2 +-
>  target/arm/helper.c        | 1220 +++++++++++++++++++++++++++---------
>  target/arm/pauth_helper.c  |   14 +-
>  target/arm/translate-a64.c |   47 +-
>  target/arm/translate.c     |   74 ++-
>  13 files changed, 1392 insertions(+), 681 deletions(-)


--
Alex Benn=C3=A9e

