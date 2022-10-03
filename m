Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEDB5F3996
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 01:09:00 +0200 (CEST)
Received: from localhost ([::1]:46648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofUYW-000693-12
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 19:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofURh-0001Tl-3P
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofURe-0001sC-90
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664838113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iyXbs9KcI6nu5U8VpaVDCA/YhiZVDmPKHW2fbc0Tpc8=;
 b=P9rAwNCQJlZEqzVD9TYmu0Ovl+Oisqk4Lw4NERuYFqaETRuWam6sTYYISAi2XSxtXEYMZV
 Q/XSrk25B7WgU0dHI6we7syvJ8nIGb/7L6aHPYzXf1YNVapQBl7j6TkOoTLknMbh27a9LF
 JnaZ6+ddrLYkMxdgh9Jawctg72nFiPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-dQN0gWExMwSjyUJw4dUCLA-1; Mon, 03 Oct 2022 19:01:50 -0400
X-MC-Unique: dQN0gWExMwSjyUJw4dUCLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9DD63803902;
 Mon,  3 Oct 2022 23:01:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD1D2166B29;
 Mon,  3 Oct 2022 23:01:48 +0000 (UTC)
Date: Mon, 3 Oct 2022 19:01:47 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/10] target-arm queue
Message-ID: <Yztp274YDgrU6mWn@fedora>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ESc8Nj+MJJ53hNyI"
Content-Disposition: inline
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


--ESc8Nj+MJJ53hNyI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--ESc8Nj+MJJ53hNyI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM7adsACgkQnKSrs4Gr
c8j1QAgApaSBgF1xFzVtXfpYi1dngCFaZqVRxYipreh5j9fo7kiRCnWlLR94VFM4
xHDPgXJkT2idC10p42bW70tFlJZGaQ3J1PLvFmhoWb43yhczjLd4ueD8bl0Wqk+O
egmFO2lfQUor3RvancaacPgzgP85DRpDXdFufSZ1Z1vrn4RGDyawUxm9lK8yeeSJ
XTWCEB0DnpIq5RX/JGjvv5s+qquM105UiGJxz6RghzLRoG9yctQfKbsq77UbT7wy
fpSlyJ0JwCnSrSW2/8cd/JFu6AXv1If5jnrmNysymhP6vB+Ahtcr2v4rTXvRvxvY
fy5VB4FIU1WC07DplcRhupaiQjWA0A==
=H+JY
-----END PGP SIGNATURE-----

--ESc8Nj+MJJ53hNyI--


