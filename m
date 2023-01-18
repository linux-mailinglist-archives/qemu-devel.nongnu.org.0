Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6D671801
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4xb-0003IQ-50; Wed, 18 Jan 2023 04:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4xZ-0003I9-A5
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:42:21 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4xX-0003gU-HD
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:42:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so33295094wrv.7
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JImrhxsrzR3dK1jEGLedPHwm6rOn7FKJIb4ih98pxY4=;
 b=xWSNOt8pjoYSn2ZUq9fYbEvZcIDgbGx8KOx/Op5q62iYaLfRKSQIYA65ggMsj5T+jG
 Yab71k5UnKx43ts4Dkm6DlPhfZ5+BNYyzwVBTKoUfK9MEblxqMjuaCuCc9TXEGrr2NkX
 kGZb+xkRhHfTPJ2ACG/e3FVcNKguvD34v4ogxObN7v4wxixyc5ozIpyqogKZQpwHdEK/
 vzMmGxfYe03i5IodBNAjATsggtq/rwDXKzKJa3m4SX+Lqyqa+O7C24c23cUHrGJmuN9U
 i1bk7RdCnmJezV+d1C5u2VUT8wkM5/D3MX7tlb2WDx69gkjHbn2YIUHfm4pby5KLQMHA
 564g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JImrhxsrzR3dK1jEGLedPHwm6rOn7FKJIb4ih98pxY4=;
 b=YJmS1yU+K/TdKdfQzpEJ61V5R7BWu0xFio60IA94E5eHJoIw3lSR/9J9bG+MKxIfkf
 NhxgkiR8ntxTlyv+IZcGBB8DGI8TYXb2qxb0a8E5EIA1e4oKTiDEM7qf6ofdGspF+8t1
 H62/nZ3d+QyWYyWHKChWbXy1LTkZp09SP8TxY9rMqQg8VxyisDaJabty1wBRfJF4UN9t
 EQgqVlLxX8woAp3britIkfW4NxtcZP3Fsq27Rakme51sAwCWsJfmZlyeDB4Bb7MmqD+d
 XNfl+7D0P1ZcLclwqofolC26siE/XsyP6zw/92GeFFC3Dn9kPAuStUBSkG03zfrHOOzO
 /ckA==
X-Gm-Message-State: AFqh2komUIhZg6CuLNGqu3j6VSsSLUMjANtXOfPJEsQdhx9yNbRywcFl
 8Gx7Dz+IiBDjG4HfvcXR6wGhdQMbSxhUJvrQ
X-Google-Smtp-Source: AMrXdXsCT+m+iZ26V/gfPPt2O9Lx74uDqEso1LbiS4JjRmnvO1UDhN1VC0TU8cIgiN2epNovCFy8Qg==
X-Received: by 2002:adf:f992:0:b0:2be:1f34:5078 with SMTP id
 f18-20020adff992000000b002be1f345078mr4746761wrr.56.1674034938005; 
 Wed, 18 Jan 2023 01:42:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r18-20020a5d4952000000b002bdda9856b5sm15304910wrs.50.2023.01.18.01.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:42:17 -0800 (PST)
Message-ID: <ef445ddc-c8a4-f949-ebc5-ce2f24457585@linaro.org>
Date: Wed, 18 Jan 2023 10:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: mips, nvme/pci boot regression (commit 145e2198d749)
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org
References: <Y8aU0fQRDm2hm+c9@cormorant.local>
 <aad40d69-c570-de15-8258-cde109842af9@linaro.org>
 <Y8eepLAgZg8H+sq2@cormorant.local>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8eepLAgZg8H+sq2@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 18/1/23 08:24, Klaus Jensen wrote:
> On Jan 17 15:25, Philippe Mathieu-Daudé wrote:
>> On 17/1/23 13:30, Klaus Jensen wrote:
>>>
>>> Commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
>>> PCI_HOST_BRIDGE MemoryRegionOps") broke my mips64 nvme boot test
>>> (little-endian host, mips64 and nvme boot device).
>>>
>>> The pci device doesn't show up and the kernel panics.
>>>
>>>     qemu-system-mips64 \
>>>       -nodefaults -nographic -snapshot -no-reboot \
>>>       -M "malta" -cpu "I6400" -m 512M \
>>>       -nic user,model=pcnet \
>>>       -drive file=images/rootfs.ext2,format=raw,if=none,id=d0 \
>>>       -device nvme,serial=default,drive=d0 \
>>>       -kernel images/vmlinux \
>>>       -append "root=/dev/nvme0n1 console=ttyS0,115200" \
>>>       -serial stdio
>>
>> How do I get this images/ folder, or how do you generate
>> the kernel / rootfs images?
> 
> It's a buildroot with the qemu_mips64r6_malta_defconfig. However, the
> kernel must be at least v6.2-rc3 and a potential fix for pin-based
> interrupts[1] (other fixes are being discussed) must be applied. On
> older kernels the device should show up, but it will be broken (issue on
> big-endian with shadow doorbells and occasional timeouts due to the
> kernel missing interrupts).
> 
> If you don't want to mess with that, I put the images on github[2] (the
> kernel is v6.2-rc4 + my potential nvme driver fix). Just gunzip
> rootfs.ext2.gz.
> 
>    [1]: https://lore.kernel.org/linux-nvme/Y8W+H6T9DOZ08SoF@cormorant.local/
>    [2]: https://github.com/birkelund/qemu-nvme-boot

Thanks Klauss, proposed fix posted:
https://lore.kernel.org/qemu-devel/20230118094023.49517-1-philmd@linaro.org/


