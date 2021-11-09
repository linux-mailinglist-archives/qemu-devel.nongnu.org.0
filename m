Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850C244A984
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 09:43:02 +0100 (CET)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkMib-00031Z-Md
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 03:43:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMgp-0001Vx-7g
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:41:11 -0500
Received: from [2a00:1450:4864:20::32c] (port=41802
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMgm-0003Yv-R4
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:41:10 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso1698554wmf.0
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L/Ay3oICBxX15e1VY4luGLSQ9lX+yYUmtF72myzm6a0=;
 b=EFZ/MLJ6RbY29Wol5Yuh3FaEIZoBpSqE+SRgamIQwUYIpqdFkLC9ysmQ0siUDcaYzs
 KKMiZNl8Z1CxSUK5rH7BfPA4KGMewBjjYNCKlxE/atW9BRlYZLvzGELuMDKJYQXcso6k
 tqiYI8uhsoNutRZquuqWPKvx28L80a12MCSSP+IGBwf3t8vZ/jiZuyGGCq6MgofBQMUI
 q67W68hZ9TH8g+A2y6l7oamZ07u4WybsS4ahcjXmysV8yuieZpIoOUE5NsUkYKm8ipK8
 EOcfgtdlmrU8lAeG9QDzWBmWDRPRrP2ji6BQenUNJ7Fw0jI+EWJXYHLnpeR6NJOY7H9I
 azng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/Ay3oICBxX15e1VY4luGLSQ9lX+yYUmtF72myzm6a0=;
 b=ZFVaa8SJn28kSa9YzmQEpqagMEIv12gveTDtLUMEqRQVQ0S87OtVRuzpfvtySPK1Ba
 SbJvUXGgNB/vEJmA7so/4sT6+nFbYo0OCxRhXO0SDoWqgHXEXWVRK/vAOSfZ4rHpk1sF
 odF79sGt9QsusEgrN+SnPsTjCOxpJwYKWmXfrtW+MtrcSr+VsNxQX3aVzllJLoN+8NpN
 PP9Uhr3dLPyAHYAjgiWkYj1r6WSGDxenuV0MD9SdVdCG8Bx05BoQGxzNFsEv6Q5SgKxg
 Lr+O/uZoUviJ0N9AT2UqEslyn3zmbeR19urIfhgPBZXJRLQjqKsoDa+Gx+zh7Tj/wBZP
 Ojsg==
X-Gm-Message-State: AOAM530amBhRDG00xSNS6EtF5GbGQz2Hxx6MbxniTOWgzQwxwYHCkKqY
 Tb+w+LF6m71xay+jtILMT9dQwGfVJgftjeApoJo=
X-Google-Smtp-Source: ABdhPJyRay+kacCmIvIQH6pDBzMpmT6kFeMv7NlQMnXjTR1lwRClLAzcu9OGY72Svfr8jJ9xBkRUcg==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr5200481wme.2.1636447266824;
 Tue, 09 Nov 2021 00:41:06 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id g13sm1786024wmk.37.2021.11.09.00.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:41:06 -0800 (PST)
Subject: Re: [PULL 00/54] ppc-for-6.2 queue 20211109
To: David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org,
 clg@kaod.org, danielhb413@gmail.com, groug@kaod.org
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1de5a918-a8c7-a6a0-dbf9-17d2eb9c2dd3@linaro.org>
Date: Tue, 9 Nov 2021 09:41:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 6:51 AM, David Gibson wrote:
> The following changes since commit 114f3c8cc427333dbae331dfd2ecae64676b087e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/avocado-20211108' into staging (2021-11-08 18:50:09 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.2-20211109
> 
> for you to fetch changes up to 71e6fae3a994ab5c69e37d6a52a30c840883fbfb:
> 
>    spapr_numa.c: FORM2 table handle nodes with no distance info (2021-11-09 10:32:53 +1100)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2021-11-09
> 
> Here's the latest set of ppc related patches for qemu-6.2, which I
> hope will squeeze in just barely before the hard freeze.
> 
> This set includes a change to MAINTAINERS moving maintainership of ppc
> from myself and Greg Kurz to Cédric le Goater and Daniel Henrique
> Barboza.  So, I expect this to be my last pull request as ppc
> maintainer.  It's been great, but it's time I moved onto other things.
> 
> Apart from that, this patchset is mostly a lot of updates to TCG
> implementations of ISA 3.1 (POWER10) instructions from the El Dorado
> team.  There are also a handful of other fixes.
> 
> ----------------------------------------------------------------
> BALATON Zoltan (1):
>        ppc/pegasos2: Suppress warning when qtest enabled
> 
> Bruno Larsen (1):
>        target/ppc: Move REQUIRE_ALTIVEC/VECTOR to translate.c
> 
> Bruno Larsen (billionai) (6):
>        target/ppc: Introduce REQUIRE_VSX macro
>        target/ppc: moved XXSPLTW to using decodetree
>        target/ppc: moved XXSPLTIB to using decodetree
>        target/ppc: implemented XXSPLTI32DX
>        target/ppc: Implemented XXSPLTIW using decodetree
>        target/ppc: implemented XXSPLTIDP instruction
> 
> Cédric Le Goater (1):
>        ppc/pnv: Fix check on block device before updating drive contents
> 
> David Gibson (1):
>        target/ppc, hw/ppc: Change maintainers
> 
> Fernando Eckhardt Valle (4):
>        target/ppc: introduce do_ea_calc
>        target/ppc: move resolve_PLS_D to translate.c
>        target/ppc: Move load and store floating point instructions to decodetree
>        target/ppc: Implement PLFS, PLFD, PSTFS and PSTFD instructions
> 
> Fernando Valle (1):
>        target/ppc: Introduce REQUIRE_FPU
> 
> Lucas Mateus Castro (alqotel) (6):
>        target/ppc: moved stxv and lxv from legacy to decodtree
>        target/ppc: moved stxvx and lxvx from legacy to decodtree
>        target/ppc: added the instructions LXVP and STXVP
>        target/ppc: added the instructions LXVPX and STXVPX
>        target/ppc: added the instructions PLXV and PSTXV
>        target/ppc: added the instructions PLXVP and PSTXVP
> 
> Luis Pires (15):
>        target/ppc: Implement cntlzdm
>        target/ppc: Implement cnttzdm
>        libdecnumber: introduce decNumberFrom[U]Int128
>        target/ppc: Implement DCFFIXQQ
>        host-utils: Introduce mulu128
>        libdecnumber: Introduce decNumberIntegralToInt128
>        target/ppc: Implement DCTFIXQQ
>        target/ppc: Do not update nip on DFP instructions
>        target/ppc: Move dtstdc[q]/dtstdg[q] to decodetree
>        target/ppc: Move d{add,sub,mul,div,iex}[q] to decodetree
>        target/ppc: Move dcmp{u,o}[q],dts{tex,tsf,tsfi}[q] to decodetree
>        target/ppc: Move dquai[q], drint{x,n}[q] to decodetree
>        target/ppc: Move dqua[q], drrnd[q] to decodetree
>        target/ppc: Move dct{dp,qpq},dr{sp,dpq},dc{f,t}fix[q],dxex[q] to decodetree
>        target/ppc: Move ddedpd[q],denbcd[q],dscli[q],dscri[q] to decodetree
> 
> Matheus Ferst (17):
>        target/ppc: Move LQ and STQ to decodetree
>        target/ppc: Implement PLQ and PSTQ
>        target/ppc: Implement pdepd instruction
>        target/ppc: Implement pextd instruction
>        target/ppc: Move vcfuged to vmx-impl.c.inc
>        target/ppc: Implement vclzdm/vctzdm instructions
>        target/ppc: Implement vpdepd/vpextd instruction
>        target/ppc: Implement vsldbi/vsrdbi instructions
>        target/ppc: Implement Vector Insert from GPR using GPR index insns
>        target/ppc: Implement Vector Insert Word from GPR using Immediate insns
>        target/ppc: Implement Vector Insert from VSR using GPR index insns
>        target/ppc: Move vinsertb/vinserth/vinsertw/vinsertd to decodetree
>        target/ppc: Implement Vector Extract Double to VSR using GPR index insns
>        target/ppc: receive high/low as argument in get/set_cpu_vsr
>        target/ppc: Implement xxblendvb/xxblendvh/xxblendvw/xxblendvd instructions
>        target/ppc: Implement lxvkq instruction
>        target/ppc: cntlzdm/cnttzdm implementation without brcond
> 
> Nicholas Piggin (1):
>        spapr_numa.c: FORM2 table handle nodes with no distance info
> 
>   MAINTAINERS                                |  20 +-
>   hw/ppc/pegasos2.c                          |   3 +-
>   hw/ppc/pnv_pnor.c                          |   2 +-
>   hw/ppc/spapr_numa.c                        |  22 +-
>   include/libdecnumber/decNumber.h           |   4 +
>   include/libdecnumber/decNumberLocal.h      |   2 +-
>   include/qemu/host-utils.h                  |  36 ++
>   libdecnumber/decContext.c                  |   7 +-
>   libdecnumber/decNumber.c                   | 131 ++++++
>   target/ppc/dfp_helper.c                    | 168 ++++---
>   target/ppc/helper.h                        | 126 +++---
>   target/ppc/insn32.decode                   | 303 +++++++++++++
>   target/ppc/insn64.decode                   |  72 +++
>   target/ppc/int_helper.c                    | 135 +++++-
>   target/ppc/translate.c                     | 238 +++-------
>   target/ppc/translate/dfp-impl.c.inc        | 419 +++++++++--------
>   target/ppc/translate/dfp-ops.c.inc         | 165 -------
>   target/ppc/translate/fixedpoint-impl.c.inc | 219 +++++++--
>   target/ppc/translate/fp-impl.c.inc         | 261 ++++-------
>   target/ppc/translate/fp-ops.c.inc          |  29 --
>   target/ppc/translate/vector-impl.c.inc     |  56 ---
>   target/ppc/translate/vmx-impl.c.inc        | 334 +++++++++++++-
>   target/ppc/translate/vmx-ops.c.inc         |  10 +-
>   target/ppc/translate/vsx-impl.c.inc        | 702 +++++++++++++++++------------
>   target/ppc/translate/vsx-ops.c.inc         |   4 -
>   25 files changed, 2171 insertions(+), 1297 deletions(-)
>   delete mode 100644 target/ppc/translate/dfp-ops.c.inc
>   delete mode 100644 target/ppc/translate/vector-impl.c.inc

Applied, thanks.
Don't forget to update the changelog on the wiki for the new features.


r~

