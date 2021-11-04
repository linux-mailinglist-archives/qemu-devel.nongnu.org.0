Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65268445297
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:03:06 +0100 (CET)
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibST-0004wC-4w
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mibR3-00045u-Le
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:01:37 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mibR1-0008Jx-0b
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:01:37 -0400
Received: by mail-qt1-x82e.google.com with SMTP id u7so3832057qtc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FKJkDxq48bMoIlyipPBE5/K5kMlZacL0mUbxqLpoaqM=;
 b=Nh0b8Plug3xo6vQXymRM5OmvAgmjl6YHj/9TJR5irXOmo+1Bylw0S5o62wsc8Jwqik
 rT8LvZdNmi2LKOB/r8QZ1fhVN7RUPc5pu7IRx+KsAxv09vSzSPmdU0TKukg22vgB8EuM
 bXRzBFhYTE9pgBpdhjRv//GUrC3Dr76wlNtYP/07Le/P+wZDb+ZA6uBxif9ZCVzUqPfg
 kFBv44zx62UwZTCt8afFRc2duCltCBnmz5Lzuns8GsrbaQZsA8xchz/w2wJDxxF1WYPe
 rDnZ1Matr/EpUxxob1vHmZM9KFSV/02ou5ucJzkPuFVFyMXI2UX4byUfmtO6ni/Ch+BJ
 eaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FKJkDxq48bMoIlyipPBE5/K5kMlZacL0mUbxqLpoaqM=;
 b=Z639vHzbEOdy/W+bSkjSR+kms3+vtU6itDFOvYMvupMnDfVCsePby0vrZ/b6yIkFMj
 BXkxjkROnZJWmW5aNFZA/bXsssTOIDZtJf/AHhPQl/r9GYVzFB1LodTsh0mr8NVnKiti
 h0F4iK0Wh6SAkKYTJnKPMWJZC9MYy9AdUNM57uz2iBXA19YPn4Pa1NEoOz9G7twoezRJ
 cRwPvUZqJy5PkoQqpuAKBkP/SG3yBiQieOtc9I434DpRWzsZQ13qg0eUWEWv7SrtBf86
 x4KacchTuc2aQVlCFQibpRoKdNfDauQx7wOKtJrKcuTbooFehBu9GK0l6iZiaAubwLUu
 Sexg==
X-Gm-Message-State: AOAM532aVN1qut3bIjgWP3bKbTnNrOw70NqroulOqefDztSsib2FAOO0
 zTkilAx2QXc4B4sLEccq36JFCucI6FBr6g==
X-Google-Smtp-Source: ABdhPJwaMZlNyfXGntpoIH93rtUX+D8a6bBtOaj80sqLaDRRG0nihaybm/JykU8OaVxm9dpGQ3tR4A==
X-Received: by 2002:ac8:588d:: with SMTP id t13mr53662019qta.179.1636027293903; 
 Thu, 04 Nov 2021 05:01:33 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id n3sm3460980qkp.112.2021.11.04.05.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 05:01:33 -0700 (PDT)
Subject: Re: [PULL v2 00/30] Hexagon HVX (target/hexagon) patch series
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6404569d-2dd5-b897-0307-e0156a9894db@linaro.org>
Date: Thu, 4 Nov 2021 08:01:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635974247-1820-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 5:16 PM, Taylor Simpson wrote:
> The following changes since commit 91e8394415f9bc9cd81c02bfafe02012855d4f98:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211031-pull-request' into staging (2021-11-02 10:07:27 -0400)
> 
> are available in the git repository at:
> 
>    https://github.com/quic/qemu tags/pull-hex-20211103
> 
> for you to fetch changes up to 49278c1b0d7ef5864d0d8ad9a950296deb8b05ae:
> 
>    Hexagon HVX (tests/tcg/hexagon) histogram test (2021-11-03 16:01:38 -0500)
> 
> ----------------------------------------------------------------
> This series adds support for the Hexagon Vector eXtensions (HVX)
> 
> These instructions are documented here
> https://developer.qualcomm.com/downloads/qualcomm-hexagon-v66-hvx-programmer-s-reference-manual
> 
> Hexagon HVX is a wide vector engine with 128 byte vectors.
> 
> See patch 01 Hexagon HVX README for more information.
> 
> *** Changes in v2 ***
> Remove HVX tests from makefile to avoid need for toolchain upgrade
> 
> ----------------------------------------------------------------
> Taylor Simpson (30):
>        Hexagon HVX (target/hexagon) README
>        Hexagon HVX (target/hexagon) add Hexagon Vector eXtensions (HVX) to core
>        Hexagon HVX (target/hexagon) register names
>        Hexagon HVX (target/hexagon) instruction attributes
>        Hexagon HVX (target/hexagon) macros
>        Hexagon HVX (target/hexagon) import macro definitions
>        Hexagon HVX (target/hexagon) semantics generator
>        Hexagon HVX (target/hexagon) semantics generator - part 2
>        Hexagon HVX (target/hexagon) C preprocessor for decode tree
>        Hexagon HVX (target/hexagon) instruction utility functions
>        Hexagon HVX (target/hexagon) helper functions
>        Hexagon HVX (target/hexagon) TCG generation
>        Hexagon HVX (target/hexagon) helper overrides infrastructure
>        Hexagon HVX (target/hexagon) helper overrides for histogram instructions
>        Hexagon HVX (target/hexagon) helper overrides - vector assign & cmov
>        Hexagon HVX (target/hexagon) helper overrides - vector add & sub
>        Hexagon HVX (target/hexagon) helper overrides - vector shifts
>        Hexagon HVX (target/hexagon) helper overrides - vector max/min
>        Hexagon HVX (target/hexagon) helper overrides - vector logical ops
>        Hexagon HVX (target/hexagon) helper overrides - vector compares
>        Hexagon HVX (target/hexagon) helper overrides - vector splat and abs
>        Hexagon HVX (target/hexagon) helper overrides - vector loads
>        Hexagon HVX (target/hexagon) helper overrides - vector stores
>        Hexagon HVX (target/hexagon) import semantics
>        Hexagon HVX (target/hexagon) instruction decoding
>        Hexagon HVX (target/hexagon) import instruction encodings
>        Hexagon HVX (tests/tcg/hexagon) vector_add_int test
>        Hexagon HVX (tests/tcg/hexagon) hvx_misc test
>        Hexagon HVX (tests/tcg/hexagon) scatter_gather test
>        Hexagon HVX (tests/tcg/hexagon) histogram test
> 
>   target/hexagon/cpu.h                         |   35 +-
>   target/hexagon/gen_tcg_hvx.h                 |  903 +++++++++
>   target/hexagon/helper.h                      |   16 +
>   target/hexagon/hex_arch_types.h              |    5 +
>   target/hexagon/hex_regs.h                    |    1 +
>   target/hexagon/insn.h                        |    3 +
>   target/hexagon/internal.h                    |    3 +
>   target/hexagon/macros.h                      |   22 +
>   target/hexagon/mmvec/decode_ext_mmvec.h      |   24 +
>   target/hexagon/mmvec/macros.h                |  354 ++++
>   target/hexagon/mmvec/mmvec.h                 |   82 +
>   target/hexagon/mmvec/system_ext_mmvec.h      |   25 +
>   target/hexagon/translate.h                   |   61 +
>   tests/tcg/hexagon/hvx_histogram_input.h      |  717 +++++++
>   tests/tcg/hexagon/hvx_histogram_row.h        |   24 +
>   target/hexagon/attribs_def.h.inc             |   22 +
>   target/hexagon/cpu.c                         |   80 +-
>   target/hexagon/decode.c                      |   28 +-
>   target/hexagon/gen_dectree_import.c          |   13 +
>   target/hexagon/gen_semantics.c               |   33 +
>   target/hexagon/genptr.c                      |  188 ++
>   target/hexagon/mmvec/decode_ext_mmvec.c      |  236 +++
>   target/hexagon/mmvec/system_ext_mmvec.c      |   47 +
>   target/hexagon/op_helper.c                   |  282 ++-
>   target/hexagon/translate.c                   |  239 ++-
>   tests/tcg/hexagon/hvx_histogram.c            |   88 +
>   tests/tcg/hexagon/hvx_misc.c                 |  469 +++++
>   tests/tcg/hexagon/scatter_gather.c           | 1011 ++++++++++
>   tests/tcg/hexagon/vector_add_int.c           |   61 +
>   target/hexagon/README                        |   81 +-
>   target/hexagon/gen_helper_funcs.py           |  115 +-
>   target/hexagon/gen_helper_protos.py          |   19 +-
>   target/hexagon/gen_tcg_funcs.py              |  257 ++-
>   target/hexagon/hex_common.py                 |   13 +
>   target/hexagon/imported/allext.idef          |   25 +
>   target/hexagon/imported/allext_macros.def    |   25 +
>   target/hexagon/imported/allextenc.def        |   20 +
>   target/hexagon/imported/allidefs.def         |    1 +
>   target/hexagon/imported/encode.def           |    1 +
>   target/hexagon/imported/macros.def           |   88 +
>   target/hexagon/imported/mmvec/encode_ext.def |  794 ++++++++
>   target/hexagon/imported/mmvec/ext.idef       | 2606 ++++++++++++++++++++++++++
>   target/hexagon/imported/mmvec/macros.def     |  842 +++++++++
>   target/hexagon/meson.build                   |   15 +-
>   tests/tcg/hexagon/hvx_histogram_row.S        |  294 +++
>   45 files changed, 10221 insertions(+), 47 deletions(-)
>   create mode 100644 target/hexagon/gen_tcg_hvx.h
>   create mode 100644 target/hexagon/mmvec/decode_ext_mmvec.h
>   create mode 100644 target/hexagon/mmvec/macros.h
>   create mode 100644 target/hexagon/mmvec/mmvec.h
>   create mode 100644 target/hexagon/mmvec/system_ext_mmvec.h
>   create mode 100644 tests/tcg/hexagon/hvx_histogram_input.h
>   create mode 100644 tests/tcg/hexagon/hvx_histogram_row.h
>   create mode 100644 target/hexagon/mmvec/decode_ext_mmvec.c
>   create mode 100644 target/hexagon/mmvec/system_ext_mmvec.c
>   create mode 100644 tests/tcg/hexagon/hvx_histogram.c
>   create mode 100644 tests/tcg/hexagon/hvx_misc.c
>   create mode 100644 tests/tcg/hexagon/scatter_gather.c
>   create mode 100644 tests/tcg/hexagon/vector_add_int.c
>   create mode 100644 target/hexagon/imported/allext.idef
>   create mode 100644 target/hexagon/imported/allext_macros.def
>   create mode 100644 target/hexagon/imported/allextenc.def
>   create mode 100644 target/hexagon/imported/mmvec/encode_ext.def
>   create mode 100644 target/hexagon/imported/mmvec/ext.idef
>   create mode 100755 target/hexagon/imported/mmvec/macros.def
>   create mode 100644 tests/tcg/hexagon/hvx_histogram_row.S

Applied, thanks.

r~

