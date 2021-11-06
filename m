Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307AC446D2F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 10:19:54 +0100 (CET)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjHrc-0001Ig-UL
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 05:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjHqh-0000TH-2q; Sat, 06 Nov 2021 05:18:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjHqe-0000cu-TV; Sat, 06 Nov 2021 05:18:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 133so9011150wme.0;
 Sat, 06 Nov 2021 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r9XL3Ls6/CvSbRt0O7iQyXcGrh9rbAAP0xqELdn6sgk=;
 b=AYn3BQdpteU3e7exKGYMXdTqNyaTVpwWt5ClcArHPWZHiNI6lEOj849NY2U11VQo40
 mlEKzhzxR+mNtjF2US6qoXHAS8UroS4LUiQb7uqY+8bgV+ygsqxtmgb9bw0eTFNo5duY
 CRDFOzWb3enGpESKRIqPar2eHIEjN5eV325x/Db3lCOi/GT3Ojs4vwVXIChJqAQewro/
 CwD5Z56d6+7J7+rL0U1Msv13PXjVMbXRv5IfzMp9SU1CfG8V+cz80IcXZUeFVG3lBTmG
 TMDyRYOPopPTIlOVjjElNkruOiE+ohRjcQKHoovxhIg9hzXP2Hw1I0cdqpBFcvo7G39W
 F1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r9XL3Ls6/CvSbRt0O7iQyXcGrh9rbAAP0xqELdn6sgk=;
 b=aHKmwGmJ0g3H+AXX3dMcPe5jLBQ+tFQZV/cd0eJtggf0PcMSee7ZYpdF3Wt4ocJ0qA
 +GiAf8AVdofmpsE2Sj2OlTaRvKfjLJ+4xaUhsZ1e2E0CrO+Ml5Wr5UEjdspksijepnuP
 w2aNxHJogTOQXswfmef/2iYjs2YQzgye5z+gigoVITjxCBPnfiTNlagrmLt1N816neA8
 GJ5vOYOuI2opt1Z3a7Qjyc4gsn8v/vKIdhiyREJw/yz5Bpm0iHjCFKtUN1GQEttPjxnE
 ghV9e2he5SH/CKZMSwHRJ2+Wfiz+RnN6V7HWELToNrYv7slTZnUzMq9z9Zyjaf4Xezjb
 jg4A==
X-Gm-Message-State: AOAM5318ikGK7PttIaRT8of7s9beaYhRdzcPTzTsl0sYkBFLoV6vXw5w
 3YD9uThNUrFOzJUPBzN2Hg4=
X-Google-Smtp-Source: ABdhPJy+6K+71CZwsuGPDT2ukJzYHIJfUbogZ/6XePxIIJMD7p9AlY0PFNB2Wxx7WGjOndN4bxxBWg==
X-Received: by 2002:a1c:a904:: with SMTP id s4mr35576821wme.163.1636190330260; 
 Sat, 06 Nov 2021 02:18:50 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z12sm9804421wrv.78.2021.11.06.02.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Nov 2021 02:18:49 -0700 (PDT)
Message-ID: <35a056f3-f074-a2a1-bf43-e24ba483d0d2@amsat.org>
Date: Sat, 6 Nov 2021 10:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, clg@kaod.org
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
 <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
 <91972ce2-8d1f-f22e-c87f-45cb3c221b18@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <91972ce2-8d1f-f22e-c87f-45cb3c221b18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.407,
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
Cc: peter.maydell@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 21:05, Daniel Henrique Barboza wrote:
> On 11/5/21 16:16, Philippe Mathieu-Daudé wrote:
>> Hi Daniel,
>>
>> On 11/5/21 10:48, Daniel Henrique Barboza wrote:
>>> On 11/5/21 00:46, David Gibson wrote:
>>>> As our day jobs and interests have moved onto other things, Greg and I
>>>> have
>>>> been struggling to keep on top of maintainership of target/ppc and
>>>> associated pieces like the pseries and powernv machine types, with
>>>> their
>>>> platform specific devices.
>>>>
>>>> We've therefore discussed and plan to transfer maintainership to
>>>> Cédric Le
>>>> Goater (primary) and Daniel Henrique Barboza (backup).  Cédric and
>>>> Daniel
>>>> have been actively contributing to the area for some time, and they're
>>>> supported in this by their current employer, IBM, who has an obvious
>>>> interest in the platform.
>>>
>>> Thank you and Greg and Red Hat for all the years of service supporting
>>> qemu-ppc in the community. IBM will shoulder this responsibility now.
>>
>> In term of the MAINTAINERS file:
>>
>>          S: Status, one of the following:
>>             Supported:   Someone is actually paid to look after this.
>>             Maintained:  Someone actually looks after it.
>>
>> The PPC entries have a 'Maintained' status. You say "IBM will shoulder
>> this responsibility", does that mean the entries will be 'Supported'
>> as in "someone paid to look after them"?
> 
> Yes. It's appropriate to change the PPC entries of this patch to
> "Supported"
> now.

This is a great news :)

>> I wonder because both Cédric and you have some commits with an IBM
>> email, but both are registering a non-IBM email as contact. I don't
>> mind the email technical detail, but I am curious about the status
>> and expectations.
> 
> I had problems using IBM corporate email with mailing lists in the past,
> and started using this gmail account instead. I believe Cedric has a
> similar sob story.
> 
> FWIW the contrib/gitdm/group-map-ibm file has both our emails there to
> indicate that we're IBM contributors.

OK this is how I understood it first then. Thanks for the clarification.

Regards,

Phil.

