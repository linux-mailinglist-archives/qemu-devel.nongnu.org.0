Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8BB37AA52
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:11:39 +0200 (CEST)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgU2s-0000SW-Cs
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lgU07-0006Os-KC
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:08:49 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:27568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lgU05-00045a-9y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:08:46 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-mRo8asxAN2uCEyqp3pWptQ-1; Tue, 11 May 2021 11:08:38 -0400
X-MC-Unique: mRo8asxAN2uCEyqp3pWptQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BF201854E30;
 Tue, 11 May 2021 15:08:37 +0000 (UTC)
Received: from bahia.lan (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 324F1E2E8;
 Tue, 11 May 2021 15:08:28 +0000 (UTC)
Date: Tue, 11 May 2021 17:08:26 +0200
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [for-6.1 v3 3/3] virtiofsd: Add support for
 FUSE_SYNCFS request
Message-ID: <20210511170826.73b0b663@bahia.lan>
In-Reply-To: <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-4-groug@kaod.org>
 <CAOssrKfbzCnpHma-=tTRvwUecy_9RtJADzMb_uQ1yzzJStz1PA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: kvm@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 virtio-fs-list <virtio-fs@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 14:31:14 +0200
Miklos Szeredi <mszeredi@redhat.com> wrote:

> On Mon, May 10, 2021 at 5:55 PM Greg Kurz <groug@kaod.org> wrote:
> >
> > Honor the expected behavior of syncfs() to synchronously flush all data
> > and metadata on linux systems. Simply loop on all known submounts and
> > call syncfs() on them.
>=20
> Why not pass the submount's root to the server, so it can do just one
> targeted syncfs?
>=20
> E.g. somehting like this in fuse_sync_fs():
>=20
> args.nodeid =3D get_node_id(sb->s_root->d_inode);
>=20
> Thanks,
> Miklos
>=20

As Vivek already pointed out, there was some misunderstanding on
how submounts were supposed to work. Things got clearer since then :)

So, basically, we have two cases:

1) virtiofsd announces submounts : the d_automount implementation
   creates a new super block and mounts the submount

2) virtiofsd doesn't announce submounts: the client only knows
   about the top-level super block

You suggestion is for case 1) while this series was made with
case 2) in mind, hence the tracking of the super blocks in
the server.

Vivek and I discussed and agreed to address 2) later and
to just focus on 1) for now.

Your suggestion doesn't work with the current code base
because ->sync_fs() is never called on our submounts'
super blocks. This is because they don't have SB_BORN
set, which looks incorrect. A call to vfs_get_tree() would
fix it, but some code refactoring is needed in
fuse_dentry_automount() and virtio_fs_get_tree() for that.

Cheers,

--
Greg


