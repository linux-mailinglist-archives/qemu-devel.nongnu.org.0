Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF127B0FD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 17:35:31 +0200 (CEST)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMvBZ-00014o-Nw
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 11:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kMv9W-0000Hr-Ja
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kMv9U-0006w9-DT
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:33:22 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601307199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSsh20YvEl8fcKMztfvzM/V3SFXS9p6Jgzi2Qw7yLjE=;
 b=bAmI7wsh2WikDq2K2AyY3y8CNrp4AtZlHciuyaBKMrtVD785qQ6iKq/1PFoyEAMixm2qXr
 mfleGpSnKf6xcJQzW8RqpGdkuOc6FekFH10lCnAyhin8T9R/XKayXHzLJJdFdAPhBb96To
 +nFPdEPB1Ozjti0LZD41Y7TdlQlvJng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-DqLKx_rJOWyxG_odnJkQTA-1; Mon, 28 Sep 2020 11:33:15 -0400
X-MC-Unique: DqLKx_rJOWyxG_odnJkQTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 563181882FBB;
 Mon, 28 Sep 2020 15:33:13 +0000 (UTC)
Received: from localhost (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F25DB5D9DC;
 Mon, 28 Sep 2020 15:32:58 +0000 (UTC)
Date: Mon, 28 Sep 2020 16:32:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: Outline for VHOST_USER_PROTOCOL_F_VDPA
Message-ID: <20200928153257.GA173977@stefanha-x1.localdomain>
References: <20200928092537.GA44353@stefanha-x1.localdomain>
 <CAMxuvayJXbSVAG3yJPkb+_9OU5k623WKOksEpHjVU5eV9U=zKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvayJXbSVAG3yJPkb+_9OU5k623WKOksEpHjVU5eV9U=zKA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:29:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lulu@redhat.com, tiwei.bie@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, "Coquelin,
 Maxime" <maxime.coquelin@redhat.com>, "Hoffmann, Gerd" <kraxel@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, Nikos Dragazis <ndragazis@arrikto.com>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Daniele Buono <dbuono@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 03:21:56PM +0400, Marc-Andr=E9 Lureau wrote:
> On Mon, Sep 28, 2020 at 1:25 PM Stefan Hajnoczi <stefanha@redhat.com wrot=
e:
> > Where this converges with multi-process QEMU
> > --------------------------------------------
> > At this point QEMU can run ad-hoc vhost-user backends using existing
> > VIRTIO device models. It is possible to go further by creating a
> > qemu-dev launcher executable that implements the vhost-user spec's
> > "Backend program conventions". This way a minimal device emulator
> > executable hosts the device instead of a full system emulator.
> >
> > The requirements for this are similar to the multi-process QEMU effort,
> > which aims to run QEMU devices as separate processes. One of the main
> > open questions is how to design build system and Kconfig support for
> > building minimal device emulator executables.
> >
> > In the case of vhost-user-net the qemu-dev-vhost-user-net executable
> > would contain virtio-net-device, vhost-user-backend, any netdevs the
> > user wishes to include, a QMP monitor, and a vhost-user backend
> > command-line interface.
> >
> > Where does this leave us? QEMU's existing VIRTIO device models can be
> > used as vhost-user devices and run in a separate processes from the VMM=
.
> > It's a great way of reusing code and having the flexibility to deploy i=
t
> > in the way that makes most sense for the intended use case.
> >
>=20
> My understanding is that this would only be able to expose virtio
> devices from external processes. But vfio-user could expose more kinds
> of devices, including the virtio devices.
>=20
> Shouldn't we focus on vfio-user now, as the general out-of-process
> device solution?

Eventually vfio-user can replace vhost-user. However, vfio-user
development will take longer so for anyone already comfortable with
vhost-user I think extending the protocol with vDPA ioctls is
attractive.

Maybe we can get more organized around vfio-user and make progress
quicker?

Stefan

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9yAikACgkQnKSrs4Gr
c8iwNQgAtZyNM2vkCD8BPsvYWvN9YlsP6X4CVsGdti81xOmH4eoM1NN0QZfFhIx+
0OSeisWyZvixhwnJznd9Py797YXRCJ7yPNDLqPnRn5fw9qamqtLlYo01Z/3tjGKj
Wc+AzKwukQYuHhLZ59hoEsWtQh8cHnnvzApTwbK5ERAK/YeAzZyMIQUv5Yy6mSZy
hENW6nOHNH4tDYGN7JFLp/XGyro/W6CBivNBYYs2QQZs1xGAwI1lMHIBFYAO+9PQ
dYFR6LJSzVVQ6jyATKraks4jpzsfcfz50e8LUHzDOkLZYIH0Pcbs9GuvA0Gbg8fM
OaZhnaOXjEFalyX6WyqaHNbY51finA==
=06wC
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--


