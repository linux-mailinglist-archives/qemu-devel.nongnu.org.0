Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F496A9525
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:26:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2bv-0006lF-1r; Fri, 03 Mar 2023 05:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2bo-0006l1-Ho
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:25:52 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2bm-0004mp-O2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:25:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bx12so1724277wrb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677839149;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SM6B82OSDN89Y3zVOahxekl6UHarbJyHBW+OF2tS6mU=;
 b=xDdfya8kPPa0Pl0HtlMnwxAy8e3Jz/c6IrHkS0K2PsljYgAksH0tnbBpJuKWDg4rYQ
 yEL8x09Mi8k9wGsvaNH0o6g8pMmrVkhziEWdgXL+IL3rGWpFytnyVAsOEGpBjnSSuQq+
 bHJPkGQuUd4U7mKyHa1dus4gGwAFqkWZBG+a/sMhNj+IG8FFdHkP8WdNJul6BXZgSvDm
 ujZ/SyTIju79Fqui+Xf7EeqA+LUEMUeiM42K3JtjTsNmKUI7AgSJyJwitSJQN+D9TFpy
 T+wd6n3/yxBqavb/cjzIoT9OzMTMT3h9NmiHJ2r0eGn3ol0BSoEHcc0MpftCk7VoQhPw
 xw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839149;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SM6B82OSDN89Y3zVOahxekl6UHarbJyHBW+OF2tS6mU=;
 b=yxlBHHg8OQNn5S21BYtapBLJl3h6SwFqSAuqDzllZ54DDXGMNWJobjD62oRef0QC5D
 fz5i2CJ+slSQK7UH/wb2rTRxQs1OfM3rTeDECHI20hhyGjrRomZ1dOODaYWp6vjQxcK6
 q+VwWfc2fD9B/OXv771weT8V9/UoaxOtpfSqPthdQ6czHVplKMjb5T9FtUsXjSWZIH0u
 T07nXgKjvK6R/gZ1HgPir4dz6CdCte+9kZmmlWizRbWHctzx9wDrx0CRSNNJrD3EjIXf
 qoYQThjEEoq7Qpz6tiUSLquG31K+PLlKp9snlQvO1+mgyN9ShmJux79DFhBSH01HGTwi
 xjwA==
X-Gm-Message-State: AO0yUKX74VVJHMsBpdS1LeJOEz1fbuYFpOxpA6/ahR5+XdI0fMMRPBMO
 AM/8x8IAG3SChzQBro3/bMoZSw==
X-Google-Smtp-Source: AK7set8WtKDVG0daRnR92gz0xZzH++6u7ChWg6tAXM9ujO3eCsBKJvI+KYHMED2Ti4LfPc+GqaB7Fg==
X-Received: by 2002:a5d:5222:0:b0:2c9:850c:6b15 with SMTP id
 i2-20020a5d5222000000b002c9850c6b15mr931369wra.41.1677839149181; 
 Fri, 03 Mar 2023 02:25:49 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 g18-20020a5d4892000000b002c70e60abd4sm1823531wrq.2.2023.03.03.02.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:25:48 -0800 (PST)
Message-ID: <e85a5616-514f-0623-d8ec-eec758ac160b@linaro.org>
Date: Fri, 3 Mar 2023 11:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Haitao Shan <hshan@google.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303023013-mutt-send-email-mst@kernel.org>
 <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
In-Reply-To: <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 11:19, Philippe Mathieu-Daudé wrote:
> On 3/3/23 08:33, Michael S. Tsirkin wrote:
>> On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
>>> Add the configure support for the Android Emulator hypervisor driver
>>> accelerator. The Android Emulator hypervisor driver is a Windows
>>> driver made by porting the KVM from kernel 4.9-rc7.
>>>
>>> Signed-off-by: Haitao Shan <hshan@google.com>
>>
>> Replying on patch 1 but it applies to the whole patchset.
> 
> Indeed this series lacks a cover letter, 
I just noticed the cover letter in my inbox, oddly delivered after
the patches:
https://lore.kernel.org/qemu-devel/CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=9YWDFcvqbcHMr0S_5kVw@mail.gmail.com/
(note the patches are disconnected from the cover, and the cover lacks
the diffstat).

> which would show
> this huge diffstat:
> 
>   MAINTAINERS                       |   12 +
>   accel/Kconfig                     |    3 +
>   docs/about/build-platforms.rst    |    2 +-
>   hw/i386/aehd/apic.c               |  204 +++++++++++++++
>   hw/i386/aehd/i8259.c              |  165 ++++++++++++
>   hw/i386/aehd/ioapic.c             |  164 ++++++++++++
>   hw/i386/aehd/meson.build          |    6 +
>   hw/i386/meson.build               |    1 +
>   hw/i386/pc.c                      |    5 +
>   hw/i386/x86.c                     |    5 +-
>   include/exec/poison.h             |    1 +
>   include/exec/ram_addr.h           |    2 -
>   include/hw/core/cpu.h             |    7 +
>   include/hw/intc/i8259.h           |    1 +
>   include/hw/intc/ioapic.h          |    1 +
>   include/sysemu/aehd-interface.h   |  878 
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   include/sysemu/aehd.h             |  168 ++++++++++++
>   include/sysemu/hw_accel.h         |    1 +
>   meson.build                       |   16 ++
>   meson_options.txt                 |    2 +
>   qemu-options.hx                   |   20 +-
>   scripts/meson-buildoptions.sh     |    2 +
>   target/i386/aehd/aehd-accel-ops.c |  119 +++++++++
>   target/i386/aehd/aehd-accel-ops.h |   22 ++
>   target/i386/aehd/aehd-all.c       | 1349 
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   target/i386/aehd/aehd-cpu.c       |  150 +++++++++++
>   target/i386/aehd/aehd-cpu.h       |   41 +++
>   target/i386/aehd/aehd-stub.c      |   22 ++
>   target/i386/aehd/aehd.c           | 2003 
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   target/i386/aehd/aehd_i386.h      |   26 ++
>   target/i386/aehd/aehd_int.h       |   50 ++++
>   target/i386/aehd/meson.build      |    8 +
>   target/i386/cpu-sysemu.c          |    3 +
>   target/i386/cpu.c                 |   12 +-
>   target/i386/cpu.h                 |    5 +-
>   target/i386/helper.c              |    3 +
>   target/i386/meson.build           |    2 +
>   37 files changed, 5465 insertions(+), 16 deletions(-)
> 
>> There's obvious duplication with kvm here - probably not surprising.
>>
>> I'd be interested to hear from KVM people to know whether
>> there's interest in unifying code, or they would rather
>> not bother supporting this platform and it's better off
>> being kept separate.
> 
> I believe the hw part can be unified, reducing the maintenance
> cost. (I gave Haitao few hints replying to the relevant patches).
> 
> Regards,
> 
> Phil.


