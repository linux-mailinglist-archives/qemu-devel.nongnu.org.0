Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213FE5C0564
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:38:38 +0200 (CEST)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3gD-000539-96
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob3bY-00088Q-5X
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob3bT-0006CF-2U
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663781622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqSOTcfjNFBpt1oCMGFxnbYD54zrPgMx04YisfnGTos=;
 b=N2DObdA0CYJK+5cCNN+taenm9ihbIEsDUqviVddU7Ic/ojBCDsVxXzQMMUxFxQjtazr5qD
 7/gpNpndlCXe/p4BivvsVz5Mo8Mgn07IYp/uQ7xHSjYegPySJUOrq+gLzmjRv7qeic4QlF
 j8fGtxaLZvtjaIgo3kDPvWrrY3MGwdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-kHUQlAvAM9iqTI852IcpkA-1; Wed, 21 Sep 2022 13:33:41 -0400
X-MC-Unique: kHUQlAvAM9iqTI852IcpkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 042D8296A608
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 17:33:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64BE62166B29;
 Wed, 21 Sep 2022 17:33:40 +0000 (UTC)
Date: Wed, 21 Sep 2022 13:33:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 00/15] Testing, qga and misc patches
Message-ID: <YytK8lGmOE2/1qa4@fedora>
References: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jD2OvAlagb/j0n7b"
Content-Disposition: inline
In-Reply-To: <20220920153512.187283-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--jD2OvAlagb/j0n7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--jD2OvAlagb/j0n7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMrSvIACgkQnKSrs4Gr
c8hpIQf6Aj307jn87J8Imj46fnUOkcTUAf/esonNHWo98DiEp1qfy1jiWXjtjGU1
fqRXriR0rEfkmSQsWUBKdVeAFH69UnT8yFHwtq3w2ZtKvECkvml/vNIrCPX6QKjk
3bMbaB4PrlxfWt2PLMSfQSHbnBqnHr4OXD8AJ/qKO8tff9iDMIPI1CWeBxlOZLKv
/TPi0wMp5f7Mogwm1y6XZJUQ2bFr8Rs7HVl7151HyTFvadeRmKKw6TxCUf257f+1
hb2h/y30IGYzgJaI5GxpXVsrr4MmdncD1kbjnY59PeZq5U0TzxDtwEhb16n9TeTU
dsQVyGyYc3X93O7G7afxCFhgeBlyiQ==
=BUF2
-----END PGP SIGNATURE-----

--jD2OvAlagb/j0n7b--


