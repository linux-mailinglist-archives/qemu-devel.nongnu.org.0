Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24756244E7A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 20:37:53 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6eaN-0003oh-VG
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 14:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6eZY-0003La-Ew
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 14:37:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6eZU-0007hP-Il
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 14:36:59 -0400
Received: by mail-pj1-x102f.google.com with SMTP id l60so4812959pjb.3
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 11:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mSyGCQ00UyCgU4W9lEQIrAQfxGRZDKKKHrtU9PhMcIQ=;
 b=CSSJKKfy+sonqbtGFLnLCNeBbrSCw7u9HMPegawyNa4ju/wtj18SKQr71AeFIQSkwY
 WlRmAVDYf7QAJgNuIgIxe93VRu4vvxNIFzJ62+iV/VwKC6AR+CB26ZUTXgDk3lO5ZUS6
 M3m2YlCSNrYmsk3bzjZnP7USMDQ4wjBgKxJX7vnMmjFrwI4Evzh4kcQ+vKSecthOpsEj
 eWR4c2Zy9ZSyoNUXvDT2O3FWN0IR+ohDCvaxnWk2XA26tEGN+IUJevEJ5GCQYNBr0mDq
 YrXNzoGKyBA2WbtxDuVtYq565BTh65nHP7cLK2QJFgD/5WhoNnvaHU9f/6yEYeJFBW6K
 AD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mSyGCQ00UyCgU4W9lEQIrAQfxGRZDKKKHrtU9PhMcIQ=;
 b=TK/sH9zeH63gZagnctFkqepPCDbEjqd7veDvkrssr2NtShQjhE1Si2bt9/bv8vCHoR
 H3FbtJDniLgdcKm5nnbUGs5BOxZeKG1w4tBPv2PFrpJqEuo0Qf359CUUrja9mw78X+XB
 5WbmRywb2IVViSx9OZGPGvxjxeMiL/9mrPFBObjK7Kr2X0+KJU4PTsFL6I7wA2NymOfA
 nUmD4PDDqZjAjQFY6+fJh1+JFG+N1AonjbTKCHXOCroOumq1FLWDRvgCUcuTZ3VRVvxr
 q9ATcldd5XFEu4JdZHkRpkj1RDNpexxCW0sbcn4FygLxsq0fZ3OfJKsHdQPeN4XNw13B
 g+7Q==
X-Gm-Message-State: AOAM532FkkBuVM9S+Hqr72FwfPmz6e00tgAqMa6CsZ2FX5AT/PePu4/1
 DGwhwz9aam8wwpk5B6IcAz35ag==
X-Google-Smtp-Source: ABdhPJyZLCyL2BtMWKO3xuiCXoArtbr1UhQmM/7Dh3ImiZJHn6KM0/KKC75b/GBGVAuobIHZ3tG/QQ==
X-Received: by 2002:a17:90b:803:: with SMTP id
 bk3mr3324828pjb.57.1597430214965; 
 Fri, 14 Aug 2020 11:36:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d128sm10192297pfa.24.2020.08.14.11.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 11:36:54 -0700 (PDT)
Subject: Re: [RFC v3 26/71] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
To: Frank Chang <frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-27-frank.chang@sifive.com>
 <90f01984-54a4-2a56-c52f-d1f4332b39d4@linaro.org>
 <CAE_xrPiJRRV3FYtfve6LMOF6LNEYGfhmi9CiabxqUBEew9igLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5706a1ca-1dd9-22cd-08ce-c70780111bfc@linaro.org>
Date: Fri, 14 Aug 2020 11:36:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPiJRRV3FYtfve6LMOF6LNEYGfhmi9CiabxqUBEew9igLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/20 7:48 PM, Frank Chang wrote:
> esz is passed from e.g. GEN_VEXT_LD_STRIDE() macro:
> 
>> #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)        \
>> void HELPER(NAME)(void *vd, void * v0, target_ulong base,  \
>>                   target_ulong stride, CPURISCVState *env, \
>>                   uint32_t desc)                           \
>> {                                                          \
>>     uint32_t vm = vext_vm(desc);                           \
>>     vext_ldst_stride(vd, v0, base, stride, env, desc, vm, LOAD_FN, \
>>                      sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);       \
>> }
>>
>> GEN_VEXT_LD_STRIDE(vlse8_v,  int8_t,  lde_b)
> 
> which is calculated by sizeof(ETYPE), so the results would be: 1, 2, 4, 8.
> and vext_max_elems() is called by e.g. vext_ldst_stride():

Ah, yes.

>> uint32_t max_elems = vext_max_elems(desc, esz);
> 
> I can add another parameter to the macro and pass the hard-coded log2(esz) number
> if it's the better way instead of using ctzl().
> Or if there's another approach to get the log2(esz) number more elegantly?

Using ctzl(sizeof(type)) in the GEN_VEXT_LD_STRIDE macro will work well.  This
will be constant folded by the compiler.


r~

