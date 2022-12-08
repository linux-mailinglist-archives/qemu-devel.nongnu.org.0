Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAFB646C54
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:01:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Dgz-00014W-HU; Thu, 08 Dec 2022 04:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Dgu-00013m-PV
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 04:59:45 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Dgt-0001Kh-9e
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 04:59:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id d1so968033wrs.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 01:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OMRpfiFGeiSEduQL6JDN4K4D8ccLPexQnP1Idu6j370=;
 b=NQ/RxCL5Cu9tkOt/cW2T2LRcveqB2jlCGtq5irXcyh1Ja114xysudyQohB/BBt5uG1
 dUrovCnp05D4nOYQLd+MxbnSvWwA4dwTa9wwKRYQYhz16WwVCqIf+N+lhEB4ej/ALeVC
 s6118/8uvq0jfMhe9CaRkq+qLJ/vpBFnvCHe4/q7DxRAJ0CQ8WyAxN/iytjceHnNpi6t
 KxqFnvk0XAaKc/nIAYm+6y4QTdb1cB0NpOh2qfSKN0KhDbt1H8mPK9s3xl6qWCOp1eyP
 Allqp/haMiFvR73scFPWuV5BHeO/zfS8NIreUKP2Ae1O0bHWuQRB3eh5LVKkyNH30pJn
 vl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OMRpfiFGeiSEduQL6JDN4K4D8ccLPexQnP1Idu6j370=;
 b=ZFCPOMsVKNl0KLJUP7txkOvbV8wPApuRGG19tuHkgdbqM5w5C6fQ03qWSZjsGAdMps
 WPRpHiPTqRlgocIW922xAa4NyqHbmSLNAZ5bdHGj0Tt2/OQQfVlaCjD1cPxiO/WSuyHK
 HQ73vWuzZIXWGBZqWwyZX+hidmw61Nvb25eEdkuiw3Pysz2O1kcUSHFHQ1SVFPjDaF0d
 hBii0kKMyUsUBlR8PkOatQAbfVjCgyxt0YgYb5Ms8ZfpgpztzX9jZw6BBzJu4qA1T5IY
 wcT3Uc87PwsYtIbu62fXiH9p5niBK3ldipPuFtyv1rnsQnGlbeBWXPSdsly0X6aEclLs
 JDGQ==
X-Gm-Message-State: ANoB5pkVUm4zDCbBC/l4oxq7Rv2GM0XnJbAJ1AEz/LwmWbhUC9uBsPYE
 d1QAFp4cSe8sTPtP9m5prw+zPg==
X-Google-Smtp-Source: AA0mqf5A0hmgnDxosq7pAl2sLD67U22f+3yySRNlkyQw0pwewBoQLoZE0fwku8qKFUgzpu0CcafYhg==
X-Received: by 2002:a05:6000:1b8d:b0:241:c73e:9d0b with SMTP id
 r13-20020a0560001b8d00b00241c73e9d0bmr51634569wru.313.1670493581657; 
 Thu, 08 Dec 2022 01:59:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5543000000b0022cc0a2cbecsm21436496wrw.15.2022.12.08.01.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 01:59:41 -0800 (PST)
Message-ID: <a8ef1890-f8b5-c257-6cdf-910df1b8eaf4@linaro.org>
Date: Thu, 8 Dec 2022 10:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Stafford Horne <shorne@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-3-philmd@linaro.org>
 <CAFEAcA_DwMB7CZERo3EG2wRAQp6ugiikxhqtMxOaWS+dd8tn3g@mail.gmail.com>
 <6acb79ca-d12a-7f94-2112-5f0f9480f473@linaro.org>
 <CAFEAcA_4uJDc_q6ov=8n+BjtNm=j1980sNGb1D8+o1Lid-x3Yw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_4uJDc_q6ov=8n+BjtNm=j1980sNGb1D8+o1Lid-x3Yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/12/22 21:15, Peter Maydell wrote:
> On Wed, 7 Dec 2022 at 18:27, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 7/12/22 19:23, Peter Maydell wrote:
>>> On Wed, 7 Dec 2022 at 17:42, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> Both insert/remove_breakpoint() handlers are used in system and
>>>> user emulation. We can not use the 'hwaddr' type on user emulation,
>>>> we have to use 'vaddr' which is defined as "wide enough to contain
>>>> any #target_ulong virtual address".
> 
>>>> @@ -48,8 +48,8 @@ struct AccelOpsClass {
>>>>
>>>>        /* gdbstub hooks */
>>>>        bool (*supports_guest_debug)(void);
>>>> -    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
>>>> -    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
>>>> +    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
>>>> +    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
>>>>        void (*remove_all_breakpoints)(CPUState *cpu);
>>>>    };
>>>
>>> If you're changing the prototype of these methods on AccelOpsClass
>>> don't you also want to change the implementations, eg tcg_breakpoint_insert()?
>>> Interestingly that function calls cpu_breakpoint_insert() which
>>> already takes a 'vaddr' rather than a 'hwaddr'.
>>
>> Yes I neglected to include these changes here:
>>
>> -- >8 --
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
>> diff --git a/gdbstub/user.c b/gdbstub/user.c
> 
> Those are the callsites to the methods, not the implementations, I think.

Oh correct, I missed that :/ Thanks!


