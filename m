Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123316A7962
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 03:15:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXYRz-0004Nn-S5; Wed, 01 Mar 2023 21:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYRw-0004Gl-49
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 21:13:41 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYRu-0005Tu-2y
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 21:13:39 -0500
Received: by mail-pf1-x431.google.com with SMTP id ay18so9227008pfb.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 18:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677723216;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=usqa6T82H/AQx+cCnajt85Mw++4g4uTdUei6cdIf57o=;
 b=JtAgkAVqGzOHmoqGvWcLj2Mo9+QvPhjV11CIu3nQiEVmv+XhdvK+jg6uE5towjbsF5
 RyM40VmMzSXuA2mugMPl4PA6RsBG89vGNZ063fLsWtoLnHgnqBF7W4sHjJT/ehko6qkZ
 WKCKGvzq5KtHTd6fvgco61bklG4r+xLHBVltD6U9rV7rI4J71ByTeXnd1T0rS/00RxwY
 CJeXzW+bdYVCpz+IZzlxTxFrFfaOrohZmBYHFiBVpXn4HoL/1tbCvgFGGvHE1HBCBD8S
 sGdWjz3gSVquVPOOVnr88tyXWqYCsGTo0Wc/wRsCCp7akK20FgYAAc25CPILL4UVjqlV
 eyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677723216;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usqa6T82H/AQx+cCnajt85Mw++4g4uTdUei6cdIf57o=;
 b=hLbGZKSdxu0CaqW34WkYF8YI8ixLlzYBCN8U2/ixFfxCRTy0/FxFXtxrmtP+n5tBVg
 AcgSjOseUUULdbuVOx5/xesBznFeQtkf3z7xWUcLyG7qkv8LXbz4bSsdTf3bBvKZELa8
 Cx+9FP48kHHvzA4R8bHTRUpeKwbuG3kDb8NDCEfkqwoIHMZx8HsyFCux2ij6g9+aSsCc
 G4B+R2+KcD4l9UXyXV9IdfxvIsooVe1hN5dPApXRRQuRG1ysOMVuATw4sbEMrT036KW6
 ACAOKq63g1BslGa/lm6MnB/Pqjig0EJ9TwIHff5RY9AiRTT7xdc/22d5zXoP5Chvmpzs
 NIfg==
X-Gm-Message-State: AO0yUKXzED0tkEK/gCQqCVSwTkP0ke6nbIuiihKVo/nAqSWblG3anrHJ
 fwM7lbAKLxKI39au901ATPWiMw==
X-Google-Smtp-Source: AK7set8lPTT2Gh4hzHpOnaVHfqnNf2Yh+ZfpSjzYS7NF8FBSOc8g10jImGCdFQyKX109WoN5CZRzZg==
X-Received: by 2002:a62:5251:0:b0:5a8:68c0:5607 with SMTP id
 g78-20020a625251000000b005a868c05607mr7811870pfb.21.1677723216339; 
 Wed, 01 Mar 2023 18:13:36 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 j18-20020aa78dd2000000b005938f5b7231sm8486981pfr.201.2023.03.01.18.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 18:13:35 -0800 (PST)
Date: Wed, 01 Mar 2023 18:13:35 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:08:16 PST (-0800)
Subject: Re: [PATCH 1/2] target/riscv/vector_helper.c: create
 vext_set_tail_elems_1s()
In-Reply-To: <27f27069-b14a-45da-7e79-bdbd378e1a72@linaro.org>
CC: dbarboza@ventanamicro.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, frank.chang@sifive.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: philmd@linaro.org
Message-ID: <mhng-348cd335-c03c-481a-b09f-06bb3134650f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 26 Feb 2023 10:23:01 PST (-0800), philmd@linaro.org wrote:
> On 26/2/23 18:05, Daniel Henrique Barboza wrote:
>> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
>> load / store instructions") added code to set the tail elements to 1 in
>> the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
>> vext_ldff(). Aside from a env->vl versus an evl value being used in the
>> first loop, the code is being repeated 4 times.
>>
>> Create a helper to avoid code repetition in all those functions.
>> Arguments that are used in the callers (nf, esz and max_elems) are
>> passed as arguments. All other values are being derived inside the
>> helper.
>>
>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
>>   1 file changed, 30 insertions(+), 56 deletions(-)
>
>
>> +static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
>> +                                   void *vd, uint32_t desc, uint32_t nf,
>> +                                   uint32_t esz, uint32_t max_elems)
>> +{
>> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
>> +    uint32_t vta = vext_vta(desc);
>> +    uint32_t registers_used;
>> +    int k;
>> +
>> +    for (k = 0; k < nf; ++k) {
>> +        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>> +                          (k * max_elems + max_elems) * esz);
>> +    }
>> +
>> +    if (nf * max_elems % total_elems != 0) {
>> +        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
>> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
>> +                          registers_used * vlenb);
>> +    }
>
>    for (unsigned k = 0; k < nf; ++k) {
>        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>                          (k * max_elems + max_elems) * esz);
>    }
>
>    if (nf * max_elems % total_elems != 0) {
>        uint32_t cnt = (nf * max_elems) * esz;
>        vext_set_elems_1s(vd, vta, cnt, QEMU_ALIGN_UP(cnt, vlenb));
>    }
>
> I suspect ROUND_UP() could be used if vlenb is a power of 2.

As far as I can tell there's nothing in the ISA that requires vlenb be a 
power of two, it's just defined as 

    The XLEN-bit-wide read-only CSR vlenb holds the value VLEN/8, i.e., 
    the vector register length in bytes.

I'm pretty surprised to see that's the case and I'd doubt anything 
actually works with non-power-of-two vlenb.  It's possible I'm just 
missing something in the ISA so I opened a bug at
<https://github.com/riscv/riscv-v-spec/issues/864>.

