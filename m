Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678B43DFB9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 13:06:39 +0200 (CEST)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg3Ez-0000dA-TU
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 07:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg3Cc-0008ET-H9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:04:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mg3CX-0007iG-9Z
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 07:04:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u18so9457178wrg.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 04:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3b4ewVfYGVA77vgRl4rVRaSFRqASijwlu4XBS2kRIww=;
 b=Zw7urcdGG0vMs8q7TG1BzaEPygtFKMo/o+5ew+8X7vlQU69JtIscnVqrTbbF6TkX3y
 l+hxLeOz47l7Nq7I2WOVrNrjoQujeOWMneysP3KmZ1qwKoT2jknSwKI5/OeFnoTpwd2/
 zXcxGG/v72PWuRMygyJ4yVJKJExYwKEDn15jFw5av6JfzU/CoaqL6Qutcb1rSSvivRMT
 YaMVNJ8hT0VG3Jwx7K4tDf+dk/PXuQkBCpMQlZzUbt4ja3Y6mquLvmR3GYF8oE0QhwJ0
 +2YC1OanUYrutRFvKZV7I9zyThcoJuCYaGVsjECVkD9n318oyRdTivFDzegFrYiPr/ii
 DojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3b4ewVfYGVA77vgRl4rVRaSFRqASijwlu4XBS2kRIww=;
 b=SMBw8KGQDtJpgCJJ5Ad9cS6SMnp4DiO0PtWSpIvZYAPb2nS1zlBIYf48IhbJENmNdr
 Bf8ZBDNC5+ZhnosGkGfC8uvE0b+xXqJzsyU8rH3awRlqjpeDyjS69siRQVoDeZ/ZyYaq
 NzCy4Z55F1PWqSLfuXcDDlo4WPIsDIAOS8WYMWgBfO2qv3Up5QYMegFWCRGamjAJimAP
 pOZVdQRKh0P2SjFZvDBt/NbNZl7X3gDqatBkiomAxAYiGvIFCB8tFxMpB97sUzXVWpon
 58Ygm5BkFQqW/sIg+iC8IRo6q6ecKZuwntgy0fpzzLF9Uj1rY7lmPmy+A0aibkF5qQ7v
 mILw==
X-Gm-Message-State: AOAM5300Ack8SYhTQ/8gpfI+7i/6/K3TEn4jBgqk3Mtrf8cFNmYV0PBm
 yg8plcwjFc48nG9JJfawwag=
X-Google-Smtp-Source: ABdhPJyL+d4IZ9qwQBxotUFf1PvFZDIrJlcYdUe65KhDuNsD9i0vah2Kt/UpINpbZvkXBprY17JN2g==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr4674240wri.127.1635419043092; 
 Thu, 28 Oct 2021 04:04:03 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j16sm2615588wms.16.2021.10.28.04.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 04:04:02 -0700 (PDT)
Message-ID: <186aa8a6-560b-b442-0654-f4d19da0826c@amsat.org>
Date: Thu, 28 Oct 2021 13:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 10/32] target/mips: Convert MSA BIT instruction format
 to decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-11-f4bug@amsat.org>
 <8a26bb59-dc0e-f56f-2d8b-dd0cc9dcaf6a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <8a26bb59-dc0e-f56f-2d8b-dd0cc9dcaf6a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 23:20, Richard Henderson wrote:
> On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
>> +static bool trans_msa_bit(DisasContext *ctx, arg_msa_bit *a,
>> +                          gen_helper_piiii *gen_msa_bit)
>>  {
>> +    if (a->df < 0) {
>> +        return false;
>>      }
> 
> This test should happen before the msa check...
>>   +    gen_msa_bit(cpu_env,
>> +                tcg_constant_i32(a->df),
>> +                tcg_constant_i32(a->wd),
>> +                tcg_constant_i32(a->ws),
>> +                tcg_constant_i32(a->m));
>>   +    return true;
>>   }
>>   +TRANS_MSA(SLLI,     trans_msa_bit, gen_helper_msa_slli_df);
> 
> ... currently being hidden in here.
> 
> This is the reason why I suggest TRANS_MSA be dispensed with.  You won't
> have over-many explicit trans_* functions in which you need to place the
> msa check, I think.

Yes, you are right.

