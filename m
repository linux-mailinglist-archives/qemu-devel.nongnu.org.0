Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7071BFF04
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 16:48:18 +0200 (CEST)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUAU5-0000GY-Hj
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 10:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jUATA-0007tC-7L
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jUAT9-0008Ex-8c
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:47:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48653
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jUAT8-0008ES-Lv
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 10:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588258037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wq4//QI0qMmliWJMyWnbmlRpH7+MoNuzMvvMeZ91itY=;
 b=M8wFaY96HVqT6Qk3QwxmFRvUBqUrb8MVXNDv9DFwLsIzzqvukJiUMV5ebVLcnbrJ8UcRFV
 AtnS/JtUh9dQ+ruPSkSPBFdy14DdAnGo49S+0HWsC+B+9NQuRaskOCmvESSgB3kZZNCAtu
 3KjEDzMkprfzdbQfNWHRrhTmJVU2XCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-rY6jKvHlPgutXiCwqb1a_w-1; Thu, 30 Apr 2020 10:47:15 -0400
X-MC-Unique: rY6jKvHlPgutXiCwqb1a_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3140107ACCD
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 14:47:14 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80FD02B4A5;
 Thu, 30 Apr 2020 14:47:07 +0000 (UTC)
Date: Thu, 30 Apr 2020 15:47:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: Show submounts
Message-ID: <20200430144704.GG2184629@redhat.com>
References: <20200424133516.73077-1-mreitz@redhat.com>
 <20200427175902.GM2923@work-vm> <20200429145720.GA2835@work-vm>
 <8c73f374-fcc8-1684-b581-84a9ab501aa9@redhat.com>
 <20200430085812.GC2874@work-vm>
 <20200430135639.GA260081@redhat.com>
 <20200430142013.GI2874@work-vm>
 <20200430143425.GD2184629@redhat.com>
 <20200430144116.GD260081@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200430144116.GD260081@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 01:04:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: virtio-fs@redhat.com, Max Reitz <mreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 30, 2020 at 10:41:16AM -0400, Vivek Goyal wrote:
> On Thu, Apr 30, 2020 at 03:34:25PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Apr 30, 2020 at 03:20:13PM +0100, Dr. David Alan Gilbert wrote:
> > > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > > On Thu, Apr 30, 2020 at 09:58:12AM +0100, Dr. David Alan Gilbert wr=
ote:
> > > > [..]
> > > > > > > Even without this patch, the SLAVE stuff worked so if you sta=
rt the
> > > > > > > daemon and *then* mount under the shared directory, the guest=
 sees it
> > > > > > > with or without this patch.
> > > > > >=20
> > > > > > Hm, I don=E2=80=99t.  Do you really?
> > > > >=20
> > > > > Yes! With your patch reverted:
> > > > >=20
> > > > > Start virtiofsd, mount in the guest:
> > > > >=20
> > > > > host:
> > > > > # ./virtiofsd --socket-path=3D/tmp/vhostqemu -o source=3D/home/dg=
ilbert/virtio-fs/fs  -o log_level=3Dwarn -o no_writeback
> > > > >=20
> > > > > guest:
> > > > > # mount -t virtiofs myfs /sysroot
> > > > >=20
> > > > > host:
> > > > > # findmnt -o +PROPAGATION -N 6100
> > > > > TARGET SOURCE                                                    =
          FSTYPE OPTIONS                                                   =
   PROPAGATION
> > > > > /      /dev/mapper/fedora_dgilbert--t580-root[/home/dgilbert/virt=
io-fs/fs] xfs    rw,relatime,seclabel,attr2,inode64,logbufs=3D8,logbsize=3D=
32k,no private,slave
> > > > > # mount -t tmpfs /dev/null /home/dgilbert/virtio-fs/fs/tmp
> > > > > # findmnt -o +PROPAGATION -N 6100
> > > > > TARGET SOURCE                                                    =
          FSTYPE OPTIONS                                                   =
   PROPAGATION
> > > > > /      /dev/mapper/fedora_dgilbert--t580-root[/home/dgilbert/virt=
io-fs/fs] xfs    rw,relatime,seclabel,attr2,inode64,logbufs=3D8,logbsize=3D=
32k,no private,slave
> > > > > =E2=94=94=E2=94=80/tmp /dev/null                                 =
                          tmpfs  rw,relatime,seclabel                      =
                   private,slave
> > > >=20
> > > > Why is it showing a mount point at "/tmp". If mount point propagate=
d, then
> > > > inside guest we should see a mount point at /sysroot/tmp?
> > >=20
> > > That findmnt is on the host.
> > >=20
> > > > So there are two things.
> > > >=20
> > > > A. Propagation of mount from host to virtiofsd.
> > > > B. Visibility of that mount inside guest over fuse protocol (submou=
nt
> > > >   functionality).
> > > >=20
> > > > I think A works for me without any patches. But don't think B is wo=
rking
> > > > for me. I don't see the submount inside guest.=20
> > > >=20
> > > > > # touch /home/dgilbert/virtio-fs/fs/tmp/hello
> > > > >=20
> > > > > guest:
> > > > > # ls -l /sysroot/tmp
> > > > > total 0
> > > > > -rw-r--r-- 1 root root 0 Apr 30 08:50 hello
> > > >=20
> > > > Do a "findmnt /sysroot/tmp" inside guest and see what do you see.
> > > >=20
> > > > You will be able to see "hello" as long as virtiofsd sees the new
> > > > mount point, I think. And guest does not have to see that mount poi=
nt
> > > > for this simple test to work.
> > >=20
> > > Right, the guest just sees:
> > >=20
> > > `-/sysroot                            myfs       virtiof rw,relatime
> >=20
> > That is a good thing surely ? If I'm exporting "/sysroot" from the host=
,
> > I want the content in "/sysroot/some/sub/mount" to be visible to the
> > guest, but I don't want the guest to see "/sysroot/some/sub/mount"
> > as an actual mount point. That would be leaking information about the
> > host storage setup into the guest. The host admin should be free to
> > re-arrange submounts in the host OS, to bring more storage space online=
,
> > and have this be transparent to the guest OS.
>=20
> If we don't see mount inside guest, we run into the possibility of inode
> number collision. On host two files in shared dir can have same inode
> number (if they are on two different filesystem with different device
> numbers). But inside guest, we will show device number of virtiofs,
> and it will look as if two files in this filesystem have same inode
> number, breaking some workloads.
>=20
> By propagating mounts (submounts), we can assign a unique device number
> to these submounts and hence <dev,inode> number pair will become unique.

Ah, yes, that's true.  In 9pfs there was recent changes precisely
because of this clash possibility:

commit 1a6ed33cc56997479bbe5b48337ff8da44585bd4
Author: Antonios Motakis <antonios.motakis@huawei.com>
Date:   Thu Oct 10 11:36:05 2019 +0200

    9p: Added virtfs option 'multidevs=3Dremap|forbid|warn'
   =20
    'warn' (default): Only log an error message (once) on host if more than=
 one
    device is shared by same export, except of that just ignore this config
    error though. This is the default behaviour for not breaking existing
    installations implying that they really know what they are doing.
   =20
    'forbid': Like 'warn', but except of just logging an error this
    also denies access of guest to additional devices.
   =20
    'remap': Allows to share more than one device per export by remapping
    inodes from host to guest appropriately. To support multiple devices on=
 the
    9p share, and avoid qid path collisions we take the device id as input =
to
    generate a unique QID path. The lowest 48 bits of the path will be set
    equal to the file inode, and the top bits will be uniquely assigned bas=
ed
    on the top 16 bits of the inode and the device id.


Perhaps we should try to support the same options in virtio-fs. At least
the "forbid" and "remap" options make sense I think. "warn" was only
really there for backcompat.  If we can expose it to the guest, then a
further "expose" option would be viable.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


