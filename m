Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8817151C3A9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:16:17 +0200 (CEST)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdDE-0004Cx-MN
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdBH-0003Ot-AL
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:14:15 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:24808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdBF-000762-7K
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651763652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IHznhH5ocLY9F1OPj2Tu6OjKWoGnIonByMduJLvylxs=;
 b=CpdydY8W2S8ScKC2c6jgPVKGRL0/velrKtJz2/z0J3NlXmZMZ2MeuxkHFiemclh6BPhaGq
 yIZEomnTE7H42/BeYWSc5pSgSjDzj6pNh0cSKQC5x3xZt2anKg4Nf3GzyR/Blz0scYPs4l
 H0RoJEhcx+BdAFJNcgXuiIhPQ9J0TD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-J0Uqxm4rPbiExmoQTNC9FA-1; Thu, 05 May 2022 11:14:09 -0400
X-MC-Unique: J0Uqxm4rPbiExmoQTNC9FA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E8F685A5A8;
 Thu,  5 May 2022 15:14:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DFDEC28122;
 Thu,  5 May 2022 15:14:07 +0000 (UTC)
Date: Thu, 5 May 2022 16:14:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 07/17] vfio-user: define vfio-user-server object
Message-ID: <YnPpv+7S4PhkfK4R@stefanha-x1.localdomain>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
 <871qx97c8s.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hGbt/O92pzPTKu9d"
Content-Disposition: inline
In-Reply-To: <871qx97c8s.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--hGbt/O92pzPTKu9d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 01:45:07PM +0200, Markus Armbruster wrote:
> Jagannathan Raman <jag.raman@oracle.com> writes:
>=20
> > Define vfio-user object which is remote process server for QEMU. Setup
> > object initialization functions and properties necessary to instantiate
> > the object
> >
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > ---
> >  qapi/qom.json               |  20 +++-
> >  include/hw/remote/machine.h |   2 +
> >  hw/remote/machine.c         |  27 +++++
> >  hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
> >  MAINTAINERS                 |   1 +
> >  hw/remote/meson.build       |   1 +
> >  hw/remote/trace-events      |   3 +
> >  7 files changed, 262 insertions(+), 2 deletions(-)
> >  create mode 100644 hw/remote/vfio-user-obj.c
> >
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index eeb5395ff3..582def0522 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -703,6 +703,20 @@
> >  { 'struct': 'RemoteObjectProperties',
> >    'data': { 'fd': 'str', 'devid': 'str' } }
> > =20
> > +##
> > +# @VfioUserServerProperties:
> > +#
> > +# Properties for x-vfio-user-server objects.
> > +#
> > +# @socket: socket to be used by the libvfio-user library
> > +#
> > +# @device: the id of the device to be emulated at the server
>=20
> Suggest "the ID", because "id" is not a word.

id (noun)
1. In Freudian theory, the division of the psyche that is totally unconscio=
us and serves as the source of instinctual impulses and demands for immedia=
te satisfaction of primitive needs.
2. In Weismann's doctrine of germ-plasm, the substance of inheritance or th=
e bearer , in the germ-plasm, of the hereditary qualities of a single compl=
ete organism.
3. In the somatic idioplasm of the hereditary qualities of a group of cells=
 or a part of a developing embryo or growing organism.
https://duckduckgo.com/?q=3Ddefine+id&ia=3Ddefinition

:D :D :D

Stefan

--hGbt/O92pzPTKu9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz6b8ACgkQnKSrs4Gr
c8g3Lwf5ARXYFW0Xbgo/o6RBTYfeT+G0auNpi7EMAMBpIIjDpNIK7EW60GgbK6uk
H5OTmWMF9yoiDSLR2Awj3iOnDNYeOZTSOm4gui+taQ3MXpW265yrsqh5GJe2fl2v
La4V2izZDdctwcpE3tS+Skgw45x6GoT0u5lsqB/QQkEPXVuYJ6PKg10/1123oXqC
ubK2R6X/VBoiESEDPqKzHIWBKsQPKxpxggrB7sCJy6QVtDls/tzDSwzI4rvD+giy
m3g91nsdiMQ65qMbY21BzG+dXkhPA7xTxp++WA+B+joIBLPX/VUqsfxNiDlkE4XJ
ILgxEnWrqweLljIxfRqC0e8zbs8cIg==
=6cWn
-----END PGP SIGNATURE-----

--hGbt/O92pzPTKu9d--


