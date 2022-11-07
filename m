Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD561FF3C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 21:13:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os8TE-00011w-Gb; Mon, 07 Nov 2022 15:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os8TC-00011n-M6
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 15:11:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os8TA-0002Ul-E4
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 15:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667851902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjrz9sEnSItdYMng3xAniFg8X7jdfvuM2Bpxe43DY3o=;
 b=MaYoshcV1jKyCQrcxLLYnmp4LCzGZf6o7u2QJrXgcZiujC1+8T3KU6U30l0u5x11e8/PXq
 496+XMSqhHYcfxJfAcEvh/2ADGI+0ZLg0KvI0r8zfvRsgHj82xHSBnApeyLJKjLOix71id
 DoG0BTSmxlkmohPkk7QnfbU7q2qif9k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-qA4CyuFkPcCSAOZxg0G4ug-1; Mon, 07 Nov 2022 15:11:41 -0500
X-MC-Unique: qA4CyuFkPcCSAOZxg0G4ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D584B101A52A
 for <qemu-devel@nongnu.org>; Mon,  7 Nov 2022 20:11:40 +0000 (UTC)
Received: from localhost (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CA66140EBF5;
 Mon,  7 Nov 2022 20:11:40 +0000 (UTC)
Date: Mon, 7 Nov 2022 15:11:38 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 00/12] qtest and s390x patches
Message-ID: <Y2lmeke8dkASsYE+@fedora>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="blVpleybuSecyrSa"
Content-Disposition: inline
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


--blVpleybuSecyrSa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--blVpleybuSecyrSa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNpZnoACgkQnKSrs4Gr
c8gOXgf/ZznEb812F+ypGuxHVSX9vipPNyD3zbZPEXn54aIzmBww8fmMap43Y1UC
KiioVAvGHCDqo4MjTU8WR/ddEZH5IsLZkuRn4hJr/JfSSDqYepsooZUP113W4/ho
jYRYn2XUTERdNsnGhEWwWdvxdePYaj7wvUHwCyE96kC87hoJ4Fpc0Ucvi3ig9IzL
oZbI+Rb6p30lF43XRy/Hjfi7Go+kMQ9Alp2v3Bh8y+Mxm8L3FXEcmWW2YakakqA0
66nTH4lmCL7gtOLmZKFIlCiZqSHMDk2F+F20d0ccTQ9uhiYA4fzjMoXNk4lHSGfq
fKEOJ9KXDhDC64lHy9MDTjYpbYdP6A==
=bZ+L
-----END PGP SIGNATURE-----

--blVpleybuSecyrSa--


