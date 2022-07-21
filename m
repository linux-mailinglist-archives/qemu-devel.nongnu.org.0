Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AD957C611
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 10:19:19 +0200 (CEST)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEROx-0008J9-2O
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 04:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oERK5-0003tJ-36
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:14:17 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oERK2-0003hd-K2
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:14:16 -0400
Received: by mail-pf1-x432.google.com with SMTP id c3so1061003pfb.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1SPlaA76YyEiFEdCpUk5K59tRpTpW7KvS42T1puVIrY=;
 b=z8sE5frVsjY5UYNvsAgxp8+onBUxlvKc/lT04Nf2vUM1nBf+3V/7RBgNGKXQ98dW8v
 gGvTjhUlJQe1dXzPIWQvSPZjsnobajKofNODhsnU/bKJlHLrqlijdD4JjNTpdsloNIUQ
 B2XHVY3bNGc1/oeDmAbaRf4//MLXtedIvPjbDVbRKnyt4fF95jhg3jFM9PPFWJi306P1
 B1QEAKzJ9qEGiMPCA9jTvWEX7LGT1sPyMoT6R8+ipVQAbtrT/8eBw2ILVDnW7lE0PRF+
 HSvk+JaIeog4gjmZXqj2r/jWfREoArBSGgaPaEawAEo57RjwkZUigIJoIZrRnkRJ2rVK
 Ri8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1SPlaA76YyEiFEdCpUk5K59tRpTpW7KvS42T1puVIrY=;
 b=r8j66z9l9io4ZZoShac24NT+xOgAuYN9J0qsSCP3bDIHcMCfXX0g08GnFz3g+OaxS7
 jnqikA8wQulm1Ygruw+RqU5gSskQE9fHAWoF5eZoje2BE6BXHKIUPhaAUniedCTw/lhb
 /4b7jQPzPmNGV3bwI3UC9AyawSThjCrG4lLy9jM+sBQKxNz+mDlfPg3MzDsHHCLj3wAA
 PjmGYuEfzt5ML1lSn6wHkNuVCNxm4nEu5UycwJTNFhj4vybd3hYuzbyPKq0Mt+U+g3Y8
 UI3GSspsvHfbLaSGf0kcc6DE+xMiUbcM98nsomCv/2I5AZnGHDeGg3SAO5FVRSdiBJEd
 39Ew==
X-Gm-Message-State: AJIora+YIjmupJIEaJEya2vq6fIAQK1/yesZfAIomMVcetKBaiQb/N/g
 y6f5g3IW0BFMdqpqmax5atz7sw==
X-Google-Smtp-Source: AGRyM1vnpDkZpPLdpedfExgP0sE2Wdqt/IdYWkd7Q1JBqTASWw0MyU44OoHz493WnPPgcV/JoMTMmg==
X-Received: by 2002:a05:6a00:330c:b0:52b:6ff7:5f03 with SMTP id
 cq12-20020a056a00330c00b0052b6ff75f03mr19532309pfb.49.1658391251407; 
 Thu, 21 Jul 2022 01:14:11 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d50c00b0016c78aaae7fsm1012291plg.23.2022.07.21.01.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 01:14:10 -0700 (PDT)
Message-ID: <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
Date: Thu, 21 Jul 2022 18:14:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220719075930.315237-1-aik@ozlabs.ru>
 <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 21/07/2022 02:08, Daniel Henrique Barboza wrote:
> Hey,
> 
> On 7/19/22 04:59, Alexey Kardashevskiy wrote:
>> The following changes since commit 
>> d2066bc50d690a6605307eaf0e72a9cf51e6fc25:
>>
>>    target/ppc: Check page dir/table base alignment (2022-07-18 
>> 13:59:43 -0300)
>>
>> are available in the Git repository at:
>>
>>    git@github.com:aik/qemu.git tags/qemu-slof-20220719
>>
>> for you to fetch changes up to 17c1ad657904787b1d986fb4c85431fee006a6ea:
>>
>>    pseries: Update SLOF firmware image (2022-07-19 17:50:46 +1000)
>>
>> ----------------------------------------------------------------
>> Alexey Kardashevskiy (1):
>>        pseries: Update SLOF firmware image
>>
>>   docs/system/ppc/pseries.rst |   2 +-
>>   pc-bios/README              |   2 +-
>>   pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
>>   roms/SLOF                   |   2 +-
>>   4 files changed, 3 insertions(+), 3 deletions(-)
>>
>>
>> *** Note: this is not for master, this is for pseries
>> *** Note2: this has not sync'd to git.qemu.org but softfreeze is
>> too soon so I am posting it anyway.
> 
> I forgot to send a reply yesterday, sorry.
> 
> Don't worry about rushing this SLOF pull. Given that this build doesn't
> have bug fixes we can wait to pull it in 7.2. You'll have the time to
> sync it up with git.qemu.org and so on.


Well, the git.qemu.org is still not updated, and I have no control over 
this process anyway, who manages it?


> 
> Thanks,
> 
> 
> Daniel
> 
>>
>>
>> The image grew in size because of change of the toolchain from
>> native PPC to cross on x86.
>>
>>
>> The only change is that now SLOF can also boot big endian zImage
>> but kernel-addr=0 is still required.
>>
>>

-- 
Alexey

