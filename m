Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBC5E6BC8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:36:22 +0200 (CEST)
Received: from localhost ([::1]:46914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRzh-000099-52
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obRWF-0000qM-Cc
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obRWD-0002Rf-JB
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663873552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nm4lXWLAPURx6GaslP1nYuL5tnbFYfF5me+54+Ic4nk=;
 b=Kgca1OmxdXv7RSksRZ4U+PJC5wZyzDfRuNHTa8tQcue6qoBecB863mBEcZD6ytdSNR9Ya7
 moJTMeTStxV9WmzfB8Q731BjtQIAFpCxlv5oISI/hJ6nTclouUFlqi7F1VcO4aT+emU2vB
 HBK6zBGCADAQIv6IfRjieycnLOQy5Mc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-KX6wR2D6Nk6ZkysKbyX10g-1; Thu, 22 Sep 2022 15:05:49 -0400
X-MC-Unique: KX6wR2D6Nk6ZkysKbyX10g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AED338173CA;
 Thu, 22 Sep 2022 19:05:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB099492B04;
 Thu, 22 Sep 2022 19:05:47 +0000 (UTC)
Date: Thu, 22 Sep 2022 15:05:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, edgar.iglesias@amd.com
Subject: Re: [PULL v1 0/1] Xilinx queue
Message-ID: <YyyyCnd015gI/wrs@fedora>
References: <20220921201705.1309392-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TDyIOoLMraoHRevM"
Content-Disposition: inline
In-Reply-To: <20220921201705.1309392-1-edgar.iglesias@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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


--TDyIOoLMraoHRevM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--TDyIOoLMraoHRevM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMssgoACgkQnKSrs4Gr
c8gxvwf+NJiQJmrIWgZsyJK0F2jpK6ZUty4r0zXrMpKpnyaJUcpOov3xsphdhRhZ
BzOxdfqHfm9QqtvsmJlHUm8t0PbUoVRy4ybBxCMq7hGnPydFVjT57fkqAE8ukf8C
OQfIbot/mhyODyxilsvXxxxJBqiDAVhczY7XCjhne91HCsT01xqF4InMJpExvSBe
Ng6HQUoW9+aWCSkcnTvHM0H8kzCzIJDRP+ig1eRGHEt3N8Eec3UjB5OX9Eke4QFm
hGhy3bYTzJkr+tBvYDnHhK/tOC2zyIJ2ihNUvLRzKL291pwVA8xz3r9aAFliOZqT
bAEYwkQ7wKB3xUfjRhjpXnsRgmU6HQ==
=ccSO
-----END PGP SIGNATURE-----

--TDyIOoLMraoHRevM--


