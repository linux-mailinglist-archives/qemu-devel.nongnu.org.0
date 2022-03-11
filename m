Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580C4D60D9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 12:43:37 +0100 (CET)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSdgF-0007dw-TF
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 06:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSdeP-0006sU-8b
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 06:41:44 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSdeM-0008HK-UV
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 06:41:40 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-tvjs9tyUM8-OssPG0QL6cw-1; Fri, 11 Mar 2022 06:41:36 -0500
X-MC-Unique: tvjs9tyUM8-OssPG0QL6cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C214180FD71;
 Fri, 11 Mar 2022 11:41:35 +0000 (UTC)
Received: from bahia (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56BE561B66;
 Fri, 11 Mar 2022 11:41:34 +0000 (UTC)
Date: Fri, 11 Mar 2022 12:41:32 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/6] tests/9pfs: Twalk with nwname=0
Message-ID: <20220311124132.522fa396@bahia>
In-Reply-To: <22257136.YvWK5Ti9pE@silver>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <f19d6f5fd2b569ebac797f18849710eb22c40984.1646850707.git.qemu_oss@crudebyte.com>
 <22257136.YvWK5Ti9pE@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 09:57:25 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 9. M=C3=A4rz 2022 14:24:24 CET Christian Schoenebeck wrote:
> > Send Twalk request with nwname=3D0. In this case no QIDs should
> > be returned by 9p server; this is equivalent to walking to dot.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >  tests/qtest/virtio-9p-test.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.=
c
> > index 22bdd74bc1..6c00da03f4 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -1002,6 +1002,27 @@ static void fs_walk_nonexistent(void *obj, void
> > *data, QGuestAllocator *t_alloc) do_walk_expect_error(v9p, "non-existen=
t",
> > ENOENT);
> >  }
> >=20
> > +static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_all=
oc)
> > +{
>=20
> Or maybe calling this function fs_walk_clone_fid and the test case name
> "synth/walk/clone_fid" respectively instead?
>=20

I agree that Twalk with nwname=3D0 does clone the fid in practice but
the test doesn't explicitly check that. In its present form, I'd
suggest a "no_names" wording but it is already fine as is, so:

Reviewed-by: Greg Kurz <groug@kaod.org>

> > +    QVirtio9P *v9p =3D obj;
> > +    alloc =3D t_alloc;
> > +    v9fs_qid root_qid;
> > +    g_autofree v9fs_qid *wqid =3D NULL;
> > +    P9Req *req;
> > +
> > +    do_version(v9p);
> > +    req =3D v9fs_tattach(v9p, 0, getuid(), 0);
> > +    v9fs_req_wait_for_reply(req, NULL);
> > +    v9fs_rattach(req, &root_qid);
> > +
> > +    req =3D v9fs_twalk(v9p, 0, 1, 0, NULL, 0);
> > +    v9fs_req_wait_for_reply(req, NULL);
> > +    v9fs_rwalk(req, NULL, &wqid);
> > +
> > +    /* special case: no QID is returned if nwname=3D0 was sent */
> > +    g_assert(wqid =3D=3D NULL);
> > +}
> > +
> >  static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_a=
lloc)
> > {
> >      QVirtio9P *v9p =3D obj;
> > @@ -1435,6 +1456,7 @@ static void register_virtio_9p_test(void)
> >      qos_add_test("synth/walk/basic", "virtio-9p", fs_walk,  &opts);
> >      qos_add_test("synth/walk/no_slash", "virtio-9p", fs_walk_no_slash,
> >                    &opts);
> > +    qos_add_test("synth/walk/none", "virtio-9p", fs_walk_none, &opts);
> >      qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
> >                   fs_walk_dotdot,  &opts);
> >      qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonex=
istent,
>=20
>=20


