Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F0B681AC6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:48:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMa7T-0002i4-F0; Mon, 30 Jan 2023 14:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1pMa7Q-0002hv-RT
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:47:08 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1pMa7O-0001Ho-Be
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:47:08 -0500
Received: by mail-lf1-x129.google.com with SMTP id h24so20713894lfv.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wndVqPfVUSXYsL1HMhqEZ0esXnhbj/t7n1eyLj+lBg8=;
 b=ebY/6M6Ps7jdFLOGX9rpIlyBzr4bQgYMl0TQ34t5rU8Zp3AUqUfpgP1E1ROcu71Cs5
 fHBGKLvJV8TK7GaeikwizLpMdLfrvtHdt/UW4nPNmzT1awanpq6cmsQMN1TxWzIWDBoE
 8exLja0rEU/b/7eXzOfoHWpNeeydVeUe8kvLSPuGr54iKnuh8LZ0Gy9kp27xYTGmco5X
 y6RLKvbl0kQmhe3Nn/OYboNBxN1EbOtpG1xwCrgZdwvyMDxcyVouxbwWzw8FjZnv2Evl
 G/AOCI8EzdpttqxVT7SvoFPMz9dvqXyBi3w4nv9wC1digJnNiBP5QNbfIoTt+5wfc+BX
 /YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wndVqPfVUSXYsL1HMhqEZ0esXnhbj/t7n1eyLj+lBg8=;
 b=5E/oeQ3eCXpZMTHYS38aw19RA5EoELEUIUTJY+MNx4gq0pKnU3hmH5F7XjvA0fJSlL
 QidnTJ71K4xbq+vYwGkd7Te7RuWx324tluzetTnkdndIiGD05qGbw4Lojj4tvZJyH0ar
 31YIFOkkUX/Z9a64svUZ4kIlDQ3kUs/XSlAylezgM1k+EP4mjt6qkk+c8s1khBTJ8JDI
 tib946ql+XnUdujxIqur/h1zd769d8uYUuOaYL3f5Qz+T4gM4TALEhcUFPWydVpZbWY0
 YCH1vQTiVwgJYTZqwF9ynYoKi0HQ+IjPznB/6vRVNFGDpG1EhrShPYE+9bUG9GXsL9n0
 5yCA==
X-Gm-Message-State: AFqh2kq1hcPkFxSBLoN7MgrejL1ifjtfTVAUN7z/LTd2h/cRfNzdUytc
 acozWrWJxAxHSTrFMpzZongsr3EqBSqL8hh9Vv0P1A==
X-Google-Smtp-Source: AMrXdXs3cFES1tIENiK7ZvZbAkuSa4V2wqM+zMH8rS8rFv1qsIe9VD/p0ADV7sGjO06VmuvAGPGqHrUsVg1Y90GVm84=
X-Received: by 2002:a05:6512:1113:b0:4d0:9cea:63f1 with SMTP id
 l19-20020a056512111300b004d09cea63f1mr3857918lfg.221.1675108022799; Mon, 30
 Jan 2023 11:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 30 Jan 2023 19:47:00 +0000
Message-ID: <CA+EHjTwG8Sj=V4NhF4GqdTN=t=pxCWANaMixjQ58fAp-fDsZUQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] target/arm: Implement FEAT_FGT fine-grained traps
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=tabba@google.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Mon, Jan 30, 2023 at 6:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This series implements the FEAT_FGT fine-grained traps architectural
> feature. The bulk of this is new system registers HFGRTR_EL2, HFGWTR_EL2,
> HFGITR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, which have bits that enable
> trapping of system register and system instruction accesses on a
> fine-grained basis (typically one or a few sysregs at a time).
>
> Changes v1->v2:
>  * patch 6 updated to use RTH's suggestion of doing the check
>    inline rather than in a helper function
>  * all other patches are already reviewed
>
> In theory we could implement this with our existing ARMCPRegInfo::accessfn
> machinery, but we would end up with many many very nearly identical
> access functions. Instead this series adds a new ARMCPRegInfo::fgt
> field, which specifies which bit in which FGT register should be
> checked; this is then tested by code in the access_check_cp_reg
> helper function.
>
> A few bits in HFGITR_EL2 allow trapping of instructions which aren't
> handled by the ARMCPRegInfo mechanism: ERET and SVC. These we just
> implement "by hand". FEAT_FGT also adds new MDCR_EL3.TDCC and
> MDCR_EL2.TDCC bits for trapping the Debug Comms Channel registers;
> these we implement with a standard accessfn.
>
> The first seven patches are various cleanups and bugfixes that
> I noticed while I was doing the FEAT_FGT work. In particular, we
> weren't getting the priority of HSTR_EL2 traps right -- these should
> take priority over UNDEF-at-EL traps but not over UNDEF-at-EL0 traps.
> The rest of the series is FEAT_FGT itself.

Thanks for this. I'd tested v1, which allowed me to run KVM/SME tests
with qemu (which require FGTs). Reran the tests with V2:
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> thanks
> -- PMM
>
> Peter Maydell (23):
>   target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs correctly
>   target/arm: Correct syndrome for ATS12NSO* at Secure EL1
>   target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2, EL3}
>   target/arm: Move do_coproc_insn() syndrome calculation earlier
>   target/arm: All UNDEF-at-EL0 traps take priority over HSTR_EL2 traps
>   target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1
>   target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
>   target/arm: Define the FEAT_FGT registers
>   target/arm: Implement FGT trapping infrastructure
>   target/arm: Mark up sysregs for HFGRTR bits 0..11
>   target/arm: Mark up sysregs for HFGRTR bits 12..23
>   target/arm: Mark up sysregs for HFGRTR bits 24..35
>   target/arm: Mark up sysregs for HFGRTR bits 36..63
>   target/arm: Mark up sysregs for HDFGRTR bits 0..11
>   target/arm: Mark up sysregs for HDFGRTR bits 12..63
>   target/arm: Mark up sysregs for HFGITR bits 0..11
>   target/arm: Mark up sysregs for HFGITR bits 12..17
>   target/arm: Mark up sysregs for HFGITR bits 18..47
>   target/arm: Mark up sysregs for HFGITR bits 48..63
>   target/arm: Implement the HFGITR_EL2.ERET trap
>   target/arm: Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 traps
>   target/arm: Implement MDCR_EL2.TDCC and MDCR_EL3.TDCC traps
>   target/arm: Enable FEAT_FGT on '-cpu max'
>
>  docs/system/arm/emulation.rst |   1 +
>  target/arm/cpregs.h           | 484 +++++++++++++++++++++++++++++++++-
>  target/arm/cpu.h              |  18 ++
>  target/arm/internals.h        |  20 ++
>  target/arm/syndrome.h         |  10 +
>  target/arm/translate.h        |   6 +
>  hw/intc/arm_gicv3_cpuif.c     |   2 +
>  target/arm/cpu64.c            |   1 +
>  target/arm/debug_helper.c     |  46 +++-
>  target/arm/helper.c           | 245 ++++++++++++++++-
>  target/arm/op_helper.c        |  58 +++-
>  target/arm/translate-a64.c    |  22 +-
>  target/arm/translate.c        | 125 +++++----
>  13 files changed, 974 insertions(+), 64 deletions(-)
>
> --
> 2.34.1
>
>

