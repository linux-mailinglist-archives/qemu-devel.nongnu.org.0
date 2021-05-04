Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28412372C12
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:33:16 +0200 (CEST)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldw6t-00087y-9R
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldw57-0007A5-A2
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldw55-0002Rw-Lu
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620138682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+a+HYYyG5igr0zdtW1YVXboaOmLwhdWJFr/ySpI2SCM=;
 b=QOojCtB0z8mgDgmWGF53aUlPjit4+N+nQE7aHWNK7tpJepfodvBtna4lJ3G70DqAolCPg+
 tE7CDN6N+WEkKglMgjP0iCWDAyjVwHRF0Dn5AX9suGx/eNgc02XKDmNZSpyCKi7JV+KQxD
 cIL2pt2rj26LkYeyHYBTwFg/rtGBc30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-6u2mFXZwPsGTIWjuu16vYg-1; Tue, 04 May 2021 10:31:20 -0400
X-MC-Unique: 6u2mFXZwPsGTIWjuu16vYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 855E0835DE5;
 Tue,  4 May 2021 14:31:19 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 222D15C1B4;
 Tue,  4 May 2021 14:31:18 +0000 (UTC)
Date: Tue, 4 May 2021 15:31:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
Message-ID: <YJFatjRiRvSq/zrn@stefanha-x1.localdomain>
References: <20210429155221.1226561-1-stefanha@redhat.com>
 <YIrb3IboF11GJ2nm@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <YIrb3IboF11GJ2nm@angien.pipo.sk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="stOiPwCSE5jajwq0"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--stOiPwCSE5jajwq0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 06:16:28PM +0200, Peter Krempa wrote:
> On Thu, Apr 29, 2021 at 16:52:21 +0100, Stefan Hajnoczi wrote:
> > The scsi=3Don|off property was deprecated in QEMU 5.0 and can be remove=
d
> > completely at this point.
> >=20
> > Drop the scsi=3Don|off option. It was only available on Legacy virtio-b=
lk
> > devices. Linux v5.6 already dropped support for it.
> >=20
> > Remove the hw_compat_2_4[] property assignment since scsi=3Don|off no
> > longer exists. Old guests with Legacy virtio-blk devices no longer see
> > the SCSI host features bit.
>=20
> Does this mean that qemu rejects it if it's explicitly enabled on the
> commandline?=20

Yes.

Stefan

--stOiPwCSE5jajwq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRWrYACgkQnKSrs4Gr
c8j6HQf7BHAv5lsucqbo+3nNUwl9tv0ofGhp0lo0ZuboDSS3bYBCxAmrTzUa+9ns
DytfgwPvnXzYOgFoyw0BSxT/8cJAQ2eyD0DfaizFpyIzo6nFhPNTo5dyllHvgrRn
ySFIGf1dl4PBRIfInWzT43YLoePv34nZ0MKWKoEq7LaNA+/Kb9MP4osSRLpRLkVW
0xUTHvJnz1Iz04NUgsWjrcJysNJFLRydGqmCvFEgDyMtn7dO2+GQiyvr1gNmElS7
7pgSA5zf0jaqX8EfiyHtehJoCxeVBfzEEcKjysmN8+3N33fVaz+jDn35BsdSP4kk
/FidObvgEGuUKryMybX8mOiwUaqW9w==
=ABHk
-----END PGP SIGNATURE-----

--stOiPwCSE5jajwq0--


