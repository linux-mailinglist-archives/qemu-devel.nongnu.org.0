Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004AA5E69F8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:54:10 +0200 (CEST)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQOk-0003Vw-9s
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obPue-0004BC-Dp
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obPud-0006tW-1H
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 13:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663867378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wbaBo40bcu6cdveob0bgzzI1CIYzupMjSt9Ky4EPE0k=;
 b=G79WbXU5iIUUuVN89zbE+eGp5LYoKa/5x+lgoBBgE+SeKHy8r21CeTZ9ckKTVDio8wfo88
 5/fMaF+sSttjTW9UVB1okKRlQy9PISA1hIjzjDn5zbPSCJ6hFVdVwA8h/IoHD72UHnNoFW
 aHzBGtJRqID4EW9IPTy8i52Qm2YTDzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-AAAYdo01PuqMbzQAWKnzkg-1; Thu, 22 Sep 2022 13:22:55 -0400
X-MC-Unique: AAAYdo01PuqMbzQAWKnzkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9683A872843;
 Thu, 22 Sep 2022 17:22:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06B3D17595;
 Thu, 22 Sep 2022 17:22:46 +0000 (UTC)
Date: Thu, 22 Sep 2022 13:16:42 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PULL 00/30] testing updates (docker, avocado, deprecate 32bit
 BE MIPS)
Message-ID: <YyyYer+scURdkWnj@fedora>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fii+OkdsrIwpJJ8k"
Content-Disposition: inline
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--fii+OkdsrIwpJJ8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--fii+OkdsrIwpJJ8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMsmHoACgkQnKSrs4Gr
c8j9Cwf+I1QQsOQzazHjL/fsaEMYK0u4NERqTMEu/Ltcii8hQZPg1XQBiZrKrwLS
MPNs+Cd3Zzz/n4lu42UXmPV1qEhVZlwFPHa8rAE8JdPr7MZOt5JnODo08IfvT92w
nrev4j0Qfst411wh7Y8b0YGVxK+byhRH741pZPN3MkJEVNpGrRAL62+EjVZ08iq8
B5kvMC7Rd6T0G33mI3Lb973i2OS/9f9YHjY8aASEm21w9C+jioFd8HXPxVKyKdVr
jeOsZ2fcYkvKXMZyUj/E3MvGre1ijmHd+s8t19AJyi/ZbQFufQJGPacssVR5hsiy
GVTpHBFJgZ83dIwdGEbap2X5wEDANg==
=cG9n
-----END PGP SIGNATURE-----

--fii+OkdsrIwpJJ8k--


