Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E96CC4E1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 17:10:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phAwv-0007zq-Uj; Tue, 28 Mar 2023 11:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1phAwp-0007z3-8l
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1phAwm-0008Kn-2s
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680016155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hfrJ0s3mDXBh1urPVLYx3NAW6Q/fvMMWG4Rmnopum3w=;
 b=BeTxDsT6kkhei2empW9ezWTmsXOc/+UGZu/jpRw36Ysns49imLCLCEk35oosrxbslGbV+l
 DWgrYQQSXQAkLAJfsL437CJnfbmmuGmi8v1rk+bY5iOMflftZdB9KDjAgVRfGv44/445kc
 HnjuDds7wtZpbIQJUuwC6fxzZP8vbZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-Qmg8SwCIP_OUH9MZ6aKgUQ-1; Tue, 28 Mar 2023 11:09:11 -0400
X-MC-Unique: Qmg8SwCIP_OUH9MZ6aKgUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90FD38028B3;
 Tue, 28 Mar 2023 15:09:10 +0000 (UTC)
Received: from localhost (unknown [10.39.195.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE82BC15BB8;
 Tue, 28 Mar 2023 15:09:09 +0000 (UTC)
Date: Tue, 28 Mar 2023 11:09:08 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH for-8.0] block/export: fix assume_graph_lock() assertion
 failure
Message-ID: <20230328150908.GA1625749@fedora>
References: <20230327211921.1612727-1-stefanha@redhat.com>
 <ZCLdNxESMsE0r92T@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VAJ79EyMlZW5P1DI"
Content-Disposition: inline
In-Reply-To: <ZCLdNxESMsE0r92T@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--VAJ79EyMlZW5P1DI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 02:27:35PM +0200, Kevin Wolf wrote:
> Am 27.03.2023 um 23:19 hat Stefan Hajnoczi geschrieben:
> > When I/O request parameters are validated for virtio-blk exports like
> > vhost-user-blk and vduse-blk, we call blk_get_geometry() from a
> > coroutine. This hits an assume_graph_lock() assertion failure.
> >=20
> > Use blk_co_nb_sectors() instead and mark virtio_blk_sect_range_ok() with
> > coroutine_fn.
> >=20
> > This assertion failure is triggered by any I/O to a vhost-user-blk
> > export.
> >=20
> > Fixes: 8ab8140a04cf ("block: Mark bdrv_co_refresh_total_sectors() and c=
allers GRAPH_RDLOCK")
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> This is a duplicate of this fix:
>=20
> https://patchew.org/QEMU/20230327113959.60071-1-kwolf@redhat.com/

Okay, thanks. Your fix looks good.

Stefan

--VAJ79EyMlZW5P1DI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQjAxQACgkQnKSrs4Gr
c8j5ZAgArSJFgC3yYHtwCifp7w/AFBdsjBd/7ojnlBBhpMYozVJJVNgNuy7Tn9ha
YBUdtBbilGE7Brq3KO3QkhHhVjlCLCfKT1PS0rLqV4sieXhwjy5YOoumh65AQ9aR
+wW/1R5m9MYlFB0T+AK9tQYIRbjQdmqqLlAeUG9gIO83GzZ3M0Q8m4+eM5x3M8rt
N0qD+DrXqIyPPKGtGWFo9uSvwQKgQVjCekEJdRqunREv/vdvU92jLCCliD1AN8SJ
rddFh3ruPbnayjjRV4lgxmO8s8KX5Tvehrei+bC4imYTqryaaxcvC7I57Dn6CTqV
QsYtLR7+N+E77fBKNCrmMKMjP23LPw==
=gwEx
-----END PGP SIGNATURE-----

--VAJ79EyMlZW5P1DI--


