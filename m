Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFCF4EED36
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 14:33:40 +0200 (CEST)
Received: from localhost ([::1]:38700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naGTD-00016R-2P
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 08:33:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGRH-0000FE-9L
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:31:39 -0400
Received: from [2001:4860:4864:20::2e] (port=44119
 helo=mail-oa1-x2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGRF-0006NV-On
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 08:31:38 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so2479944fac.11
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S39ASf82fmXmnHbixXsS4gBB+nFp64cArZTkdrClIHQ=;
 b=BtsWSLiumNCiuhRqLYTmOSo1iD4pi8fFem+qfzAEM/DcuJbfrbiB0tET9h0s/5lo8S
 QO+I/zO/A5fc4371t04sVN4LPbuCniqOuPYVCRIyOApfZEu2Wj92mq6lOIJrWtPwEK/N
 oLOSdqhXkiiJDAdrolkl7ve381S5zmNkCgZ/fEPIlVjGsX3SG6c/yimsSoIM9Uof8EZY
 6Txxql+I43IjzHFoj+8w3eHCCuDWZLHajt/HKEXR7g4upbWxvIX5uoXdA3cvzNkS5xKj
 Y12uTURqdwdOLzwqTni8AmOu+cOIzPbPaMBLS3kxJeNi5alcd0EZeGHnkG2Q9vmYtw1W
 JxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S39ASf82fmXmnHbixXsS4gBB+nFp64cArZTkdrClIHQ=;
 b=w2K7RK9NEQ/c3yozGTlpaxbUYT+UprIyeajmOkIpwTjvyO3JpTxCfoge9ExHREcOVc
 T25TRyYmVnG+GtKgSUl5ACfoBFxFvEwmAVUnab5L8oRsD4EexftY3vzTSOhskGaGauWn
 kX3HPw2aQZpIwBcYBZiniVnbE7VWKQ4Oy3ZAVqyFmEcl2td7thJfQOAD7P5mOA8KvEVr
 eOqUR+leMCB/zTLQU6EEoKVo6UiSoCat6CYH6nsG6NSBRn3NHljlVo5zClgwYN4+NHz2
 I+8f++8c0il4wzGZwzUOMwYsnjlv4LUf7jnX5l2DKLwZKazaazCmN9hyvgntZ+UIywDh
 3Myg==
X-Gm-Message-State: AOAM530tgGfbwtkBATS5tsLB92AGXA/HlPg01DplEdeV9EIFzDodmMKQ
 R38PS8IhY4W3bUKM/nVDhzmziA==
X-Google-Smtp-Source: ABdhPJxqK9lgD8FITKAK96lSH6N9pI25/akSnF1r4tnC0VCMpkI5jvcXld3eXSiCkXu86l/ZXoZSkQ==
X-Received: by 2002:a05:6870:6097:b0:e1:a94d:9a38 with SMTP id
 t23-20020a056870609700b000e1a94d9a38mr2743731oae.191.1648816296484; 
 Fri, 01 Apr 2022 05:31:36 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056870000f00b000de1ab6364dsm896310oaa.49.2022.04.01.05.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 05:31:35 -0700 (PDT)
Message-ID: <58ea6c94-c308-a567-cb89-a2e2dd881402@linaro.org>
Date: Fri, 1 Apr 2022 06:31:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] target/riscv: Call probe_write() before atomic
 operations
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20220401014920.1709379-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220401014920.1709379-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2e
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 19:49, Alistair Francis wrote:
> +void helper_atomic_check(CPURISCVState *env, target_ulong address,
> +                         int mmu_idx)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    void *phost;
> +    int ret = probe_access_flags(env, address, MMU_DATA_STORE, mmu_idx, false,
> +                                 &phost, GETPC());
> +
> +    if (ret & TLB_MMIO) {
> +        env->amo_store_fault = true;
> +    }
> +#endif
> +}

You've got to turn this off somewhere too.

I've got a better solution for you, using TARGET_INSN_START_EXTRA_WORDS, which will handle 
I/O regions as well.  I'll send it separately in a minute.


r~

