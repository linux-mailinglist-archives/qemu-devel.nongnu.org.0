Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E315E53F5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 21:51:05 +0200 (CEST)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob5kO-00083w-2j
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 15:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob5dY-0004FD-Tv
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 15:44:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ob5dU-0000uP-Oy
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 15:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663789435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0fIpX5dhE6kb2vtdLktpD5VwoatOIWW1/73egJCd18A=;
 b=UmIkQaLJRkzWglpbRQrtjfL9s1OsbtXzDGRWPtv7DzCrsFIGOKDodqdQqfDbM7vzfNJwVC
 /ANvqJcTSbBhOAFKCtEodqg+k+nXhrlw9jP3daHCmtTOax77jym6Dh27yGrnEasJ0GZZzI
 8235U+y57AhULAOVTQ8/wNPNrqy/PwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-cHkYKS6zOvWRSfXNNSCQtw-1; Wed, 21 Sep 2022 15:43:52 -0400
X-MC-Unique: cHkYKS6zOvWRSfXNNSCQtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF76862FE0;
 Wed, 21 Sep 2022 19:43:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8422027061;
 Wed, 21 Sep 2022 19:43:50 +0000 (UTC)
Date: Wed, 21 Sep 2022 15:43:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/5] M68k for 7.2 patches
Message-ID: <YytpdGdWWZuIcLR8@fedora>
References: <20220921155211.402559-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VdvIvMNlQSMbxLWm"
Content-Disposition: inline
In-Reply-To: <20220921155211.402559-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--VdvIvMNlQSMbxLWm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--VdvIvMNlQSMbxLWm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMraXQACgkQnKSrs4Gr
c8htiAf/b2nNFcafQpUUrqVPGb2UUknjpk6GVYzPBcl4IQVxhwif+5yH2eZN2x6l
f049qcimd5nbeThbSSCAfbte/8T5NjEph9mffaILuQV0WNEuWFZxLD/nkaBKiM07
S7jf/GpLxjsnazLxt9WnbhGGh9gm9VPML/1jCnNVewANYXIcGbP4zqf7fSI1aeG4
XNfcV6OrT7EXXXab4/zySSnewdWlYWX+aIh1CKU6TcnrsH0EFjs4yqajnzySkS/i
83dQ7vgPc8awQ+yWOTE/hDFCqBY9qnX+PXYlPTLnv6MimexYQAom9ytloTq6dUvT
n3F7u6+iI52E5fEZGVgAip8VBcNblw==
=OLU1
-----END PGP SIGNATURE-----

--VdvIvMNlQSMbxLWm--


