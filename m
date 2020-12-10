Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0412D5AA2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:36:51 +0100 (CET)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLBi-0003AK-KG
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKYI-0000VU-Bm
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:56:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1knKYC-0001Ch-7x
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:56:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607601359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MucEp2q9Z+8tlAqhqnNq4svdhUxR95XxXhNV9vCD9Kw=;
 b=L2QwYC2LHZRYpVurznZ4Pcg5X2/FgZiqmeWPISmAERIpz/fmidHpR6BcDGw4ppILwOx06/
 Ip/TWiu4e60NEuTI9wNdev7twlV9Rm0ZHzv7XlNj9bUUIwR7eSOwdHJstJE/Qod7fRXk8N
 XJYtTY2zaeNaX/3g/YfX6rGsWKRveug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-Iu-oSkLwM9qwB-9bm14vaA-1; Thu, 10 Dec 2020 06:55:55 -0500
X-MC-Unique: Iu-oSkLwM9qwB-9bm14vaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14D46100C605;
 Thu, 10 Dec 2020 11:55:52 +0000 (UTC)
Received: from localhost (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 568F419C78;
 Thu, 10 Dec 2020 11:55:48 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:55:47 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC PATCH 13/27] vhost: Send buffers to device
Message-ID: <20201210115547.GH416119@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-14-eperezma@redhat.com>
 <20201208081621.GR203660@stefanha-x1.localdomain>
 <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf13ta5MtzmTUz2N5XnQ+ebqFPYAivdggL64LEQAf=y+A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y0Ed1hDcWxc3B7cn"
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

--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 07:41:23PM +0100, Eugenio Perez Martin wrote:
> On Tue, Dec 8, 2020 at 9:16 AM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> > On Fri, Nov 20, 2020 at 07:50:51PM +0100, Eugenio P=E9rez wrote:
> > > +        while (true) {
> > > +            int r;
> > > +            if (virtio_queue_full(vq)) {
> > > +                break;
> > > +            }
> >
> > Why is this check necessary? The guest cannot provide more descriptors
> > than there is ring space. If that happens somehow then it's a driver
> > error that is already reported in virtqueue_pop() below.
> >
>=20
> It's just checked because virtqueue_pop prints an error on that case,
> and there is no way to tell the difference between a regular error and
> another caused by other causes. Maybe the right thing to do is just to
> not to print that error? Caller should do the error printing in that
> case. Should we return an error code?

The reason an error is printed today is because it's a guest error that
never happens with correct guest drivers. Something is broken and the
user should know about it.

Why is "virtio_queue_full" (I already forgot what that actually means,
it's not clear whether this is referring to avail elements or used
elements) a condition that should be silently ignored in shadow vqs?

Stefan

--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/SDMMACgkQnKSrs4Gr
c8g6rQgAoyNP4PVcZp9IjF/ZpHcUkbIw8vq2zHMVYynE086IcL4SufcLEwnibkyk
6zkRHz9diZrDtE8JiVVDCgd335nP1fB5Gc6QtuTy6TP03GFD7jRCBtFuWZz0zPNJ
EhBn7yQGyh2MI6U5qE4cIZso2KQO0KxgU/TGSMcwY5dErD/LvDh+WZBIUVqpJvem
5/uSCeSkVXyHIwMzsTYV770Ja7yiiOeNSsODlonzy7GfBg05wnh7SCtVbyiKcvTF
n4KEqDQyurGvMZg4tExPxNL04bu9AAPvdK1QGjAfPdufdAPllV4xfiUEI5sOM9l1
N3hvUjX/foOV3ccIX3dyrNyRIa/mgA==
=x9KI
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--


