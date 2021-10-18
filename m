Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B243254F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 19:42:36 +0200 (CEST)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcWeg-0000Gt-Ic
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 13:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcWbL-0007QZ-F3
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:39:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcWbJ-0002re-PU
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:39:07 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u18so42970620wrg.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=THgUzY/gbauDIdQfeX0lExnFEi8vzShAnt9bLuBOVnc=;
 b=BERyTmFXWV8IkuQerZdQk61XFvPTVL5YOpZ8OZjOpg6Rz86ZuBAGO35Un+00GZFzVG
 66AzqtipjftCmtkWRnsz+pj5ThfKcguxo+vcgQREob8h/RqQffTEe8n9fb61ituAJfSo
 MdHmFKoT/U5zWpCpZzdQGCsHtlfdYR/vRZSDKIuXzgBIR0Xieev21u4xVke2uFpQ4x2y
 0UxT/c4ckdhx8ZPcUI242nO2w/lGQf0HdbXeIIH4tY8ORQqylESlyCHG+zZ7b7u0V5pS
 x/8kNjIJP2aqa7JkhyCii6ZraTHhiywBm/r3XrraDKozGZdn2mVsHg0jy3gN5L06/d3i
 BSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=THgUzY/gbauDIdQfeX0lExnFEi8vzShAnt9bLuBOVnc=;
 b=gLRMpDRmJQzgdJ7lka8Uon60Eo9dJtzE369Q8Hr1wb+1cQHrt7fo8pQ/bYPN3kouYa
 2SMzs77ynXAdF+SZPBKpyyzFKyCgNR4B+6SYZd/on/f3qDQYVtv6jgxcKJAcHSb+816S
 5tZETZjvr12uCYly+/9N+JwonGpTwq/ukwCNQ0m0uOPK9E5Gvah/ehzgIysrm8BjA2Yf
 MDDc6TaBuIuhvwiyMWf8fiLp7fNb66lVjvs6Le3EBMZeMxp5jweHNBjs0mdMbMm8bs6r
 9wF0sJFeo15LNDMfiuYqUHP7q8ggUGu2Y1A4/R1u180GaxhL/YQHdtr03KReTSlxwxam
 aifA==
X-Gm-Message-State: AOAM530n7++0Wz5q6u57JimFsAkdQE/q2Cy07vTs76scSbqcgaNrl8sL
 eByUpc33dwz+1ex1Jnc7ApmvQ7akWx4=
X-Google-Smtp-Source: ABdhPJzwpNEs+aX5TqzhOt3CbHQEfgMoXp96D83MPF8s/oOSQiVHOw0ZggFntuFOZzBcGYCUi23vpQ==
X-Received: by 2002:adf:b185:: with SMTP id q5mr36796242wra.213.1634578740830; 
 Mon, 18 Oct 2021 10:39:00 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id m14sm105927wms.25.2021.10.18.10.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 10:39:00 -0700 (PDT)
Message-ID: <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
Date: Mon, 18 Oct 2021 19:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, Song Gao <gaosong@loongson.cn>,
 qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 18:06, WANG Xuerui wrote:
> Hi Song,
> 
> On 10/18/21 20:47, Song Gao wrote:
>> This patch add target state header, target definitions
>> and initialization routines.
> "adds"; fix in other patches too.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/loongarch/cpu-param.h |  19 +++
>>   target/loongarch/cpu.c       | 285
>> +++++++++++++++++++++++++++++++++++++++++++
>>   target/loongarch/cpu.h       | 151 +++++++++++++++++++++++
>>   target/loongarch/internals.h |  23 ++++
>>   4 files changed, 478 insertions(+)
>>   create mode 100644 target/loongarch/cpu-param.h
>>   create mode 100644 target/loongarch/cpu.c
>>   create mode 100644 target/loongarch/cpu.h
>>   create mode 100644 target/loongarch/internals.h


>> +static void set_loongarch_cpucfg(CPULoongArchState *env)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < 49; i++) {
>> +        env->cpucfg[i] = 0x0;
>> +    }
>> +    env->cpucfg[0] = 0x14c010;
>> +    env->cpucfg[1] = 0x3f2f2fe;
>> +    env->cpucfg[2] = 0x60c3cf;
>> +    env->cpucfg[3] = 0xcff;
>> +    env->cpucfg[4] = 0x5f5e100;
>> +    env->cpucfg[5] = 0x10001;
>> +    env->cpucfg[16] = 0x2c3d;
>> +    env->cpucfg[17] = 0x6080003;
>> +    env->cpucfg[18] = 0x6080003;
>> +    env->cpucfg[19] = 0x60800f;
>> +    env->cpucfg[20] = 0x60f000f;
> I know these values are taken from a real 3A5000 chip, since I have such
> a machine and I've done the experiment, but others likely wouldn't
> notice so quickly. Maybe put some comment on top of this function to
> illustrate this?

Simpler: ...

>> +}
>> +
>> +/* LoongArch CPU definitions */
> Doc-string for such a function should be verb phrase; but in this case
> would it be better to just drop the comment? The code is pretty concise
> and self-documenting after all.
>> +static void loongarch_3a5000_initfn(Object *obj)
>> +{
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
>> +    CPULoongArchState *env = &cpu->env;
>> +
>> +    set_loongarch_cpucfg(env);

... directly inline here.

>> +}

