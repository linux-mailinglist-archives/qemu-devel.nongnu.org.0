Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FAD452F9F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:59:40 +0100 (CET)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwBf-0000N2-Pb
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:59:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmwAr-0007xO-41
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:58:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmwAn-0004OV-TP
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637060324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uS7VXILYAkCgDvXpBCxhVsvNcSvt5xqWnMa1D/NqrIA=;
 b=THOkcckAABtowyXqQRYb4H+L50zVzc176d/90vygNKiGx5psEuhi9FL/EqHSbZeLXdA5TI
 SoRgrMkFeZIjd9h7JEcia14BY2WrIzFFyvVjQ3FfFwMVZGtH33ZwijhtRNCz6KY767b5P1
 yud8dbKLoQB8HVpLfPUtfsMjz5qT2ZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-iTL4mvxlMeWrNVyqgaAWAg-1; Tue, 16 Nov 2021 05:58:41 -0500
X-MC-Unique: iTL4mvxlMeWrNVyqgaAWAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF9EA102CB2B;
 Tue, 16 Nov 2021 10:58:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 550E919723;
 Tue, 16 Nov 2021 10:58:31 +0000 (UTC)
Date: Tue, 16 Nov 2021 10:58:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Message-ID: <YZOO1hD/+AAMB/b5@stefanha-x1.localdomain>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com>
 <YZJq4E92zYQeqMy7@stefanha-x1.localdomain>
 <BL1PR11MB547976F230BB9EAE2E7C458BE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BL1PR11MB547976F230BB9EAE2E7C458BE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="swVu8HbinttUmNVG"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Kai Z" <kai.z.wang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>, "Qi,
 Yadong" <yadong.qi@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--swVu8HbinttUmNVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 02:03:15AM +0000, Qi, Yadong wrote:
> > > Add a new option "secdiscard" for block drive. Parse it and record it
> > > in bs->open_flags as bit(BDRV_O_SECDISCARD).
> > >
> > > Add a new BDRV_REQ_SECDISCARD bit for secure discard request from
> > > virtual device.
> > >
> > > For host_device backend: implement by ioctl(BLKSECDISCARD) on real
> > > host block device.
> > > For other backend, no implementation.
> > >
> > > E.g.:
> > >     qemu-system-x86_64 \
> > >     ... \
> > >     -drive
> > file=3D/dev/mmcblk0p2,if=3Dnone,format=3Draw,discard=3Don,secdiscard=3D=
on,id=3Dsd0 \
> > >     -device virtio-blk-pci,drive=3Dsd0,id=3Dsd0_vblk \
> > >     ...
> >=20
> > I'm curious why there is explicit control over this feature (-drive
> > secdiscard=3Don|off). For example, is there a reason why users would wa=
nt to
> > disable secdiscard on a drive that supports it? I guess there is no way=
 to emulate
> > it correctly so secdiscard=3Don on a drive that doesn't support it prod=
uces an error?
>=20
> Yes. AFAIK, there is no way to emulate a "secure" discard. But it seems a=
lso hard to
> detect whether a host drive support secdiscard unless it really perform a=
 real
> secdiscard. So I choose to add an option for user to enable it for virtua=
l block.
> There is an assumption that user knows whether host support secdiscard.

Question for Jens and Christoph:

Is there a way for userspace to detect whether a Linux block device
supports SECDISCARD?

If not, then maybe a new sysfs attribute can be added:

diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index cef1f713370b..c946ef49ac15 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -304,6 +304,7 @@ QUEUE_SYSFS_BIT_FNS(nonrot, NONROT, 1);
 QUEUE_SYSFS_BIT_FNS(random, ADD_RANDOM, 0);
 QUEUE_SYSFS_BIT_FNS(iostats, IO_STAT, 0);
 QUEUE_SYSFS_BIT_FNS(stable_writes, STABLE_WRITES, 0);
+QUEUE_SYSFS_BIT_FNS(secure_erase, SECERASE, 0);
 #undef QUEUE_SYSFS_BIT_FNS

 static ssize_t queue_zoned_show(struct request_queue *q, char *page)

Stefan

--swVu8HbinttUmNVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGTjtYACgkQnKSrs4Gr
c8h0tQgAgY9l8NmxZNRwlwUTEOESsBNQ+nG+/j7LqJZ+HWMzFthvzXYWvTJ9nkkC
Eb+04507twG3YbUcDfH3pSV/zM4UO6qrhChjbNLKGx4P9mKfgYlAMEWvZeoZajef
Gun3SPursVUEi4xG96OoJCxBC3VLMsofBkON32PGq5H9oiroVNRLAYqGmwq9mLnH
ezTyZJeGfBB0Hq5aLbP9Vm8T4t38WH4/Z5DXNNDgeifxkp0jiyd7GH/Vqt60ZkXS
J0F71xT10jQAx4eCF5l/NLOxCQXn21kFQbp14Rw8C776Hex0/l14HUIcedxuHpxy
46O1LIGoyJCcVM+13RtwTYEh/jc3zw==
=f6Yo
-----END PGP SIGNATURE-----

--swVu8HbinttUmNVG--


