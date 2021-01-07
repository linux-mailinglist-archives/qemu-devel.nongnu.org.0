Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704862EE82B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:14:09 +0100 (CET)
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdXk-0004IZ-1k
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdWw-0003lm-Ai; Thu, 07 Jan 2021 17:13:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdWu-0001Aw-LV; Thu, 07 Jan 2021 17:13:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v14so6348299wml.1;
 Thu, 07 Jan 2021 14:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K4T7AbWqL1Uh5WkojPp1mJJYra3fPcG7SypekqMMxIQ=;
 b=p85uEYlwKHU8XuOWaD03jJ8xPDKjnwzvNepcBYfgUS4JvuugxIywURiffkxNHWZss7
 /GcQQYbKNdNCS/2ThXZJn35OzWOP44OWxNiwUBcwePK0a+xvVKhgPDC9Nb7bo/z7/Cxw
 VdUIKbAlEs4MAViwFAbrR4oWkQOZdc/DHA5n7K8V9ZW/aFHzAq/aN8SkNXPEtVWT9b5N
 Ja9myKy+ml715Kpg26s7Z8L88u/UJCAnhuogZbrqrzwC9dwFlqnQr3GgekHMuXNClxmK
 h0CncLBVagwakw/6qCDd/h271SHWJfnibVSBVVV352216fkpoGuC8npDA9GJRt6I2bCj
 sVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K4T7AbWqL1Uh5WkojPp1mJJYra3fPcG7SypekqMMxIQ=;
 b=LoM+E5t5hKx7WfIDyqeOjAL49nJnmQy4BZ2GGv3zDr7+9NATH9IBMHSAvM/I2K6G3u
 vljy7lFhyrwEtcn2YGZ9bbYb6Z8Q6z+Ugx+VFeo37TBivqfKGDT5ieEH9+1QIo/Ibrnb
 6NIsreZAIeaHU1OqRxFZo3A3ZV/2ZoZc4mKK/w0QFEIpS4jgvsd4P65zdKwW1GrcklZM
 W3A7rKSSAsPcLCHvXjXqNKWCn9auGOUiiHnPhQt0LutPFkHXgV7PXvAMWUlFkmm8KHje
 v5LqJbHSRvapscvw6gDltL7oz35XY9ooeZyOJFhOeytVwKXoABitppT824QbqivcPswf
 C0BQ==
X-Gm-Message-State: AOAM533cRJdMl35OOHfZxnhx14GqJ5WrKcheuayUAfbX1r6RA2ouBEpc
 YOXQy45+n5VRDkR0kEvb5v0vFSauCV8=
X-Google-Smtp-Source: ABdhPJweeNe0uGS3TT0ARXxR6rp/iBmc7v+GQzAdM5AQtHBp1TozcSEkWca5iJNpleeG38j8BLS3YA==
X-Received: by 2002:a7b:c3d1:: with SMTP id t17mr473366wmj.11.1610057594655;
 Thu, 07 Jan 2021 14:13:14 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id a12sm10997623wrh.71.2021.01.07.14.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 14:13:13 -0800 (PST)
Subject: Re: [Bug 1910586] [NEW] SD card size constraint conceptually wrong
To: Bug 1910586 <1910586@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161004745358.28900.17773103786496139692.malonedeb@chaenomeles.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f4c6b358-ce79-73d8-8a92-eb474ab1a5ee@amsat.org>
Date: Thu, 7 Jan 2021 23:13:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161004745358.28900.17773103786496139692.malonedeb@chaenomeles.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 8:24 PM, - wrote:
> Public bug reported:
> 
> The patch discussed here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720833.html
> introduces an artificial size constraint for SD cards
> that has no relation to reality.
> 
> I'm trying to use an _actual_ **physical** SD card,
> and qemu tells me its size is "invalid".
> 
> Something here appears to be conceptually wrong.
> 
> --------------------------------------------------
> # fdisk -l /dev/sdg
> Disk /dev/sdg: 14.84 GiB, 15931539456 bytes, 31116288 sectors
> Disk model: USB  SD Reader  
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: dos
> Disk identifier: 0x7a0c8bb0
> 
> Device     Boot  Start      End  Sectors  Size Id Type
> /dev/sdg1         2048   524287   522240  255M  c W95 FAT32 (LBA)
> /dev/sdg2       524288 31116287 30592000 14.6G 83 Linux
> # qemu-system-aarch64 -M raspi3 -m 1G -kernel vmlinuz-5.4.79-v8 -dtb bcm2837-rpi-3-b-plus.dtb -append console=ttyAMA0\ root=/dev/mmcblk0p2\ rw -nographic -serial mon:stdio -drive file=/dev/sdg,format=raw
> qemu-system-aarch64: Invalid SD card size: 14.8 GiB
> SD card size has to be a power of 2, e.g. 16 GiB.

Your physical card likely is 16GiB. The firmware running
on it is free to reserve some amount to replace broken
blocks. In your case ~7%.

We choose to restrict the model to the physical layer to
simplify the design and avoid to deal with security issues.

Patches to improve the model by better matching the real
world are always welcomed!

> You can resize disk images with 'qemu-img resize <imagefile> <new-size>'
> (note that this will lose data if you make the image smaller than it currently is).

Indeed, we can remove this warning for block devices.

> --------------------------------------------------
> 
> The same invocation with a dump of the actual image
> resized to match qemu's odd expectations works fine.
> 
> 
> This is on QEMU 5.2.0, as evidenced by the following:
> --------------------------------------------------
> # qemu-system-aarch64 -version
> QEMU emulator version 5.2.0
> Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
> --------------------------------------------------
> 
> Is there a simple workaround that disables this rather
> arbitrary constraint?

No, but you can send a patch :)

Regards,

Phil.

