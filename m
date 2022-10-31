Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A761378C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUVi-0002tL-8g; Mon, 31 Oct 2022 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTf-0008BM-Td
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTc-0007iz-Ur
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3PklVnpb0Pep8pW7zl1i6HEyiG4TyyKq+ZjSsk4/IS0=;
 b=FGesGVRflxK8qHBsYkw8+Vw4FrTjxMSr/hoIhnSIrGO2foRSQMxk7NDRpl8+vXEsak3Hq7
 qCOtHcmdmvvh83bjHGo5HOhppuzBydLri/pnu+PT3QP3dCNLBvTen94F/uhfzuCvNp4Me5
 q37yzt3qMMHaNblwvnEOvDqz4AaThc8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-SZL1Pw3vMaCO47pzwa8yyg-1; Mon, 31 Oct 2022 09:05:13 -0400
X-MC-Unique: SZL1Pw3vMaCO47pzwa8yyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC6251871D97
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:05:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B79A40C2066;
 Mon, 31 Oct 2022 13:05:12 +0000 (UTC)
Date: Mon, 31 Oct 2022 06:13:49 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PULL 00/26] Net patches
Message-ID: <Y1+f3RgpgXiME/C2@fedora>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fs90R1fbOEZhnkyM"
Content-Disposition: inline
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--Fs90R1fbOEZhnkyM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Fs90R1fbOEZhnkyM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNfn90ACgkQnKSrs4Gr
c8g26wgAljK19x1gMFOL7mKgsZ0X6GajmhkoFDzw/tQ0WmZKlLTYNKJ9MFNgeeuy
/LcKXsoltbmF7CLsNucMWN2oHqG3CpLVIrGTXXpQBfv2pyPJEJRQ/guGLp054/TZ
d8JfCo+Xnjte6PSL2GcTPxVNYcziebSmBVA5IGIZ8vNWLJJhcBYO70xB2ysVIrII
E5Bax6QhWMCo62/AIXRb30VGBNgrRjQ6xSAmjXrKWjIH6WnW7WOSeS8U9Z0fM6er
2T7ghf8cmB2I7uIbaufmf09Ttf7dM26le01iHuxiLbtWReEqt7l44EHcgIxNSWJF
5+KAttJAaRW7vKIKtJ3bY1YdpS4kHA==
=YtNM
-----END PGP SIGNATURE-----

--Fs90R1fbOEZhnkyM--


