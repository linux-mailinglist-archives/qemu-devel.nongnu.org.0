Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2F3BF8BA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:11:42 +0200 (CEST)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1RwR-0008Vj-9C
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1RvJ-0007FG-BF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:10:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1m1RvF-0004FV-DE
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:10:28 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b8-20020a17090a4888b02901725eedd346so3522967pjh.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8bDUzo+Bhkrj9c7s2S3xw61x2dnAiaco/AcAMweYqac=;
 b=a1O0evcox+KB8YjJkOLH0bItmgpx7OqzaxOCDO8e0j6D3i88UhLdPM6cqm0og4UxP9
 DrOsEvfZ50bxu0yPu4gKitF7ylghRWLqTpdRNg+A0UGjxz2AnPIB/L8ezoX0eq5XjOnJ
 aW0cJVEVdRCMK6lc6/owTcrnK4Hf5RYb9HIqUrT4wKoJchdINHX4LMTXHPWFVNUVKyoE
 RBjfFntgG361GHbjMQfFKCeoeQXbj3IOpyPkbXzSZcYBd3lsdHFnWsbJC1y4TjXuN7Y/
 F2TW8LylhNAlk/Jt+2a2oKi3rug1FvHGl5qxBhOcY1LcTltAVg4BpAvgsOwxIgJAbDsI
 Lzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8bDUzo+Bhkrj9c7s2S3xw61x2dnAiaco/AcAMweYqac=;
 b=QTuF3A84l/tzGBm/CkODzx1pBnz65GyJSabWe3OJBHbJpsjc4TFZ3CfT6mMBdZVJYT
 WLJr1s25ow82BOof2+Xnvvt1JKQEyH9y9e11aEL83NDQr/UtbQasy+ovXXbBgMnefHX3
 HLFA5m1svTljssCrzttiXNdBk642peljnWrO0qQTBjHpnvxEWi4StFM0/FPCydI6D0dD
 X7PmCpcCchYK1DUnPPyWvqhp1hAcJCTZ/aayu/2KzKQae/pfabSZbB5RxCOVJvCDvLiZ
 7SPDX6h0RxeBYm7oRcVC4miBkiGXop0woOHzksIfZsM+PYuOqqCFSrsHm1cyfAqBb/bk
 WSLw==
X-Gm-Message-State: AOAM533/H7wYX7lekgWTQgowZYLW1YCIqRgqelihCwFcKfYS1GpU3Zxg
 yqs3DYMd4R6R3Och1fHnb6E5WA==
X-Google-Smtp-Source: ABdhPJxQ8W6DvBFAR0eVRs5iMvUHDaVulKgIa8s72U0lTBa0vbzTlsC+AWDBcqOuHWgB8tnI2xbpWg==
X-Received: by 2002:a17:90a:d48f:: with SMTP id
 s15mr31158324pju.161.1625742622624; 
 Thu, 08 Jul 2021 04:10:22 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 g9sm2311792pfj.49.2021.07.08.04.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 04:10:22 -0700 (PDT)
Message-ID: <6a25eed6-22db-7d5c-6686-67322b70a83f@ozlabs.ru>
Date: Thu, 8 Jul 2021 21:10:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <22b9ae49-7252-b664-ea98-99bb7baf4680@eik.bme.hu>
 <07d3a270-6d44-591d-d0ee-0264d3b4c7f2@ozlabs.ru>
 <4a903fde-4ea-a296-3132-bae249d261a@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <4a903fde-4ea-a296-3132-bae249d261a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 20:39, BALATON Zoltan wrote:
> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>> On 08/07/2021 20:18, BALATON Zoltan wrote:
>>> On Thu, 8 Jul 2021, Alexey Kardashevskiy wrote:
>>>> This addresses the comments from v22.
>>>>
>>>> The functional changes are (the VOF ones need retesting with Pegasos2):
>>>>
>>>> (VOF) setprop will start failing if the machine class callback
>>>> did not handle it;
>>>
>>> I'll try this later but I think I've seen guests using setprop (Linux 
>>> also does that for some property). How should I allow that? Do I need 
>>> a new callback for this? Could it be allower unless there's a 
>>> callback that could deby it? But that was the previous way I think.
>>
>> A simple defined callback which always returns "true" should do.
> 
> Yes but what's the point? That would just effectiverly disable this 
> change so if we need that, we could just as well keep the previous 
> behaviour which is to allow setprop unless there's a callback that can 
> decide otherwise. The spapr machine has such a callback so it already 
> does not allow all setprop and if I'll have a callback in pegasos2 
> returning true that will allow what's allowed now so this part of this 
> patch does nothing indeed.
> 
> Since guests could do all kinds of things that we don't know without 
> trying them restricting setprop is a good way to run into problems with 
> guests that were not tested that could otherwise just work. Then we'll 
> need another patch to enable that guest adding some more properties to 
> the list of allowed ones. Why it it a problem to allow this by default 
> in the first place and only reject changes for machines that have a 
> callback? Then I would not need more empty callbacks in pegasos2.


 From here:
https://patchwork.ozlabs.org/project/qemu-devel/patch/20210625055155.2252896-1-aik@ozlabs.ru/#2714158

===

 >>> +    if (vmo) {
 >>> +        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
 >>> +
 >>> +        if (vmc->setprop &&
 >>> +            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
 >>> +            goto trace_exit;
 >>
 >> This defaults to allowing the setprop if the machine doesn't provide a
 >> setprop callback.  I think it would be safer to default to prohibiting
 >> all setprops except those the machine explicitly allows.
 >
 >
 > Mmmm... I can imagine the client using the device tree as a temporary
 > storage. I'd rather add a trace for such cases.

If they do, I think that's something we'll need to consider and
account for that platform, rather than something we want to allow to
begin with.

===


-- 
Alexey

