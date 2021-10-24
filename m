Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646BA438B95
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 20:59:05 +0200 (CEST)
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meihz-0007QM-NB
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 14:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meigU-0006jt-CS
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:57:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meigS-0005U6-LT
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:57:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a16so7344456wrh.12
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 11:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Oh6I5CXW8CFWyMbDJD6mCgd41ekvAZMgj4q7vdqNIgI=;
 b=SFc1Ox2vc3aGGg84rJImDLMRFXYhsJZoFnU//w2BHhoCUjwDGfk0uSrYZ+gLj+rmlJ
 KVza7vgsIaLw5czy1hxoLq2gE17WE6saL6XajXLo6rXm2lxOcjrbOvRNHgMuZe7A95SG
 HyEPk85/c3oApq4K/Ikv/YZ4vngXdaBGENGp0ZKy8+lluh/8UdHlaBYp8ZcN9mRcFhtJ
 LwAY/5rGKSPihNtAKBL259ZONjUPYL2UxqsaM3+gRhp633u4oKQQW+Z58HZI5DYzR/8Q
 Y78B28fvCmwMBnbvP5Rpkkkx/7dR8O+dQBXCthzpBzWyZ2SYyVZ9tw+oGzSXZ+H1nqKb
 9pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Oh6I5CXW8CFWyMbDJD6mCgd41ekvAZMgj4q7vdqNIgI=;
 b=S2mNWGTISWV19Sq3EDLnyzLndAahZ/r0xY3VkljNCnqyWlUCmiD2oNhwNeBeRcyNuR
 SOIRVQktMicVGOikPMQmN9LPawiYhNi8hNUygjEcjgmfDHVeXaNPKUANBgNt6iYacZr4
 KfVxNvgPfe9CEti9QykuwHy5wC/2rbqNHaGM5GgsffMHCHD1l1cHhj2g9uG+2V0YyHBK
 9YKTWrN9Sg3sdwubvZqxgzDAODSaOp4pakgGFLPXCezu3rkThe6cJpJhZE80B5VLA+4b
 346OgZQEcHu/KEHk62dfPHizanA5OlxUS1hhS+MgMOaIAzlxm8rGcw9VYU4fTnXArDKz
 XBdQ==
X-Gm-Message-State: AOAM530yf6bQibdxGu1OHHX3rGJVVfAjvTK8wFmTWHUnS4leLUlmfUlS
 2QJMVoi3msZi/TiTA8jbvsQ=
X-Google-Smtp-Source: ABdhPJyZagfz1j2Fk1TM7r81YfrhYW3wQvxVh5TkRzj7BxpuoTnKmI51Lg0BZkz6+6N7jNuZ32W50A==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr16919666wrz.401.1635101847113; 
 Sun, 24 Oct 2021 11:57:27 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h8sm14624087wrm.27.2021.10.24.11.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 11:57:26 -0700 (PDT)
Message-ID: <5d91398c-310d-19cd-24ed-5ca8dc529f34@amsat.org>
Date: Sun, 24 Oct 2021 20:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 22/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-23-f4bug@amsat.org>
 <65fa8116-4a1a-eecf-4ee9-fc6ed2896f89@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <65fa8116-4a1a-eecf-4ee9-fc6ed2896f89@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 19:52, Richard Henderson wrote:
> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>> +static bool trans_msa_3r_df(DisasContext *ctx, arg_msa_r *a,
>> +                            void (*gen_msa_3r_df)(TCGv_ptr, TCGv_i32,
>> TCGv_i32,
>> +                                                  TCGv_i32, TCGv_i32))
>> +{
>> +    TCGv_i32 tdf = tcg_constant_i32(a->df);
>> +    TCGv_i32 twd = tcg_const_i32(a->wd);
>> +    TCGv_i32 tws = tcg_const_i32(a->ws);
>> +    TCGv_i32 twt = tcg_const_i32(a->wt);
>> +
>> +    gen_msa_3r_df(cpu_env, tdf, twd, tws, twt);
> 
> Missing check_msa_access.

It is included in TRANS_MSA(). How could I make that clearer?

The style I follow is:
- trans_UPPER() -> direct implementation
- trans_lower() -> called via TRANS_xxx() macro

