Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5C65E732
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:01:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDM6b-0005nl-IG; Thu, 05 Jan 2023 04:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDM6Y-0005mi-U7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:00:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDM6W-0007ab-PK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:00:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ay40so27538398wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LsXygiNQHKAq0z/B9aDeUiHiWu/xl4SLVIf56udDyRQ=;
 b=WCuNT6ESmDv6ND4gX3mjBj5emHzsRk9neFYxp5tmJgFsXyRFvEx/6VhdWXk6Vtnhea
 HfJdVqgkdYhI6dN9n/re7xSdCtZIVSayA3ObrFpkjj00qGH2nyPtZnprpAXZ+gBLLaC3
 4qRM1e6ju6uwdMLMIS4zuXlS6Xd9YvqMjZTSeLwlI7Xi65wOKO3MZVJgJlb9QURxrwxw
 +QTfgRoAEnFM1FS4vKFqzxtjabHBFZRjhgZ2pZtjMjtMWPhefk3e/xpN9YQQpUjiT+G0
 7v0bINGKw8Rc3NwoOX7enAXPzUlT2HeUlEvQ4e/QSzW++VgMFTmPjZBVevaDHKsWyapG
 tZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LsXygiNQHKAq0z/B9aDeUiHiWu/xl4SLVIf56udDyRQ=;
 b=yyNr83pEnmwJ/XeBiPOvmPD4hGOVaztge7taiBv1l0iN4FLW22G5AhxRdZxxJnUe6k
 9Sg5QH9uLr/ttfheOq1AYvR8RVi/lNby7OMyI4voH7sG+tQ87rC6SXyyofKzEVFJTQBh
 UPW5aH7Vz00UlKex3/rOvRb2Z6xigxHlDGlOxB43Fq3U5LJJ68gXQqTQLsxCfGnB7fRs
 bLI17yx755uoMhyyzei21DwgtKWUlywsK4rEIz/L1ybRQR3o0oYStmy52NockVnRt18H
 IPBjvmsKlFmM9Gwa+Qlgy9z+Xq86JQRrEBMpWS4TPRufSNAmvkWO9owwqNIKg7YYgfca
 mhOQ==
X-Gm-Message-State: AFqh2kpMpaOk26+iMgIBdA2NOewDsswtopH1LxRBNFcP1wAWeyynjHf6
 SUItw6mnRGSN7+aPg1JRA2R4wg==
X-Google-Smtp-Source: AMrXdXtAXjwONJRepFNvzGQmQjzbHvLAMaUCoav2QqFJKeGTK72ADzdx7R5jYkwLIzppbedJHO7obw==
X-Received: by 2002:a05:600c:b90:b0:3d9:76fd:ee06 with SMTP id
 fl16-20020a05600c0b9000b003d976fdee06mr26680038wmb.32.1672909202842; 
 Thu, 05 Jan 2023 01:00:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bh21-20020a05600c3d1500b003b492753826sm1627769wmb.43.2023.01.05.01.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 01:00:02 -0800 (PST)
Message-ID: <2f32e669-2263-01c5-28d4-5721b3144b32@linaro.org>
Date: Thu, 5 Jan 2023 10:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to the
 legacy reg block
Content-Language: en-US
To: Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, Ani Sinha <ani@anisinha.ca>,
 Ard Biesheuvel <ardb@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-stable@nongnu.org
References: <20230104090138.214862-1-lersek@redhat.com>
 <20230104072457-mutt-send-email-mst@kernel.org>
 <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7122894b-ccbf-9d30-ee54-c23c25c0f82b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 5/1/23 08:13, Laszlo Ersek wrote:
> On 1/4/23 13:35, Michael S. Tsirkin wrote:
>> On Wed, Jan 04, 2023 at 10:01:38AM +0100, Laszlo Ersek wrote:
[...]

>>> To make things *even more* complicated, the breakage was (and remains, as
>>> of today) visible with TCG acceleration only.  Commit 5d971f9e6725 makes
>>> no difference with KVM acceleration -- the DWORD accesses still work,
>>> despite "valid.max_access_size = 1".
>>
>> BTW do you happen to know why that's the case for KVM? Because if kvm
>> ignores valid.max_access_size generally then commit 5d971f9e6725 is
>> incomplete, and we probably have some related kvm-only bugs.
> 
> It remains a mystery for me why KVM accel does not enforce
> "valid.max_access_size".
> 
> In the thread I started earlier (which led to this patch), at
> 
>    "IO port write width clamping differs between TCG and KVM"
>    https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg00199.html

[...]

> So, I think the bug is somehow "distributed" between
> flatview_write_continue(), flatview_access_allowed(), and
> memory_access_size(). flatview_access_allowed() does not care about "l"
> at all, when it should (maybe?) compare it against
> "mr->ops->valid.max_access_size". In turn, memory_access_size()
> *silently* reduces the access width, based on
> "->ops->valid.max_access_size".
> 
> And all this this *precedes* the call to memory_region_access_valid(),
> which is only called from within memory_region_dispatch_write(), which
> already gets the reduced width only.
> 
> Now, flatview_access_allowed() is from commit 3ab6fdc91b72
> ("softmmu/physmem: Introduce MemTxAttrs::memory field and
> MEMTX_ACCESS_ERROR", 2022-03-21), and the fact it does not check "len"
> seems intentional -- it only takes "len" for logging.
> 
> Hmm. After digging a lot more, I find the issue may have been introduced
> over three commits:
> 
> - 82f2563fc815 ("exec: introduce memory_access_size", 2013-05-29), which
>    (IIUC) was the first step towards automatically reducing the address
>    width, but at first only based on alignment,
> 
> - 23326164ae6f ("exec: Support 64-bit operations in address_space_rw",
>    2013-07-14), which extended the splitting based on
>    "MemoryRegionOps.impl",
> 
> - e1622f4b1539 ("exec: fix incorrect assumptions in memory_access_size",
>    2013-07-18), which flipped the splitting basis to
>    "MemoryRegionOps.valid".
> 
> To me, 23326164ae6f seems *vaguely* correct ("vague" is not criticism
> for the commit, it's criticism for my understanding :)); after all we're
> on our way towards the device model, and the device model exposes via
> "MemoryRegionOps.impl" what it can handle. Plus, commit 5d971f9e6725
> does direct us towards "MemoryRegionOps.impl"!
> 
> But clearly there must have been something wrong with 23326164ae6f,
> according to e1622f4b1539...

Maybe the long-standing unaligned access problem? Could be fixed by:
https://lore.kernel.org/qemu-devel/20210619172626.875885-15-richard.henderson@linaro.org/

> The latter is what introduced the current "silent splitting of access
> based on 'valid'". The message of commit e1622f4b1539 says, almost like
> an afterthought:
> 
>>      access_size_max can be mr->ops->valid.max_access_size because memory.c
>>      can and will still break accesses bigger than
>>      mr->ops->impl.max_access_size.
> 
> I think this argument may have been wrong: if "impl.max_access_size" is
> large (such as: unset), but "valid.max_access_size" is small, that just
> means:
> 
>    the implementation is flexible and can deal with any access widths (so
>    "memory.c" *need not* break up accesses for the device model's sake),
>    but the device should restrict the *guest* to small accesses. So if
>    the guest tries something larger, we shouldn't silently accommodate
>    that.

Indeed. '.impl' is a software thing for the device modeller, ideally one
will chose a value that allows the simplest implementation. I.e. if a
device only allows 8-bit access, use 8-bit registers aligned on a 64-bit
boundary, the model might use:

   .impl.min_access_size = 8,
   .impl.max_access_size = 1,

Also we need to keep in mind that even if most MemoryRegionOps structs
are 'static const', such structure can be dynamically created. I.e.:
https://lore.kernel.org/qemu-devel/20200817161853.593247-5-f4bug@amsat.org/

> I have zero idea how to fix this, but I feel that the quoted argument
> from commit e1622f4b1539 is the reason why KVM accel is so lenient that
> it sort of "de-fangs" commit 5d971f9e6725.
> 
> Laszlo
> 


