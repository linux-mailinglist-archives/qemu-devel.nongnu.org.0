Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9937BCB0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:40:59 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgoAa-0002fs-AE
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lgo8z-0001zb-OK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:39:17 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:59841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lgo8x-0001cS-VR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:39:17 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-Sb1DXmwKMEiFEwR_NIGcWw-1; Wed, 12 May 2021 08:39:10 -0400
X-MC-Unique: Sb1DXmwKMEiFEwR_NIGcWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DE51854E24;
 Wed, 12 May 2021 12:39:09 +0000 (UTC)
Received: from bahia.lan (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74CC76091A;
 Wed, 12 May 2021 12:39:08 +0000 (UTC)
Date: Wed, 12 May 2021 14:39:06 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: add link to 9p developer docs
Message-ID: <20210512143906.73ee6d43@bahia.lan>
In-Reply-To: <1839394.9N4xr98ZK1@silver>
References: <E1leeDf-0008GZ-9q@lizzy.crudebyte.com>
 <2208e250-4587-5902-f5c9-4786f8bd41e8@redhat.com>
 <1839394.9N4xr98ZK1@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
Cc: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 12:25:56 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 11. Mai 2021 21:57:53 CEST Connor Kuehl wrote:
> > On 5/6/21 8:12 AM, Christian Schoenebeck wrote:
> > > To lower the entry level for new developers, add a link to the
> > > 9p developer docs (i.e. qemu wiki) at the beginning of 9p source
> > > files, that is to: https://wiki.qemu.org/Documentation/9p
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  hw/9pfs/9p-local.c             | 5 +++++
> > >  hw/9pfs/9p-posix-acl.c         | 5 +++++
> > >  hw/9pfs/9p-proxy.c             | 5 +++++
> > >  hw/9pfs/9p-synth.c             | 5 +++++
> > >  hw/9pfs/9p-util.c              | 5 +++++
> > >  hw/9pfs/9p-xattr-user.c        | 5 +++++
> > >  hw/9pfs/9p-xattr.c             | 5 +++++
> > >  hw/9pfs/9p.c                   | 5 +++++
> > >  hw/9pfs/codir.c                | 5 +++++
> > >  hw/9pfs/cofile.c               | 5 +++++
> > >  hw/9pfs/cofs.c                 | 5 +++++
> > >  hw/9pfs/coth.c                 | 5 +++++
> > >  hw/9pfs/coxattr.c              | 5 +++++
> > >  hw/9pfs/virtio-9p-device.c     | 5 +++++
> > >  hw/9pfs/xen-9p-backend.c       | 5 +++++
> > >  tests/qtest/libqos/virtio-9p.c | 5 +++++
> > >  tests/qtest/virtio-9p-test.c   | 5 +++++
> >=20
> > Would it be helpful to also add this link to the virtio-9p stanza in
> > MAINTAINERS? Something like:
> >=20
> > W: https://wiki.qemu.org/Documentation/9p
> >=20
> > Connor
>=20
> Right, makes sense to me. I think I can just handle that as a separate pa=
tch=20
> subsequently, not worth a threaded V2 IMO.
>=20
> @Greg: a humble PING from the silent 9p front.
>=20

Sorry for lack of care... I agree both with the patch and with
Connor's suggestion. No need to even post anything more. You
can just fix this patch in your tree.

Acked-by: Greg Kurz <groug@kaod.org>

> Best regards,
> Christian Schoenebeck
>=20
>=20


