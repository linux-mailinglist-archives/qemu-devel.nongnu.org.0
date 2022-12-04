Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090B64209E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 00:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1ykH-0001rU-Iv; Sun, 04 Dec 2022 18:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1ykF-0001rL-KY
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1ykD-0001YG-Up
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670197801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rEvPOEbL6oMS51kXvN8+u/O/iDv7iLe2wrYgS/ZOB38=;
 b=fWkWiXqFloek4XVuj26/h2HAmx5c6BDdJUialfSMea0o5u1w9TARAwpuBSKQNN1Z/Fukxy
 Em27m6T1L+SUWajD2KCZBQEtqGDsW80lTsqi1FO/acAZ+GWqrP7USmyZOu0JC1U/CDhGM2
 wpTahf4/vzPebRk53kjZh1TiRTRfwZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-D821Gw34O_GgDt5XYcHXQg-1; Sun, 04 Dec 2022 18:49:59 -0500
X-MC-Unique: D821Gw34O_GgDt5XYcHXQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8AE185A78B
 for <qemu-devel@nongnu.org>; Sun,  4 Dec 2022 23:49:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EDC2140EBF3;
 Sun,  4 Dec 2022 23:49:53 +0000 (UTC)
Date: Sun, 4 Dec 2022 18:46:26 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL for-7.2 0/2] TCG/i386 fixes for QEMU 7.2-rc4
Message-ID: <Y40xUg7CVg2FuY7+@fedora>
References: <20221201085419.146789-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="usN/W+P0p+yJQ+OC"
Content-Disposition: inline
In-Reply-To: <20221201085419.146789-1-pbonzini@redhat.com>
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


--usN/W+P0p+yJQ+OC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--usN/W+P0p+yJQ+OC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmONMVIACgkQnKSrs4Gr
c8gIAAf/Z5ITX7+cRC9CFm2Y44Ccv9C7FhBDjmSFq+Gm6qVUScsggdw3r71NbRud
WbaxM5oOq5fN/OrKOQrh3z86PyyZJl662jmFHoCUs+RP6QYCvBeqNPQxQuB67VY4
MPaNTGlahmwN9KUuibG+fZKfqUCOtsHBVZ9JIHOgd+w+P40yYGWaLxlJzFeQ3Aul
giBHiI9AI62G4dGOLk3+UXxxmBs6C2Q9Qzfq1HbznhGmm+0iySgtgfXlt6KZYAll
odEkcFz5VVBr6jNAVk21CaLT6M3mPN9fIpepnAmf6Kwq/sL2oKYO8wAWdrYyB5Ej
ugfDbmDuUSpLIIW6Q/+PqaBcEDsu1Q==
=501p
-----END PGP SIGNATURE-----

--usN/W+P0p+yJQ+OC--


