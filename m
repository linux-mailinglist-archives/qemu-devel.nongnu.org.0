Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF8C5BBA49
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 22:20:33 +0200 (CEST)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZeIh-0004P8-UO
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 16:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeGA-0008Q4-Cj
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeG8-0001C9-Sy
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663445872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XACBi77i+cBNglvlFhn9tENT8/fZO6ghjD5FdL6USpY=;
 b=MllETSA7YU51Sn93aOX3lJopAMo6vye/gbBhyLGJJIhFMSOh9tUMIlCZIkOxht9kqJ2HmN
 S4XTIWNPTS1UJifwMODMaDzArhjpiCENOSFiGhZPQeUhO0fXKlvCsvD6JX3sFp+nP77UTD
 rhC9Gjmfzvvn3K47nWBXcL+Rf25mVzM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-G7ikd7RvOlGA7Py8lFL61Q-1; Sat, 17 Sep 2022 16:17:50 -0400
X-MC-Unique: G7ikd7RvOlGA7Py8lFL61Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EFE585A583;
 Sat, 17 Sep 2022 20:17:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B72252166B26;
 Sat, 17 Sep 2022 20:17:49 +0000 (UTC)
Date: Sat, 17 Sep 2022 16:14:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/11] semihosting patch queue
Message-ID: <YyYqnE1PeKmyX/cA@fedora>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X5zoelyKAqYFkge7"
Content-Disposition: inline
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
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


--X5zoelyKAqYFkge7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--X5zoelyKAqYFkge7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMmKpwACgkQnKSrs4Gr
c8gaRAf+ITuqeFLZ9r+BQmSHVnbNqlBMzSEcZO7j0ESfhrKMee+gxLFkT9cn/8im
4/AKiySozy3CA7TKnUKzQ1djny7917k4STo0EQKSDsw4lopsprujDUJDhMEdKAnQ
CGmydShuCQiNi22XzV3MS9cJNCYX1Gr89isiSD8vz0T9XzznP+sZe7FuOLkO4EjC
7l7OpuRjYpJKm/5WYhg+itSfzxvESvCXSAbZS/DRnTAJmYqOovSbc1sfwpeNVMJu
gnb9b67jxHGaZ3anKjHKmZKc1OvIKhAYDM0qeBX+29tcISYtqjSLPJoUh3ZgqCk9
B13BeMdNtKyXzmoOydRt0W6qRa4f2g==
=sQqf
-----END PGP SIGNATURE-----

--X5zoelyKAqYFkge7--


