Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45605F679D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:17:18 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQkX-0008Dj-75
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogQP0-0005Cr-Hj
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogQOx-0006Ex-As
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 08:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665060898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9sQKkJqXo3OuBrGFNkncqSdHgG5caemzeUOpUvrgtjs=;
 b=QZ7eBM4eJidP8yWKDNSx+OBSFZwocbTuODMHOTMxPKKNVzlYOCxcEdEocqGW7kVEU/wfMb
 gk7lWNIxn784TPKhPQEEJzKIoBhL9kO1KzzXkwrMkq2X3IHJjZ8vDiOKymIT9uQ8NV7/r9
 llOFB4yL+CXI/SQNmOH/8fRzU7UERgQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-kI4Gt9uCNhOh-MN4ZJNX0g-1; Thu, 06 Oct 2022 08:54:56 -0400
X-MC-Unique: kI4Gt9uCNhOh-MN4ZJNX0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70494185A794;
 Thu,  6 Oct 2022 12:54:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FC481121331;
 Thu,  6 Oct 2022 12:54:55 +0000 (UTC)
Date: Thu, 6 Oct 2022 08:54:53 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de
Subject: Re: [PATCH v2 1/2] include: update virtio_blk headers from Linux
 5.19-rc2+
Message-ID: <Yz7QHdjyJudLzeeV@fedora>
References: <20220929094821.78596-1-faithilikerun@gmail.com>
 <20220929094821.78596-2-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9qsPuPdcT8W6Xo+r"
Content-Disposition: inline
In-Reply-To: <20220929094821.78596-2-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9qsPuPdcT8W6Xo+r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 05:48:20PM +0800, Sam Li wrote:
> Use scripts/update-linux-headers.sh to update virtio-blk headers
> from Dmitry's "virtio-blk:add support for zoned block devices"
> linux patch. There is a link for more information:
> https://github.com/dmitry-fomichev/virtblk-zbd
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  include/standard-headers/linux/virtio_blk.h | 109 ++++++++++++++++++++
>  1 file changed, 109 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9qsPuPdcT8W6Xo+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM+0B0ACgkQnKSrs4Gr
c8iJYwf/fNdjnf5gI/b7hek5e3d7uXyZx3PfmtM+wvERjh+t4d658+htrJi0QWgv
0dJ+1KMWFdv0Z4dhW+i252FJvqmyDLKnoXIZu4kMtMKiRP7wZIDoYlwlTWsIr1u3
4F8gBOopMZumlJA99YVtrOoxsJ331+psoofqKi+3c3y9w1xcQUAjtOxYPTK6vZx0
2cA7dfOYvypdsDqkRgHue81nieIcmCCCe5KnwexcoNtcv3+8Scj+Urg/3AGulEoB
CXWNdSf939GPMaP4wlKBSE+QH9EuSsKbG6mEOpWNKcktAHiCseGwyC1b+91cWazD
a1abCrqTXM4YFCBI3XQm8vnAzWJWnQ==
=CVgd
-----END PGP SIGNATURE-----

--9qsPuPdcT8W6Xo+r--


