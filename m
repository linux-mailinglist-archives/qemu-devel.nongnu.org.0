Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C2613DD7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZud-0001OB-NT; Mon, 31 Oct 2022 14:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu0-00019P-BS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZty-0003di-Qz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=L5JSHncN5DABRpUtxq8xWcqZNwXnhDPVkM7C+bdaWTo=;
 b=WYifD4gkSzfCPOBoEptoRqzGABOVMuR8RpSOPAXT1Z99ONMnEbuMJVzuopgeSuI7lXueks
 jQWXiHfTNYrDlXbR3ApSJZx2jNourYNC7eRcglYQcdcED1vcC8q+j0/6Q/baqKaFhp7HuB
 ivbtKa5mP+zmYMp1nNUi+ugDNZ3VaNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-WTQG8b6dPOiCNbyPiOGQ0A-1; Mon, 31 Oct 2022 14:52:48 -0400
X-MC-Unique: WTQG8b6dPOiCNbyPiOGQ0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 256D3884344;
 Mon, 31 Oct 2022 18:52:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 944F640C2066;
 Mon, 31 Oct 2022 18:52:47 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:39:07 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/55] MIPS patches for 2022-10-30
Message-ID: <Y2AWS0Ug/Gt/c7KX@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QuLTTNvbGtZGakc7"
Content-Disposition: inline
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--QuLTTNvbGtZGakc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--QuLTTNvbGtZGakc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgFksACgkQnKSrs4Gr
c8hJ7Qf/Wfzs/i2Muavo8cbV+a6MH6uGXQdWB8vMB6wjr3tjKNcFEz67OS8ZdlNb
wurDOLitTVtM5Q8WaWYGPvp6XWHKJrq4wcyDZDNH/J7lG0NEYjHi2m09ZyRbw8Zd
si/+VGlwsk0qTad+zg6ETiQhzImP0mA1ovFaxZu4/w30Xxnw2zCD8wTmM8F6kApy
0ACu3gSQqY1/EFXbNFY21K2+dkKopqLD7DJkF7mXRpahKkcO5sXTXtp7VzP7GHa0
nNNW3dI00+5Nw1D0V2rLSG8t1vK8krxHU0HUPLZDvTPMN1nrDmGHFcN72eiAOHqq
MAAA3dM8pWjCy1hk0fX7Ju+TD6hM7Q==
=VEqc
-----END PGP SIGNATURE-----

--QuLTTNvbGtZGakc7--


