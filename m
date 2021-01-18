Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1232FA79A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:33:26 +0100 (CET)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YP7-0007JD-76
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l1XwL-0006kD-9Q
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l1XwH-0007Zh-6C
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610989415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+XNB+5EyQcu+8cLmCnuiD6jvZwaizNzjfAwfcvvO9Ig=;
 b=RcR/fN9gffIJYcM+/6iN/UD+WcpBmhu+9LN29djLmpusIakWCB9miLn369wBr0Pzvx+S6z
 43fXKOvacVvbSGgsprt9k8OKFR8evXDisXeKhP0VFq9W8AT0IlmeFUrpXe65QxBDRhtJP5
 gA7HWtlbwRoCbo5RwMyJrFcqhHmA/Bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-xcNUvXkHOd201H7SzuVuWw-1; Mon, 18 Jan 2021 12:03:30 -0500
X-MC-Unique: xcNUvXkHOd201H7SzuVuWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADE6580DDF1
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 17:03:29 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5111060C77;
 Mon, 18 Jan 2021 17:03:26 +0000 (UTC)
Date: Mon, 18 Jan 2021 17:03:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [qemu-web PATCH v2] Add virtio-blk and virtio-scsi configuration
 post
Message-ID: <20210118170325.GE255498@stefanha-x1.localdomain>
References: <20210105104907.33587-1-stefanha@redhat.com>
 <a6cc92c5-3c6c-7c29-2f37-56ef25d6c585@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a6cc92c5-3c6c-7c29-2f37-56ef25d6c585@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 09:17:55PM +0100, Laszlo Ersek wrote:
> On 01/05/21 11:49, Stefan Hajnoczi wrote:
> > The second post in the storage series covers virtio-blk and virtio-scsi=
.
> > It compares the two and offers recommendations that users and tools
> > using QEMU can use as a starting point. Graphs are included comparing
> > the performance of various options.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > v2:
> >  * Mention default storage controllers for non-x86 [danpb]
> >  * Remove statement about read-only ISO virtio-blk devices, both Rich
> >    Jones and Daniel Berrange commented about this at different times so
> >    I decided to drop it completely [danpb]
> >  * Clarify PCI slot limits and multi-function discussion for virtio-blk
> >    [danpb]
> >  * Mention multiple virtio-scsi devices for NUMA tuning and that
> >    emulated LUNs can be HDDs or CD-ROMs [danpb]
> > ---
> >  ...020-12-17-virtio-blk-scsi-configuration.md | 115 ++++++++++++++++++
> >  screenshots/2020-09-15-scsi-devices.svg       |   1 +
> >  screenshots/2020-09-15-virtio-blk-vs-scsi.svg |   1 +
> >  3 files changed, 117 insertions(+)
> >  create mode 100644 _posts/2020-12-17-virtio-blk-scsi-configuration.md
> >  create mode 100644 screenshots/2020-09-15-scsi-devices.svg
> >  create mode 100644 screenshots/2020-09-15-virtio-blk-vs-scsi.svg
> >=20
> > diff --git a/_posts/2020-12-17-virtio-blk-scsi-configuration.md b/_post=
s/2020-12-17-virtio-blk-scsi-configuration.md
> > new file mode 100644
> > index 0000000..b4361f5
> > --- /dev/null
> > +++ b/_posts/2020-12-17-virtio-blk-scsi-configuration.md
> > @@ -0,0 +1,115 @@
> > +---
> > +layout: post
> > +title:  "Configuring virtio-blk and virtio-scsi Devices"
> > +date:   2021-01-05 07:00:00 +0000
> > +author: Stefan Hajnoczi and Sergio Lopez
> > +categories: [storage]
> > +---
> > +The [previous article](https://www.qemu.org/2020/09/14/qemu-storage-ov=
erview/)
> > +in this series introduced QEMU storage concepts. Now we move on to loo=
k at the
> > +two most popular emulated storage controllers for virtualization: virt=
io-blk
> > +and virtio-scsi.
> > +
> > +This post provides recommendations for configuring virtio-blk and virt=
io-scsi
> > +and how to choose between the two devices. The recommendations provide=
 good
> > +performance in a wide range of use cases and are suitable as default s=
ettings
> > +in tools that use QEMU.
> > +
> > +## Virtio storage devices
> > +### Key points
> > +* Prefer virtio storage devices over other emulated storage controller=
s.
> > +* Use the latest virtio drivers.
> > +
> > +Virtio devices are recommended over other emulated storage controllers=
 as they
> > +are generally the most performant and fully-featured storage controlle=
rs in
> > +QEMU.
> > +
> > +Unlike emulations of hardware storage controllers, virtio-blk and virt=
io-scsi
> > +are specifically designed and optimized for virtualization. The detail=
s of how
> > +they work are published for driver and device implementors in the [VIR=
TIO
> > +specification](https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v=
1.1.html).
> > +
> > +Virtio drivers are available for both Linux and Windows virtual machin=
es.
> > +Installing the latest version is recommended for the latest bug fixes =
and
> > +performance enhancements.
> > +
> > +If virtio drivers are not available, the AHCI (SATA) device is widely =
supported
> > +by modern x86 operating systems and can be used as a fallback. On non-=
x86
> > +guests the default storage controller can be used as a fallback.
> > +
> > +## Comparing virtio-blk and virtio-scsi
> > +### Key points
> > +* Prefer virtio-scsi for attaching more than 28 disks or for full SCSI=
 support.
> > +* Prefer virtio-blk in performance-critical use cases.
> > +* With virtio-scsi, use scsi-block for SCSI passthrough and otherwise =
use scsi-hd.
> > +
> > +Two virtio storage controllers are available: virtio-blk and virtio-sc=
si.
> > +
> > +### virtio-blk
> > +The virtio-blk device presents a block device to the virtual machine. =
Each
> > +virtio-blk device appears as a disk inside the guest. virtio-blk was a=
vailable
> > +before virtio-scsi and is the most widely deployed virtio storage cont=
roller.
> > +
> > +The virtio-blk device offers high performance thanks to a thin softwar=
e stack
> > +and is therefore a good choice when performance is a priority.
> > +
> > +Applications that send SCSI commands are better served by the virtio-s=
csi
> > +device, which has full SCSI support. SCSI passthrough was removed from=
 the
> > +Linux virtio-blk driver in v5.6 in favor of using virtio-scsi.
>=20
> Is "discard=3Dunmap" worth mentioning specifically? For me, that was the
> reason for switching practically all my domains to virtio-scsi from
> virtio-blk. ("Delete files in the guest, recover space on the host.")

virtio-blk supports discard since Linux commit
1f23816b8eb8fdc39990abe166c10a18c16f6b21 ("virtio_blk: add discard and
write zeroes support"). The feature was added in 2018 so you now have
the choice between virtio-blk or virtio-scsi again :).

Stefan

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAFv10ACgkQnKSrs4Gr
c8ilOggAwrKIjKFI7ObX2qe5gy0blK+Bi10gIsV1BQQ9k9aT7FZtqs/1m14v1USF
raAthHbI6eYopk68PV8tPYqJL6MWDPeqO8VhD8rEnqFWck+NuA6A0Wl0FYjdP1HD
Za7boRWveCKlbTJ6d/XDEjCtZtcu5/w0OrdoV5UA1YX5BLZY6ixzWTHhqxHU2njG
G6mwi8j+O2X37bnTVeDEBP33VTKMf2eFIvolibhmiz18rPwkhwF+1e32dwwGhGyU
yBDwKptqFsTCDU8MEaY26UcsErht5xGdyZAlsUbz81hJ86geaTUQNI87isiE5VsV
4oiTaxM+R7goxaRpxpktrs9er0eZ2Q==
=NhVP
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--


