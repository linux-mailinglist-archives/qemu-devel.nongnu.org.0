Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB443CEC5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:32:10 +0200 (CEST)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflqT-0005u1-F1
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mflMf-000466-6D
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:01:21 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:29046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mflMc-0007HZ-1E
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:01:20 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-X5bbPv4ZMcKIfGLfXzVSlg-1; Wed, 27 Oct 2021 12:01:06 -0400
X-MC-Unique: X5bbPv4ZMcKIfGLfXzVSlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F09880A5CC;
 Wed, 27 Oct 2021 16:01:05 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67CF157CAA;
 Wed, 27 Oct 2021 16:01:04 +0000 (UTC)
Date: Wed, 27 Oct 2021 18:01:03 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
Message-ID: <20211027180103.3fcbd709@bahia.huguette>
In-Reply-To: <1763549.VT83FdeJ1q@silver>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <1763549.VT83FdeJ1q@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Oct 2021 16:05:39 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck wrote:
> > The following changes since commit 931ce30859176f0f7daac6bac255dae5eb21=
284e:
> >=20
> >   Merge remote-tracking branch 'remotes/dagrh/tags/pull-virtiofs-202110=
26'
> > into staging (2021-10-26 07:38:41 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
> >=20
> > for you to fetch changes up to 7e985780aaab93d2c5be9b62d8d386568dfb071e=
:
> >=20
> >   9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
> >=20
> > ----------------------------------------------------------------
> > 9pfs: performance fix and cleanup
> >=20
> > * First patch fixes suboptimal I/O performance on guest due to previous=
ly
> >   incorrect block size being transmitted to 9p client.
> >=20
> > * Subsequent patches are cleanup ones intended to reduce code complexit=
y.
> >=20
> > ----------------------------------------------------------------
> > Christian Schoenebeck (8):
> >       9pfs: fix wrong I/O block size in Rgetattr
> >       9pfs: deduplicate iounit code
> >       9pfs: simplify blksize_to_iounit()
> >       9pfs: introduce P9Array
> >       fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
> >       9pfs: make V9fsString usable via P9Array API
> >       9pfs: make V9fsPath usable via P9Array API
> >       9pfs: use P9Array in v9fs_walk()
> >=20
> >  fsdev/9p-marshal.c |   2 +
> >  fsdev/9p-marshal.h |   3 +
> >  fsdev/file-op-9p.h |   2 +
> >  fsdev/p9array.h    | 160
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c     =
  |=20
> > 70 +++++++++++++----------
> >  5 files changed, 208 insertions(+), 29 deletions(-)
> >  create mode 100644 fsdev/p9array.h
>=20
> Regarding last 5 patches: Daniel raised a concern that not using g_autopt=
r=20
> would deviate from current QEMU coding patterns:
> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
>=20
> Unfortunately I saw no way to address his concern without adding unnecess=
ary=20
> code complexity, so I decided to make this a 9p local type (QArray -> P9A=
rray)=20
> for now, which can easily be replaced in future (e.g. when there will be=
=20
> something appropriate on glib side).
>=20

Christian,

Given that the P9Array is controversial and that the current benefit in
patch 8 is relatively small, I'd suggest that you just drop patches 4 to
8 for now.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
>=20
>=20


