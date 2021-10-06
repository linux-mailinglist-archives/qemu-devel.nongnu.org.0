Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F4424644
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:48:38 +0200 (CEST)
Received: from localhost ([::1]:50884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBy1-0000wZ-E5
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYBwM-0000AY-Bu
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:46:55 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYBwK-0000t3-2z
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:46:53 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso4614043pjb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9X21bm4vNL4f45nwvW+L7jhSOfBVkZNaJXafWz8U1Uk=;
 b=S8yhp5DpXT6z3yNBP03J2MMmb/3MvpNc6Wei5NJb0XU/uiMhqMje495mPsRNpYi6jM
 IW3mKCT4etusGub/wcy0jBAXpj1tzY8xJt5cW/qulglrZhr0WPYANZgiscUHkXS3SAWt
 KKUbS8kOjG34SsYB1IXsvCm/NAL7xmGwvCuU94i0vZV/Se+PSvy8Hrsl+3vsl0nbFaRk
 olPWhcY/f/EVFWSAwztALXlxc9ZgijnLtR8WXDExvlEMPJQK57lQa7RvHb5j5XhFg52T
 ktBCOVH8D/cGMy2n3YjxkCMRva+r6oiFbaWGb/0dcESBCRr87qiOMFRMdaiPqBDQrliE
 mlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9X21bm4vNL4f45nwvW+L7jhSOfBVkZNaJXafWz8U1Uk=;
 b=sWTjK2ww7Ck0Vai2Ru2fyB1Fs3dx1I9R3Eyf6ICl5f8omsRXHC49WtKmPWyAocJR9Y
 xiBPQ7ykMcHadevGISA91xJyCrbiGXf78Rsj82OTn0VYaYmyZuLbvjpmCXzjpRAjqctm
 dsSM5fN/zDwnZT/9UrIJcxsApHQE+y3lpAIj+/FNlIBVp5aFUChIBY8URrecWQZ05njN
 WCCDdsjinE3EXuc3yNM0KaAZzoLXN4NNoyZi8HuOysj8LsmmdIQVFkTJuaEUFdQTS4Vw
 V/wF4fRMQbET+HRsSBjFK6Zv/v0EnEDqdjQ6p+m/KQdnes/cyZoV67JcnYAatU8a58Qs
 PUfg==
X-Gm-Message-State: AOAM533EUBjPT4++CwKruAzx8LdHJ1pzpk22uua2giE5OgD/5ldBGdGE
 jKBY+kzMj1VoGK6Fx48N11YbIIM4KI3euw==
X-Google-Smtp-Source: ABdhPJy0bxGWaLQ7VxIsRHg/AORSaLjmhq8QansQGLbachJ/gnnztDGYUxOnNEmldjFB+6IQj9HnNg==
X-Received: by 2002:a17:90b:3254:: with SMTP id
 jy20mr361379pjb.43.1633546010230; 
 Wed, 06 Oct 2021 11:46:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m6sm5819272pjl.46.2021.10.06.11.46.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 11:46:49 -0700 (PDT)
Subject: Re: [PULL 00/28] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211006152014.741026-1-richard.henderson@linaro.org>
Message-ID: <e93b3d98-b0e6-083f-df47-303bbc715a2f@linaro.org>
Date: Wed, 6 Oct 2021 11:46:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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

On 10/6/21 8:19 AM, Richard Henderson wrote:
> The following changes since commit e3acc2c1961cbe22ca474cd5da4163b7bbf7cea3:
> 
>    tests/docker/dockerfiles: Bump fedora-i386-cross to fedora 34 (2021-10-05 16:40:39 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211006
> 
> for you to fetch changes up to ea3f2af8f1b87d7bced9b75ef2e788b66ec49961:
> 
>    tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec (2021-10-05 16:53:17 -0700)
> 
> ----------------------------------------------------------------
> More fixes for fedora-i386-cross
> Add dup_const_tl
> Expand MemOp MO_SIZE
> Move MemOpIdx out of tcg.h
> Vector support for tcg/s390x
> 
> ----------------------------------------------------------------
> Philipp Tomsich (1):
>        tcg: add dup_const_tl wrapper
> 
> Richard Henderson (27):
>        tests/docker: Remove fedora-i386-cross from DOCKER_PARTIAL_IMAGES
>        tests/docker: Fix fedora-i386-cross cross-compilation
>        accel/tcg: Drop signness in tracing in cputlb.c
>        tcg: Expand MO_SIZE to 3 bits
>        tcg: Rename TCGMemOpIdx to MemOpIdx
>        tcg: Split out MemOpIdx to exec/memopidx.h
>        trace/mem: Pass MemOpIdx to trace_mem_get_info
>        accel/tcg: Pass MemOpIdx to atomic_trace_*_post
>        plugins: Reorg arguments to qemu_plugin_vcpu_mem_cb
>        trace: Split guest_mem_before
>        hw/core/cpu: Re-sort the non-pointers to the end of CPUClass
>        tcg: Expand usadd/ussub with umin/umax
>        tcg/s390x: Rename from tcg/s390
>        tcg/s390x: Change FACILITY representation
>        tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into TCGReg
>        tcg/s390x: Add host vector framework
>        tcg/s390x: Implement tcg_out_ld/st for vector types
>        tcg/s390x: Implement tcg_out_mov for vector types
>        tcg/s390x: Implement tcg_out_dup*_vec
>        tcg/s390x: Implement minimal vector operations
>        tcg/s390x: Implement andc, orc, abs, neg, not vector operations
>        tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
>        tcg/s390x: Implement vector shift operations
>        tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
>        tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
>        tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
>        tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec
> 
>   meson.build                                       |   2 -
>   accel/tcg/atomic_template.h                       |  73 +-
>   include/exec/memop.h                              |  14 +-
>   include/exec/memopidx.h                           |  55 ++
>   include/hw/core/cpu.h                             |  11 +-
>   include/qemu/plugin.h                             |  26 +-
>   include/tcg/tcg.h                                 | 117 ++-
>   tcg/{s390 => s390x}/tcg-target-con-set.h          |   7 +
>   tcg/{s390 => s390x}/tcg-target-con-str.h          |   1 +
>   tcg/{s390 => s390x}/tcg-target.h                  |  91 ++-
>   tcg/s390x/tcg-target.opc.h                        |  15 +
>   trace/mem.h                                       |  63 --
>   accel/tcg/cputlb.c                                | 103 ++-
>   accel/tcg/plugin-gen.c                            |   5 +-
>   accel/tcg/user-exec.c                             | 133 ++-
>   plugins/api.c                                     |  19 +-
>   plugins/core.c                                    |  10 +-
>   target/arm/helper-a64.c                           |  16 +-
>   target/arm/m_helper.c                             |   2 +-
>   target/arm/translate-a64.c                        |   2 +-
>   target/i386/tcg/mem_helper.c                      |   4 +-
>   target/m68k/op_helper.c                           |   2 +-
>   target/mips/tcg/msa_helper.c                      |   6 +-
>   target/s390x/tcg/mem_helper.c                     |  20 +-
>   target/sparc/ldst_helper.c                        |   2 +-
>   tcg/optimize.c                                    |   2 +-
>   tcg/tcg-op-vec.c                                  |  37 +-
>   tcg/tcg-op.c                                      |  60 +-
>   tcg/tcg.c                                         |   2 +-
>   tcg/tci.c                                         |  14 +-
>   accel/tcg/atomic_common.c.inc                     |  43 +-
>   target/s390x/tcg/translate_vx.c.inc               |   2 +-
>   tcg/aarch64/tcg-target.c.inc                      |  18 +-
>   tcg/arm/tcg-target.c.inc                          |  14 +-
>   tcg/i386/tcg-target.c.inc                         |  14 +-
>   tcg/mips/tcg-target.c.inc                         |  16 +-
>   tcg/ppc/tcg-target.c.inc                          |  18 +-
>   tcg/riscv/tcg-target.c.inc                        |  20 +-
>   tcg/{s390 => s390x}/tcg-target.c.inc              | 949 ++++++++++++++++++++--
>   tcg/sparc/tcg-target.c.inc                        |  20 +-
>   tcg/tcg-ldst.c.inc                                |   2 +-
>   tests/docker/Makefile.include                     |   2 +-
>   tests/docker/dockerfiles/fedora-i386-cross.docker |   5 +-
>   trace-events                                      |  18 +-
>   44 files changed, 1445 insertions(+), 610 deletions(-)
>   create mode 100644 include/exec/memopidx.h
>   rename tcg/{s390 => s390x}/tcg-target-con-set.h (86%)
>   rename tcg/{s390 => s390x}/tcg-target-con-str.h (96%)
>   rename tcg/{s390 => s390x}/tcg-target.h (66%)
>   create mode 100644 tcg/s390x/tcg-target.opc.h
>   delete mode 100644 trace/mem.h
>   rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)

Applied, thanks.

r~

