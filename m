Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99DA23DA60
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 14:38:12 +0200 (CEST)
Received: from localhost ([::1]:42776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3f9v-00071j-VK
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 08:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k3f95-0006b9-1x
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 08:37:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42754
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k3f92-00047E-Id
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 08:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596717435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tN2sMYMwsQ3G5dSBIkNzQppt6QfK6XmpbHerIFWDHlU=;
 b=AVIhBpCIGD2ZIocN95wbgOy5vCGnDZNA2xNzPfn+rxXvhMiK1OdM79IjQvlXV6/qI8YHJJ
 btZ7QRruV9tys9mp2XAg+PMIceByL9Pq0Iw8LLHQBTsDjJJ+zVaonsvXZ5iu174JmB1/CH
 z3qax5XRdXrwqJ9LgJ0qh0BHdiHcnwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-eh1D9ZqUNNStzrd2I6G3XQ-1; Thu, 06 Aug 2020 08:37:13 -0400
X-MC-Unique: eh1D9ZqUNNStzrd2I6G3XQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E45106B248;
 Thu,  6 Aug 2020 12:37:12 +0000 (UTC)
Received: from localhost (ovpn-114-7.ams2.redhat.com [10.36.114.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F2605C1BD;
 Thu,  6 Aug 2020 12:37:09 +0000 (UTC)
Date: Thu, 6 Aug 2020 13:37:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: Any reason VIRTQUEUE_MAX_SIZE is 1024? Can we increase this limit?
Message-ID: <20200806123708.GC379937@stefanha-x1.localdomain>
References: <AM7PR05MB6695D4FF6766BF2942C345D6BB710@AM7PR05MB6695.eurprd05.prod.outlook.com>
 <20200805121107.GG361702@stefanha-x1.localdomain>
 <20200805081144-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200805081144-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:24:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: jasowang@redhat.com, Yajun Wu <yajunw@mellanox.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 08:13:29AM -0400, Michael S. Tsirkin wrote:
> On Wed, Aug 05, 2020 at 01:11:07PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Jul 30, 2020 at 07:46:09AM +0000, Yajun Wu wrote:
> > > I'm doing iperf test on VIRTIO net through vhost-user(HW VDPA).
> > > Find maximal acceptable tx_queue_size/rx_queue_size is 1024.
> > > Basically increase queue size can get better RX rate for my case.
> > >=20
> > > Can we increase the limit(VIRTQUEUE_MAX_SIZE) to 8192 to possibly gai=
n better performance?
> >=20
> > Hi,
> > The VIRTIO 1.1 specification says the maximum number of descriptors is
> > 32768 for both split and packed virtqueues.
> >=20
> > The vhost kernel code seems to support 32768.
> >=20
> > The 1024 limit is an implementation limit in QEMU. Increasing it would
> > require QEMU code changes. For example, VIRTQUEUE_MAX_SIZE is used as
> > the size of arrays.
> >=20
> > I can't think of a fundamental reason why QEMU needs to limit itself to
> > 1024 descriptors. Raising the limit would require fixing up the code an=
d
> > ensuring that live migration remains compatible with older versions of
> > QEMU.
> >=20
> > Stefan
>=20
> There's actually a reason for a limit: in theory the vq size
> also sets a limit on the number of scatter/gather entries.
> both QEMU and vhost can't handle a packet split over > 1k chunks.
>=20
> We could add an extra limit for s/g size like block and scsi do,
> this will need spec, guest and host side work.

Interesting, thanks for explaining! This could be made explicit by
changing the QEMU code to:

include/hw/virtio/virtio.h:#define VIRTQUEUE_MAX_SIZE IOV_MAX

Looking more closely at the vhost kernel code I see that UIO_MAXIOV is
used in some places but not in vhost_vring_set_num() (ioctl
VHOST_SET_VRING_NUM). Is there a reason why UIO_MAXIOV isn't enforced
when the application sets the queue size?

Stefan

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8r+XQACgkQnKSrs4Gr
c8iAnwf/dRpWwH7qXOweO3BLTWgANA77J7IaSMxAN8bg6wYd1mXAbvb5s8nZmNW7
fSIqOp6P8Erl7EiG/e1spPnwCQRFJtsCYQRvFTbgPqL9nIP2ZDN4MCpKfS/IKt4u
Ry+pr0rpmKNWxjB9t9if1LsY95G7RuWBi8Yryn51NezJqOOJLWWClNRi7ny6A+RK
dqaD2s5PX5spekIoGjdvcsV6XG3zg1lQSx7+x4R6afDmF8M9sCELRM7LzvS0o1Wv
1OtZ0foJGoSg8SrDeT4vmGWIbxihgjbQgUbZmskhF/GABHTP7vXv3g5x7RlR+916
UuX18WcGWMeKchHbovChY+g295fQzw==
=k5HU
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--


