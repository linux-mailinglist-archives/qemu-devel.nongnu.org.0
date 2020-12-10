Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6822D593F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:33:57 +0100 (CET)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKCk-0005s0-Jw
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKAd-0004t2-81
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:31:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKAb-0001PE-KL
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607599896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0vpeFoxvipiFfHjrK3SmcHRfsuQ3JzQdub6tkzQBRZk=;
 b=AmeZAkkhUfvHpCvF4rQkCCdDVbRnXxwiRq0to+RVCLLujb/GXeXK4uDRG0HxNFCmftdbMI
 +etWsfLUDTqLnwbKhGm0Da4lFaedirHBzN5aXghUbTxToBkL5J035+mAWVphgpamzxC9AH
 gAhNJQrbvwV/jd+1CbGx0ag0N0PsMZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-IPyTpgFpPWuti1cYkS4kHA-1; Thu, 10 Dec 2020 06:31:33 -0500
X-MC-Unique: IPyTpgFpPWuti1cYkS4kHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0353810CE7BC;
 Thu, 10 Dec 2020 11:30:53 +0000 (UTC)
Received: from localhost (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 380665D9DD;
 Thu, 10 Dec 2020 11:30:52 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:30:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH 05/27] vhost: Add hdev->dev.sw_lm_vq_handler
Message-ID: <20201210113051.GF416119@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-6-eperezma@redhat.com>
 <20201207165216.GL203660@stefanha-x1.localdomain>
 <CAJaqyWfSUHD0MU=1yfU1N6pZ4TU7prxyoG6NY-VyNGt=MO9H4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfSUHD0MU=1yfU1N6pZ4TU7prxyoG6NY-VyNGt=MO9H4g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wtjvnLv0o8UUzur2"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 04:02:56PM +0100, Eugenio Perez Martin wrote:
> On Mon, Dec 7, 2020 at 5:52 PM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> > On Fri, Nov 20, 2020 at 07:50:43PM +0100, Eugenio P=E9rez wrote:
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 9179013ac4..9a69ae3598 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -2628,24 +2628,32 @@ static void virtio_net_tx_bh(void *opaque)
> > >      }
> > >  }
> > >
> > > -static void virtio_net_add_queue(VirtIONet *n, int index)
> > > +static void virtio_net_add_queue(VirtIONet *n, int index,
> > > +                                 VirtIOHandleOutput custom_handler)
> > >  {
> >
> > We talked about the possibility of moving this into the generic vhost
> > code so that devices don't need to be modified. It would be nice to hid=
e
> > this feature inside vhost.
>=20
> I'm thinking of tying it to VirtQueue, allowing the caller to override
> the handler knowing it is not going to be called (I mean, not offering
> race conditions protection, like before of starting processing
> notifications in qemu calling vhost_dev_disable_notifiers).

Yes, I can see how at least part of this belongs to VirtQueue.

Stefan

--wtjvnLv0o8UUzur2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/SBusACgkQnKSrs4Gr
c8iLwgf/aaGiY0DHn8I8FYdQGoreiYRr1SK+yJ4QWre7tvYsACl3EXz8Uq2PKZRo
+7NkNHIwhXEpcb1usOfH5PrUw4pRoMH78oQckxlnJtoQOdKiYi1SikAQKxOrooRs
Cn4E2SA9vVnDyCa0ZFs83GkRJyhnsLfs/AOYtWk/t2JdxzXWZhbewHgI3lUhy5qN
nLo/wINyWrndWt1HoI7HFbe82IDwhpwh5ACBxlb5579HaSwJsI/HX4k+jcHEJGAl
S7wSdufuVz9xzQ07r3fIWjTh9GsVJRJhHS3cfUcYmL/7CbmkGxYOiHPveHLEPogL
0G812OH8HJc+Hde+Ce/yAwlHGjXPFw==
=/sJb
-----END PGP SIGNATURE-----

--wtjvnLv0o8UUzur2--


