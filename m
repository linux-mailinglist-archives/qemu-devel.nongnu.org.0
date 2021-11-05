Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E97F4468CC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 20:18:02 +0100 (CET)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4iu-0000IM-VQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 15:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj4ht-0007lf-9X; Fri, 05 Nov 2021 15:16:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj4hp-0001go-K0; Fri, 05 Nov 2021 15:16:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d27so15266556wrb.6;
 Fri, 05 Nov 2021 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nf835mmAytdF0LUXOxz9y59qEtN6QJvyVDZuiS0VPqs=;
 b=msKdvSMCow2vom2xZcLm/oCWuJ2S7Fy/o1ZA+rGpUkVKwO5tIoGHW0O4yA3pBrjxmp
 7xa+u4vxbd4lx8bwKdZwVo0t5L/EWyTQjcgiIc7QgUJMLTRQszxt9bP/8UbD3OZ43OB8
 LAkvvD9doBDX7bt9g0zmeoGhsJSjEFNcdEvnxkUJkY6ii9IkINWxyRhpy1rKrji9dY0B
 vojB0zVegJK8rZbPzoKmBpzkosD2PG/6c+bOwGKiaBPhUVHcEUoRJFGZ25kEQgLEG2bh
 +4s71ikvdBmXbEHd2vwqTPlWXIBFzhaPJD2qQrkmhQglC69DlkAvpyGn6PLwYQxHmKwa
 hWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nf835mmAytdF0LUXOxz9y59qEtN6QJvyVDZuiS0VPqs=;
 b=VU7QvzfBMJeNaGD4sBi9dJoK2J9Pes/gcdf0aEmqwBihnplgiIyCrNCBW5np4jfSJr
 iRXFM4kGVOggW+SAXKTWEEVwo2MQ11AMlf3CdviCcj/BTj5JTNAX6+n+pDaXPX184N4l
 3l7HBOPLX5H1MBnuA/FoP0xZl+slLhaKcw+h2P2U2gwNC2ho38WpgjgD3v00OE0x+M3d
 kIdtka8aYFfYQhzW/Fc/R1jKP5hcj7KKBUmTD3AGp1yN9bxYLtgF/3doZxN/xhYvKn03
 Wlm7Fm3OUtS38lggYMET17LBgZvO5q0L04XdG0Wqce+r33g0NNm0g3zPSDKXhME3ybJ7
 xHeQ==
X-Gm-Message-State: AOAM533SBMAp769br9YpvbZ7ZNtYLBfLEB9SWOfMLb1TcAPi+FSgd6m6
 8kyGMggZIUAIznjzb073wqI=
X-Google-Smtp-Source: ABdhPJzyP3R8KyYl26BrCWXyB561Iz63Q8AqujFb3YgqEDbee7gl3g+A+Q5Co7B2DB7lZSLhHZvtXg==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr76040773wru.182.1636139811437; 
 Fri, 05 Nov 2021 12:16:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n7sm8703323wro.68.2021.11.05.12.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 12:16:50 -0700 (PDT)
Message-ID: <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
Date: Fri, 5 Nov 2021 20:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, clg@kaod.org
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.093,
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
Cc: peter.maydell@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On 11/5/21 10:48, Daniel Henrique Barboza wrote:
> On 11/5/21 00:46, David Gibson wrote:
>> As our day jobs and interests have moved onto other things, Greg and I
>> have
>> been struggling to keep on top of maintainership of target/ppc and
>> associated pieces like the pseries and powernv machine types, with their
>> platform specific devices.
>>
>> We've therefore discussed and plan to transfer maintainership to
>> Cédric Le
>> Goater (primary) and Daniel Henrique Barboza (backup).  Cédric and Daniel
>> have been actively contributing to the area for some time, and they're
>> supported in this by their current employer, IBM, who has an obvious
>> interest in the platform.
> 
> Thank you and Greg and Red Hat for all the years of service supporting
> qemu-ppc in the community. IBM will shoulder this responsibility now.

In term of the MAINTAINERS file:

        S: Status, one of the following:
           Supported:   Someone is actually paid to look after this.
           Maintained:  Someone actually looks after it.

The PPC entries have a 'Maintained' status. You say "IBM will shoulder
this responsibility", does that mean the entries will be 'Supported'
as in "someone paid to look after them"?
I wonder because both Cédric and you have some commits with an IBM
email, but both are registering a non-IBM email as contact. I don't
mind the email technical detail, but I am curious about the status
and expectations.

Thanks,

Phil.

>> Greg and I do plan to stay around in some capacity for at least the next
>> 6 months, providing reviews and advice to assist the new maintainers into
>> the role.
> 
> I hope both of you stay around way longer than that :)
> 
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
>>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>   MAINTAINERS | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 797be5b366..066c4fb2b0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -262,8 +262,10 @@ F: hw/openrisc/
>>   F: tests/tcg/openrisc/
>>     PowerPC TCG CPUs
>> -M: David Gibson <david@gibson.dropbear.id.au>
>> -M: Greg Kurz <groug@kaod.org>
>> +M: Cédric Le Goater <clg@kaod.org>
>> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
>> +R: David Gibson <david@gibson.dropbear.id.au>
>> +R: Greg Kurz <groug@kaod.org>
>>   L: qemu-ppc@nongnu.org
>>   S: Maintained
>>   F: target/ppc/
>> @@ -382,8 +384,10 @@ F: target/mips/kvm*
>>   F: target/mips/sysemu/
>>     PPC KVM CPUs
>> -M: David Gibson <david@gibson.dropbear.id.au>
>> -M: Greg Kurz <groug@kaod.org>
>> +M: Cédric Le Goater <clg@kaod.org>
>> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
>> +R: David Gibson <david@gibson.dropbear.id.au>
>> +R: Greg Kurz <groug@kaod.org>
>>   S: Maintained
>>   F: target/ppc/kvm.c
>>   @@ -1321,8 +1325,10 @@ F: include/hw/rtc/m48t59.h
>>   F: tests/acceptance/ppc_prep_40p.py
>>     sPAPR
>> -M: David Gibson <david@gibson.dropbear.id.au>
>> -M: Greg Kurz <groug@kaod.org>
>> +M: Cédric Le Goater <clg@kaod.org>
>> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
>> +R: David Gibson <david@gibson.dropbear.id.au>
>> +R: Greg Kurz <groug@kaod.org>
>>   L: qemu-ppc@nongnu.org
>>   S: Maintained
>>   F: hw/*/spapr*
>> @@ -1382,6 +1388,8 @@ F: include/hw/pci-host/mv64361.h
>>     Virtual Open Firmware (VOF)
>>   M: Alexey Kardashevskiy <aik@ozlabs.ru>
>> +R: Cédric Le Goater <clg@kaod.org>
>> +R: Daniel Henrique Barboza <danielhb413@gmail.com>
>>   R: David Gibson <david@gibson.dropbear.id.au>
>>   R: Greg Kurz <groug@kaod.org>
>>   L: qemu-ppc@nongnu.org
>>
> 


