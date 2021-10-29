Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E484401A8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:06:18 +0200 (CEST)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWGf-0000uf-CR
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgW9N-0003Z1-IO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:58:45 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgW9K-00008I-C9
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:58:45 -0400
Received: by mail-pg1-x529.google.com with SMTP id q187so10647634pgq.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qqc+CKQmzp1ovtHauR9LiS6uR6TXqwpui1HFml9eubM=;
 b=opvfXfhsHa2qfPPMizAbAJmlXxYyxiOUkXhC04KLpMnaumo+ewXCT/o7/RHD43onzo
 ag10SQWtsPMhTWyq0biyZSegj/i/Alm7JTdk57WLTWgbL/JwxtXKT1+mtGbFwxcYZ3GQ
 fCWE/I2MepCXJkRNHwUtDu/3wnWYRW3uVuQBuvMvfWYGDFCz0RYT48oNwHDoZ7LLIxor
 iHdu2sxj6MMnE/jmDSL7PD/IaqyHlcR174ZncwRL5+bYsna/G3bqp+Lokg5JA9LKVpKE
 tAQinKWzmdKM3MONFZxrbK/+csh+jDAeYcYx5zTm/50PnQxifpMwxET5h7add+UH0nGX
 dQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqc+CKQmzp1ovtHauR9LiS6uR6TXqwpui1HFml9eubM=;
 b=ZmqneObWCatGNEVWqBXqe1mQAwVAVZmJtHLBKND4aj5dRohjO5zX2a68uW612gEETS
 Ies5lNi7Q4vrQm56WTfBW1eFXUul7qhRfsRiri02G+WuNrmiWhCMM2neuLStkrEEnQa7
 7SJvBoiGRaUE8UwLEpTtFQWLBPIDSCv7uS/848uLp0w4xgnTnV14SSM71CfH6/1UJo5P
 ciDKEt4nx2eBN9mqPkYHTcIPiad0cSb5JyJmnYZTCrcZq2CoMnF7v2j+3FkJ5kjDFtyl
 WVBoI9KtqPFEDJGoXHFA2VtA/aeP7WYpcQnLlRDwk1v9CXn8IqnosMPSz0J/I/qSpS5C
 Yycg==
X-Gm-Message-State: AOAM531+aNei3USsawv2SoNBfwaSn2M1SppWHi/8/srXaAeXop5TAPJT
 gBzR3jbuXUEOGkow3RyrwuX4vdIKDRbR7g==
X-Google-Smtp-Source: ABdhPJzmlNH2wfNkFVi53C3VBuulx89RxEErqLgkbRblXjxfjGKmyhw4WUVX1jgrhMGBf0WZ7EA3Jg==
X-Received: by 2002:a05:6a00:1393:b0:47b:ebaa:7dd3 with SMTP id
 t19-20020a056a00139300b0047bebaa7dd3mr12216739pfg.17.1635530320781; 
 Fri, 29 Oct 2021 10:58:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q18sm8592310pfu.219.2021.10.29.10.58.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:58:40 -0700 (PDT)
Subject: Re: [PULL v2 00/60] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
Message-ID: <03e39819-5495-914e-2e6d-532a05b6b764@linaro.org>
Date: Fri, 29 Oct 2021 10:58:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 9:32 PM, Richard Henderson wrote:
> The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:
> 
>    Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211028
> 
> for you to fetch changes up to efd629fb21e2ff6a8f62642d9ed7a23dfee4d320:
> 
>    softmmu: fix for "after access" watchpoints (2021-10-28 20:55:07 -0700)
> 
> ----------------------------------------------------------------
> Improvements to qemu/int128
> Fixes for 128/64 division.
> Cleanup tcg/optimize.c
> Optimize redundant sign extensions
> 
> ----------------------------------------------------------------
> Frédéric Pétrot (1):
>        qemu/int128: Add int128_{not,xor}
> 
> Luis Pires (4):
>        host-utils: move checks out of divu128/divs128
>        host-utils: move udiv_qrnnd() to host-utils
>        host-utils: add 128-bit quotient support to divu128/divs128
>        host-utils: add unit tests for divu128/divs128
> 
> Pavel Dovgalyuk (3):
>        softmmu: fix watchpoint processing in icount mode
>        softmmu: remove useless condition in watchpoint check
>        softmmu: fix for "after access" watchpoints
> 
> Richard Henderson (52):
>        tcg/optimize: Rename "mask" to "z_mask"
>        tcg/optimize: Split out OptContext
>        tcg/optimize: Remove do_default label
>        tcg/optimize: Change tcg_opt_gen_{mov,movi} interface
>        tcg/optimize: Move prev_mb into OptContext
>        tcg/optimize: Split out init_arguments
>        tcg/optimize: Split out copy_propagate
>        tcg/optimize: Split out fold_call
>        tcg/optimize: Drop nb_oargs, nb_iargs locals
>        tcg/optimize: Change fail return for do_constant_folding_cond*
>        tcg/optimize: Return true from tcg_opt_gen_{mov,movi}
>        tcg/optimize: Split out finish_folding
>        tcg/optimize: Use a boolean to avoid a mass of continues
>        tcg/optimize: Split out fold_mb, fold_qemu_{ld,st}
>        tcg/optimize: Split out fold_const{1,2}
>        tcg/optimize: Split out fold_setcond2
>        tcg/optimize: Split out fold_brcond2
>        tcg/optimize: Split out fold_brcond
>        tcg/optimize: Split out fold_setcond
>        tcg/optimize: Split out fold_mulu2_i32
>        tcg/optimize: Split out fold_addsub2_i32
>        tcg/optimize: Split out fold_movcond
>        tcg/optimize: Split out fold_extract2
>        tcg/optimize: Split out fold_extract, fold_sextract
>        tcg/optimize: Split out fold_deposit
>        tcg/optimize: Split out fold_count_zeros
>        tcg/optimize: Split out fold_bswap
>        tcg/optimize: Split out fold_dup, fold_dup2
>        tcg/optimize: Split out fold_mov
>        tcg/optimize: Split out fold_xx_to_i
>        tcg/optimize: Split out fold_xx_to_x
>        tcg/optimize: Split out fold_xi_to_i
>        tcg/optimize: Add type to OptContext
>        tcg/optimize: Split out fold_to_not
>        tcg/optimize: Split out fold_sub_to_neg
>        tcg/optimize: Split out fold_xi_to_x
>        tcg/optimize: Split out fold_ix_to_i
>        tcg/optimize: Split out fold_masks
>        tcg/optimize: Expand fold_mulu2_i32 to all 4-arg multiplies
>        tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
>        tcg/optimize: Sink commutative operand swapping into fold functions
>        tcg: Extend call args using the correct opcodes
>        tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values
>        tcg/optimize: Use fold_xx_to_i for orc
>        tcg/optimize: Use fold_xi_to_x for mul
>        tcg/optimize: Use fold_xi_to_x for div
>        tcg/optimize: Use fold_xx_to_i for rem
>        tcg/optimize: Optimize sign extensions
>        tcg/optimize: Propagate sign info for logical operations
>        tcg/optimize: Propagate sign info for setcond
>        tcg/optimize: Propagate sign info for bit counting
>        tcg/optimize: Propagate sign info for shifting
> 
>   include/fpu/softfloat-macros.h |   82 --
>   include/hw/clock.h             |    5 +-
>   include/qemu/host-utils.h      |  121 +-
>   include/qemu/int128.h          |   20 +
>   softmmu/physmem.c              |   41 +-
>   target/ppc/int_helper.c        |   23 +-
>   tcg/optimize.c                 | 2644 ++++++++++++++++++++++++----------------
>   tcg/tcg.c                      |    6 +-
>   tests/unit/test-div128.c       |  197 +++
>   util/host-utils.c              |  147 ++-
>   tests/unit/meson.build         |    1 +
>   11 files changed, 2075 insertions(+), 1212 deletions(-)
>   create mode 100644 tests/unit/test-div128.c

Applied, thanks.

r~


