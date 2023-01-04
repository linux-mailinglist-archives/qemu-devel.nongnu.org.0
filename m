Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BC65CD93
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 08:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCy7u-0001vT-J6; Wed, 04 Jan 2023 02:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCy7R-0001lP-Cb
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:23:27 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCy7P-0002Tv-DD
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 02:23:25 -0500
Received: by mail-wr1-x430.google.com with SMTP id az7so7665716wrb.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 23:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vkjrdjWAI8GyQ21OQFBZakkJwxXZvNNmD5vBxcAfAoA=;
 b=y2N9UDgZxFSF9Na8lkG+4b7/Ow5XL3UPZtlmp7xOHWAUgyuuVx5wcXD/txaaKDHsM1
 MQMr+yOfeOfcENJv5VzgKuIYHsvkalRp3RIzcvaMU0FLBjmfzG3sGlokSEaMacOnqU2n
 +wknF/I6WNU8qgBh9zRlZAO2nTSRtrdTBLtrZJeL0OkJltmCXFhfHembXTTd4K2mYUuB
 dBePdW2l8P5DX0oeicXLeySAyhqwmmvJ5jlwUb3ayj7f5Sd+k0bIKYhqF5iL7IdVTINP
 ln/7bZLEpsnn6PdsathngSch9xLo9Qy5FsX+UDFu7DXYjv8BVAbeTVwIIt9J/VdoYF6a
 Kw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vkjrdjWAI8GyQ21OQFBZakkJwxXZvNNmD5vBxcAfAoA=;
 b=qxqzllLKVtgYK3c0JhVdmbK22dKibgb0rHFQFWBNrBI6eNie7ZVAMy0Q/OhenJJjEe
 sJm/CaXLkMXhWCWsha5y550UVljNkUamsIxDKgUBALE9jpyhxrEjvRLEnmCs/oNjHysq
 lcyGm7lFYpZV/Yy4SebxJOnI+VNpaqQfAqQiWekarTE1TgjmLCPeABQehe03PKTwG1HW
 Gid7Ro/kXnbr2BbHdj0r6X20XFQvCmeKdQ0uogKJLfcCh4es/seZRU23IPIZJalfiNTx
 gEzL5S0ZU4Mi3Th7lo73q8Q0G2NvhCfCJRfXJmnQOdrOpAHqjL+iNsTBToy9eqPzCZyF
 51AA==
X-Gm-Message-State: AFqh2kpcVNjV77xxluwJuAqFXp8TdADkbzkJhjCVjCN0gm/ln1s8361F
 AA6WFQw2v3DX1M04iwyeEscn4w==
X-Google-Smtp-Source: AMrXdXvC0XiNDPs0c3SwsTyyzOdteJsuA3ti9iz9+FxvuV2AyyBmp+kpZuJl/z12zYtiInc2W+YRqw==
X-Received: by 2002:a05:6000:1109:b0:28d:b028:b16 with SMTP id
 z9-20020a056000110900b0028db0280b16mr12090157wrw.32.1672817001826; 
 Tue, 03 Jan 2023 23:23:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a18-20020adfed12000000b0027cfd9463d7sm26104125wro.110.2023.01.03.23.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 23:23:21 -0800 (PST)
Message-ID: <2048fd2c-0c85-bea5-3c0c-5223bedcc252@linaro.org>
Date: Wed, 4 Jan 2023 08:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: IO port write width clamping differs between TCG and KVM
Content-Language: en-US
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Michael Tsirkin <mtsirkin@redhat.com>
Cc: "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>,
 qemu devel list <qemu-devel@nongnu.org>
References: <aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com>
 <ea401dd3-53f1-b27c-4a5a-9085ce5ab051@redhat.com>
 <c03e353e-0d7b-6515-d7ac-1cb71e9cc7c9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c03e353e-0d7b-6515-d7ac-1cb71e9cc7c9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Laszlo,

Happy new year!

On 4/1/23 08:04, Laszlo Ersek wrote:
> Adding Michael. The thread started here:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html
> 
> More below:
> 
> On 1/4/23 07:06, Laszlo Ersek wrote:
>> On 1/3/23 18:42, Laszlo Ersek wrote:
>>> (resending with qemu-devel on CC; sorry!)
>>>
>>> Hi,
>>>
>>> this is with QEMU-7.2.
>>
>> This is a regression. It works fine with QEMU-5.0. The regression has
>> not been fixed since QEMU-7.2, as of master @ 222059a0fccf ("Merge tag
>> 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging",
>> 2022-12-21).
>>
>> I'm bisecting.
>>
>> (It's a relief that this is a regression. I felt pretty certain that I
>> had tested CPU hotplug with TCG as well!
>>
>> I've picked QEMU-5.0 as the start candidate for my bisection for the
>> following reason: per git-blame, Igor described the modern interface
>> detection steps in commit ae340aa3d2567 (which I reviewed), and the
>> first tag/release to contain that commit was QEMU-5.0. The first QEMU
>> release after Igor and I had worked on this in QEMU and OVMF
>> definitely worked with TCG too, by my account.)
> 
> See the bisection log attached.
> 
> The first bad commit is:
> 
>> commit 5d971f9e672507210e77d020d89e0e89165c8fc9
>> Author: Michael S. Tsirkin <mst@redhat.com>
>> Date:   Wed Jun 10 09:47:49 2020 -0400
>>
>>      memory: Revert "memory: accept mismatching sizes in memory_region_access_valid"

Good, I was going to point at this commit but you were faster :) This
commit has been problematic (because not all code base was ready):

$ git log 5d971f9e67.. | fgrep 5d971f9e67
     This was not an issue until commit 5d971f9e67 which reverted
     This is particularly useful since commit 5d971f9e67 which reverted
     This was not an issue until commit 5d971f9e67 which reverted
     was allowed before commit 5d971f9e67 ("memory: Revert "memory: accept
     Fixes: 5d971f9e67 ("memory: Revert "memory: accept mismatching 
sizes in memory_region_access_valid"")
     Commit 5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes
     Fixes: 5d971f9e6725 ("memory: Revert "memory: accept mismatching 
sizes in memory_region_access_valid")
     Fixes: 5d971f9e67 (memory: Revert "memory: accept mismatching sizes 
in memory_region_access_valid")
     5d971f9e6725 ("memory: Revert "memory: accept mismatching sizes in 
memory_region_access_valid"")
     Commit 5d971f9e672507210e77d020d89e0e89165c8fc9

See the later commit dba04c3488:

commit dba04c3488c4699f5afe96f66e448b1d447cf3fb
Author: Michael Tokarev <mjt@tls.msk.ru>
Date:   Mon Jul 20 19:06:27 2020 +0300

     acpi: accept byte and word access to core ACPI registers

     All ISA registers should be accessible as bytes, words or dwords
     (if wide enough).  Fix the access constraints for acpi-pm-evt,
     acpi-pm-tmr & acpi-cnt registers.

     Fixes: 5d971f9e67 (memory: Revert "memory: accept mismatching sizes 
in memory_region_access_valid")
     Fixes: afafe4bbe0 (apci: switch cnt to memory api)
     Fixes: 77d58b1e47 (apci: switch timer to memory api)
     Fixes: b5a7c024d2 (apci: switch evt to memory api)
     Buglink: 
https://lore.kernel.org/xen-devel/20200630170913.123646-1-anthony.perard@citrix.com/T/
     Buglink: https://bugs.debian.org/964793
     BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964247
     BugLink: https://bugs.launchpad.net/bugs/1886318
     Reported-By: Simon John <git@the-jedi.co.uk>
     Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
     Message-Id: <20200720160627.15491-1-mjt@msgid.tls.msk.ru>
     Cc: qemu-stable@nongnu.org
     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

>>      Memory API documentation documents valid .min_access_size and .max_access_size
>>      fields and explains that any access outside these boundaries is blocked.
>>
>>      This is what devices seem to assume.
>>
>>      However this is not what the implementation does: it simply
>>      ignores the boundaries unless there's an "accepts" callback.
>>
>>      Naturally, this breaks a bunch of devices.
>>
>>      Revert to the documented behaviour.
>>
>>      Devices that want to allow any access can just drop the valid field,
>>      or add the impl field to have accesses converted to appropriate
>>      length.
>>
>>      Cc: qemu-stable@nongnu.org
>>      Reviewed-by: Richard Henderson <rth@twiddle.net>
>>      Fixes: CVE-2020-13754
>>      Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1842363
>>      Fixes: a014ed07bd5a ("memory: accept mismatching sizes in memory_region_access_valid")
>>      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>      Message-Id: <20200610134731.1514409-1-mst@redhat.com>
>>      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> First released in QEMU v5.1.0 and v6.0.0 (exact same commit hash in
> both, as v6.0.0 descends of v5.1.0).
> 
> Because this is a CVE fix, and also because of the suggestions made in
> the commit message, I think the commit is actually right, and what we
> need to fix is the hotplug register block -- namely the
> "AcpiCpuHotplug_ops" structure in "hw/acpi/cpu_hotplug.c".

Do you see anything running with '-d guest_errors'? (on top of commit
21786c7e59 "softmmu/memory: Log invalid memory accesses", or cherry-pick 
it if you are around dba04c3488 "acpi: accept byte and word access to 
core ACPI registers").

> However, what I *really* don't understand is why this commit
> (5d971f9e672507210e77d020d89e0e89165c8fc9) makes a difference *only*
> under TCG.

Is it easily reproducible with TCG?

Regards,

Phil.

