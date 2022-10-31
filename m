Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D4613DCD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:53:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZtz-00017j-Cd; Mon, 31 Oct 2022 14:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZto-0000qr-U1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtm-0003cA-8R
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uI7UfggV+WdoDLM3ewSj7QH9i05QNq0/AXyGTnKZJ94=;
 b=XXojtpa4LWu0qucsCuxFmvpH8J67ZUHFbOWqCzhDx+rIN1gVEmTDJAOq8WYy9NGDPa+qRM
 XsnInpJTa0P0xvlswjF59QsWrSXCyoZze4md4em/xyyl5RdTnm81+PYG7Q0+CF5Wa36yn2
 LBZ9UmcoyO6NdJbnIL9l9ScBwAqGmno=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-nyfkc93PME2lS9ex2uWN4g-1; Mon, 31 Oct 2022 14:52:35 -0400
X-MC-Unique: nyfkc93PME2lS9ex2uWN4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52A76800159;
 Mon, 31 Oct 2022 18:52:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC07340C6EC6;
 Mon, 31 Oct 2022 18:52:34 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:33:49 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block/blkio: Tolerate device size changes
Message-ID: <Y2AVDYVLdOXx3Pbn@fedora>
References: <20221029122031.975273-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NIAWVUYQsBWPjNNi"
Content-Disposition: inline
In-Reply-To: <20221029122031.975273-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--NIAWVUYQsBWPjNNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2022 at 01:20:31PM +0100, Alberto Faria wrote:
> Some libblkio drivers may be able to work with regular files (e.g.,
> io_uring) or otherwise resizable devices. Conservatively set
> BlockDriver::has_variable_length to true to ensure bdrv_nb_sectors()
> always gives up-to-date results.
>=20
> Also implement BlockDriver::bdrv_co_truncate for the case where no
> preallocation is needed and the device already has a size compatible
> with what was requested.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>=20
> This is based on Stefan's block tree:
> https://gitlab.com/stefanha/qemu/-/commits/block
>=20
>  block/blkio.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--NIAWVUYQsBWPjNNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgFQ0ACgkQnKSrs4Gr
c8iOuwf8DoQ8BfURyjhTQeexwRt/atLgKB6Flj8MK5hnnOPi2XonFQX+GCmMmSnn
ciQV67R6HtlqaGohMdXD5EYlr1WwhQoX/Mh1QYj1kOUPU3yGSMuJXZBTVfv/yQCj
aVngf77+RmLpii8zf2eDe9BKH0diZ0/EfUqkcUFNZONOTPKG3wAzew3e5Yj68WPk
g0j9GE4NU5b1yZSOsB7rSI5tgnRNxW5TRUMfp4/67j0uTgiwb/yE+aKWJSca6aCE
PBz04maFYVtYe8eWzlMxcOVwSxQejLnIkfCEyg1n4w6k8DcTmT82Wh4dzzLXpUgl
t5QDuHBwpHHuvvz1D3T8uDifnN/3Zg==
=WryF
-----END PGP SIGNATURE-----

--NIAWVUYQsBWPjNNi--


