Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BDB4DA1BB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:00:16 +0100 (CET)
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBSx-0000Qk-Te
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:00:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nUBQ2-0006Y6-NA; Tue, 15 Mar 2022 13:57:14 -0400
Received: from forward107p.mail.yandex.net ([77.88.28.115]:42576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nUBPz-0007BZ-FT; Tue, 15 Mar 2022 13:57:14 -0400
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
 by forward107p.mail.yandex.net (Yandex) with ESMTP id 23AEF556D95D;
 Tue, 15 Mar 2022 20:57:02 +0300 (MSK)
Received: from vla1-25221a47e1d2.qloud-c.yandex.net
 (vla1-25221a47e1d2.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3c06:0:640:2522:1a47])
 by forward100q.mail.yandex.net (Yandex) with ESMTP id 1F2986F4000A;
 Tue, 15 Mar 2022 20:57:02 +0300 (MSK)
Received: from vla1-ef285479e348.qloud-c.yandex.net
 (vla1-ef285479e348.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:ef28:5479])
 by vla1-25221a47e1d2.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 XuLrsVvbOl-v1eetCJ4; Tue, 15 Mar 2022 20:57:02 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1647367022; bh=VXf1Ulnh0egAcBdibezAQ6riQ4CtvnIi1ibzNj1sDaA=;
 h=From:To:Subject:Cc:Date:Message-ID;
 b=UNOrRWK2oZ4SqjSerERdreJP7aGVofJcwpCzZaMxVCH5lPXl6+HAY2sXP5yDDl4N1
 SM8NpC9gaUtv4m2u3nwsgSr6w8Vh9YM1OwQlin0AwWlg5MTmdva2ZlWiZYIn/XHKPU
 IkWO00jwXW+vN99kPWjExx+wsp/ZhgXtXe9D9YcA=
Authentication-Results: vla1-25221a47e1d2.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by vla1-ef285479e348.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id M3HWHftW0k-v1JKZL9S; Tue, 15 Mar 2022 20:57:01 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <b68833dd-8864-4d72-7c61-c134a9835036@ya.ru>
Date: Tue, 15 Mar 2022 20:57:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: qemu block <qemu-block@nongnu.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
Subject: Summary on new backup interfaces in QEMU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.28.115; envelope-from=v.sementsov-og@ya.ru;
 helo=forward107p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here I want to summarize new interfaces and use cases for backup in QEMU.

TODO for me: convert this into good rst documentation in docs/.

OK, let's begin.

First, note that drive-backup qmp command is deprecated.

Next, some terminology:

push backup: the whole process is inside QEMU process, also may be called "internal backup"

pull backup: QEMU only exports a kind of snapshot (for example by NBD), and third party software reads this export and stores it somehow, also called "external backup"

copy-before-write operations: We usually do backup of active disk, guest is running and may write to the disk during the process of backup. When guest wants to rewrite data region which is not backed up yet, we must stop this guest write, and copy original data to somewhere before continuing guest write. That's a copy-before-write operation.

image-fleecing: the technique that allows to export a "snapshotted" state of the active disk with help of copy-before-write operations. We create a temporary image - target for copy-before-write operations, and provide an interface to the user to read the "snapshotted" state. And for read, we do read from temporary image the data which is already changed in original active disk, and we read unchanged data directly from active disk. The temporary image itself is also called "reverse delta" or "reversed delta".



== Simple push backup ==

Just use blockdev-backup, nothing new here. I just note some technical details, that are relatively new:

1. First, backup job inserts copy-before-write filter above source disk, to do copy-before-write operation.
2. Created copy-before-write filter shares internal block-copy state with backup job, so they work in collaboration, to not copy same things twice.



== Full pull backup ==

Assume, we are going to do incremental backup in future, so we also need to create a dirty bitmap, to track dirtiness of active disk since full backup.

1. Create empty temporary image for fleecing. It must be of the same size as active disk. It's not necessary to be qcow2, and if it's a qcow2, you shouldn't make the original active disk a backing file for the new temporary qcow2 image (it was necessary in old fleecing scheme).

Example:
   qemu-img create -f qcow2 temp.qcow2 64G


2. Initialize fleecing scheme and create dirty bitmap for future incremental backup.

Assume, disk0 is an active disk, attached to qdev-id sda, to be backed up.

qmp: transaction [
    block-dirty-bitmap-add {node: disk0, name: bitmap0, persistent: true}
    blockdev-add* {node-name: tmp-protocol, driver: file, filename: temp.qcow2}
    blockdev-add {node-name: tmp, driver: qcow2, file: tmp-protocol}
    blockdev-add {node-name: cbw, driver: copy-before-write, file: disk0, target: tmp}
    blockdev-replace** {parent-type: qdev, qdev-id: sda, new-child: cbw}
    blockdev-add {node-name: acc, driver: snapshot-access, file: cbw}
]

qmp: nbd-server-start {...}
qmp: nbd-server-add {device: acc, ...}

This way we create the following block-graph:

[guest]                   [NBD export]
    |                            |
    | root                       | root
    v                 file       v
[copy-before-write]<------[snapshot-access]
    |           |
    | file      | target
    v           v
[active-disk] [temp.qcow2]

* "[PATCH 0/2] blockdev-add transaction" series needed for this
** "[PATCH v3 00/11] blockdev-replace" series needed for this


Note additional useful options for copy-before-write filter:

"[PATCH 0/3] block: copy-before-write: on-cbw-error behavior" provides possibility of option on-cbw-error=break-snapshot, which means that on failure of CBW operation we will not break guest write, but instead all further reads by NBD client will fail, which formally means: break the backup process, not guest write.

"[PATCH 0/4] block: copy-before-write: cbw-timeout" provides an option cbw-timeout, to set a timeout for CBW operations. That's very useful to avoid guest stuck.


3. Now third party backup tool can read data from NBD export

NBD_CMD_TRIM (discard) operation is supported on the export, it has the following effects:

1. discard this data from temp image, if it is stored here
2. avoid further copy-before-write operation (guest is free to rewrite corresponding data with no extra latency)
3. all further read requests from discarded areas by NBD client will fail

So, NBD client may discard regions that are already backed up to avoid extra latency for guest writes and to free disk space on the host.

Possible TODO here is to implement NBD protocol extension, that allows to READ & DISCARD in command. In this case we avoid extra command in the wire, but lose possibility of retrying the READ operation if it failed.

4. After backup is complete, we should destroy the fleecing scheme:

qmp: nbd-server-stop

qmp: blockdev-del {node-name: acc}
qmp: blockdev-replace {parent-type: qdev, qdev-id: sda, new-child: disk0}
qmp: blockdev-del {node-name: cbw}
qmp: blockdev-del {node-name: tmp}
qmp: blockdev-del {node-name: tmp-protocol}


5. If backup failed, we should remove created dirty bitmap:

qmp: block-dirty-bitmap-remove {node: disk0, name: bitmap0}



== Incremental pull backup ==

OK, now we have a bitmap called bitmap0, and want to do incremental backup, accordingly to that bitmap. In short, we want:

  - create a new bitmap to continue dirty tracking for next incremental backup
  - export "snapshotted" state of disk0 through NBD
  - export "frozen" bitmap, so that external tool know what to copy

Mostly, all points remains the same, let's go through:

1. Create empty temporary image for fleecing -- same as for full backup, no difference

2. Initialize fleecing scheme and create dirty bitmap for future incremental backup.

qmp: transaction [
    block-dirty-bitmap-add {node: disk0, name: bitmap1, persistent: true}
    block-dirty-bitmap-disable {node: disk0, name: bitmap0}
    blockdev-add {node-name: tmp-protocol, driver: file, filename: temp.qcow2}
    blockdev-add {node-name: tmp, driver: qcow2, file: tmp-protocol}
    blockdev-add {node-name: cbw, driver: copy-before-write, file: disk0, target: tmp, bitmap: {node: disk0, name: bitmap0}}
    blockdev-replace {parent-type: qdev, qdev-id: sda, new-child: cbw}
    blockdev-add {node-name: acc, driver: snapshot-access, file: cbw}
]

qmp: nbd-server-start {...}
qmp: block-export-add {type: nbd, node-name: acc, bitmaps: [{node: disk0, name: bitmap0}]}

3. Now third party backup tool can read data from NBD export

  - Client may negotiate meta contexts, to query exported dirty bitmap by NBD_BLOCK_STATUS commend
  - If client reads "not-dirty" (by bitmap0) areas, it gets an error.
  - NBD_CMD_TRIM (discard) works as for full backup, no difference

4. After backup is complete, we should destroy the fleecing scheme:

   - Same as for full backup

5. Next, we should handle dirty bitmaps:

5.1 Failure path

Merge-back bitmap1 to bitmap0 and continue tracking in bitmap0:

qmp: transaction [
     block-dirty-bitmap-enable {node: disk0, name: bitmap0}
     block-dirty-bitmap-merge {node: disk0, target: bitmap0, bitmaps: ['bitmap1']}
     block-dirty-bitmap-remove {node: disk0, name: bitmap1}
]

5.2 Success path

We have two possible user scenarios on success:

5.2.1 Continue tracking for next incremental backup in bitmap1

In this case, just remove bitmap0:
qmp: block-dirty-bitmap-remove {node: disk0, name: bitmap0}

Or you may not delete bitmap0 and keep it disabled, to be reused in future for differential backup (see below).

5.2.2 Continue tracking for next incremental backup in bitmap0 (assume, we always work with one bitmap and don't want any kind of differential backups, and don't associate bitmap name with stored backups)

In this case, enable and clear bitmap0, merge bitmap1 to bitmap0 and remove bitmap1:

qmp: transaction [
     block-dirty-bitmap-enable {node: disk0, name: bitmap0}
     block-dirty-bitmap-clear {node: disk0, name: bitmap0}
     block-dirty-bitmap-merge {node: disk0, target: bitmap0, bitmaps: ['bitmap1']}
     block-dirty-bitmap-remove {node: disk0, name: bitmap1}
]



== Push backup with fleecing full/incremental ==

Reasoning: the main problem of simple push backup is that guest writes may be seriously affected by copy-on-write operations, when backup target is slow. To solve this problem, we'll use the scheme like for pull backup: we create local temporary image, which is a target for copy-before-write operations, and instead of exporting the "snapshot-access" node we start internal backup from it to the target.

So, the scheme and commands looks exactly the same as for full and incremental pull backup. The only difference is that we don't need to start nbd export, but instead we should add target node to qemu and start internal backup. And good thing is that it may be done in same transaction with initializing fleecing scheme:

qmp: transaction [
     ... initialize fleecing scheme for full or incremental backup ...

# Add target node. Here is qcow2 added, but it may be nbd node or something else
     blockdev-add {node-name: target-protocol, driver: file, filename: target.qcow2}
     blockdev-add {node-name: target, driver: qcow2, file: target-protocol}

# Start backup
     blockdev-backup {device: acc, target: target, ...}
]

If it is an incremental backup, pass also bitmap parameter:

     blockdev-backup {..., bitmap: bitmap0, sync: incremental, bitmap-mode: never}

Note bitmap-mode=never: this means that backup will do nothing with bitmap0, so we have same scheme like for pull backups (handle bitmaps by hand after backup). Still, push-backup scheme may be adopted to use other bitmap modes.

What we lack here is discarding in 'acc' node after successful copying of the block to the target, to safe disk space and avoid extra copy-before-write operations. It's a TODO, should be implemented like discard-source parameter for blockdev-backup.



== Differential backups ==

I'm not fan of this idea, but I think it should be described.

Assume we have already a chain of incremental backups (represented as qcow2 chain on backup storage server, for example). They corresponds to some points in time: T0, T1, T2, T3. Assume T3 is the last backup.

If we want to create usual incremental backup, it would be diff between T3 and current time (which becomes T4).

Differential backup say: I want to make backup starting from T1 to current time. What's for? Maybe T2 and T3 was removed or somehow damaged..

How to do that in Qemu: on each incremental backup you start a new bitmap, and _keep_ old one as disabled.
This way we have bitmap0 (which presents diff between T0 and T1), bitmap1 (diff T1 T2), bitmap2 (diff T2 T3), and bitmap3 which shows diff from T3 up to current time. bitmap3 is the only enabled bitmap and others are disabled.

So, to make differential backup, use block-dirty-bitmap-merge command, to merge all bitmaps you need into one, and than use it in any backup scheme.

The drawback is that all these disabled bitmaps eat RAM. Possible solution is to not keep them in RAM, it's OK to keep them in qcow2, and load only on demand. That's not realized now and that's a TODO for thous who want differential backups.

-- 
Best regards,
Vladimir

