Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4E2F768F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:23:27 +0100 (CET)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MGM-0001FU-3j
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0MEX-0000GU-2C
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:21:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0MEV-0006Jj-JQ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xw/pp5Z7GYLd8tWIon39VeNcK5q8ntZqGrZHMjazwk=;
 b=U3kHbbiN7UQOo1mL6/f4vdxzVekbiu8eEJl/SwdpjzH01G3AGTV+tazbA8vvMOLUeIcUyR
 zQ2bMC3ojCBY7FzncQENhB3oXlQSMKa03TkxORgBjJKUHyXGIn67FvvJLWcHi7rniOX9Ca
 dVY9WkIA9rwHtxSZEOvhb7xsUdKjHjM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-O-yi4Wz-OUabNTH_r9JZww-1; Fri, 15 Jan 2021 05:21:24 -0500
X-MC-Unique: O-yi4Wz-OUabNTH_r9JZww-1
Received: by mail-ed1-f71.google.com with SMTP id f21so3355828edx.23
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+xw/pp5Z7GYLd8tWIon39VeNcK5q8ntZqGrZHMjazwk=;
 b=l/BNr22E6m6BTrDpXTa1IPdxRuLvqgIxf7+PGHxRvMDTnWYRyZbUFd1LY6rpFfQX9x
 VRyX4oy61FXSrfo6m9D4LB2Vha4Xo15zV4MPhMgQ7SExhm6XFC6ZvHhjldBRar/bXorZ
 1VSjgBAe29okG/z4BxlYgY94TGAnffVTcoMT+CsmEaxRmrnv30ojBMwbm4OE1Vs7uG+N
 jIShmQEyLcKoFN1x5tkOLOSLWFaKVnQiS+GzM+anJcVGx6XMscv3l7eotxzye4LcAgWV
 Qd9HPVqkfmBdvzEv39lzBLGW+ZV4uZlrx6jmsNCm5069uLamsGYnFAwMHKH8Kzw6tLMg
 oUQQ==
X-Gm-Message-State: AOAM533NuRgi46W7PDEDWNbFUTIyFO7pxdndlJFkraJ5lsCZCCm512Kg
 vxvEU4qILIeDB/3m4EIcJipg3LlQ4yWTKbI63Rt+oQigTl8DwRxbrCz0OOGodmIAM6AoAwZ887G
 T/q5fug+OZmJFK9I=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr9287000eds.352.1610706083553; 
 Fri, 15 Jan 2021 02:21:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+f24uUfM5vbuVcpFufIUo+L2vcJHNGN6/J5INNDR2Kczkzre0QWyWfS25XUKImcCK/sZn5w==
X-Received: by 2002:aa7:c886:: with SMTP id p6mr9286983eds.352.1610706083326; 
 Fri, 15 Jan 2021 02:21:23 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x5sm2456170edi.35.2021.01.15.02.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 02:21:22 -0800 (PST)
Subject: Re: [PATCH] hw/block/nvme: fix for non-msix machines
To: Klaus Jensen <its@irrelevant.dk>
References: <20210112124714.220657-1-its@irrelevant.dk>
 <0d5fc44d-14cf-5fd9-e8e3-2aae48ebfa4a@redhat.com>
 <YAE/J08kcQ1WfjOQ@apples.localdomain>
 <5bcdfa4a-218d-a1f4-0ece-654e76403ee6@redhat.com>
 <YAFkeSFGnSAG987g@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <262f869d-e9d4-0cc9-ef9d-66ff8dd06178@redhat.com>
Date: Fri, 15 Jan 2021 11:21:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YAFkeSFGnSAG987g@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 10:46 AM, Klaus Jensen wrote:
> On Jan 15 10:37, Philippe Mathieu-Daudé wrote:
>> On 1/15/21 8:07 AM, Klaus Jensen wrote:
>>> On Jan 12 14:20, Philippe Mathieu-Daudé wrote:
>>>> On 1/12/21 1:47 PM, Klaus Jensen wrote:
>>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>>
>>>>> Commit 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar()
>>>>> return value") had the unintended effect of breaking support on
>>>>> several platforms not supporting MSI-X.
>>>>>
>>>>> Still check for errors, but only report that MSI-X is unsupported
>>>>> instead of bailing out.
>>>>>
>>
>> BTW maybe worth adding:
>>
>> Cc: qemu-stable@nongnu.org
>>
>> So this patch get backported in the next stable release based on 5.2.
>>
> 
> Thanks Philippe,
> 
> I messed up the bounce, but I sent it on to stable now.

I meant in the patch description itself before the other tags
(qemu-stable scan for commits with the "Cc: qemu-stable@nongnu.org"
tag).


