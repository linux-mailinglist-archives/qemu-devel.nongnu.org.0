Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E163A2525
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 09:15:54 +0200 (CEST)
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEuv-0001uC-6s
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 03:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lrEu0-00015O-SJ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:14:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lrEtx-00026f-9u
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:14:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so3251834pjb.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o9rqaU6zAIxQ2mL1/XDvuvGfto369s8oio/RvC61Dno=;
 b=wdJdLhyeFcus3gd7wppXLFU9vJyGsQF1XHJqPpimiCqwiqzbKpky4MIQNCkPDaeFqJ
 q2zi1LVOyTowgXRZ0DHd5mXw/Uamb34633FHJabGyicMxiZgnZVDwh7i3zOn/gtQacML
 mdmTnGwkPNkawYTTknQAlIQxACth3TLkZQ6dZUDxw5yD1IusU9N/GApjP3vM4IpKfNvg
 s0gK3FuGhs+idzuuKsK8TM6hcMjygDyqQzxPMYhwpGhsVcIQDuSWfcPS7ubj8a6G5cij
 H8SMYh010Xg7eib11Fy+Cjqx8pos7Fu1s6EV6/dSUqn8S/l2qmtYv9cvqYBH516yfilY
 KkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o9rqaU6zAIxQ2mL1/XDvuvGfto369s8oio/RvC61Dno=;
 b=DtO0VAFN2ntMKQS1ICcz+YyE816XB0mRTtAzVfg07Dz66y0TmYZXdSYuUOO0OeivUp
 V1rZQlto58f0ZXaSxGLt9Oaxt56IRVOmreD3D2wWE27NY2k0wggTgUJ6hwqRVSt3wvqm
 +i2FmFv3lMqLNy2Mmi2kL8n0s+ZuqASMhF0DmkEY8NZogQF7CbTSTktxMxGjfW/k4Q5n
 7sIRFdPQVjQBvsgwGwU1eIT/bsL897wq2HlHSABIXNy1zY6GgHRpC3hh3IEsM+mTlml3
 +cXExPlYYpcokGz9KhTet5hD9iE9HUjr0CYJoigkrHo7e6HPdhNF816fCtJCAkn7xud4
 FwBw==
X-Gm-Message-State: AOAM5315BXuAPqDTXjAh5baDxsY7h6XNSgDdpszo9/BLGiJzyCFgNhr2
 saQQAgoeZKc1vK0O+VhFRHE0ZQ==
X-Google-Smtp-Source: ABdhPJx8kQZepzlxv5b1dknoBEhSRhXnB6NQ3+17ie3rbzZJDDRpeW2RTWMUAaETYEd6Dm9wqS0C7Q==
X-Received: by 2002:a17:902:bb94:b029:116:1eb9:9c74 with SMTP id
 m20-20020a170902bb94b02901161eb99c74mr3523517pls.48.1623309290259; 
 Thu, 10 Jun 2021 00:14:50 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id s22sm1504192pfd.94.2021.06.10.00.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 00:14:49 -0700 (PDT)
Message-ID: <bb539b72-5548-d035-8089-3d49f4babc1d@ozlabs.ru>
Date: Thu, 10 Jun 2021 17:14:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [RFC PATCH 0/5] ppc/Pegasos2 VOF
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <5ab75d13-2fca-17cc-b24f-e86430fdda20@ozlabs.ru>
 <a5786f77-efc1-febb-7ae2-1e9543ca2687@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <a5786f77-efc1-febb-7ae2-1e9543ca2687@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/9/21 20:28, BALATON Zoltan wrote:
> On Wed, 9 Jun 2021, Alexey Kardashevskiy wrote:
>> On 6/7/21 01:46, BALATON Zoltan wrote:
>>> Based-on: <20210520090557.435689-1-aik@ozlabs.ru>
>>> ^ That is v20 of Alexey's VOF patch
>>>
>>> Hello,
>>>
>>> Posting these for early review now. I plan to rebase on the next VOF
>>> patch that hopefully fixes those points that I had to circumvent in
>>> patch 1 for now. I've reported these before but now all of those that
>>> are needed for pegasos2 are in one place. Other points I've reported
>>> could be clean ups but not sttictly needed.
>>>
>>> With this series on top of VOF v20 I can now boot Linux and MorphOS on
>>> pegasos2 without needing a firmware blob so I hope this is enough to
>>> get this board in 6.1 and also have it enabled so users can start
>>> using it. That means that VOF will also be merged by then. This now
>>> gives VOF another use case that may help it getting finished.
>>>
>>> I've also updated my development tree with this series here:
>>>
>>> https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
>>>
>>> Please review so I can do any needed changes together with the rebase
>>> on next VOF patch so we don't miss 6.1 this time.
>>
>>
>> It would help if you provided the disk or/and kernel or/and 
>> initramdisk images and the example command line to give this a try. 
>> And said a few words who is this Pegasos2 guy :) The series looks ok 
>> to me otherwise. Thanks,
> 
> These were in the original series adding this board:
> 
> https://patchew.org/QEMU/cover.1616680239.git.balaton@eik.bme.hu/


Ah ok. Thanks!


> For testing I've used the kernel from debian 8.11.0 powerpc iso which is 
> known to work on real hardware and MorphOS demo iso available from 
> www.morphos-team.net. For debian look into install/pegasos to find the 
> right vmlinuz-chrp.initrd kernel, for MorphOS use the boot.img from root 
> of the iso as -kernel.
> 
> What's still missing is some rtas functions like get-time-of-day. Are 
> these any kind of standard and is there a doc about their parameters and 
> returns or I'll heave to find out from kernel sources? I plan to add 
> these later but not needed to get it boot.

pseries guests use what the LoPAPR spec (derived from sPAPR - "server 
PAPR") describes:

https://openpowerfoundation.org/?resource_lib=linux-on-power-architecture-platform-reference


-- 
Alexey

