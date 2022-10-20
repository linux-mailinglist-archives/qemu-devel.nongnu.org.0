Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43B606017
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:25:23 +0200 (CEST)
Received: from localhost ([::1]:32832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUbv-0006KC-4d
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:25:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olULS-0001h6-VA
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olTQr-0000Pw-HU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:10:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olTQo-0005Fw-FN
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:09:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id u10so33834220wrq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92uEmtp0iMeRAZMk73yq3VKvN0q9uNr4+yogAGVc0XM=;
 b=Snh8j5drBrvcDM/qqaaL1qXDdwo8Nu/LDmKVTAPucohQReI2HbaBTxRLD9TuTbOSg5
 sg/bP01aJE4ZBUZzBMk5/32OxLIYEKPFlf8nYFi833kU2Y0QPkLYFWmiZo720x1nEyHo
 FfJzI2WVQD4FsZws1kF6AhvZDnG5CZ95h1GZRIhyVQw9+48Uu46qKK+MR7Js4T5zxwt3
 V3ky+RQD0uO4FB0vmfRMG/VRjtzZapxTTHri+OemzZq+XxvzJV5aCyIfny48JCbcjktc
 kCSrKSXmprE0sbTzykJ2tzT6b4ySvK6iaTM3NmJSmiFS6fjAdJ4dKpURKtKoKzLAl2q4
 9hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=92uEmtp0iMeRAZMk73yq3VKvN0q9uNr4+yogAGVc0XM=;
 b=q8cWM+1y0hypOha1qmpJmaNHgl/8UBS74faFN1/tY1QewiWAx7qgowecewRXnQvU7D
 RTNyayk97RkUCzYgG+se2KjrltakflSQf6m7BKIj2r/fzFsyMGP4G/68SIXryfeHkn8p
 e3/jaRyZgjTRp2R3kiY4VAPrP2vhW4hD7Sh5xtRk6AUn1lqWrPyqcyv04TCDPrGNOnX0
 qYpre77JV2KrI3D60wNcEfRAl9dW2p0ys+ODBeK7Qp92l/GVU/yLcIWNKy4hwBVbXKM7
 jdJcpEoKgfUVyo9/PiK1RXhqZQF/ROaXZfoCpIGwGkGdZpgaEUWILZ+JocNNEFn90rRC
 wQtQ==
X-Gm-Message-State: ACrzQf0sAd450yDd9BUxWlKn9niIWVtpNWv8ri2lkTVpoT12KMXPFbn+
 06iwrsohBzkzQn6dJvJfTvb3Zg==
X-Google-Smtp-Source: AMsMyM6KwxoT0VMcD4SPJF623aP57Vqby9fwe3TdSYaS195DDY7YPP1isHnHagtuBTDkeKJwUxAbLg==
X-Received: by 2002:a05:6000:1a8b:b0:232:4311:4ff with SMTP id
 f11-20020a0560001a8b00b00232431104ffmr7967352wry.236.1666264185022; 
 Thu, 20 Oct 2022 04:09:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c444e00b003c6f27d275dsm2801112wmn.33.2022.10.20.04.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:09:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8DC81FFB7;
 Thu, 20 Oct 2022 12:09:42 +0100 (BST)
References: <20221019113552.1051940-1-alex.bennee@linaro.org>
 <6b62a753-974d-968e-9e8f-a79e23a29719@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "open list:S390 TCG CPUs"
 <qemu-s390x@nongnu.org>
Subject: Re: [RFC PATCH] target/s390x: fake instruction loading when
 handling 'ex'
Date: Thu, 20 Oct 2022 12:09:16 +0100
In-reply-to: <6b62a753-974d-968e-9e8f-a79e23a29719@linaro.org>
Message-ID: <874jvyagzt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/10/22 13:35, Alex Benn=C3=A9e wrote:
>> The s390x EXecute instruction is a bit weird as we synthesis the
>> executed instruction from what we have stored in memory. When plugins
>> are enabled this breaks because we detect the ld_code2() loading from
>> a non zero offset without the rest of the instruction being there.
>> Work around this with a special helper to inform the rest of the
>> translator about the instruction so things stay consistent.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/translator.h    | 17 +++++++++++++++++
>>   target/s390x/tcg/translate.c |  4 ++++
>>   2 files changed, 21 insertions(+)
>> diff --git a/include/exec/translator.h b/include/exec/translator.h
>> index 3b77f5f4aa..156f568701 100644
>> --- a/include/exec/translator.h
>> +++ b/include/exec/translator.h
>> @@ -211,6 +211,23 @@ translator_ldq_swap(CPUArchState *env, DisasContext=
Base *db,
>>       return ret;
>>   }
>>   +/**
>> + * translator_fake_ldw - fake instruction load
>> + * @insn16: 2 byte instruction
>> + * @pc: program counter of instruction
>> + *
>> + * This is a special case helper used where the instruction we are
>> + * about to translate comes from somewhere else (e.g. being
>> + * re-synthesised for s390x "ex"). It ensures we update other areas of
>> + * the translator with details of the executed instruction.
>> + */
>> +
>> +static inline void translator_fake_ldw(uint16_t insn16, abi_ptr pc)
>> +{
>> +    plugin_insn_append(pc, &insn16, sizeof(insn16));
>> +}
>> +
>> +
>>   /*
>>    * Return whether addr is on the same page as where disassembly starte=
d.
>>    * Translators can use this to enforce the rule that only single-insn
>> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
>> index 1d2dddab1c..a07b8b2d23 100644
>> --- a/target/s390x/tcg/translate.c
>> +++ b/target/s390x/tcg/translate.c
>> @@ -6317,12 +6317,16 @@ static const DisasInsn *extract_insn(CPUS390XSta=
te *env, DisasContext *s)
>>       if (unlikely(s->ex_value)) {
>>           /* Drop the EX data now, so that it's clear on exception paths=
.  */
>>           TCGv_i64 zero =3D tcg_const_i64(0);
>> +        int i;
>>           tcg_gen_st_i64(zero, cpu_env, offsetof(CPUS390XState, ex_value=
));
>>           tcg_temp_free_i64(zero);
>>             /* Extract the values saved by EXECUTE.  */
>>           insn =3D s->ex_value & 0xffffffffffff0000ull;
>>           ilen =3D s->ex_value & 0xf;
>> +        for (i =3D 0; i < ilen; i +=3D 2) {
>
> Is it worth guarding with #ifdef CONFIG_PLUGIN?

I don't think so. It all gets nicely dead coded away when plugins aren't
enabled.

>
>> +            translator_fake_ldw(extract64(insn, 48 - (i * 8), 16), pc +=
 i);
>> +        }
>>           op =3D insn >> 56;
>>       } else {
>>           insn =3D ld_code2(env, s, pc);


--=20
Alex Benn=C3=A9e

