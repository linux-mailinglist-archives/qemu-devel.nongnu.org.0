Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B4339CA2
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 08:52:58 +0100 (CET)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKz4z-0004V7-9K
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 02:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKz3k-0003hR-Af
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:51:41 -0500
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKz3W-0005c3-FG
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 02:51:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.72])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 0B57324EAF8;
 Sat, 13 Mar 2021 08:51:23 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Sat, 13 Mar
 2021 08:51:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00493fe079e-39b9-4635-8326-f78e7b89c71c,
 9E37A514F06DCB590C72484BFCF591CDCEC69E3E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Sat, 13 Mar 2021 08:51:21 +0100
From: Greg Kurz <groug@kaod.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 8/9] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
Message-ID: <20210313085121.625fe50e@bahia.lan>
In-Reply-To: <CAD-LL6iS11_2Z1hFa9-Or6J4-X2fKfMhriRMby5G3VEZhhpf9w@mail.gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <2248579.lIZarMFqrv@silver> <20210311125245.5127cd6d@bahia.lan>
 <2070220.8au7kWUZml@silver>
 <CAD-LL6iS11_2Z1hFa9-Or6J4-X2fKfMhriRMby5G3VEZhhpf9w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 44ca5e67-2a1c-419c-a7b0-fbfde03df270
X-Ovh-Tracer-Id: 7996704090710645213
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvfedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=groug@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Mar 2021 07:43:38 +0200
Mahmoud Mandour <ma.mandourr@gmail.com> wrote:

> Thanks for the fast review. I asked on the QEMU IRC channel
> before committing whether to put all the changes into one patch
> or split them and was instructed that it was better to split them up.
> But in any case I was open to both ways and you can decide
> on the best way to go.
>=20

People only do inline replies here. Please don't top-post for the
sake of clarity.

So, the instructions to split the patches is obviously the way to go. The
question here is rather : will each subsystem maintainer pick up patches
from this series or will only one maintainer pick up all the patches after
they have been acked by the other maintainers ?

> On Thu, Mar 11, 2021 at 1:59 PM Christian Schoenebeck <
> qemu_oss@crudebyte.com> wrote:
>=20
> > On Donnerstag, 11. M=C3=A4rz 2021 12:52:45 CET Greg Kurz wrote:
> > > On Thu, 11 Mar 2021 11:49:06 +0100
> > >
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > On Donnerstag, 11. M=C3=A4rz 2021 04:15:37 CET Mahmoud Mandour wrot=
e:
> > > > > Replaced a call to qemu_mutex_lock and its respective call to
> > > > > qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
> > > > > This simplifies the code by removing the call required to unlock
> > > > > and also eliminates goto paths.
> > > > >
> > > > > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > > > > ---
> > > > >
> > > > >  hw/9pfs/9p-synth.c | 12 ++++--------
> > > > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > > > >
> > > > > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > > > > index 7eb210ffa8..473ef914b0 100644
> > > > > --- a/hw/9pfs/9p-synth.c
> > > > > +++ b/hw/9pfs/9p-synth.c
> > > > > @@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *pare=
nt,
> > int
> > > > > mode, if (!parent) {
> > > > >
> > > > >          parent =3D &synth_root;
> > > > >
> > > > >      }
> > > > >
> > > > > -    qemu_mutex_lock(&synth_mutex);
> > > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > > >
> > > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > > >
> > > > >          if (!strcmp(tmp->name, name)) {
> > > > >
> > > > >              ret =3D EEXIST;
> > > > >
> > > > > -            goto err_out;
> > > > > +            return ret;
> > > > >
> > > > >          }
> > > > >
> > > > >      }
> > > > >      /* Add the name */
> > > > >
> > > > > @@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent,
> > int
> > > > > mode, node->attr, node->attr->inode);
> > > > >
> > > > >      *result =3D node;
> > > > >      ret =3D 0;
> > > > >
> > > > > -err_out:
> > > > > -    qemu_mutex_unlock(&synth_mutex);
> > > > >
> > > > >      return ret;
> > > > >
> > > > >  }
> > > > >
> > > > > @@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> > > > > *parent,
> > > > > int mode, parent =3D &synth_root;
> > > > >
> > > > >      }
> > > > >
> > > > > -    qemu_mutex_lock(&synth_mutex);
> > > > > +    QEMU_LOCK_GUARD(&synth_mutex);
> > > > >
> > > > >      QLIST_FOREACH(tmp, &parent->child, sibling) {
> > > > >
> > > > >          if (!strcmp(tmp->name, name)) {
> > > > >
> > > > >              ret =3D EEXIST;
> > > > >
> > > > > -            goto err_out;
> > > > > +            return ret;
> > > > >
> > > > >          }
> > > > >
> > > > >      }
> > > > >      /* Add file type and remove write bits */
> > > > >
> > > > > @@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode
> > *parent,
> > > > > int
> > > > > mode, pstrcpy(node->name, sizeof(node->name), name);
> > > > >
> > > > >      QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
> > > > >      ret =3D 0;
> > > > >
> > > > > -err_out:
> > > > > -    qemu_mutex_unlock(&synth_mutex);
> > > > >
> > > > >      return ret;
> > > > >
> > > > >  }
> > > >
> > > > Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > >
> > > > Greg, I suggest I'll push this onto my queue as you seem to be busy.
> > >
> > > This cleanup spans over multiple subsystems but I think it makes more
> > > sense to keep all these patches together. Let's wait for everyone to
> > > ack/review and then we'll decide how to merge the patches.
> >
> > Sure, makes sense.
> >
> >
> >
> >


