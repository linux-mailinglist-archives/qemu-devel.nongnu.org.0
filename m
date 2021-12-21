Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDBA47B86B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:39:52 +0100 (CET)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzV4A-0000eh-FZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mzV2N-0008PV-Vk
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:37:59 -0500
Received: from [2607:f8b0:4864:20::f30] (port=43922
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mzV2C-0007Rn-Pa
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:37:59 -0500
Received: by mail-qv1-xf30.google.com with SMTP id fq10so2653888qvb.10
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=EPmBpF7mc5/4GJo5a+0FocHBt8lYIXWR1a4oN3Tyew0=;
 b=GBu14DlvnMLC0X6lxDDwWsGTQtcQO5L2OgNIFFwaJZUSMrQ6Mjt3gl/z8VdlcZ/ZU0
 oNgxeVzMXuLUg7IGlKrtfQPA2XdjV23QoIaEmWkb3SzUuPF+m94i0lpG4agm+29EdKYp
 GSttEZn0JoagPKQs/D66svp5pDDGhmVIxep+WekyWORKIC2hUfot3reNFnXoSR4OYyEh
 mTthpcmF3bG3QH1Dt3G/yzykqgt06xZ36xTDXarV6TYnPHNyQf3O7cxEjujEGKIA8OWY
 lbk7/CIMs9tr5v7vpSJag4rtvkxtxst+R5snkvk/ylNg/mvRQvM8HTJKeYsY5Dv94Apt
 6hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EPmBpF7mc5/4GJo5a+0FocHBt8lYIXWR1a4oN3Tyew0=;
 b=vfbE/ISa6Sq2/5QJ+ZR9o9yt+GK2p3X9M4QFgxuBpVq43oMMvei9SRFVTyhXMoqLP5
 UEEPnU55MXlEU2yctt3+WwSZFwIYeef6lQLMUSlaYGt1Bk0Tm05VROS2bzU1mglSXzXr
 By6Lby5GQpn2C+5J38o/S/dBj7nQqfOKvDiY7vDueDNnDsvoHon0yGpkA21OpHNh0iL3
 LmpyVeO71XLnEYmNuEWpv5E6GQvGEu67VkU538GbMtkoE7Gs0qDetzP//wPEWi9zhuRv
 ubxD88Mtg8QvL5Sv23m4fMb5e27rdfxolTjDswfu4JwJ3aDh6wc/icaJGPpgvHiSiIvm
 veig==
X-Gm-Message-State: AOAM533/dT70qBEqlxMIWx3cYKFp5zfxYV/NJCFtEwCLwEoNdgEktQx0
 IgxoXcsIW4MqLqBoWuRHZOw=
X-Google-Smtp-Source: ABdhPJwYUPSDq+vXKzsVDMjkZIcjNdVeDvjyqXU94rj5qFp5Of1JmNTy8LtbN9OOyoJE6lsFmHzXvw==
X-Received: by 2002:a05:6214:2429:: with SMTP id
 gy9mr702581qvb.36.1640054267573; 
 Mon, 20 Dec 2021 18:37:47 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:e707:b911:92d:ccb8:4968?
 ([2804:431:c7c7:e707:b911:92d:ccb8:4968])
 by smtp.gmail.com with ESMTPSA id v12sm16359199qtx.80.2021.12.20.18.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 18:37:47 -0800 (PST)
Message-ID: <9f1947e0-86d8-60e4-87bf-f4a5ec0d6ea8@gmail.com>
Date: Mon, 20 Dec 2021 23:37:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: powernv gitlab ci regression
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-devel <qemu-devel@nongnu.org>, clombard@linux.vnet.ibm.com
References: <461a77d6-a5d2-0ba1-de95-bc8cfa5fb83b@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <461a77d6-a5d2-0ba1-de95-bc8cfa5fb83b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.608,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

On 12/20/21 18:35, Richard Henderson wrote:
> Hi guys,
> 
> Somewhere within
> 
>> Merge tag 'pull-ppc-20211217' of https://github.com/legoater/qemu into staging
>> ppc 7.0 queue:
>>
>> * General cleanup for Mac machines (Peter)
>> * Fixes for FPU exceptions (Lucas)
>> * Support for new ISA31 instructions (Matheus)
>> * Fixes for ivshmem (Daniel)
>> * Cleanups for PowerNV PHB (Christophe and Cedric)
>> * Updates of PowerNV and pSeries documentation (Leonardo and Daniel)
>> * Fixes for PowerNV (Daniel)
>> * Large cleanup of FPU implementation (Richard)
>> * Removal of SoftTLBs support for PPC74x CPUs (Fabiano)
>> * Fixes for exception models in MPCx and 60x CPUs (Fabiano)
>> * Removal of 401/403 CPUs (Cedric)
>> * Deprecation of taihu machine (Thomas)
>> * Large rework of PPC405 machine (Cedric)
>> * Fixes for VSX instructions (Victor and Matheus)
>> * Fix for e6500 CPU (Fabiano)
>> * Initial support for PMU (Daniel)
> 
> is something that has caused a timeout regression in avocado-system-centos:
> 
>>  (047/171) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '047-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8', 'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2021-12-17T19.23-... (90.46 s)
>>  (048/171) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '048-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9', 'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2021-12-17T19.23-... (90.55 s)
> 
> See e.g. https://gitlab.com/qemu-project/qemu/-/jobs/1898304074

Thanks for letting us know. I bisected it and the culprit is this patch:


commit 4db3907a40a087e2cc1839d19a3642539d36610b
Author: Daniel Henrique Barboza <danielhb413@gmail.com>
Date:   Fri Dec 17 17:57:18 2021 +0100

     target/ppc: enable PMU instruction count


This is a patch where I added instruction count in the ppc64 PMU. After this patch the
performance of these 2 tests are degraded to the point where we're hitting timeouts in
gitlab (didn't hit timeouts in my machine but the performance is noticeable worse).

I'll need to see the serial console of the VM booting up to evaluate if there's some kernel
module during boot time that is using the PMU and causing the delay. I'll also take a look
into improving the performance as well (e.g. using more TCG code and avoid calling helpers).

It might be the case that the performance gain is enough to make these tests happy again,
although my initial guess is that there's something during boot that is starting the PMU and
leaving it running.


Thanks,


Daniel









> 
> Timeouts are especially tedious with gitlab, because they're not usually consistent, and often go away with a retry.  If I don't see the same failure on my local machine, I often let it go.
> 
> But in this case, the gitlab ci regression has been consistent, not passing a single time since.  Which makes me think this is not just a ci artifact, but that there's a real slowdown.  Could you please have a look?
> 
> 
> r~

