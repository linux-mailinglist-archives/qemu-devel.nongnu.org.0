Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAED332253
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:50:55 +0100 (CET)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZ0w-0003Id-5w
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYu7-0005KG-WF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:43:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYu6-0004SL-5i
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615283029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNEf+GtEbXYXeLBBojgwoYyBlmOqbIHHX0ChTeVYfLI=;
 b=hNlNwtdRhpcZXlZothUzKTngCPV2w5rkFsbEnQKJm9S77vP1OIhADzNaGSswrfexzl0Er6
 7QnlMA7AE8bgoO8JVTUIj4BqW4EkJeTGYtuiYojIfyL/z4GX75qOyKq7k3K5CzJPVqyqMU
 OKS4uKkXlVTJ7yt2cvofE2QK4ih/lf0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-vx8IabLuPL6docmrT5pCDA-1; Tue, 09 Mar 2021 04:43:47 -0500
X-MC-Unique: vx8IabLuPL6docmrT5pCDA-1
Received: by mail-wm1-f69.google.com with SMTP id o9so230277wmq.9
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:43:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FNEf+GtEbXYXeLBBojgwoYyBlmOqbIHHX0ChTeVYfLI=;
 b=on22scEpFfa7U/eAzLHgmjLcHUo4VfGM+8hY6mxPRjRC0mtfQ9Tbbks36TPkNjy7m5
 UiIAGked6SISH8AWHD/rFp0LOk31YkpD6tzpOWr3ivViS617H9R0ZKXVoW0Z1cU5PtMR
 93ZAJxzNXa73bsjqvY79nUJbMCBeyGmszNNk4QIAni1X1HCvX34dypzZxdJv9v++1SSs
 dw+2Pjq++JxcTFvHMMseXO4BafBTmMebEK4T5xwzLC6dL152oUwRTmUMZ3E1uvZqIXGo
 fSDUOBodHhACT3OfoiBkMIw/Y2KXO/S4fmq0mFZZwN1n3pBi3dWvYemp62n65bB1SMvL
 OIew==
X-Gm-Message-State: AOAM530aMTM2bC5k0AMhRt8uexn0X4eY0gXCTb4AMGStGglaTqrXLtop
 0LBI2QNA+HmhgUzsQz3pxCK/YN4Qech5VqeIe8vitrpeG/ZYCGELHhK3joPID1+9uDGs3T4xHC6
 VMOVfqBlb9UO77YfVZm/H2ih7WJMk740qqiVJ1yTzfz3qas0HERCp/f7QgZCQxOl2
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr3044819wmc.168.1615283026017; 
 Tue, 09 Mar 2021 01:43:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeoSg1w4IqZOL2h40/DAT/wNbCUX+L8jpwJN/bsR6LU14jFJt+t9GffW8ZfV8H5vIBjvFH/w==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr3044795wmc.168.1615283025781; 
 Tue, 09 Mar 2021 01:43:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 18sm3231744wmj.21.2021.03.09.01.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:43:45 -0800 (PST)
Subject: Re: [PATCH v2 0/2] tests/acceptance: Test Aspeed ARM machines
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210304123951.163411-1-joel@jms.id.au>
 <CAFEAcA9jux7H2cAwgrndvUv5=fivgQwbWDUEbU7rv7xUb=rz4A@mail.gmail.com>
 <345ad50c-ac43-2337-29e4-b7f060896434@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce0fdfce-409f-4e20-7b11-180673a39473@redhat.com>
Date: Tue, 9 Mar 2021 10:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <345ad50c-ac43-2337-29e4-b7f060896434@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alex

On 3/5/21 4:38 PM, Cédric Le Goater wrote:
> On 3/5/21 4:12 PM, Peter Maydell wrote:
>> On Thu, 4 Mar 2021 at 12:40, Joel Stanley <joel@jms.id.au> wrote:
>>>
>>> v2: Fix ast2600 test, thanks Cédric for the review.
>>>
>>> This adds tests for the Aspeed ARM SoCs. The AST2400 and AST2500 tests
>>> use OpenBMC images from that project, fetched from github releases. The
>>> AST2600 test uses a Debian arm32 kernel.
>>
>> Just a note that I'm assuming that Cédric will gather up the
>> various aspeed related patches that have been on the list recently
>> and send a pullreq for them. (Having been on holiday my to-review
>> queue is pretty full so I've just ignored anything aspeed-related;
>> let me know if there is anything you specifically want me to look
>> at, queue, whatever.)
>>
>> PS: softfreeze is 16 March so a pullreq on list sometime next week
>> would probably be the ideal.
> 
> Yes. I am preparing the PR. 
> 
>   aspeed: Integrate HACE
>   hw: Model ASPEED's Hash and Crypto Engine
>   hw/misc: Model KCS devices in the Aspeed LPC controller
>   hw/misc: Add a basic Aspeed LPC controller model
>   hw/arm: ast2600: Correct the iBT interrupt ID
>   hw/arm: ast2600: Set AST2600_MAX_IRQ to value from datasheet
>   hw/arm: ast2600: Force a multiple of 32 of IRQs for the GIC
>   hw/arm/aspeed: Fix location of firmware images in documentation
>   aspeed: Emulate the AST2600A3
>   tests/acceptance: Test ast2600 machine
>   tests/acceptance: Test ast2400 and ast2500 machines
>   arm/ast2600: Fix SMP booting with -kernel
> 
> The HACE patchset needs a second look from an Aspeed-aware person and 
> I have some questions on AST2600A3.
> 
> Merging these acceptance tests would be really nice. Have we addressed
> all you concerns Philippe regarding the image downloads ?

No, but I'll defer to Alex here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg787742.html

> 
> Thanks,
> 
> C.
> 


