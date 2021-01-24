Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A41301B4C
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 11:59:59 +0100 (CET)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3d7e-0005P5-04
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 05:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l3d6M-0004fF-2Q
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 05:58:38 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:40347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l3d6K-0007dB-8N
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 05:58:37 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mcpz0-1ldVoT0nRq-00Zyda; Sun, 24 Jan 2021 11:58:23 +0100
Subject: Re: [PATCH v2 7/7] m68k: add Virtual M68k Machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-8-laurent@vivier.eu>
 <dda5766b-8af9-df30-abaf-c4c91c0d5543@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f8856f85-cea8-dc07-a88c-a7f03fc96356@vivier.eu>
Date: Sun, 24 Jan 2021 11:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dda5766b-8af9-df30-abaf-c4c91c0d5543@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CZ4AdV/IrmAi9zEF5Rf3mvy/92HxPDo9x8Qhw1rSp6Y3JxnLE5a
 eWLZTCs8AStYYNCSzrA5nyG1OZAmNZ73RoP+Ovzjkv52l2cRs9TG+CBN3Xcw2THPwIDFyA4
 mmuFKMXVK0OYziGF+R8y6y+tJH6p663zbsT3TUCtgFGJmg7xJxNYun+uU56Xjc3DcatemC/
 B4KNmPggSrH0B7caDzXfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:elwpy/j153I=:M+qp2DT/6YFGhDEuitn4Zj
 X8hBKTgqx8kl/FnKnxVPvYgXuXmadc1iw03lpFtIdJYUzKb0xLrF/iVHfy68CZ0Z/J0kvMoiF
 Zs3CE6+IxZ8HNTZOhobO3OK1GJT86wjcPRG71VA08KiQ02AEzc4OcVztsSFNzj5BmJlWvdErZ
 udl3QCGjC1AcKGWvCxhDOBKxf4F83chktDqQcZ2QJ/T0sv56QoaVfxflamQ0GKUlx1qm/ei/n
 3A2ZhPSxb+rhUfl9UcDs6ilcuLW+OAbH3dCgosC6jUpYro92312I3rzAK4HCup5yvTG4/x9T6
 Zc3DcumOKxdXYeWdzbQ9Mixfgg6G3jvqiGfRTcZw5lm7wKj5u/w2HBFb1FFeL6RMQqLDPP+66
 ZggxLE0RRN1rLvZ3AFkpzp2BvFlsQK5Eb3AYmSxGrK76NISrWDn+i3m7ZRoxdXMML5qgu68Nz
 qBKFuoi5FA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/01/2021 à 01:18, Philippe Mathieu-Daudé a écrit :
> On 12/20/20 12:26 PM, Laurent Vivier wrote:
>> The machine is based on Goldfish interfaces defined by Google
>> for Android simulator. It uses Goldfish-rtc (timer and RTC),
>> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
>>
>> The machine is created with 128 virtio-mmio bus, and they can
>> be used to use serial console, GPU, disk, NIC, HID, ...
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  default-configs/devices/m68k-softmmu.mak      |   1 +
>>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>>  hw/m68k/virt.c                                | 312 ++++++++++++++++++
>>  MAINTAINERS                                   |   9 +
>>  hw/m68k/Kconfig                               |  10 +
>>  hw/m68k/meson.build                           |   1 +
>>  6 files changed, 351 insertions(+)
>>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>>  create mode 100644 hw/m68k/virt.c
> ...
> 
>> diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
>> new file mode 100644
>> index 000000000000..81be1e092497
>> --- /dev/null
>> +++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> +** asm/bootinfo-virt.h -- Virtual-m68k-specific boot information definitions
>> +*/
>> +
>> +#ifndef _UAPI_ASM_M68K_BOOTINFO_VIRT_H
>> +#define _UAPI_ASM_M68K_BOOTINFO_VIRT_H
>> +
>> +#define BI_VIRT_QEMU_VERSION	0x8000
>> +#define BI_VIRT_GF_PIC_BASE	0x8001
>> +#define BI_VIRT_GF_RTC_BASE	0x8002
>> +#define BI_VIRT_GF_TTY_BASE	0x8003
>> +#define BI_VIRT_VIRTIO_BASE	0x8004
>> +#define BI_VIRT_CTRL_BASE	0x8005
>> +
>> +#define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
>> +
>> +#endif /* _UAPI_ASM_M68K_BOOTINFO_MAC_H */
> 
> Doesn't this belong to patch #1?
> 

No, because in PATCH #1 the m68k-virt machine doesn't exist.

PATCH #1 can be merged outside of this series, it's a generic patch.

Thanks,
Laurent

