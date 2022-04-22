Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684150B7C2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:57:58 +0200 (CEST)
Received: from localhost ([::1]:34218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsrE-0006sh-MB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1nhsBj-0006rh-MY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:15:04 -0400
Received: from mscreen.etri.re.kr ([129.254.9.16]:60007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckim@etri.re.kr>) id 1nhsBf-0000ZU-S4
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:15:02 -0400
Received: from unknown (HELO send001-relay.gov-dooray.com) (211.180.235.152)
 by 129.254.9.16 with ESMTP; 22 Apr 2022 21:14:52 +0900
X-Original-SENDERIP: 211.180.235.152
X-Original-MAILFROM: ckim@etri.re.kr
X-Original-RCPTTO: qemu-devel@nongnu.org
Received: from [10.162.225.106] (HELO smtp001-imp.gov-dooray.com)
 ([10.162.225.106]) by send001-relay.gov-dooray.com with SMTP id
 d6128a0562629c3c; Fri, 22 Apr 2022 21:14:52 +0900
DKIM-Signature: a=rsa-sha256;
 b=QlfyLec6SynupqGgazpACFtwLzsJb+VEd1stj0QYNH5cDpi67EtvrGhuqkOHG817Nb3IJt/ZWs
 vbj1+dRLg489txG1WijVAbr06I1aiXOxXdkT7Oa2lxSyAiczTM/cfsA8WoJJ+fAgYSuLzyJYAXKk
 VpRImr2F4qIUYhIGidh1DbF3dfGZwfzNaq6ctCASgUrq42Q4fKBSwg9JhXkucLJTGIlT5qP1EO/G
 HDw4bhxPnpnWFmIF3e41DqWjLVV/zzI8B7JkKt0at+cdOoPKUf92//4DOdp1qjkT+u/6bynt/TBK
 KYoLCLe2AzbMxaAhgbXyNXtiwIYdwpleDowMr6sw==;
 c=relaxed/relaxed; s=selector; d=dooray.com; v=1;
 bh=z3wIQGB7aZJvUTAx9WZ5IbhlZ8jf2fkvEWTEI4kN0dc=;
 h=From:To:Subject:Message-ID;
Received: from [129.254.132.39] (HELO CHANKIMPC) ([129.254.132.39]) by
 smtp001-imp.gov-dooray.com with SMTP id 548ea89862629c3b; Fri, 22 Apr 2022
 21:14:52 +0900
From: "Chan Kim" <ckim@etri.re.kr>
To: "'qemu-devel'" <qemu-devel@nongnu.org>, <kernelnewbies@kernelnewbies.org>
Subject: Backtrace stopped: previous frame identical to this frame (corrupt
 stack?) , even with fresh qemu and linux build
Date: Fri, 22 Apr 2022 21:14:48 +0900
Message-ID: <025301d85642$901587b0$b0409710$@etri.re.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdhWQkwF5FF64+vcSS2WW7hwjDSPEw==
Content-Language: ko
Received-SPF: pass client-ip=129.254.9.16; envelope-from=ckim@etri.re.kr;
 helo=mscreen.etri.re.kr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello all,

Really strange thing happening here.. I can't see the full stack trace with
'bt' command in gdb.
So I tried with fresh linux-5.10.122 source and qemu-6.2.0 source and it's
happening too!
(it's happening when I do combinations with linux 5.10.0 and qemu-5.1.0. But
it's not happening with linux-5.4.21)

I would be grateful if somebody could check if this happens to other people
or just me.

1. download linux-5.1.122 tarball from https://www.kernel.org/ 
2. uncompress it and set env variable ARCH=arm64,
CROSS_COMPILE=aarch64-none-elf- , do "make defconfig" and "make -j`nproc`
Image"
3. download qemu-6.2.0 from https://www.qemu.org/
4. uncompress it and do "mkdir build" "cd build" "../configure
--target-list=aarch64-softmmu --enable-debug"
5. run qemu and wait for debugger to attach.
qemu-6.2.0/build/aarch64-softmmu/qemu-system-aarch64 -machine
virt,gic-version=max,secure=off,virtualization=true -cpu max -kernel
linux-5.10.112/arch/arm64/boot/Image -m 2G -nographic -netdev
user,id=vnet,hostfwd=:127.0.0.1:0-:22,tftp=/srv/tftp -device
virtio-net-pci,netdev=vnet -machine iommu=smmuv3 --append "root=/dev/ram
init=/init nokaslr earlycon ip=dhcp hugepages=16" -s -S
6. run debugger, do "aarch64-none-elf-gdb linux-6.10.112/vmlinux -x
gdb_script"
(gdb_script content : 
target remote :1234
layout src
b start_kernel
b __driver_attach
)

Now, in gdb, when you press 'c' twice, it'll stop at the first
__driver_attach. (first one stops at start_kernel).
When you are at __attach_driver, type 'bt'. See if you see the full function
stack trace.
This is what I see. 
(gdb) bt
#0  __driver_attach (dev=0xffff000002582810, data=0xffff800011dc2358
<dummy_regulator_driver+40>)
    at drivers/base/dd.c:1060
#1  0xffff8000107a3ed0 in bus_for_each_dev (bus=<optimized out>,
start=<optimized out>,
    data=0xffff800011dc2358 <dummy_regulator_driver+40>,
fn=0xffff8000107a6f60 <__driver_attach>)
    at drivers/base/bus.c:305
#2  0xd6d78000107a5c58 in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

I used to see more thatn 20 stacks trace but strangely I see only two. 
I can still see many stacks for linux-5.4.21 that I was working with in the
past. 
Could anyone check if this happens to anyone?
I think if I add BLK_DEV_RAM and set initramfs.cpio.gz in the linux build,
the kernel will boot ok to the shell prompt.
Only the gdb can't show the stack levels.

My OS : ubuntu-20.04  5.13.0-35-generic

$ aarch64-none-elf-gdb --version
GNU gdb (GNU Toolchain for the A-profile Architecture 10.2-2020.11
(arm-10.16)) 10.1.90.20201028-git
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Thank you.
Chan Kim





