Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A65F5996
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 20:14:59 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og8v4-0007Rm-PY
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 14:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og8cU-0007dG-MC
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og8cS-0001bN-QE
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664992544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M/ftjPSQIqyF+JhmtDeRxIjKUmu+ZBrbChC9xxMGN1g=;
 b=abc4hCgkgFeX4CK10L3dWsioMAGPunk6vJxgfLyTr0QHJxz5ptIryWW+Nbu4xeeAmgBa0G
 7omuLjEviUTk4t+qPpbxbGbq4l5GAXlJp805mgCkMIoQRpvy3qHP1ZBbQl+KQEMHWNS5O7
 lgkPQxHbN3pBo7fWnCrNF8RtQW7f7HQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-qtRNlc5DM62XxBPX6ulfuA-1; Wed, 05 Oct 2022 13:55:40 -0400
X-MC-Unique: qtRNlc5DM62XxBPX6ulfuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B38E101A5DE;
 Wed,  5 Oct 2022 17:55:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19E9C140EBF3;
 Wed,  5 Oct 2022 17:55:39 +0000 (UTC)
Date: Wed, 5 Oct 2022 13:55:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 00/20] tcg patch queue
Message-ID: <Yz3FGu2HLz3C4lbw@fedora>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8PlTFsiPFtXjm/TW"
Content-Disposition: inline
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


--8PlTFsiPFtXjm/TW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--8PlTFsiPFtXjm/TW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9xRoACgkQnKSrs4Gr
c8h94Af/bAN2zqfC34T2Zx8emE2F+3zWE2IFc0HzpYFKhpTFCUtKRv/dVdEpi2Qe
Q4b+p3zDopcpaA15uT1rgw/duDwEh0u9N7KYTHGcIHAzmUqT3Y1UCcvkatIvu0pX
IVlhmiM0aWIxoVjmZjuYlJ58rS1Mz9d9IQ4shVgF+7oOPJI6HVyWtqsM9gsn6AW8
1v+hR5fVz45k4TCwPqg//3OilxJhPhf8j3aJMsuJk60bv1hoSXOu3Zq0FI9zyG9L
oqX1jzVYVsZKe1bPUBeFcUNrLzBKzOAyTSSsU49lWDcr0r/oEfM3YibjqDrbuBsr
UMh2nYEv12Dyt4j5poDr1UDTFKNX0A==
=uWWi
-----END PGP SIGNATURE-----

--8PlTFsiPFtXjm/TW--


