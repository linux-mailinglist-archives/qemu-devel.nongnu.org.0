Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F211B11A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 16:28:43 +0100 (CET)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if3ur-0005uE-M0
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 10:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <coiby.xu@gmail.com>) id 1if3tc-0004st-6c
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:27:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <coiby.xu@gmail.com>) id 1if3ta-0007pu-K9
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:27:23 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:40415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <coiby.xu@gmail.com>) id 1if3ta-0007n3-9m
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:27:22 -0500
Received: by mail-lj1-x244.google.com with SMTP id s22so24527153ljs.7
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 07:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=le6qsglN4BF7awIWgtFI0HxiVdmLA446rknNqRYCMAE=;
 b=YRP5QjVpDxVBROKYjDVhJTIae6XlvZSjxToO7u+DdQbidDVpmLz4PTBzU/645Vg8SD
 ZMKlRpmyt3Jay5EdA65Sz9xhi570c+gjCcfWbc7bBBRBho6bY89BN8WXuuJ3XGMvFnx0
 uVVCBw/i4t/pys5ON/SWcoqx6J6fBDcdH0gMoCECzFkbWbU9Hv28V6wlf+w9nfl6rFnJ
 aBjX5gu3uohy95w5Ql6p6nuKE7JGhMfR2407dmCRVjQ4YXOqknFjJy4hpIcOCdULyLh8
 fZsXTCtbAABvcG2paKORE4Y3zZJVJ9tpQMoAq+IR+SbGK+nKziTlSvrwb6EbedlHQQYl
 rEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=le6qsglN4BF7awIWgtFI0HxiVdmLA446rknNqRYCMAE=;
 b=gVA7fu7/AHAPtd2CphDvbqH+01xSwRNG20vR2ve/OWcHXHpOpDFZ9b32BpelguNpcR
 ZHnabjfEEEvCMCmhoYo7gSr5wdYC/umgK7d5d+3rZgl78bQ+s4cl+tepnkNf/9N3vA9C
 YdiRWzZmAQ0qWqo/hWs3qnVVrpha+ymbFruEWJ3wOmCZ4q1mAZHVQbeh4r+JFbUKlECs
 2zhUkzKgzKCudWpnKFgN1K2eTQ4C1IlFYjY2Y1VIGMUkfPitbzPtofZttL0bRJHl0ho5
 +bkGagIY/DGIxXtCJvcevLoSiQRZyOQMEs8nMFJr2pwMLXiiw/gWekIHO3npmt9pIUa3
 1MXw==
X-Gm-Message-State: APjAAAVoaXiFgC9xuW82K/h6GDgj/LPpN221YqCTk/thEd5jk2gUI82w
 D9Pm4vlHMw+wBQLqA0hqBTlCI7YFbNCo2+edd40=
X-Google-Smtp-Source: APXvYqxBaYBhsEHZopKc7fm6jpJ7p0eK+d34zSqttrG6Q9nAowL7Su4dwzgt1j6wKpHAjBtZhLNAepoWzB0QrocrDpA=
X-Received: by 2002:a05:651c:239:: with SMTP id
 z25mr2545171ljn.48.1576078040283; 
 Wed, 11 Dec 2019 07:27:20 -0800 (PST)
MIME-Version: 1.0
References: <CAJAkqrXyeVn4iy7NzkR__BS9q9xT4ZWcjJszNBaSKH0U57c4hw@mail.gmail.com>
 <20191114111429.GC580024@stefanha-x1.localdomain>
In-Reply-To: <20191114111429.GC580024@stefanha-x1.localdomain>
From: Coiby Xu <coiby.xu@gmail.com>
Date: Wed, 11 Dec 2019 23:25:32 +0800
Message-ID: <CAJAkqrULM=wjDEVV8kZBU4u1ag4ERiKq3z5yzRus3vqwsx_a4A@mail.gmail.com>
Subject: Re: How to extend QEMU's vhost-user tests after implementing
 vhost-user-blk device backend
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

I'm now writing the tests for vhost-user-blk device based on
tests/virtio-blk-test.c. But block_resize command doesn't apply to
vhost-user-blk device.

After launching vhost-user backend server, I type the following
command to connect to it

(qemu) chardev-add socket,id=char1,path=/tmp/vhost-user-blk_vhost.socket
(qemu) object_add memory-backend-memfd,id=mem,size=256M,share=on
(qemu) device_add vhost-user-blk-pci,id=blk0,chardev=char1
(qemu) block_resize blk0 512
Error: Cannot find device=blk0 nor node_name=

QEMU can't find the device although in the guest OS I can already
mount /dev/vda. And `info block` doesn't list the newly added
vhost-user-blk device,
(qemu) info block
disk (#block154): dpdk.img (raw)
    Attached to:      /machine/peripheral-anon/device[0]
    Cache mode:       writeback

floppy0: [not inserted]
    Attached to:      /machine/unattached/device[17]
    Removable device: not locked, tray closed

sd0: [not inserted]
    Removable device: not locked, tray close

It seems `info block` and `block_resize` only work with `drive_add`
which is not necessary for vhost-user-blk device. Should I let QEMU
support adding vhost-user backend device in the way similar to adding
NBD device(`drive_add -n buddy
file.driver=nbd,file.host=localhost,file.port=49153,file.export=disk,node-name=nbd_client1`),
i.e., a drive can be added via `drive_add -n buddy
file.driver=vhost-user,file.sock=/tmp/vhost-user-blk_vhost.socket,node-name=vhost_user_client1`?

Thank you!


On Thu, Nov 14, 2019 at 7:14 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, Nov 13, 2019 at 05:23:46PM +0800, Coiby Xu wrote:
> > I've implemented vhost-user-blk device backend by following
> > https://wiki.qemu.org/Google_Summer_of_Code_2019#vhost-user-blk_device_backend.
> > But I'm not sure what kind of tests I should write or to extend to
> > take advantage of implemented vhost-user-blk device backend. The
> > existing two tests related to vhost user are tests/vhost-user-bridge.c
> > and tests/vhost-user-test.c both of which act as vhost user server to
> > test QEMU's implementation of vhost user client. Am I supposed to
> > extend these two tests? Could you elaborate on the final step "Extend
> > QEMU's vhost-user tests to take advantage of your vhost-user-blk
> > device backend"?
>
> Hi Coiby,
> The following tests/virtio-blk-test.c test cases will also work with
> vhost-user-blk: basic, indirect, idx, nxvirtq.  The other test cases
> may require more work because they send QMP commands like block_resize
> or device_add virtio-blk-pci.
>
> In theory block_resize should work because the vhost-user-blk device
> backend can send a VIRTIO Configuration Space changed interrupt
> (VHOST_USER_SLAVE_CONFIG_CHANGE_MSG), but I haven't checked if this code
> path is fully implemented.
>
> In order to reuse existing test cases you could add new initialization
> code to virtio-blk-test.c that:
> 1. Starts the vhost-user-blk device backend
> 2. Adds a -device vhost-user-blk-pci connected to that device backend
>
> Please post your patches to qemu-devel even if you don't have test cases
> yet.  That way you can get review feedback earlier.
>
> Stefan



-- 
Best regards,
Coiby

