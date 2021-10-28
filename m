Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4843E44D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:54:53 +0200 (CEST)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6ns-0005VZ-D6
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg6kO-0008Eo-SC
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:51:16 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg6kM-0003BK-GJ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:51:16 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so4911917pjb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ks/fkjEHbrPu9TPiHl51SHCvd4typGuwJBzeLRfq2Fw=;
 b=YM37u1+JxWHEHrDbo+17oxd/8K1UECaCmq/n8R/HzkDG+n1ioZ/H8HdSxhOiZfxfDe
 +toQ2ofL9/OjVsti/bfNozyBCut5qjbHj7ZcaewYCyHZ8SjGdCMbFNrRFMnFrhz2bNTh
 5by/TjUcAZGEgMzlerNw0rwC9yhv4GA5sbLVuuw1buo/VcNPW8ce9xHorckf+j6Zl0Xq
 I0cBzFf26u4psZGG9nR+2rFmSJ4mX25q6ta4De1FDhlyJERm3VWE0G0uGomsS2KFvuL8
 lxUXBD7FSCzNcHHXDgOM6PJUYXPj31mheQn5+W0pc5l+BxdF7MuHrUDPKCTp+pxDu8uo
 ukpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ks/fkjEHbrPu9TPiHl51SHCvd4typGuwJBzeLRfq2Fw=;
 b=hO3SlSP4HjVD9rk3+p0dF42QKlWNVEMs0jZo0uhz47mHYM3IzwzZYRP1doSDuWaUSb
 bqEkXhOi7AVmWIpzgN0dqw8EULwtnIT+rjVMufFWEkUf5nJhaTdTh6qrqivUb1/dp9Em
 KZM/veAI5X1XUrDd5gNamUD31ztvczhS4IgdCuuIk3m6sBVXJSt/KuoIMwcT0Ya3u0rn
 8WiIWZm2SmSuNHSlUNb7Grsa+tJuMMo086V+lwBOYaCfc8Vj39r418oRDUhUqUE88agy
 VC1fRJ4NfoUhlnulfHhJ6eE8T0akvowZ4kIu9HkI/wlADHKZ3AinFoXGNGq7bVCC+cAQ
 91ZA==
X-Gm-Message-State: AOAM5338aJZLspTXBth7Av75DjCp5W+GrYtbvmIYd/5jeMgmrrssi9jd
 4UyigiMd/AK/TVnm27JClOMNQ/JBXohdCg==
X-Google-Smtp-Source: ABdhPJxju0SQuZKMTuWcINu7NO+APdQ0+rvaS1IKUXIImcbp3WGT35SJH43e/MFKg4SRNgXMKrmIcA==
X-Received: by 2002:a17:902:8b81:b0:13f:3d30:f624 with SMTP id
 ay1-20020a1709028b8100b0013f3d30f624mr4349751plb.51.1635432671936; 
 Thu, 28 Oct 2021 07:51:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z7sm2959373pfe.194.2021.10.28.07.51.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 07:51:11 -0700 (PDT)
Subject: Re: [PULL 00/56] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
Message-ID: <26d42082-28f1-3059-b373-99ab9e357261@linaro.org>
Date: Thu, 28 Oct 2021 07:51:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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

On 10/27/21 7:40 PM, Richard Henderson wrote:
> The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:
> 
>    Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211027
> 
> for you to fetch changes up to 820c025f0dcacf2f3c12735b1f162893fbfa7bc6:
> 
>    tcg/optimize: Propagate sign info for shifting (2021-10-27 17:11:23 -0700)
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
> Richard Henderson (51):
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
>   target/ppc/int_helper.c        |   23 +-
>   tcg/optimize.c                 | 2644 ++++++++++++++++++++++++----------------
>   tests/unit/test-div128.c       |  197 +++
>   util/host-utils.c              |  147 ++-
>   tests/unit/meson.build         |    1 +
>   9 files changed, 2053 insertions(+), 1187 deletions(-)
>   create mode 100644 tests/unit/test-div128.c

Failed testing on s390x host.

r~


