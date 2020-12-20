Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14512DF6AD
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 20:46:59 +0100 (CET)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr4fS-0005fh-BF
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 14:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lego12239@yandex.ru>)
 id 1kr4db-0005AC-HP
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 14:45:03 -0500
Received: from forward103j.mail.yandex.net ([5.45.198.246]:38110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lego12239@yandex.ru>)
 id 1kr4dY-0005QH-Pw
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 14:45:02 -0500
Received: from myt6-f96510cd1fe5.qloud-c.yandex.net
 (myt6-f96510cd1fe5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4e12:0:640:f965:10cd])
 by forward103j.mail.yandex.net (Yandex) with ESMTP id 5CCAE6740D18
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 22:44:55 +0300 (MSK)
Received: from myt6-efff10c3476a.qloud-c.yandex.net
 (myt6-efff10c3476a.qloud-c.yandex.net [2a02:6b8:c12:13a3:0:640:efff:10c3])
 by myt6-f96510cd1fe5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 nt2NvTMuwY-itDqHm24; Sun, 20 Dec 2020 22:44:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1608493495; bh=ZsP9j3R0LJlI7kLpgbTa+i7vBsMaVpBTnI9Gex1Z3aQ=;
 h=Reply-To:Subject:To:From:Date:Message-ID;
 b=ToK6Y6fQFNhKPNgxpPVfUcGPyCjI3KJ2B/aRFIdFBHYVZNdB/MPYD4mye6Jw2uXpR
 RG79SqYsrqhFAscupnVEDINwkrYrFgYdF9tJ/5aUhY6j5PNrEwVpsGotYzOd9mLD7R
 oTyISY5dIohBhZDsN6wHn9Juz5ZNnl3zQIh5LW7o=
Authentication-Results: myt6-f96510cd1fe5.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id AfzgbWXNBt-isHamEwo; Sun, 20 Dec 2020 22:44:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Sun, 20 Dec 2020 22:48:25 +0300
From: Oleg <lego12239@yandex.ru>
To: qemu-devel@nongnu.org
Subject: qemu-nbd trouble
Message-ID: <20201220194825.GA25878@legohost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=5.45.198.246; envelope-from=lego12239@yandex.ru;
 helo=forward103j.mail.yandex.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Oleg <lego12239@yandex.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi.

mkfs.ext4 on nbd device cause:

Discarding device blocks: failed - Input/output error

message.

The actions:

~# qemu-img create -f raw test.img 10G
Formatting 'test.img', fmt=raw size=10737418240
~# qemu-nbd -f raw -c /dev/nbd0 test.img
~# fdisk /dev/nbd0
...[PARTITION A DISK]...
~# fdisk -l /dev/nbd0
Disk /dev/nbd0: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xe75e6795

Device      Boot Start      End  Sectors Size Id Type
/dev/nbd0p1       2048 20971519 20969472  10G 83 Linux
~# mkfs.ext4 /dev/nbd0p1 
mke2fs 1.45.2 (27-May-2019)
Discarding device blocks: failed - Input/output error
Creating filesystem with 2621184 4k blocks and 655360 inodes
Filesystem UUID: 442620a3-0f00-432b-884e-0f14d76a993a
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done 
~# dmesg | tail
...[CUT]...
[64297.914937]  nbd0: p1
[64306.284714] block nbd0: Other side returned error (5)
[64306.284722] blk_update_request: I/O error, dev nbd0, sector 34816 op 0x3:(DISCARD) flags 0x800 phys_seg 1 prio class 0


With qcow2 format i get the same problem. With losetup instead of qemu-nbd there is no errors.

kernel - 5.4.82(4.19.132 get the same error)
qemu - 5.0.0

-- 
Олег Неманов (Oleg Nemanov)

