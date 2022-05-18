Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C6252BB74
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:25:54 +0200 (CEST)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJgX-0005ci-G0
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJdA-0002hB-MT
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJd9-0000xY-69
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652880142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hZJl+9Ef8/CGCzRC3kzZveK0PllzURhQVOIC/LnbSXM=;
 b=enJOYJBZtKDatSp/PpYwp341n+8VhpsEzwbdZZXd3vU2iGdS/pH3RuCrGlUujBM2DDxItk
 ib1KDY/cm7zP2VEhZE9JxJeYFOklvSSnvBQqbKmnQReQ7o/qiXPGuThvCi8b4LwyVqwKwR
 FFFuSQNWADxTUXaS49Lk6a+zBapMnd8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-aPh_XBu4MJqz59SF2Kh8LA-1; Wed, 18 May 2022 09:22:19 -0400
X-MC-Unique: aPh_XBu4MJqz59SF2Kh8LA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADA592932480;
 Wed, 18 May 2022 13:22:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA4E492CA2;
 Wed, 18 May 2022 13:22:18 +0000 (UTC)
Date: Wed, 18 May 2022 14:22:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 4/8] linux-headers: Add vduse.h
Message-ID: <YoTzCefztuuJsQKo@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-5-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BQgRLWE28Vs3NZu1"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-5-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BQgRLWE28Vs3NZu1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 03:40:47PM +0800, Xie Yongji wrote:
> This adds vduse header to linux headers so that the
> relevant VDUSE API can be used in subsequent patches.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  linux-headers/linux/vduse.h     | 306 ++++++++++++++++++++++++++++++++
>  scripts/update-linux-headers.sh |   2 +-
>  2 files changed, 307 insertions(+), 1 deletion(-)
>  create mode 100644 linux-headers/linux/vduse.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--BQgRLWE28Vs3NZu1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE8wkACgkQnKSrs4Gr
c8h4eQgAlxBzma0g6iGB+6Yya+2oIERWQ1/UBFUBn/OKC0KW+HDDa9sgjvNxjiz/
lbHZti+tzTGsBbzKH/eyD7lKwsa0QB47ZdfDNht9eZTLCCbCGKggPBrjnvAQrWl4
vqJp+yNdd9Uy5kbfixmiJJgdq3Bzhd7X+sC6f7W8JCZjXOSnVx6jcgz0il8KWR8e
EYZieq0F/EE0l1eAfFFR12NGtNT8+ZD9JuZ+iU2y7nVBqADVIHUQODCSyC9TRZ6U
6zOdp2x9VIoN0eYZdOEugdDzc2Eu9jSqy4mjotKmviXCdWYYrWNtIWwCVRTuPrFs
UmzgN8TbQ1JVMCF8TM7LDC6iOLziSg==
=ocpE
-----END PGP SIGNATURE-----

--BQgRLWE28Vs3NZu1--


