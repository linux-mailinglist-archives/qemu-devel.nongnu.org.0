Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA339AB98
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 22:09:23 +0200 (CEST)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lotec-0004Mj-1v
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 16:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lotdf-0003Sx-Lk
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:08:23 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lotdc-000740-7M
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:08:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id o9so3170174pgd.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UA3W026wWvjUG2XmVjHJZBd9HirAYi0EKLar928B9g8=;
 b=ZORDsAXl9BKJoqP+KUPashYpZV14n9RVt8VbRUx5CEuXcOvko7drj2V2RYqfJ7vL3R
 3Fw04G3A9LLMe/bYi/WJJ8jK29P5hw2DGIES3+N3inTf152ASqWFl8n7HiGD5v0qq5s0
 BjxRSqenlr6EY2ObRl0haWNcJrwSKptwg8hTb3s6yzy8lKx0BlTBSmYLsnVEiIkPF779
 cVXg00tyZtfAzAMdU6/Zr2nqEfLMMK19HMsWeOH5ZDReY5q3McWhUdL2E1khIOMq2Qlq
 JToBgbxuSzGUrBOa8qwVXUemJwWD8gIS/bC1JjkR6gjbSrFfh366BJTq/zhDY9/0rAX6
 cRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UA3W026wWvjUG2XmVjHJZBd9HirAYi0EKLar928B9g8=;
 b=m3xwqQQW7q6pAZfRJawXCTJve1cm4OSgQfmQWJi2GXRMNYWCgJ1hgAhBK+z8mgSt6v
 dz1Uw8mNXWy/1RpqdsrHqXkxf0jRIWe28Mdxg0rl8FTJfamV1dc+vkPhuRxYvrN1iaUB
 rO3wUX/7zvNmQIhzgjWKlFDaAX9QBxmBSS+9PH+U0LLU/Ni6EcJsoxWsjF/d3oxrqEHb
 DEjF0itgZvaAbtcGttW4Pdasz43HTEOlEUxFbONqmOKJMx6NjpRjqybUAwRPv8cAnQIl
 OBqYh9xiwqRJqe5sm+Jw5aSc1sKoCOkD8/NKaouEqvu7ilfN0BYEyIRN5PBPhHma3OTi
 lQFQ==
X-Gm-Message-State: AOAM532ZS1+vsA4PhVhe8Px0224EvsR/AGHnC3DYVK+sUlRgg87nae9o
 cc97ubVnNgkfujF/Yv2UDP9+wL/4AzcIqA==
X-Google-Smtp-Source: ABdhPJyEoCIRqzi7icX+UqYk4rQwcFSL6om89d0VHZus336DqydKGoJtwKoOdd9a4frvA4klM2HpTA==
X-Received: by 2002:a62:5f82:0:b029:2e9:760e:e9c8 with SMTP id
 t124-20020a625f820000b02902e9760ee9c8mr736260pfb.23.1622750897702; 
 Thu, 03 Jun 2021 13:08:17 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p20sm1718794pff.204.2021.06.03.13.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 13:08:17 -0700 (PDT)
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
Date: Thu, 3 Jun 2021 13:08:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 1:17 AM, ishii.shuuichir@fujitsu.com wrote:
> Hi, Richard.
> 
> Thank you for your comment.
> 
>> My first thought is that -cpu max can simply enable the extensions, without
>> extra flags.  The max cpu has all of the features that we can enable, and as I
>> see it this is just one more.
> 
> Let me confirm a few things about the above comment.
> Does it mean that I don't need to explicitly enable individual extensions
> such as a64fx-hpc-sec, a64fx-hpc-hwpf, and a64fx-hpc-hwb,
> since all extensions can be enabled by specifying -cpu max?

Well, Peter disagreed with having them enabled by default in -cpu max, so we 
might need at least one extra property.  I see no reason to have three 
properties -- one property a64fx-hpc should be sufficient.  But we might not 
want any command-line properties, see below...

> 
>> The microarchitectural document provided does not list all of the system
>> register reset values for the A64FX, and I would be surprised if there were an
>> architectural id register that specified a non-standard extension like this.
>> Thus I would expect to add ARM_FEATURE_A64FX with which to enable these
>> extensions in helper.c.
> 
> As you said,
> some of the published specifications do not describe the reset values of the registers.
> I would like to implement this in QEMU by referring to a real machine with A64FX.

I presume there exists some documentation for this somewhere, though possibly 
only internal to Fujitsu so far.

For comparison, in the Arm Cortex-A76 manual,
   https://developer.arm.com/documentation/100798/0301/
section B2.4 "AArch64 registers by functional group", there is a concise 
listing of all of the system registers and their reset values.

The most important of these for QEMU to create '-cpu a64fx' are the 
ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of the 
standard architectural features, and from them we can tell what QEMU may (or 
may not) be missing for proper emulation of the cpu.  For comparison, look at 
aarch64_a72_initfn in target/arm/cpu64.c.

Peter is suggesting that if full support for -cpu a64fx apart from the hpc 
extensions is close, then we shouldn't implementing a property for -cpu max, 
but only implement -cpu a64fx.  (Because how does the OS detect the hpc 
feature, apart from the MIDR value?)


r~

