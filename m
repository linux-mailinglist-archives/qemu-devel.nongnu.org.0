Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F6E434CDE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:59:10 +0200 (CEST)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdC7Z-0003qJ-8T
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdC5T-0001Q7-0Y
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:57:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:47010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdC5R-00088G-3Z
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:56:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i76so3015083pfe.13
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 06:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Bkirzy6ObMHTrWDLklJL7jVE9m0PpEPDrQecyV/Qbc=;
 b=Qk/dmdorY+IiQkvVxKHHl3oekrRrQWbOfOO42p9oeS4V0aVwFV4/Lgq64ljmBuh5Au
 lbJqemT22c0IboKDpSgj0fPg1UissmEaY1gtXv0p6diMWdossOcmeVU9tt940qdOavPc
 rCNttUt5/Q45BDz/3iZXHlXRWQur9ntvqvsF3CtBBAdLtw+684/CxT5XDOem2t9AJSFh
 5Q+fN3Pw9+KdjLD+7N98jj+S+6BtqrlBKd0LQBbcm2RvKObHTDA4b7LKq0LOLVjbsHmY
 dCGOM8m7HOO9NTyu0QF75lnR49Xhm7zaKOcIn8yFginf3S1E4z4htm3rCJUiZK8+4yIg
 lZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Bkirzy6ObMHTrWDLklJL7jVE9m0PpEPDrQecyV/Qbc=;
 b=BJjD8hakIJQncdW72xP+jxbl0NbGCLXeoQaMDU929K7ZQHjLL1Qn96ABnGCdraVmZ2
 QZfprVhbL7fyEUN5fGrfd2cDIII4vpc5wdZNT0o+pYS1sHfvHMYS3gRft6811hLlYw1i
 SMItuoA7iwtBp/xnuPR0YRhhtWD1BxAi1oVylzHPfYMUTeDRlMJjd7P8DHVXX+t38EbM
 x5b0Jb3cFs0XlSnkT/zJAsWA2yKvYIMY/RRw3G05sG9ODXPeTGuxl/U804H+VDnn4Hgi
 XPZrEUtCXZGZupQoz832PWz89lprNNrxt1dTfY6nrE6Z0pR2eqjmbv7NEh0oJaPxO7Xp
 A8gQ==
X-Gm-Message-State: AOAM533klXYnbH56pMk0LOSp7nCsXzljJTPo9EA6UpawMrfvjIs12scV
 1RT2kzMz/a5V7pOEb8kWmES50w==
X-Google-Smtp-Source: ABdhPJxXKk/kSqvS364CZYCNJDBFy+ScPUCcbukflHMQgPrT6K0w1txKclBRaxcXQZyf9D+MAXPW0w==
X-Received: by 2002:a63:3548:: with SMTP id c69mr106539pga.111.1634738215318; 
 Wed, 20 Oct 2021 06:56:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n202sm2803609pfd.160.2021.10.20.06.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:56:54 -0700 (PDT)
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
To: WANG Xuerui <i.qemu@xen0n.name>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
 <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
 <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
 <74bbac65-2cd4-dac7-86d1-e18cfa3f3f1f@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da597248-8e06-2f14-b39e-67c457aa5a71@linaro.org>
Date: Wed, 20 Oct 2021 06:56:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <74bbac65-2cd4-dac7-86d1-e18cfa3f3f1f@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, yangxiaojuan@loongson.cn,
 peterx@redhat.com, laurent@vivier.eu, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 5:00 AM, WANG Xuerui wrote:
> On 2021/10/20 16:54, Song Gao wrote:
> 
>> On 10/19/2021 01:38 AM, Philippe Mathieu-Daudé wrote:
>>> On 10/18/21 18:06, WANG Xuerui wrote:
>>>
>>> On 10/18/21 20:47, Song Gao wrote:
>>>>> +static void set_loongarch_cpucfg(CPULoongArchState *env)
>>>>> +{
>>>>> +    int i;
>>>>> +
>>>>> +    for (i = 0; i < 49; i++) {
>>>>> +        env->cpucfg[i] = 0x0;
>>>>> +    }
>>>>> +    env->cpucfg[0] = 0x14c010;
>>>>> +    env->cpucfg[1] = 0x3f2f2fe;
>>>>> +    env->cpucfg[2] = 0x60c3cf;
>>>>> +    env->cpucfg[3] = 0xcff;
>>>>> +    env->cpucfg[4] = 0x5f5e100;
>>>>> +    env->cpucfg[5] = 0x10001;
>>>>> +    env->cpucfg[16] = 0x2c3d;
>>>>> +    env->cpucfg[17] = 0x6080003;
>>>>> +    env->cpucfg[18] = 0x6080003;
>>>>> +    env->cpucfg[19] = 0x60800f;
>>>>> +    env->cpucfg[20] = 0x60f000f;
>>>> I know these values are taken from a real 3A5000 chip, since I have such
>>>> a machine and I've done the experiment, but others likely wouldn't
>>>> notice so quickly. Maybe put some comment on top of this function to
>>>> illustrate this?
>>> Simpler: ...
>>>
>> On linux-user emulation. We don't care about the value of cpucfg[i].
>> I think we only need to set cpucfg[i] to 0. and set value on system emulations, is that better?
> 
> I'm afraid that wouldn't be better; actually it would be *wrong* to just
> return zeroes for user-space CPUCFG accesses. CPUCFG is designed to
> provide runtime feature probing like CPUID, and is usable from
> user-space. So, one can only assume this data is being used, and
> properly return data.
> 
> I've heard that kernel could choose to not actually enable all features
> for which CPUCFG indicate support, while not configuring CPUCFG values
> to reflect that, thus making CPUCFG values unreliable; that's not a
> proper reason to return zeroes. Kernel should be fixed to properly
> configure CPUCFG instead. Because otherwise you wouldn't make such an
> instruction an unprivileged one in the first place...

In the meantime, I think you really need to filter these values to those you have 
implemented.  E.g. cpucfg[2].LASX here indicates support for the 256-bit vector extension. 
  Similarly the COMPLEX and CRYPTO extensions.

I think you would do well to add some FIELD definitions so that these can be set symbolically.


r~

