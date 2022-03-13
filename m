Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB74D751B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 13:06:30 +0100 (CET)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTMzU-0004Gs-Nb
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 08:06:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTMyE-0003Rj-Lv
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 08:05:10 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTMyB-0000ZC-Lj
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 08:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=qyszWsz7kVDbaSUHZRprswgzSPXC4AX+i7GaFyFYBDk=; b=MdoHBLFwKXb5I9xhm4VxoI79nX
 3KScbQID0zA5/GcGzeSrA1wcnbRR1Y3PHMzpHWN4OTeAzuVVQ7oUTOCt1dCynDjHa+68+ZFd/cALo
 B6AW0VZwttsafX4LLW9YsoSMMKgp4DJNQzsEi98vvAWBTm+puhz7pALPTQCNtx51716j/MjlXe20I
 FWhc7nwoBaG6hlJL0Epa6MsJRZS7leFsIsqRFlLJgmoG6Pqb7AhMcXe3ZjYI1keoTUaAtyVnzMsWG
 fetkqrJoxuWSCL1nCNopd9+X+Eh/R85a0n5sLbFFD7PksvZ5fAYGE6c/izAcOz9cn+9eAwc1nSdCA
 QvzlZ2IN26BE8k3XH68b90kFSTB0LXZBNbsBx4e0w9Svr2oESe10CpHZHvqeFT/rdZ9TBDLXTnDxt
 PpgxWYzbTTv4cKQuGv8S3Z1V46nIOWM6fFtWJX0EThJAfabCVkt5hCpWuwE6efWEWvZAlcOq4ZZzQ
 kKSwdzxJTINPBJxIzDCh+bRCwffO0qwJLmzFW5FL2EDatXZvd1V1iDGs7quWXk9jdT2YTAK9gJ+Xk
 rnza0ue1Uye8a9UoPcbmP48v0n4b2QJE493+FgfVT33XVlYMtn/mZZaaYVWmynta8gKGm2VxVSfxk
 zydZM077l6mr9j9b1LV1m82CY++DYk76bDaVGLjYw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 7/7] tests/9pfs: check fid being unaffected in
 fs_walk_2nd_nonexistent
Date: Sun, 13 Mar 2022 13:05:04 +0100
Message-ID: <3859307.hTDP4D0zbi@silver>
In-Reply-To: <29415460.1Kctidrl30@silver>
References: <cover.1647163863.git.qemu_oss@crudebyte.com>
 <c553fe1cfcfef7560240a40638b5ebc40a992863.1647163863.git.qemu_oss@crudebyte.com>
 <29415460.1Kctidrl30@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 13. M=E4rz 2022 11:27:56 CET Christian Schoenebeck wrote:
> On Sonntag, 13. M=E4rz 2022 10:28:32 CET Christian Schoenebeck wrote:
> > Extend previously added test case by checking that fid is unaffected
> > by 'Twalk' request (i.e. when 2nd path component of request being
> > invalid). Do that by comparing the QID of root fid with QID of walked
> > fid; they should be identical.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >=20
> >  tests/qtest/virtio-9p-test.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index f6e78d388e..b9c6819d01 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -721,14 +721,19 @@ static void fs_version(void *obj, void *data,
> > QGuestAllocator *t_alloc) do_version(obj);
> >=20
> >  }
> >=20
> > -static void do_attach(QVirtio9P *v9p)
> > +static void do_attach_rqid(QVirtio9P *v9p, v9fs_qid *qid)
> >=20
> >  {
> > =20
> >      P9Req *req;
> >     =20
> >      do_version(v9p);
> >      req =3D v9fs_tattach(v9p, 0, getuid(), 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> >=20
> > -    v9fs_rattach(req, NULL);
> > +    v9fs_rattach(req, qid);
> > +}
> > +
> > +static void do_attach(QVirtio9P *v9p)
> > +{
> > +    do_attach_rqid(v9p, NULL);
> >=20
> >  }
> > =20
> >  static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
> >=20
> > @@ -1101,19 +1106,22 @@ static void fs_walk_2nd_nonexistent(void *obj,
> > void
> > *data, {
> >=20
> >      QVirtio9P *v9p =3D obj;
> >      alloc =3D t_alloc;
> >=20
> > +    v9fs_qid root_qid;
> >=20
> >      uint16_t nwqid;
> >      g_autofree v9fs_qid *wqid =3D NULL;
> >      g_autofree char *path =3D g_strdup_printf(
> >     =20
> >          QTEST_V9FS_SYNTH_WALK_FILE "/non-existent", 0
> >     =20
> >      );
> >=20
> > -    do_attach(v9p);
> > +    do_attach_rqid(v9p, &root_qid);
> >=20
> >      do_walk_rqids(v9p, path, &nwqid, &wqid);
> >      /*
> >     =20
> >       * The 9p2000 protocol spec says: "nwqid is therefore either nwname
> >       or
> >=20
> > the * index of the first elementwise walk that failed."
> >=20
> >       */
> >     =20
> >      assert(nwqid =3D=3D 1);
> >=20
> > +    /* expect fid being unaffected by walk */
> > +    g_assert(wqid && wqid[0] && is_same_qid(root_qid, wqid[0]));
>=20
> Mmm, that's actually not checking whether fid was unaffected by the walk.=
 It
> just checks whether the QID returned by Rwalk equals the root QID, period.
>=20
> I suggest I leave this check here (just remove the false comment there),
> it's still OK to do that check, but additionally I would send a Tgetatrr =
on
> the walked fid to do the actual "fid unaffected" check?
>=20
> I'll wait to see if you spot something else before posting any v4.

There is something more cheesy: wqid[0] (i.e. first subdir) should actually=
=20
*NOT* be equal to the root QID. The g_assert check above however does not=20
fail.

After debugging this, the root cause seems to be that the 'synth' driver's=
=20
root node has the same inode number (zero) as the first subdirectory. The=20
following fixes this synth driver bug for me:

=2D-- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -92,7 +92,7 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
         }
     }
     /* Add the name */
=2D    node =3D v9fs_add_dir_node(parent, mode, name, NULL, synth_node_coun=
t++);
+    node =3D v9fs_add_dir_node(parent, mode, name, NULL, ++synth_node_coun=
t);
     v9fs_add_dir_node(node, parent->attr->mode, "..",
                       parent->attr, parent->attr->inode);
     v9fs_add_dir_node(node, node->attr->mode, ".",
@@ -130,7 +130,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int=
=20
mode,
     mode =3D ((mode & 0777) | S_IFREG);
     node =3D g_malloc0(sizeof(V9fsSynthNode));
     node->attr         =3D &node->actual_attr;
=2D    node->attr->inode  =3D synth_node_count++;
+    node->attr->inode  =3D ++synth_node_count;
     node->attr->nlink  =3D 1;
     node->attr->read   =3D read;
     node->attr->write  =3D write;

That way root node would have inode number zero, 1st subdir inode 1, and so=
=20
on.

Best regards,
Christian Schoenebeck



