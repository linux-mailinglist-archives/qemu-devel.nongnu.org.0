Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FC16B70F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 02:15:03 +0100 (CET)
Received: from localhost ([::1]:47063 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6OoQ-000885-Al
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 20:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanrin@gmail.com>) id 1j6Cxm-0007KA-37
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 07:35:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanrin@gmail.com>) id 1j6Cxk-0007Um-S0
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 07:35:54 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:42958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanrin@gmail.com>)
 id 1j6Cxi-0007TA-1g; Mon, 24 Feb 2020 07:35:50 -0500
Received: by mail-io1-xd42.google.com with SMTP id z1so10050437iom.9;
 Mon, 24 Feb 2020 04:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=IoKrnU5wlsNsgz6KvO+wF5EOEafsdIsaofsmdcmtqP0=;
 b=BkiYonQiep0tatWxVn7a2wbdYiv4PkTrZtFnekQNKS0etGLpn8crlRb6ruA/szSRLb
 3Ah9dJjUfUWWuiZ37CnANBew2pkE5gzEuxYM081cZL/W/5vnMApTJLsRKJ4mtk0s/rmm
 USogk+3ClIwmSG+i3PL4Zt6hCGcKGACLAcxp3JgyFJkorcodI32B87vsg+HLIxn00EV5
 UzINviUQobNUOX6ATJ4AzcDzUZt/uGmBc8fDEPvjh9yxv77u2MPoGh0iBSFMGeq6kp4q
 jchmnN6IiNDME9yyoBZ3aqFVdJJHhol0RLPW2dQ5AfaVY8HkhyLCY4pB6xiv/OeYqmst
 tUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=IoKrnU5wlsNsgz6KvO+wF5EOEafsdIsaofsmdcmtqP0=;
 b=NQyOkcvFDs7aBnwtjcz7g4YptkqW0ha3EAZhdGzKvTr5v0WU+QkuRTvciD+zRm+akw
 GzRqEJz1JsWclk1TtHIOrYCqkt6haEHalhx818JSsf6PQBe2p7N8mVvFWtIwHgnLSenV
 6cskK20MrwRTeDCQVagh+LPUMhVH+97T5g4tjjvXoHnHRLaSEMO8ikF+aEcmBOWOCWRs
 7v3S6TmqC1MUSnuYXIt+qempGQYnSJi2WBJvkqmJZAPF/eB/yQZb4RPYw6ozRUMSEAd9
 KbW3wt/gTwug2HUI5BRT3H32Rk8wi4op+fGYJglszR5Z8NhO6ow2ubsXbcVh45KIUD1u
 p+TA==
X-Gm-Message-State: APjAAAVDvc4Dn8EK6wQIpiumFOjwBQg4sAuCN6PdmAMHR4SsccBOU/D5
 KAXAqfvJHU/y5ZOiMWUKYbQZU/uwz5Wo3DDTzutUtC02
X-Google-Smtp-Source: APXvYqwpyY38gpwaHyLZf/O02to5Uruhhq1m/qifI3h3x3ZZeYGV/Vf0B2bGQTB736E5ni4+lMZf5GrtWk2Eg32VAQc=
X-Received: by 2002:a6b:fd1a:: with SMTP id c26mr49073528ioi.214.1582547748225; 
 Mon, 24 Feb 2020 04:35:48 -0800 (PST)
MIME-Version: 1.0
References: <CAAxjCEzHQz4cG_8m7S6=CwCBoN5daQs+KVyuU5GL5Tq3Bky1NA@mail.gmail.com>
In-Reply-To: <CAAxjCEzHQz4cG_8m7S6=CwCBoN5daQs+KVyuU5GL5Tq3Bky1NA@mail.gmail.com>
From: Stefan Ring <stefanrin@gmail.com>
Date: Mon, 24 Feb 2020 13:35:36 +0100
Message-ID: <CAAxjCEx79Fkjw9tFbSMo+b1LGv2LNivLRXf1GS9JsYnXrNVVkQ@mail.gmail.com>
Subject: Re: Strange data corruption issue with gluster (libgfapi) and ZFS
To: qemu-block@nongnu.org, qemu-devel@nongnu.org, integration@gluster.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
X-Mailman-Approved-At: Mon, 24 Feb 2020 20:12:27 -0500
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

On Thu, Feb 20, 2020 at 10:19 AM Stefan Ring <stefanrin@gmail.com> wrote:
>
> Hi,
>
> I have a very curious problem on an oVirt-like virtualization host
> whose storage lives on gluster (as qcow2).
>
> The problem is that of the writes done by ZFS, whose sizes according
> to blktrace are a mixture of 8, 16, 24, ... 256 (512 byte)
> blocks,sometimes the first 4KB or more, but at least the first 4KB,
> end up zeroed out when read back later from storage. To clarify: ZFS
> is only used in the guest. In my current test scenario, I write
> approx. 3GB to the guest machine, which takes roughly a minute.
> Actually it=E2=80=99s around 35 GB which gets compressed down to 3GB by l=
z4.
> Within that, I end up with close to 100 data errors when I read it
> back from storage afterwards (zpool scrub).
>
> There are quite a few machines running on this host, and we have not
> experienced other problems so far. So right now, only ZFS is able to
> trigger this for some reason. The guest has 8 virtual cores. I also
> tried writing directly to the affected device from user space in
> patterns mimicking what I see in blktrace, but so far have been unable
> to trigger the same issue that way. Of the many ZFS knobs, I know at
> least one that makes a huge difference: When I set
> zfs_vdev_async_write_max_active to 1 (as opposed to 2 or 10), the
> error count goes through the roof (11.000). Curiously, when I switch
> off ZFS compression, the data amount written increases almost
> 10-fold,while the absolute error amount drops to close to, but not
> entirely,zero. Which I guess supports my suspicion that this must be
> somehow related to timing.
>
> Switching the guest storage driver between scsi and virtio does not
> make a difference.
>
> Switching the storage backend to file on glusterfs-fuse does make a
> difference, i.e. the problem disappears.
>
> Any hints? I'm still trying to investigate a few things, but what bugs
> me most that only ZFS seems to trigger this behavior, although I am
> almost sure that ZFS is not really at fault here.
>
> Software versions used:
>
> Host
> kernel 3.10.0-957.12.1.el7.x86_64
> qemu-kvm-ev-2.12.0-18.el7_6.3.1.x86_64
> glusterfs-api-5.6-1.el7.x86_64
>
> Guest
> kernel 3.10.0-1062.12.1.el7.x86_64
> kmod-zfs-0.8.3-1.el7.x86_64 (from the official ZoL binaries)

I can actually reproduce this on my Fedora 31 home machine with 3 VMs.
All 3 running CentOS 7.7. Two for glusterd, one for ZFS. Briefly, I
also got rid of the 2 glusterd VMs altogether, i.e. running glusterd
(the Fedora version) directly on the host, and it would still occur.
So my impression is that the server side of GlusterFS does not matter
much =E2=80=93 I=E2=80=99ve seen it happen on 4.x, 6.x, 7.2 and 7.3. Also, =
as it
happens in the same way on a Fedora 31 qemu as well as a CentOS 7 one,
the qemu version is equally irrelevant.

The main conclusion so far is that it has to do with growing the qcow2
image. With a fully pre-populated image, I cannot trigger it.

I poked around a little in the glfs api integration, but trying to
make sense of two unknown asynchronous io systems (QEMU's and
GlusterFS's) interacting with each other is demanding a bit much for a
single weekend ;). The one thing I did verify so far is that there is
only one thread ever calling qemu_gluster_co_rw. As already stated in
the original post, the problem only occurs with multiple parallel
write requests happening.

What I plan to do next is look at the block ranges being written in
the hope of finding overlaps there.

