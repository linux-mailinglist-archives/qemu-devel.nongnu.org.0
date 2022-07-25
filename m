Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219495806D2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 23:32:59 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG5hB-0002xJ-NT
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 17:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkhai@ya.ru>) id 1oG5QF-0001WT-Nx
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 17:15:27 -0400
Received: from forward101o.mail.yandex.net ([2a02:6b8:0:1a2d::601]:47476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkhai@ya.ru>) id 1oG5QB-0006u4-JL
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 17:15:27 -0400
Received: from iva1-dcde80888020.qloud-c.yandex.net
 (iva1-dcde80888020.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:7695:0:640:dcde:8088])
 by forward101o.mail.yandex.net (Yandex) with ESMTP id 2ECB3369B50D;
 Tue, 26 Jul 2022 00:15:15 +0300 (MSK)
Received: by iva1-dcde80888020.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id ZXho2Z3dGu-FCh4KT0f; Tue, 26 Jul 2022 00:15:14 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1658783714; bh=kAhlQFCfWhrWOTesABzSAGCxFIgasBuWCk2ikQwkOAw=;
 h=Cc:References:Date:Message-ID:In-Reply-To:From:To:Subject;
 b=a7+K89XMIQp31FWkZzoPIemd6vfXr+vHqwHgBtS4m/bzkyi/EYQtofn2uuUCzuxaA
 Hf4kCrj87gbytIcL3w7tp2E0ai84alujiOiPi7SJxeEs1n31ugUxDSoJsNaclJ6QG+
 YJAxA4Z5VYsL5IyLgtdoRBy8OndxHTvtpH1jleLY=
Authentication-Results: iva1-dcde80888020.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Subject: Re: Attaching qcow2 images to containers
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Kirill Tkhai <kirill.tkhai@openvz.org>
Cc: qemu-devel@nongnu.org, dm-devel@redhat.com, linux-kernel@vger.kernel.org, 
 Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>, sgarzare@redhat.com, tkhai@ya.ru
References: <YoSSkOQaGL0sBNOI@stefanha-x1.localdomain>
From: Kirill Tkhai <tkhai@ya.ru>
Message-ID: <d4aafde8-1686-4423-e9b1-c1cc825236e6@ya.ru>
Date: Tue, 26 Jul 2022 00:15:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YoSSkOQaGL0sBNOI@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::601; envelope-from=tkhai@ya.ru;
 helo=forward101o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Jul 2022 17:29:17 -0400
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

Hi, Stefan,

sorry for the late reply. I missed your message since I don't use that email address anymore.
Sent a patch to fix the stale address in .mailmap.

On 18.05.2022 09:30, Stefan Hajnoczi wrote:
> Hi Kirill,
> I saw your "[PATCH 0/4] dm: Introduce dm-qcow2 driver to attach QCOW2
> files as block device" patch series:
> https://lore.kernel.org/linux-kernel/YkME5ZS2CpXuNmN6@infradead.org/T/
> 
> There has been recent work in vDPA (VIRTIO Data Path Acceleration) to
> achieve similar functionality. The qemu-storage-daemon VDUSE export
> attaches a virtio-blk device to the host kernel and QEMU's qcow2
> implementation can be used:
> https://patchew.org/QEMU/20220504074051.90-1-xieyongji@bytedance.com/
> 
> A container can then access this virtio-blk device (/dev/vda). Note that
> the virtio-blk device is implemented in software using vDPA/VDUSE, there
> is no virtio-pci device.
> 
> As a quick comparison with a dm-qcow2 target, this approach keeps the
> qcow2 code in QEMU userspace and can take advantage of QEMU block layer
> features (storage migration/mirroring/backup, snapshots, etc). On the
> other hand, it's likely to be more heavyweight because bounce buffers
> are required in VDUSE for security reasons, there is a separate
> userspace process involved, and there's the virtio_blk.ko driver and an
> emulated virtio-blk device involved.

The main idea is to reach the best performance and density. This is possible only,
if driver's hot path is implemented in kernel. Comparing to NBD the driver shows
much better results in these criteria.

This has a continuation, and I mean DAX here. IO handling with any userspace-based
implementation will be slower, than DAX in case of kernel-based implementation. So,
in my driver IO handling is done in kernel, while DAX support is a subject of
the future development.

And this driver and advantages of QEMU block layer are not mutually exclusive.
This driver *does not implement* snapshot or backup support, here is only hot-path
doing IO handling.
 
> Another similar feature that was recently added to QEMU is the
> qemu-storage-daemon FUSE export:
> 
>   $ qemu-storage-daemon \
>         --blockdev file,filename=test.img,node-name=drive0 \
> 	--export fuse,node-name=drive0,id=fuse0,mountpoint=/tmp/foo
>   $ ls -alF /tmp/foo
>   -r--------. 1 me me 10737418240 May 18 07:22 /tmp/foo
> 
> This exports a disk image as a file via FUSE. Programs can access it
> like a regular file and qemu-storage-daemon will do the qcow2 I/O on the
> underlying file.
> 
> I wanted to mention these options for exposing qcow2 disk images to
> processes/containers on the host. Depending on your use cases they might
> be interesting. Performance comparisons against VDUSE and FUSE exports
> would be interesting since these new approaches seem to be replacing
> qemu-nbd.
> 
> Can you share more about your use cases for the dm-qcow2 target? It
> could be useful for everyone I've CCed to be aware of various efforts in
> this area.

The use case is containers, and they are the requestor for high density.
The userspace-based implementation overhead will be noticeable on nodes
running a lot of containers (just because of any overhead is noticeable
there :)). Also, it's very useful to use the same disk image for VMs and
containers giving people to choose what they want in the moment.

Best wishes,
Kirill

