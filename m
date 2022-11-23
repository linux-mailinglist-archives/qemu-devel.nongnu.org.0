Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9184636CAB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 22:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxxkP-0004VR-Lw; Wed, 23 Nov 2022 16:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxxkM-0004VG-8X
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 16:57:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxxkK-0001jw-AK
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 16:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669240650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w8I2lq0eoaLFndmNmaf+GnKQPnWMJI9FIgxiYPxZt+I=;
 b=IFwGkgDDKB8hFgjH1B95GANrxPJl9hHD8VOFwwH47tYiYdr3frkso6Z33aia0UPJQPmI/Q
 +s3xQNytETgjFL19vE6K/PC+8OekIb2F1Giy39x2yTizOYt9pPE8iLAOaV3eFr7m8CbXR2
 QfJz0irb5neteU0u6OHq51OQZBo+XAI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-xRiCZGj1N5W8Ja7k5wgLuQ-1; Wed, 23 Nov 2022 16:57:28 -0500
X-MC-Unique: xRiCZGj1N5W8Ja7k5wgLuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69AA9101A528;
 Wed, 23 Nov 2022 21:57:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B387D2024CBE;
 Wed, 23 Nov 2022 21:57:27 +0000 (UTC)
Date: Wed, 23 Nov 2022 16:57:24 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PULL 0/7] Fixes 20221123 patches
Message-ID: <Y36XREqtQtV/S09G@fedora>
References: <20221123144436.2141069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PaEDPidit5Vjzqja"
Content-Disposition: inline
In-Reply-To: <20221123144436.2141069-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--PaEDPidit5Vjzqja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--PaEDPidit5Vjzqja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN+l0MACgkQnKSrs4Gr
c8gp5ggAhES2qdZtu8ZSkYD5QCLX1UMEwBfyvnbPT/Lg5qIBQlV0U8sYYQDjx9zk
JGxUXd/7/9Gy/JVh7qKtW5gUs3kozZ7viK3rZjGJknFGSclHHx5SqUtiyZZWodZs
na3rEx/AfSzBogHLsdQJU0EHo/feNe9SrJoeJPgNLxOz+WTZd2bTLHdzC3RuNqi6
YKKcBTlEhyWCi64UVTRk2TORyDqowaW6tVEUQSV+byBx/F0CaWegC3eCVgfvIYM5
BZoS3v+Spi/Cmljnik/D8ba2BvoJaP6/cKuVLZIbTuI/WASAnKzydFNxB39zHI4o
USFlICh3WFaKxOThntIcjPvtKxIbFA==
=ArwU
-----END PGP SIGNATURE-----

--PaEDPidit5Vjzqja--


