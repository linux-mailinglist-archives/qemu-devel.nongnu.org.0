Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A73371D6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:54:02 +0100 (CET)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJtB-00054P-Tj
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKJs6-0004Ws-2C
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:52:54 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKJs3-0004y4-0g
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:52:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A51718EDAD2F;
 Thu, 11 Mar 2021 12:52:47 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 11 Mar
 2021 12:52:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a387d7f3-17d6-4fb3-83d4-e56f7944e5cd,
 58A3AAFCCF725AA0952C8F912993319916779E2B) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 11 Mar 2021 12:52:45 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Message-ID: <20210311125245.5127cd6d@bahia.lan>
In-Reply-To: <2248579.lIZarMFqrv@silver>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-9-ma.mandourr@gmail.com>
 <2248579.lIZarMFqrv@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: a9665246-8e47-4407-8f82-e5f619470f9b
X-Ovh-Tracer-Id: 328481300130601437
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvtddgfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmrgdrmhgrnhguohhurhhrsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 11:49:06 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 11. M=C3=A4rz 2021 04:15:37 CET Mahmoud Mandour wrote:
> > Replaced a call to qemu_mutex_lock and its respective call to
> > qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
> > This simplifies the code by removing the call required to unlock
> > and also eliminates goto paths.
> >=20
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >  hw/9pfs/9p-synth.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > index 7eb210ffa8..473ef914b0 100644
> > --- a/hw/9pfs/9p-synth.c
> > +++ b/hw/9pfs/9p-synth.c
> > @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int
> > mode, if (!parent) {
> >          parent =3D &synth_root;
> >      }
> > -    qemu_mutex_lock(&synth_mutex);
> > +    QEMU_LOCK_GUARD(&synth_mutex);
> >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> >          if (!strcmp(tmp->name, name)) {
> >              ret =3D EEXIST;
> > -            goto err_out;
> > +            return ret;
> >          }
> >      }
> >      /* Add the name */
> > @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int =
mode,
> > node->attr, node->attr->inode);
> >      *result =3D node;
> >      ret =3D 0;
> > -err_out:
> > -    qemu_mutex_unlock(&synth_mutex);
> >      return ret;
> >  }
> >=20
> > @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *paren=
t,
> > int mode, parent =3D &synth_root;
> >      }
> >=20
> > -    qemu_mutex_lock(&synth_mutex);
> > +    QEMU_LOCK_GUARD(&synth_mutex);
> >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> >          if (!strcmp(tmp->name, name)) {
> >              ret =3D EEXIST;
> > -            goto err_out;
> > +            return ret;
> >          }
> >      }
> >      /* Add file type and remove write bits */
> > @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent,=
 int
> > mode, pstrcpy(node->name, sizeof(node->name), name);
> >      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
> >      ret =3D 0;
> > -err_out:
> > -    qemu_mutex_unlock(&synth_mutex);
> >      return ret;
> >  }
>=20
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>=20
> Greg, I suggest I'll push this onto my queue as you seem to be busy.
>=20

This cleanup spans over multiple subsystems but I think it makes more
sense to keep all these patches together. Let's wait for everyone to
ack/review and then we'll decide how to merge the patches.

> Best regards,
> Christian Schoenebeck
>=20
>=20


