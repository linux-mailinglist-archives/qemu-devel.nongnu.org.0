Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322E035A030
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:42:38 +0200 (CEST)
Received: from localhost ([::1]:45968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrPB-0005vV-9H
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUrOM-0005DE-5W
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUrOH-0004qW-86
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617975699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfimQGaRoRh0VUSPUb6eOiV9emGOWTPcbfhbj7jqM44=;
 b=ahMKtIrdHYL+m2Fxp41AVROSO42TsO7/iR4amG9Lq7tt1o9j3P94hkVCyVAcNPBSKWGqNC
 ccBjkjhC6Ajo3Tw3+0RWvUW6sfMkt4Fk8RlrZZTl+Yby62dUR6uIrr7tni348ZCpBVV1zL
 Xj///dAk3npRnx0JIoWr3sMcyOKT/EI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-xvuYuxU8PoCA-l6r2BQEtA-1; Fri, 09 Apr 2021 09:41:37 -0400
X-MC-Unique: xvuYuxU8PoCA-l6r2BQEtA-1
Received: by mail-ej1-f70.google.com with SMTP id h19so2211693ejk.8
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 06:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vfimQGaRoRh0VUSPUb6eOiV9emGOWTPcbfhbj7jqM44=;
 b=JzUQXaGL+NdhRnZupLRp9q4UfSe7e3GAk0hDljuVcSwZu+/Iuy/lhsyJbOUnN9NuQx
 4Vghd/055O95yraqsrERK5mOGZs930ibk906ZhfnsSZx0gEuU48/0MqHCxzamxrFoHZZ
 PZvTEYVGh8W2XXQfIBpe2ygZY8+JlWRqDkkk+O9ydprjehl0YoE2bVMxWlfNTdGlBSY9
 ckUSImts5B1bMIJMY7CVX/wv8yQNU2fRMprXQvsSVETOOGawQAOEIjWX0IcQb7bnDNDO
 QgdFPgqlTgS01xi7+wo7roILqRwbPsMFLPtOkHBsim3FiZ5cvuUqhz6MZDHhj6ttkhkb
 qj3w==
X-Gm-Message-State: AOAM530Lhr9XzYFhNDe1+mWbBCgVRU457SA9jnEKiGOdJT798JSRzdIJ
 kt7tRuN000UfgF3EqrekHEPrmygqMWR5O+At72FnZCPCoE4vKa4fvYpTSkWEYqeuWUVE8PLNT1x
 XQstF67qlij6VNwo=
X-Received: by 2002:a50:eb92:: with SMTP id y18mr9753845edr.230.1617975696388; 
 Fri, 09 Apr 2021 06:41:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrhjeO6e67JIzOvfCHl3nws2wT7SjVq7yMM5wtveDcU2X/Q6FwLNlmCMYkPQ7C6eXK0vdmlA==
X-Received: by 2002:a50:eb92:: with SMTP id y18mr9753829edr.230.1617975696160; 
 Fri, 09 Apr 2021 06:41:36 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id hz24sm1241115ejc.119.2021.04.09.06.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 06:41:35 -0700 (PDT)
Subject: Re: iotests 041 intermittent failure (netbsd)
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <CAFEAcA_-ARyPM0gB2Y_FKdUp9DYRNbz1GFU1AzFE9UZgjWNazQ@mail.gmail.com>
 <6cf410f9-6566-5921-fecc-6adaafbce068@redhat.com>
 <YHAs/+BEnkuPgWkO@redhat.com> <YHA8eZwYOkeGjnY+@merkur.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6839ed3d-dc79-8317-c373-0f7fd08c128e@redhat.com>
Date: Fri, 9 Apr 2021 15:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHA8eZwYOkeGjnY+@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 1:37 PM, Kevin Wolf wrote:
> Am 09.04.2021 um 12:31 hat Daniel P. Berrangé geschrieben:
>> On Fri, Apr 09, 2021 at 12:22:26PM +0200, Philippe Mathieu-Daudé wrote:
>>> On 4/9/21 11:43 AM, Peter Maydell wrote:
>>>> Just hit this (presumably intermittent) 041 failure running
>>>> the build-and-test on the tests/vm netbsd setup. Does it look
>>>> familiar to anybody?
>>>
>>> This one is known as the mysterious failure:
>>> https://www.mail-archive.com/qemu-block@nongnu.org/msg73321.html
>>
>> If the test has been flakey with no confirmed fix since Sept 2020,
>> then it is well overdue to be switched to disabled by default, at
>> least on the platforms it is known to be flakey on.
> 
> Why do you think this is the same problem? It is a completely different
> error message, happening in a different test function. The problems
> reported in September were fixed in the next version of the pull
> request.

Oops my bad, I thought this was the same, sorry.

> What Peter is reporting here is probably unrelated to NetBSD, but to
> overloaded test hosts. QMPTestCase.pause_wait() uses a timeout of
> 3 seconds until it decides that the job probably has just failed to
> pause at all, so that the test case wouldn't hang indefinitely on
> failure.
> 
> We can increase the timeout, but of course, that doesn't guarantee that
> we'll never hit it again on very slow test hosts.
> 
> Kevin
> 


