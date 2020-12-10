Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403552D5AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:40:49 +0100 (CET)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLFX-0007FS-UX
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKa2-0002q7-1A
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKZy-0001iP-Jb
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607601469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+gQ9iINAWDXR5JwO1kT+v2+a0wsEJwps06F6jliWiHg=;
 b=DAW1g+CzcU3QHaEKuM5kxTDvNAa6W0SfgptrhwUrPHxL6ob9HH+yYU2zON3G+apDjLHIL1
 NqD8EOTsjJJ7YqKC84rAiAtMJ2FUr7vbWlk5G2VKqBaBuUyMHzvpfYq7bQAYaRbpc6Rxe3
 bA5hVgv9LcQ9q0ZrblmFAJCqJrh81qM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-uuDY_b2UP4KRLbhduxHdtQ-1; Thu, 10 Dec 2020 06:57:46 -0500
X-MC-Unique: uuDY_b2UP4KRLbhduxHdtQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14A6F1005513;
 Thu, 10 Dec 2020 11:57:43 +0000 (UTC)
Received: from localhost (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48B0C5C67A;
 Thu, 10 Dec 2020 11:57:29 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:57:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH 16/27] virtio: Expose virtqueue_alloc_element
Message-ID: <20201210115729.GI416119@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-17-eperezma@redhat.com>
 <20201208082552.GT203660@stefanha-x1.localdomain>
 <CAJaqyWdN7iudf8mDN4k4Fs9j1x+ztZARuBbinPHD3ZQSMH1pyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdN7iudf8mDN4k4Fs9j1x+ztZARuBbinPHD3ZQSMH1pyQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dMdWWqg3F2Dv/qfw"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dMdWWqg3F2Dv/qfw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 07:46:49PM +0100, Eugenio Perez Martin wrote:
> On Tue, Dec 8, 2020 at 9:26 AM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> >
> > On Fri, Nov 20, 2020 at 07:50:54PM +0100, Eugenio P=E9rez wrote:
> > > Specify VirtQueueElement * as return type makes no harm at this momen=
t.
> >
> > The reason for the void * return type is that C implicitly converts voi=
d
> > pointers to pointers of any type. The function takes a size_t sz
> > argument so it can allocate a object of user-defined size. The idea is
> > that the user's struct embeds a VirtQueueElement field. Changing the
> > return type to VirtQueueElement * means that callers may need to
> > explicitly cast to the user's struct type.
> >
> > It's a question of coding style but I think the void * return type
> > communicates what is going on better than VirtQueueElement *.
>=20
> Right, what I meant with that is that nobody uses that feature, but I
> just re-check and I saw that contrib/vhost-user-blk actually uses it
> (not checked for more uses). I think it is better just to drop this
> commit.

contrib/vhost-user-blk doesn't use hw/virtio/virtio.c. The code is
similar and copy-pasted, but you are free to change this file without
affecting vontrib/vhost-user-blk :).

I still think it's clearer to make it obvious that this function
allocates an object of generic type or at least the change is purely a
question of style and probably not worth making.

Stefan

--dMdWWqg3F2Dv/qfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/SDSgACgkQnKSrs4Gr
c8gBXggAw53QuLAS8n2bgSqAmCJga4/haYpDTp+tcWdB6R0QXZYfoJpiYcwL6Xor
xVRBetMYe7/mi+28pZ8gklFMpXUoxN4ZqJiIfGUXlLzhUaT5nkpvfxqyhnXkf1Hy
GqNiuv+V6U6kEvlVKK5ImLovsDj9xN6Gy80NUSk1a689Z+6qlD6zs21HAGOSpl47
ZsDLjAP6SMiYE6ZTVxvm42vBho0ixxW/ulW1BxlAOzWnukknFQr1Ci5Hl3RMsDmR
TmaccrPr8RgZtRzOVIOT/MhxCxBke95BKC5SQiLeooYIGGr6kIvIfEonTBCgLBkO
06D5WVldB7oAONWscYTRjJzqlKSUIA==
=090p
-----END PGP SIGNATURE-----

--dMdWWqg3F2Dv/qfw--


