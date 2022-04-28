Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BDB512F5E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:16:37 +0200 (CEST)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0GK-0005Uv-7X
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk05U-0007OY-Da
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:05:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk05R-0001cO-R3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651136720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NCuzz9VFCjXP0Lw7Jk7mpV7tdY/uMm1aMAT28Q9T1P8=;
 b=d//VPqoa7pIkvH5zIekNTAMfsQH9BOCJ4XvY00b8BBk8jyaEfUMbY3vdVHEYqaby5DvsYY
 wdSFtWuTyxiFwKE4ZQFDi+OIPFHT4ZyP1yeY7tqM8IZGlIbqPwShOPoQcHLRIY5MzqdmUp
 EuI3eaI6YNUFPKEXmR0Ut+k0KFZbejM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-XK-oVEWFMEKd2Ijpe5bpkQ-1; Thu, 28 Apr 2022 05:05:18 -0400
X-MC-Unique: XK-oVEWFMEKd2Ijpe5bpkQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8758A85A5A8;
 Thu, 28 Apr 2022 09:05:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14DE1401474;
 Thu, 28 Apr 2022 09:05:17 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:05:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH 1/6] virtio-scsi: fix ctrl and event handler functions in
 dataplane mode
Message-ID: <YmpYy8cCPCh4giWe@stefanha-x1.localdomain>
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-2-stefanha@redhat.com>
 <81e9949c-2d25-1648-a3f3-b3f3c9ce2c74@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l2PTVUHAWlKs6DB+"
Content-Disposition: inline
In-Reply-To: <81e9949c-2d25-1648-a3f3-b3f3c9ce2c74@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l2PTVUHAWlKs6DB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 10:47:58PM +0300, Michael Tokarev wrote:
> 27.04.2022 17:35, Stefan Hajnoczi wrote:
> > Commit f34e8d8b8d48d73f36a67b6d5e492ef9784b5012 ("virtio-scsi: prepare
> > virtio_scsi_handle_cmd for dataplane") prepared the virtio-scsi cmd
> > virtqueue handler function to by used in both the dataplane and
>=20
> Nitpick: "to BE used".

Thank you, this can be fixed when merging the patch.

Stefan

--l2PTVUHAWlKs6DB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqWMsACgkQnKSrs4Gr
c8hKvAgAn8mps5z2c2SgRlyw8I1a+guFMxuJIEo4CrTwKQDXgNdmFen98uxPOjiG
6GkXeeyrZ1DmZ1XJNk9qLGwkNYHPCIJ0XT7UD0MCIhekHTv2XjPrain8R9LgMBSo
TMx4WNJnucrwFmhafXtHoRQ3IUvgL4MDAOTkoQcp7vrEOQUfdEL43BnXlLx3qWUo
/nD1PJkkI8OuPZyOKwKMbx3WxR9Et/vO47X9M+lEYswvjea2m1NLq/P4owzHm3GR
Kwdj3xTFsHqlU/zi05ai2kQmfZWXKCo4zcwiOJbCt1Be4K5VRnCbyFwtIsF7j7Ms
PNgi14newbuV3cDcn+n98+6QZSa31A==
=bgCc
-----END PGP SIGNATURE-----

--l2PTVUHAWlKs6DB+--


