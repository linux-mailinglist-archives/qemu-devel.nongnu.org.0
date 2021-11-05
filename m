Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C925544670F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:32:43 +0100 (CET)
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj28w-0000KY-GW
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mj25n-0006jM-0C
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:29:30 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mj25l-0001lm-8K
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:29:26 -0400
Received: by mail-oi1-x236.google.com with SMTP id y11so15354690oih.7
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mfjAIJbhKDA/sTBSPUr6RQoDjgmSlvzr65p+yJK5Wrc=;
 b=O6qBvOB5aCCsVk47Y8KnjY+GXAM0szYcls1YTEMd+2aXJwrI3gNWCF7peLR8yVG6uC
 R4RmvKNw6IzwgatZ1BAcaP2qvAOsRJjrZC/KxrLdXl8NxmtwKNNw8GwwRF1GE+JRnndU
 NUIFqe23yqp8+VA4qzjdM2srhHZ+aH7Z1Mk1a7J/q5sf59ygrTo+7ZqypI9xfIsec6uH
 lk2Lxw6K5qzO5KLSiuA4ORuQchbikVpu9Exb0tf9bwnOiH1mcuDblbhCloYE2iIC7zPV
 8SGMQXzARQyhtbkJn2I0NguJG1UpkEbJVjvr0oWkNIf+dkyMfnuzlaOykUsGS1FRt4I1
 6ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mfjAIJbhKDA/sTBSPUr6RQoDjgmSlvzr65p+yJK5Wrc=;
 b=XdFi/sy30bjNBhfQgbOxdX4LUFLtYHQlolQrTYFcUdo9KT5P8IQztw6rQMIavvX1A7
 GEQTrxsq6E53j35Nk0saECZo5ZDo6cOO/y3poD22NDdRIzOjrgiNfpN3T4lZPs6Db5or
 h4FuSZe7RVY9h7a6c+QCXTQMUDmLCox2j2UfEvbJtWFLl7fYSgnxk/bCJvkyv4tIvLHU
 zT6b6OL42816XlItQzIIL/kQXmS/Scqqb1zO7eJwFjCFoGNLveUEuchojSXjc+RScRw2
 GbGOrWdImdmklZfDHIdPlwmymvk5jnmR/n+TVKTRSLHJ8bC2rkywY2S7XPioh37BTlJe
 Pqrg==
X-Gm-Message-State: AOAM533VXpe9N2Z+llCjXPyMaCH5xC3VlnCSfPWVEObdagnM6RDsX/Ox
 bm5GriMrlaJyxIxEw1GLEtGnxF2QCURIgw==
X-Google-Smtp-Source: ABdhPJyf3BlSvJnJHAhATbRIw/X6YNwgSS8ssg9QzCiBjvgxwKU7K0Z1OdYLxnumkq3kMPucZfaPMQ==
X-Received: by 2002:a05:6808:1444:: with SMTP id
 x4mr22735887oiv.79.1636129763855; 
 Fri, 05 Nov 2021 09:29:23 -0700 (PDT)
Received: from ?IPv6:2804:7f0:4841:487c:5509:2e45:5dfe:a087?
 ([2804:7f0:4841:487c:5509:2e45:5dfe:a087])
 by smtp.gmail.com with ESMTPSA id a13sm2633510oiy.9.2021.11.05.09.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:29:23 -0700 (PDT)
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
 <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
 <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
 <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org> <87v916h937.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <71c392eb-f333-89cf-d5e0-313d564dce4a@linaro.org>
Date: Fri, 5 Nov 2021 13:29:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87v916h937.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=luis.machado@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 1:15 PM, Alex Bennée wrote:
> 
> Luis Machado <luis.machado@linaro.org> writes:
> 
>> On 11/4/21 6:03 PM, Luis Machado wrote:
>>> On 10/4/21 3:44 PM, Luis Machado wrote:
>>>> Hi,
>>>>
>>>> On 9/21/21 10:55 AM, Peter Maydell wrote:
>>>>> On Tue, 19 Jan 2021 at 15:57, Alex Bennée <alex.bennee@linaro.org>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>
>>>>>>> On 1/19/21 3:50 PM, Alex Bennée wrote:
>>>>>>>>
>>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>>> qemu-system-aarch64: -gdb
>>>>>>>>> unix:path=/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server:
>>>>>>>>> info: QEMU waiting for connection on:
>>>>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
>>>>>>>>> warning: while parsing target description (at line 47): Vector
>>>>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>>>>> warning: Could not load XML target description; ignoring
>>>>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>>>>
>>>>>>>>> Seems to indicate it is "ieee_half" -related?
>>>>>
>>>>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>>>>> and there is no probing possible during the gdbstub connection. I guess
>>>>>> I can either go back to stubbing it out (which would break gdb's SVE
>>>>>> understanding) or up our minimum GDB version check for running tests.
>>>>>> That would mean less people test GDB (or at least until the distros
>>>>>> catch up) but considering it was zero people not too long ago maybe
>>>>>> that's acceptable?
>>>>>
>>>>> I just ran into this trying to connect qemu-aarch64 to the
>>>>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>>>>> case, but the 'max' CPU includes SVE by default, so we report
>>>>> it to gdb even if the guest program being run doesn't use SVE at all.
>>>>> This effectively means that usecases that used to work no longer do :-(
>>>>>
>>>>> Luis: do we really have to report to gdb all the possible
>>>>> data types that might be in SVE vector registers? Won't
>>>>> gdb autogenerate pseudoregisters the way it does with
>>>>> Neon d0..d31 ?
>>>>>
>>>>> thanks
>>>>> -- PMM
>>>>>
>>>>
>>>> I'll check what can be done here.
>>> Apologies. I got sidetracked with a few other things. I'm getting
>>> back to this one.
>>> I'm guessing the less painful solution would be for QEMU to report a
>>> more compact XML description for SVE, supported by the oldest GDB we
>>> would like to validate things on, and leave it to GDB (newer
>>> releases) to add whatever pseudo-registers it deems appropriate.
>>
>> Is it only the ieee_half type that is causing issues here? Or are
>> there other types?
> 
> That was the only one I noticed - which makes sense as it's a fairly new
> type.
> 
> 

Ok. I'm considering dialing down the number of subtypes for SVE Z 
registers, which would greatly simplify the generation of the XML for 
SVE features. But I still need to do some more investigation.

