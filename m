Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF72A251BBE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 17:02:18 +0200 (CEST)
Received: from localhost ([::1]:41510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAaSn-0005OG-Nl
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 11:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kAaR9-00046d-1F
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 11:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kAaR7-00020b-EJ
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 11:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598367632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2vh3TjLMbbAFmHKortYMReuJyieyqECv34e7lvS9cng=;
 b=J5TAIzQcC8XW646BWrSFvD3gRrfqZMOlJDVVjotiQzo8wrru1WGA1xxULB6xNS68+NckxZ
 JsIwmTogTf1sWAT7hqP709Dy301lfJ8/USnXgqyor1rRqxbUwUYpMpWJqFQzFJQtNshgXi
 y01eCVh7uMEGEntIrhJycSWOoUuy6Uw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-3PWSuheCOy22U6fLiyi2Fg-1; Tue, 25 Aug 2020 11:00:28 -0400
X-MC-Unique: 3PWSuheCOy22U6fLiyi2Fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C0541015CA3;
 Tue, 25 Aug 2020 15:00:27 +0000 (UTC)
Received: from localhost (ovpn-113-101.ams2.redhat.com [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E37619C4F;
 Tue, 25 Aug 2020 15:00:21 +0000 (UTC)
Date: Tue, 25 Aug 2020 16:00:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v2 07/10] vfio/platform: Remove dead assignment in
 vfio_intp_interrupt()
Message-ID: <20200825150019.GD7124@stefanha-x1.localdomain>
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
 <20200825112447.126308-8-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200825112447.126308-8-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 pannengyuan@huawei.com, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 07:24:44PM +0800, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/vfio/platform.c:239:9: warning: Value stored to 'ret' is never read
>         ret =3D event_notifier_test_and_clear(intp->interrupt);
>         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/vfio/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9FJ4MACgkQnKSrs4Gr
c8gKqQf/dUJ8GNdZi+1Aehsiz90/HWV6+uPjX1KGs6xizzVnOPcqRZjTX/5x47T9
cWtGluNXfamItFMHHIvCIHVbe757Bj0MNjiJ6qJBO+gCHRFC2ghB6qQvsLlIanyp
13gl9NgBPuHaT5W3+APJ1dlCvtkd9s5xgFzYU47l9JS6Sc+ERXyD+iwVYn2Fl3Mj
cjhiC8Bx5VAcisM+1PyQIoYJV0ukg5Ju3CSdmOyXlKrg8sj78w2/N+LGeXGo8rYD
+6FO2ykF3FUV1WfTcEGL3Qr4LQhC/BWnPoHe1dJg22xXU2h6CtMi7k+cSGC/Q1aJ
+jquilZZYSr7cX+SaHSbCMeZ/HJykw==
=KDwh
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--


