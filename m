Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF523CA01
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 12:48:39 +0200 (CEST)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3GyM-0007ys-D5
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 06:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k3Gvt-0005y0-Bp
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 06:46:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20786
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k3Gvr-0006lG-Nf
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 06:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596624362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t4/eWtjVdSLozrwPmNYoGkjjXvW8T77B5R2x9je2dzQ=;
 b=Kk421EpjleAgJgHEyk0c6UjGFHZkZubpFduIOVqTXhk/7XBitK+SsqRmOZLvoOh1UZadTf
 BXgoDcz+zcAlRurRx7m3xGZ+IIfr0CwXcpa63j1LAh2izfd1HMF9836z/APoYWCfERY/Z8
 eSAUkeRYedVgSe8PUogUvntzW6gobkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-kkK71MSUNt6yO8GZrM3s7w-1; Wed, 05 Aug 2020 06:46:00 -0400
X-MC-Unique: kkK71MSUNt6yO8GZrM3s7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78DDB8015F3;
 Wed,  5 Aug 2020 10:45:59 +0000 (UTC)
Received: from localhost (ovpn-114-155.ams2.redhat.com [10.36.114.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE18C5D9DC;
 Wed,  5 Aug 2020 10:45:55 +0000 (UTC)
Date: Wed, 5 Aug 2020 11:45:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v3 6/7] scsi: Add scsi_device_get
Message-ID: <20200805104554.GC361702@stefanha-x1.localdomain>
References: <20200715150159.95050-1-mlevitsk@redhat.com>
 <20200715150159.95050-7-mlevitsk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200715150159.95050-7-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 04:10:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2020 at 06:01:58PM +0300, Maxim Levitsky wrote:
> Add scsi_device_get which finds the scsi device
> and takes a reference to it.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@gmail.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  hw/scsi/scsi-bus.c     | 31 ++++++++++++++++++++++++-------
>  include/hw/scsi/scsi.h |  2 ++
>  2 files changed, 26 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8qjeIACgkQnKSrs4Gr
c8jUfAgAuxZLJDf017PkM51qKynAaspcfh6dlAS5sWBSKAJVdEv44SB9AtpV/Ksw
zbiWwv6eU0t2djgpp5BRVIBuOL6USr/tzojQ3INFxPDjCRSY/UBsHKaNLu1n9xrE
hNyKemdESLKLEAULUYObJZU0bZKs0CH6hlVHMjMoRRd+dhYDhoF7CoZt5NECquJs
qaxgdiQsxRe9YxdJNLeT37PhHfIkPNmu6XILHznKST2AIsGwuC975aGb5MjbKiGT
t7YnDGsdPoyNM4kQP2ZbVqSHy/VIRfiKGD6HK2wpgaGsYe6EQliE2wLEmx04TxPR
4qCaSTnVT9KlSnlzs23N6GdyweHIRA==
=gwMM
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--


