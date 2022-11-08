Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC349621CA9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 20:04:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTse-0007ar-4D; Tue, 08 Nov 2022 14:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osTsT-0007ZQ-Mm
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osTsP-0001a8-ST
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667934192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lTe7XvrTr/nJapRct4IL841rtnl4EopomdQM9LefVH8=;
 b=TAFjHaLRz3/y9u48BeucntXWwsEOxnEQjfCs5aqIP9nOGU+v6TmqLRHQx88ur8u9T8xxiW
 MKmr3QOuXx+cvwBaCf6ScsoUORvyrJveMCzv12/yuwRs+AAlVdUGu3acNXQZwYz3pLZOUk
 fM/SM+So69Q2IlKvBVBcMwUN+Q2y+hs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-8z8X88H4N-qMX5Tq933zyw-1; Tue, 08 Nov 2022 14:03:08 -0500
X-MC-Unique: 8z8X88H4N-qMX5Tq933zyw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 896061C075A3;
 Tue,  8 Nov 2022 19:03:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D604B4010;
 Tue,  8 Nov 2022 19:03:07 +0000 (UTC)
Date: Tue, 8 Nov 2022 13:08:42 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, kraxel@redhat.com
Subject: Re: [PULL 0/5] s390x fix and white space cleanup
Message-ID: <Y2qbKo7RMS2vz3BG@fedora>
References: <20221108113313.467923-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qd+dsBu1YolGSps2"
Content-Disposition: inline
In-Reply-To: <20221108113313.467923-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--Qd+dsBu1YolGSps2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Qd+dsBu1YolGSps2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNqmyoACgkQnKSrs4Gr
c8gzvAgAwB7udTyawyfNMH5gThho8cqu0Uj7cJ9vYpmTYOpkWqu99+bFN4uuslsL
MCQ4VMNRsyKsZUg9txBDrOEetGv9qr/Sy/ngq3Pjk04D2GWOxq/zzVRGZhET8Wgy
wgxw/5XUA3AVD+cH51D2bMGRI1N0rWnuSUYUFW8l1Xpfby2NgxUDPd+ckjU5UEET
Lx5NVnAr3mdRw7j2vwdqVzqrgUwyuxIvEjJ/cwtAygp2lxp7cOAwc7VZUsV9/Epp
oTsNGDvmF1e0QOGNkY7PUcbyWd4CCPBV2rC7JKWFponffCa9Ew42uNDvfvBxkKqW
zpbxBBxSq1dngjRujUJPZDfxYuOrXA==
=M9un
-----END PGP SIGNATURE-----

--Qd+dsBu1YolGSps2--


