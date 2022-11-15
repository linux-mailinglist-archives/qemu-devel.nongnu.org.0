Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF162AFC0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 00:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov5lP-0008VR-O5; Tue, 15 Nov 2022 18:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ov5lL-0008RO-Pp
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ov5lJ-0004w0-Qp
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668556480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lOwQrT5K9vN45rA6vT3OGi2HGv3UJyiSXCvaPc2qxCA=;
 b=hHIZ25SY/zuWLEVvtF2mqMVy63jTy0GRNOb8OjyHxWPnZ2i+2+cgJJFKNuoqVwMcPvPSBK
 i949PgpOtudJjqK/KvLAJmO9UFhTxwIDu6Bu7rEjlyIs6M69eq+KB9yNwUYYzq6+rvN7lP
 ecB17jGaUCJpW/78WHoOkA7AJs4f34U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-54wpKWQuOnmdlLNw0DkHLg-1; Tue, 15 Nov 2022 18:54:37 -0500
X-MC-Unique: 54wpKWQuOnmdlLNw0DkHLg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0537C858F17;
 Tue, 15 Nov 2022 23:54:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B8AE492B05;
 Tue, 15 Nov 2022 23:54:36 +0000 (UTC)
Date: Tue, 15 Nov 2022 18:54:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 0/2] target/i386: fix cmpxchgl, lahf, sahf
Message-ID: <Y3QmuAT5mZj7Y13A@fedora>
References: <20221114233829.3329805-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B3noi+/w5rodhbQd"
Content-Disposition: inline
In-Reply-To: <20221114233829.3329805-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--B3noi+/w5rodhbQd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--B3noi+/w5rodhbQd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN0JrgACgkQnKSrs4Gr
c8jLDQf/QW/lIBt9NTmy+CLy4iIZjPnAjvb3/woTRBpkmBcgFYtlt3nUnFGkNTv1
mNpkaGMC89xTUufmQcPlIjdvoLDl4n0YCmit1Hq6PXGoEj1OR1zl3YUR0ppW/B7q
jPVzXXZilXbeZsTbqSoF++z+gZ/fAZjAJK6R/xnPkn5tU/3yQIWfkKYpjp+/Zvv/
aymFIwXsEEA3LNLZtfOQAgpdWltLdilZO+NpS7l1ruItuxITmzusOdLqIyNs/OJz
ISg4ObhDMgwnngLAlAtwXq/BTo8mLhjbdlzQTebiUywsecwJxQHtawkuwat1Vlqn
xcXlk/DAfiqG17qwLqI6/o4hvbFDFg==
=LEwu
-----END PGP SIGNATURE-----

--B3noi+/w5rodhbQd--


