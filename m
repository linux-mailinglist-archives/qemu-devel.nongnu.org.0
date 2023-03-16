Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898D6BC714
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pci2v-0007pF-8X; Thu, 16 Mar 2023 03:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pci2t-0007oh-A5
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:29:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pci2r-0003e2-If
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:29:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id r18so611484wrx.1
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678951743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mKaw5EhrwAJEFj3VLODR4NkkmHZYvsb9mFSG73gOPtk=;
 b=SJEPZDygSUDXRevz97q9uGKyorDoKJjjgX0wCWhPI1tIwfCSM3pEmVphfq4FFJazaq
 /5xgEu4fgyewKtMGKmEuyJaUMtMtjai5EA8mQ9Z1mVUEBnWgolJTcPTQyfW3DVm3fW9v
 Cvg34o/NQ7sfjmF4pzttvCP7wo9pjP4jCCnO7RGuH4zoXOHhfdQeX63LByYVc6XR+/3a
 hyi64Hgua9igeiSElUhgOK8ye5pEiwhqxRJuGomr1c832AK8d2YgXbbCVHhIUg1CJkQI
 Io6aB+jBUcLMrYtw9x4CEEg0BAz4DxWpiS/WyvawthTq9zwHTOE2qHWti1gdgQuPZnFL
 GbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678951743;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mKaw5EhrwAJEFj3VLODR4NkkmHZYvsb9mFSG73gOPtk=;
 b=0GJ2nEiq07ZtPAB8SPC7ucSf/1widRsL8eNPsxeu1WtA7Q+1CVa5sd0V7b0Um3bQIz
 1VeSJPeHtCzYbkB0fYmKhWpyRdaWVqQCjytlNDayVZrNBQmIe7xCpW8JeKMo90AaL3TP
 hiUwh5vD55EgwyA8+uNlyZQG6o7BrbsmRQqp8td7XR0P/wz0ZQgOHrP7E9xaI2HIRuvp
 CgKglw+I/2O+8q35AwSeqBuHbqcfhphy8ZQGme8gkaOdtto+BdYQwwJPfmuWLVKcXPBB
 +BM0ZxjsgYbaZImUc5KGW9icUDNcsfV8uUJr2HNAww8dc9pTNXGIQP6H0MdR+BOB8IOc
 wSaA==
X-Gm-Message-State: AO0yUKU6YlLFD0H+5w4QXuGbZo/kTA9OT7M66M0wgXYCqWvLKk7EMMNn
 jZZJnowKWQNWJnHh1m5e3e3nyg==
X-Google-Smtp-Source: AK7set9Mp6e2jpr1QIxG+1YV+QWy6Te/GoVmgQIeuIbj2RWdVB1UEeBlzl6Sta2U/ok7bG28/BEPkQ==
X-Received: by 2002:a5d:6ace:0:b0:2c5:594b:10d5 with SMTP id
 u14-20020a5d6ace000000b002c5594b10d5mr4148804wrw.1.1678951743598; 
 Thu, 16 Mar 2023 00:29:03 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k18-20020a056000005200b002c71dd1109fsm6588749wrx.47.2023.03.16.00.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:29:03 -0700 (PDT)
Message-ID: <35022ff8-bf4b-1f52-73f9-db25c776cec1@linaro.org>
Date: Thu, 16 Mar 2023 08:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: dropping 32-bit host support
Content-Language: en-US
To: Liviu Ionescu <ilg@livius.net>,
 Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <3DD8295F-4BE0-4262-8C68-4A85A56D63C7@livius.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3DD8295F-4BE0-4262-8C68-4A85A56D63C7@livius.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi Liviu,

On 16/3/23 07:19, Liviu Ionescu wrote:
> 
> 
>> On 16 Mar 2023, at 02:57, Andrew Randrianasulu <randrianasulu@gmail.com> wrote:
>>
>> Looking at https://wiki.qemu.org/ChangeLog/8.0
>>
>> ===
>> System emulation on 32-bit x86 and ARM hosts has been deprecated. The QEMU project no longer considers 32-bit x86 and ARM support for system emulation to be an effective use of its limited resources, and thus intends to discontinue.
>>
>>   ==
>>
>> well, I guess arguing from memory-consuption point on 32 bit x86 hosts (like my machine where I run 32 bit userspace on 64 bit kernel) is not going anywhere, but what about 32bit userspace on Android tablets, either via Limbo emulator or qemu itself in Termux?
> 
> or the countless 32-bit Raspberry Pi?
> 
> my xPack binary tools, which include qemu arm & qemu riscv, are also available for arm 32-bit, and the analytics show about the same number of downloads for 32-bit as for 64-bit.
> 
> given the current chip shortages, I estimate that the 32-bit Arm binaries will still be useful for a few more years.

IIUC xPack uses npm -- so work on any environment where npm works --,
and fetch/install existing toolchains. Looking at ARM, all offered
toolchains are 64-bit host [1] and the deprecated [2]. Toolchains for
32-bit hosts are still available but also listed as "deprecated" [3].

[1] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
[2] https://developer.arm.com/downloads/-/gnu-a
[3] https://developer.arm.com/downloads/-/gnu-rm

If QEMU is useful to you for testing installing xPack on a 32-bit
emulated guest, I strongly recommend you to do that on a 64-bit host
rather than a limited performance 32-bit Raspberry Pi 2, it is a much
more pleasant "user experience". IMHO Raspberry Pi 2 was designed for
embedded setup and prototyping with other electronic devices, not
really as a compute intensive build CPU.

>> At least I hope it will be not *actively* (intentionally) broken, just ...unsupported (so users who know how to run git revert still will get their build for some more time).
> 
> I concur, please do not intentionally break support for arm 32-bit, this will make a lot of unhappy users, who currently have no choice to upgrade.
> 
> 
> thank you,
> 
> Liviu

Regards,

Phil.


