Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A764209B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 00:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1ykJ-0001s0-6m; Sun, 04 Dec 2022 18:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1ykH-0001rr-RH
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1ykG-0001kS-Dy
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670197803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6huR36w/te9dBTDJrypN0eiSQAvjDAGLhS2OvQJMmvM=;
 b=hcwuzQfeeWUE39mvoHV8MYy9bRLbTn2NAdB6bVcDGlJUOQJXrCvUtuHgNFw9M2K8220rpq
 kbnVVPIHsNR82KBbkd6FlopOd/gj9Wdpuz1Rln1jUOU0vX/QsvvB71DSvRO5E/143bU2/D
 URsS+ehVR/4BlkOYYCK8IqcVJpiQKGA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-S3NJsae_MoSTcpco_BPtbQ-1; Sun, 04 Dec 2022 18:49:59 -0500
X-MC-Unique: S3NJsae_MoSTcpco_BPtbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9E8101A528;
 Sun,  4 Dec 2022 23:49:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A26F063A55;
 Sun,  4 Dec 2022 23:49:58 +0000 (UTC)
Date: Sun, 4 Dec 2022 18:46:45 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PULL for-7.2 0/5] hw/nvme fixes
Message-ID: <Y40xZTbAnExNe6KX@fedora>
References: <20221201165024.51018-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X0+3wqbiOtC8uaOi"
Content-Disposition: inline
In-Reply-To: <20221201165024.51018-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--X0+3wqbiOtC8uaOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--X0+3wqbiOtC8uaOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmONMWQACgkQnKSrs4Gr
c8hpawf8DHlvxB0Mfj+ZFRpY0vRB/hF5mBWvZwLwePA7oAL1hjioOUBNqEJpPDCi
pEIl8rnGjR/lLi6R3rWQ05Boau6IHyclKZ2r14NzVDWVmT1tSFwFNkOzwhJupwTU
rGoVIQwsEMicbl19ZOCACMsh+Lr2DiJ0NgsTfhPzDtNYBDg6cSZM1MULkjtjvske
rUgORq0rKTsK+bzigkCLE+5bKxEeAn9V0TqZHwEsyJghY8NEbDMaBezI0gLkhpVJ
JgW1wZk5dSE/d6vgZT+nbpFx4mwyyZjWhblvIGLQve/m5OP6D6Gx7ceLwWQmeH1R
dNqoMQRI7XUAphMOR0xjhjIaM0O3Gg==
=azp9
-----END PGP SIGNATURE-----

--X0+3wqbiOtC8uaOi--


