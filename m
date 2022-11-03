Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC83618A88
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:27:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhk1-0004OY-5u; Thu, 03 Nov 2022 17:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhjy-0004OO-Sn
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqhjw-0006vi-BP
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667510827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ruKkiWhD1CiFll4S6O/7unXAy1BqMKN6LA+Np8uaTE=;
 b=XcNW+A7dkhHLgvmIcvuOpOuOGqFOT9okk5sTgHRyMv08Je42H2psHXNQaeL971f5MpZpCf
 lkb7/ys+qomb/Lbhk9f8r/7cvwoHEf966AKuYiFGlCtzrgB6act/1e8uR9YQVRUjyKboTr
 6vmUq6P7RMKI+dsDTZCgXVFMosERTEU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-zT_NKmLUPwCnuCZQG9ucgQ-1; Thu, 03 Nov 2022 17:27:06 -0400
X-MC-Unique: zT_NKmLUPwCnuCZQG9ucgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15829833A0E
 for <qemu-devel@nongnu.org>; Thu,  3 Nov 2022 21:27:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C68240C6EC3;
 Thu,  3 Nov 2022 21:27:05 +0000 (UTC)
Date: Thu, 3 Nov 2022 17:27:04 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/5] Misc patches for QEMU 7.2 soft freeze
Message-ID: <Y2QyKNz3hy45Kg3I@fedora>
References: <20221102114125.58902-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tP6QGADmw0xDZBDq"
Content-Disposition: inline
In-Reply-To: <20221102114125.58902-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--tP6QGADmw0xDZBDq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--tP6QGADmw0xDZBDq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNkMigACgkQnKSrs4Gr
c8jG0gf9Gv78/PMF0Bym/8zB0ZUadWz2S+Vu6mdGH+2w94EL8qsylId/wy3MM2Nj
ZWkhEILaZ9q1/CKrUu41AaHYBVE6L1okudC8t9Ln/3E1xr7nBJ5CeAkB4LZiLvKt
skn3LPdIjSbBaRi2/o+BMO2SdVcvTOHEq8tLNdOK6bJzpxGubPNVksnFT5KbLhx2
FumRbDMK06QNdggBmJicq9mTE5TO4+pXwMdRE8SKCTo3VqLPxsg1jnYPRanfzOTY
oq+jY9YuXCdfu1yc1D9S+D2gvUixvDmkaYBOBsFQbf/kzR6qYswa/0kv20cO/qDT
xvx37Bum8+QuCtyKnLBNJrryyF8uOw==
=LpHu
-----END PGP SIGNATURE-----

--tP6QGADmw0xDZBDq--


