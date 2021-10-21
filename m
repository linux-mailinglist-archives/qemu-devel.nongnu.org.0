Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828743664C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:31:28 +0200 (CEST)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mda2R-0007iC-Ab
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZsk-0007L5-6N
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:21:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZsi-0005af-Lf
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634829683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TboXledNF+9aS+mCGsvehlY0kLMMW4h0JKYUYf+XDZg=;
 b=RDqPnEEYxogIp5fyGRKuR74/gLnGaaOO9a6zyEC+madPv3T0/vTFLtQAPzJvlqLRHUvhPY
 GdBNYtLvNavS04B7YlyFFLAhA7Sx3Y+iKj+HpBkr085KSBLYTU419nCvg5/r7FNAaeUZYF
 ERbEbZyDJ/Jn+6cJ6UVBEYNYizYBsgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-Lz5yXp7-OyiMuZiErFk3eQ-1; Thu, 21 Oct 2021 11:21:21 -0400
X-MC-Unique: Lz5yXp7-OyiMuZiErFk3eQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B1C61927802;
 Thu, 21 Oct 2021 15:21:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2006560E1C;
 Thu, 21 Oct 2021 15:21:10 +0000 (UTC)
Date: Thu, 21 Oct 2021 16:21:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 0/3] linux-aio: allow block devices to limit aio-max-batch
Message-ID: <YXGFZa7csbD8SxLq@stefanha-x1.localdomain>
References: <20210923143100.182979-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923143100.182979-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KUxmlrmKkcSFpPfk"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KUxmlrmKkcSFpPfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 04:30:57PM +0200, Stefano Garzarella wrote:
> Commit d7ddd0a161 ("linux-aio: limit the batch size using
> `aio-max-batch` parameter") added a way to limit the batch size
> of Linux AIO backend for the entire AIO context.
>=20
> The same AIO context can be shared by multiple devices, so
> latency-sensitive devices may want to limit the batch size even
> more to avoid increasing latency.
>=20
> This series add the `aio-max-batch` option to the file backend,
> and use it in laio_co_submit() and laio_io_unplug() to limit the
> Linux AIO batch size more than the limit set by the AIO context.
>=20
> Stefano Garzarella (3):
>   file-posix: add `aio-max-batch` option
>   linux-aio: add `dev_max_batch` parameter to laio_co_submit()
>   linux-aio: add `dev_max_batch` parameter to laio_io_unplug()
>=20
>  qapi/block-core.json    |  5 +++++
>  include/block/raw-aio.h |  6 ++++--
>  block/file-posix.c      | 14 ++++++++++++--
>  block/linux-aio.c       | 38 +++++++++++++++++++++++++++-----------
>  4 files changed, 48 insertions(+), 15 deletions(-)

Sorry for the slow review. Comments posted!

Stefan

--KUxmlrmKkcSFpPfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxhWUACgkQnKSrs4Gr
c8jwbAf7BMkLewxxRiB5A/e9IZFKVVSjQXpihBrBFt7lkckZCEu0rkr95aySj0t3
/xmEMLUIuUspUj6Wwg9ALJrkSrRQTT5+bD6hfCNY2uQngI74DOBIQArliM2Nar4q
paAUEhUUizFyTV6dnagMn27h0gu+jfRKbPOQ1e6SSi8oqeVXWV8MAKdNFRFIV+Nf
7f8o4HrypyJ8YZ3rx9ADsDgj+NTcAGqyIWJ6Ck7HTX11bg8LmoHdwqzRYTFRd1ko
qR3wswgNP4yBB+zse8XiYJUIFeSYcEv+UmHkknKhRu27cvdVKIRe50rPic9/63nB
wg8UJeyhCGLcnV9Skd/NhSIgrG4FlA==
=H1Xo
-----END PGP SIGNATURE-----

--KUxmlrmKkcSFpPfk--


