Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA32F658D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:18:34 +0100 (CET)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05KQ-00014G-6R
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l057k-0004oK-91
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:05:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l057e-0003FZ-54
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:05:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610640316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I68XSCq9LgCzTbBHYJ8/EZx4SVvUDRpn5pgz9cEWB2Y=;
 b=XAC/YVIqj983MWBLR6PF0IVUVKkXE2WFdUljIQ/jbF9sx3hNvuo8IyLpmEgpWaVYOfTkIc
 gUx9rHJ6YeXci1HPFO9wOTi6fskuzhE4mgGqUJf+9jHG7ni8nN1ZX7fyWhj/KawDEwkfp3
 PhcJUsrMSQoQxBkogNQUR2p+vAobOqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-P1gn6wG5M3idT7hPkbPcLg-1; Thu, 14 Jan 2021 11:05:11 -0500
X-MC-Unique: P1gn6wG5M3idT7hPkbPcLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B047107ACF7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 16:05:10 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4C6650C0A;
 Thu, 14 Jan 2021 16:05:06 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:05:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH v2] Add virtio-blk and virtio-scsi configuration
 post
Message-ID: <20210114160505.GF292902@stefanha-x1.localdomain>
References: <20210105104907.33587-1-stefanha@redhat.com>
 <1284dc6b-0ce0-3d6e-ba54-067e91ca5dc8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1284dc6b-0ce0-3d6e-ba54-067e91ca5dc8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 03:04:20PM +0100, Thomas Huth wrote:
> On 05/01/2021 11.49, Stefan Hajnoczi wrote:
> > The second post in the storage series covers virtio-blk and virtio-scsi=
.
> > It compares the two and offers recommendations that users and tools
> > using QEMU can use as a starting point. Graphs are included comparing
> > the performance of various options.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > v2:
> >   * Mention default storage controllers for non-x86 [danpb]
> >   * Remove statement about read-only ISO virtio-blk devices, both Rich
> >     Jones and Daniel Berrange commented about this at different times s=
o
> >     I decided to drop it completely [danpb]
> >   * Clarify PCI slot limits and multi-function discussion for virtio-bl=
k
> >     [danpb]
> >   * Mention multiple virtio-scsi devices for NUMA tuning and that
> >     emulated LUNs can be HDDs or CD-ROMs [danpb]
> > ---
> >   ...020-12-17-virtio-blk-scsi-configuration.md | 115 +++++++++++++++++=
+
> >   screenshots/2020-09-15-scsi-devices.svg       |   1 +
> >   screenshots/2020-09-15-virtio-blk-vs-scsi.svg |   1 +
> >   3 files changed, 117 insertions(+)
> >   create mode 100644 _posts/2020-12-17-virtio-blk-scsi-configuration.md
> >   create mode 100644 screenshots/2020-09-15-scsi-devices.svg
> >   create mode 100644 screenshots/2020-09-15-virtio-blk-vs-scsi.svg
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
>=20
> Maybe mention "and other operating systems" as well? I assume virtio driv=
ers
> are also available for the various BSDs etc.

Will fix.

>=20
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
>=20
> I'd rather say "lots of devices" here instead of "28", since 28 needs an
> explanation (which you give below).

It's unclear whether "lots" means 5, 10, 100, or 1000. I think we should
give a number to help readers understand the scale.

>=20
> > +* Prefer virtio-blk in performance-critical use cases.
>=20
> Maybe move the virtio-blk bullet above the virtio-scsi bullet, so that th=
e
> two virtio-scsi bullets are listed next to each other? And it's also the
> order that you use below.

Will fix.

>=20
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
>=20
> I'd maybe add some more words here, saying that virtio-blk is really simp=
le,
> just read and write, and that other features might not be supported (like
> ejecting CD devices). Maybe also add a comment that it took a long time t=
o
> add an additional command like TRIM to the device?

I'll extend the next paragraph to also include devices with non-disk
functionality (like CD-ROMs). virtio-scsi is good for that.

> > +Applications that send SCSI commands are better served by the virtio-s=
csi
> > +device, which has full SCSI support. SCSI passthrough was removed from=
 the
> > +Linux virtio-blk driver in v5.6 in favor of using virtio-scsi.
>=20
> Since "passthrough" sounds like a passthrough of real hardware devices, I=
'd
> maybe rather say something like: The original virtio-blk devices also
> included the possibility to handle SCSI commands, but this features was
> removed from the Linux driver in v5.6 in favor of using virtio-scsi (and =
is
> also not available for modern virtio-1.0 devices anymore).

Guest SCSI commands were passed through to the physical LUN but what you
described sounds more like emulating SCSI commands, which is not what
the feature did.

I'm confused now. Should I keep the text or can you rephrase what you
mean?

> > +## Conclusion
> > +The virtio-blk and virtio-scsi offer a choice between a single block d=
evice and
> > +a full-fledged SCSI Host Bus Adapter. Virtualized guests typically use=
 one or
> > +both of them depending on functional and performance requirements. Thi=
s post
> > +compared the two and offered recommendations on how to choose between =
them.
> > +
> > +The next post in this series will discuss the iothreads feature that b=
oth
> > +virtio-blk and virtio-scsi support for increased performance.
>=20
> Do you maybe also want to give examples for the QEMU command line showing
> how virtio-blk and virtio-scsi can be used there?

Not in this post. In the upcoming NUMA tuning discussion I think syntax
is really helpful though.

Stefan

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAAa7EACgkQnKSrs4Gr
c8gk0QgAlNlryMEPLZEfBjmIgETZiOtuGaflMpb7dWgFaXAVlXB+OO/LP7ka713w
g6Z4dkqubC4N65YupKdpjNolyXkAkqucocFyg/dZ8KKPcthwgOKtjR64NQ8azHcl
81rmZqqSVO3/jU/nQzCvO09qkq6sekNmtzPm09DOZDxlm4aTrgWvRZED5DCdOjd8
NNe+HN215stcByS8i9kvpS0PFwXLKBf5Enr/1ffD8fBuDSEfSrvrXslOQU2PaLdX
XC9OlCpmUGfZJei7ZVRlOoetUHPyTIaP6ywBVsnYI/zoQNTeejg0s/FqJpC8sYE/
/qBPFHrC8Iv2dqkppUolgENagTUEdQ==
=SxjC
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--


