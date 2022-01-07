Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B569A487E1D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:19:26 +0100 (CET)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wdx-0001hA-Kv
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wcS-0008Ta-N4
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:17:53 -0500
Received: from [2607:f8b0:4864:20::429] (port=42893
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wcP-0005x3-LN
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:17:51 -0500
Received: by mail-pf1-x429.google.com with SMTP id t19so6129991pfg.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cS+WWKgOSNMFW73h8V1I1i3nBl7L1pgUnv0lyi65M4g=;
 b=j/A5Afo7iJ+a6JrDKYIJPGnLJkb+r82DBRlTH6d8jB9veWfhviiu5RQOTruGkX/+pK
 AS5K1YuyZa2y59+7Ses9F/0CBsbe46sEM/srTqJHmI7j9yJpfj4ym90djHWb7Wt78yN6
 Nn1VUUOixZZPao8SkpGRSiaDMhPAX3YmHcCwAaaodPr/29n0s07dM6ObLXClwRDp/Syf
 S2QYhIvok1MKd6tjjAgd0WRuNTj8RrFwuN7J+q1Xl7xtsF1njzg/Nflgwurh4+9TXJqy
 wgF4gszbk1ATYM4Tih808n9cn8ZKGfcwjzcM7oEA+Jcry4Co/fhUJhGJCExogzb7mDrH
 rh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cS+WWKgOSNMFW73h8V1I1i3nBl7L1pgUnv0lyi65M4g=;
 b=08GHGK6cgUyBa4DfJf9G/gPQzphFSUaJvW42w86mJhrkeI6WVEHzo9zBBT0NekFzJw
 XFTRHd4OeRRIs+oJuIkCYVW5Fpyg9DALRougNGWxFWoevLDwIH89gnGHzY+wzvpCCSzs
 vCUU2LfdixLEnyH8GUy9I+IEh45Yr99BPJ8FqbczHGvT0m559/fUJIv9T0m+sKu76rfW
 l1jP0CEIaDwLnxbcUcQ8Cd8T2Fl/iVPYgDGyefN9D+NmTeEP5E7AKzSe71nSIAbcfEIW
 pMna8OpMeQmiFuPhLmLVilalV/HLE8IRyl7N7iZ591dQg2tNym8fCNZW22QmfSjNcAT1
 Y9MA==
X-Gm-Message-State: AOAM532JPq40wjq6cBaxEzr+3rz2PvCGpbDSVnr4/Wbm3xLLS/AWb3aQ
 ZknKZG+UaGA0OkDXARsPMVPx++JtpRZLqg==
X-Google-Smtp-Source: ABdhPJyakNI6IwA5AbCkm3HsOgNMc3CG1uImx0xouY84B3/wl8XysqrQp4LtZAJBHYJ2o4KLDOn3sg==
X-Received: by 2002:a63:9902:: with SMTP id d2mr12103097pge.289.1641590267010; 
 Fri, 07 Jan 2022 13:17:47 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i23sm5203981pgi.92.2022.01.07.13.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:17:46 -0800 (PST)
Subject: Re: [PULL 00/19] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7257d85-30f9-851c-612e-858f6a9529f6@linaro.org>
Date: Fri, 7 Jan 2022 13:17:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 1/7/22 9:21 AM, Peter Maydell wrote:
> 
> The following changes since commit 41fb4c14ee500125dc0ce6fb573cf84b8db29ed0:
> 
>    Merge tag 'linux-user-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-01-06 11:22:42 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220107
> 
> for you to fetch changes up to b8905cc2dde95ca6be5e56d77053b1ca0b8fc182:
> 
>    hw/arm: kudo add lm75s on bus 13 (2022-01-07 17:08:01 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
>   * Add missing FEAT_TLBIOS instructions
>   * arm_gicv3_its: Various bug fixes and cleanups
>   * kudo-bmc: Add more devices
> 
> ----------------------------------------------------------------
> Chris Rauer (1):
>        hw/arm: Add kudo i2c eeproms.
> 
> Idan Horowitz (1):
>        target/arm: Add missing FEAT_TLBIOS instructions
> 
> Patrick Venture (2):
>        hw/arm: add i2c muxes to kudo-bmc
>        hw/arm: kudo add lm75s on bus 13
> 
> Peter Maydell (13):
>        hw/intc/arm_gicv3_its: Correct off-by-one bounds check on rdbase
>        hw/intc/arm_gicv3_its: Remove redundant ITS_CTLR_ENABLED define
>        hw/intc/arm_gicv3_its: Remove maxids union from TableDesc
>        hw/intc/arm_gicv3_its: Don't return early in extract_table_params() loop
>        hw/intc/arm_gicv3_its: Reduce code duplication in extract_table_params()
>        hw/intc/arm_gicv3_its: Correct setting of TableDesc entry_sz
>        hw/intc/arm_gicv3_its: Don't misuse GITS_TYPE_PHYSICAL define
>        hw/intc/arm_gicv3_its: Correct handling of MAPI
>        hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
>        hw/intc/arm_gicv3_its: Correct comment about CTE RDBase field size
>        hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
>        hw/intc/arm_gicv3_its: Fix various off-by-one errors
>        hw/intc/arm_gicv3_its: Rename max_l2_entries to num_l2_entries
> 
> Shengtan Mao (1):
>        hw/arm: attach MMC to kudo-bmc
> 
> Troy Lee (1):
>        Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
> 
>   hw/intc/gicv3_internal.h               |  40 +++---
>   include/hw/arm/aspeed_soc.h            |   2 +
>   include/hw/intc/arm_gicv3_its_common.h |   9 +-
>   hw/arm/aspeed_ast2600.c                |   8 ++
>   hw/arm/npcm7xx_boards.c                |  27 ++++
>   hw/intc/arm_gicv3_its.c                | 234 +++++++++++++++------------------
>   target/arm/helper.c                    |  32 +++++
>   7 files changed, 197 insertions(+), 155 deletions(-)

Applied, thanks.

r~


