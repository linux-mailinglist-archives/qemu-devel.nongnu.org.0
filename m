Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5951AFA4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 22:45:48 +0200 (CEST)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmLsZ-0005mw-OE
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 16:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmLqs-000501-C0
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:44:02 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmLqq-0000MR-FV
 for qemu-devel@nongnu.org; Wed, 04 May 2022 16:44:02 -0400
Received: by mail-oi1-x22d.google.com with SMTP id y63so2393799oia.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 13:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aTe29L2HCGydkiBXd0TaXzS55GvymqtUw+tv3Eo3e14=;
 b=IfgGmKZaNz35iXv7hwALMGxjGEfMVlcVCw5sdFNqVtcKq9NQ9vTpFH26z55iS5jFei
 9BHqG2vYQe8RdE40XN+tnoCIgL5GpoXUp4ewmaIAeUBX33OhctoWo8cW5Br7LastMZxI
 2UPGL5Cs+5jEdFIDuOVlHfEbmD2IZqQ0HpzPEm5VeTQ72BXtOcTUGPjM6KKtTRxbMk/U
 /7JC5+3JrEar4KPTKRBl+znu9hFFcjhBJ6Di+IZfAj1dTlNMa+g1MJ6l3wbrBVKF1HWN
 BVRtVq96TZBgMRZrIGhRvcNYm5uZR/B8W0cTqFLxjf2F4g/sHZgazce+V22IUPxXGi1B
 hZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aTe29L2HCGydkiBXd0TaXzS55GvymqtUw+tv3Eo3e14=;
 b=0KZOIrfDq9JS8orlNnACGDLX2xU9rCXW5y5o+Kw+GPPpUCgHq0AGL1OaXp14eMI2Ku
 Gr6tIROWuvCuAt58Y3/oKbRnH7HgRLok3F3opcspLkKyafhMjiSB+rrQ2PQ3zIo/yT3S
 k7Hjv7TogaoeGzPBdc3ot/xuzg70MeR9Vp+z0fI2+dLYX7fM6zQryEOwnJgAFNzXBuVq
 I9RLNCgCdUPI2ZyKFtLhRWQEcSwCPKr8ADD/RBfrIHCTEbk0lfAKozWqYq217dgOveX3
 msHsfJrYIk9tUbdI60XFRy2+Q7zJKzPNuu1GniTrVXpylySq16cd+nL3f7FZhKlEkjBS
 Iedg==
X-Gm-Message-State: AOAM533W3Gt5TLacx/CCZehWgOA7jeiIwsU1J9sAdyOLwcAc+BQDALi2
 5XWyFQ4RJ2Bxa9ukhH8FWZZZDHw/HAIdJQ==
X-Google-Smtp-Source: ABdhPJxguXP3AMbgCVTkVHdWHHXHkLjeB3mJHIoFVE9sXhdQlb7OWi8707aB2SSF2QWtxYQ0ALUPiQ==
X-Received: by 2002:a05:6808:f03:b0:325:58ac:6d02 with SMTP id
 m3-20020a0568080f0300b0032558ac6d02mr694503oiw.174.1651697039132; 
 Wed, 04 May 2022 13:43:59 -0700 (PDT)
Received: from [192.168.177.228] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05687061c300b000e686d13879sm8360304oah.19.2022.05.04.13.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 13:43:58 -0700 (PDT)
Message-ID: <410068b2-1618-a370-a8ad-1f14bf677705@linaro.org>
Date: Wed, 4 May 2022 15:43:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/15] s390x patches
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220504110521.343519-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504110521.343519-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/22 06:05, Thomas Huth wrote:
> The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:
> 
>    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-04
> 
> for you to fetch changes up to 0c5c4d5b3c1cb594e808dd4120cc56ee28fa31dd:
> 
>    tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c (2022-05-04 08:47:19 +0200)
> 
> ----------------------------------------------------------------
> * Silence the warning about the msa5 feature when using the "max" CPU on s390x
> * Implement the s390x Vector-Enhancements Facility 2
> * Remove the old libopcode-based s390 disassembler
> * Fix branch-relative-long test compilation with Clang

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> David Hildenbrand (2):
>        s390x/cpu_models: drop "msa5" from the TCG "max" model
>        s390x/cpu_models: make "max" match the unmodified "qemu" CPU model under TCG
> 
> David Miller (9):
>        target/s390x: vxeh2: vector convert short/32b
>        target/s390x: vxeh2: vector string search
>        target/s390x: vxeh2: Update for changes to vector shifts
>        target/s390x: vxeh2: vector shift double by bit
>        target/s390x: vxeh2: vector {load, store} elements reversed
>        target/s390x: vxeh2: vector {load, store} byte reversed elements
>        target/s390x: vxeh2: vector {load, store} byte reversed element
>        target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
>        tests/tcg/s390x: Tests for Vector Enhancements Facility 2
> 
> Ilya Leoshkevich (1):
>        tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c
> 
> Richard Henderson (2):
>        target/s390x: Fix writeback to v1 in helper_vstl
>        tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
> 
> Thomas Huth (1):
>        disas: Remove old libopcode s390 disassembler
> 
>   include/disas/dis-asm.h                |    1 -
>   include/tcg/tcg-op.h                   |    6 +
>   target/s390x/helper.h                  |   13 +
>   tests/tcg/s390x/vx.h                   |   19 +
>   disas.c                                |    1 -
>   disas/s390.c                           | 1892 --------------------------------
>   hw/s390x/s390-virtio-ccw.c             |    3 +
>   target/s390x/cpu.c                     |    1 -
>   target/s390x/cpu_models.c              |   26 +-
>   target/s390x/gen-features.c            |   14 +-
>   target/s390x/tcg/translate.c           |    3 +-
>   target/s390x/tcg/vec_fpu_helper.c      |   31 +
>   target/s390x/tcg/vec_helper.c          |    2 -
>   target/s390x/tcg/vec_int_helper.c      |   55 +
>   target/s390x/tcg/vec_string_helper.c   |   99 ++
>   tcg/tcg-op.c                           |   30 +
>   tests/tcg/s390x/branch-relative-long.c |    4 +-
>   tests/tcg/s390x/vxeh2_vcvt.c           |   88 ++
>   tests/tcg/s390x/vxeh2_vlstr.c          |  139 +++
>   tests/tcg/s390x/vxeh2_vs.c             |   93 ++
>   target/s390x/tcg/translate_vx.c.inc    |  461 +++++++-
>   MAINTAINERS                            |    2 -
>   disas/meson.build                      |    1 -
>   target/s390x/tcg/insn-data.def         |   40 +-
>   tests/tcg/s390x/Makefile.target        |    8 +
>   25 files changed, 1053 insertions(+), 1979 deletions(-)
>   create mode 100644 tests/tcg/s390x/vx.h
>   delete mode 100644 disas/s390.c
>   create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
>   create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
>   create mode 100644 tests/tcg/s390x/vxeh2_vs.c
> 


