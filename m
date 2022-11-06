Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A376861F500
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:12:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2qi-0000pu-Bg; Mon, 07 Nov 2022 09:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os2qg-0000ni-74
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os2qe-00068G-5y
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667830295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZzAJzK46QtQVGYFBZiJX0D0YQ7qAKuXYl8nrsSc97w=;
 b=SEbtOAe1SgU9llhxHnmuUBow7wNi5VjLQPBoqIHTngACyAJ8jQqImFmPxzol4tH1K/+wxt
 Vv3dhKYT50z9Bp9FQfsBzH1a6St2gzDgO9gfQ4V+kLOA19Vi3Ekr9dvmHF0cx+rLYj40Ej
 4cwA2KZnbFtPBDa3kZBnn9+9QGviamE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-8ef0UfCwPJWQ3p70HWkItA-1; Mon, 07 Nov 2022 09:10:34 -0500
X-MC-Unique: 8ef0UfCwPJWQ3p70HWkItA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC6032932495
 for <qemu-devel@nongnu.org>; Mon,  7 Nov 2022 14:10:33 +0000 (UTC)
Received: from localhost (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A102140EBF5;
 Mon,  7 Nov 2022 14:10:33 +0000 (UTC)
Date: Sun, 6 Nov 2022 17:34:01 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, alex.williamson@redhat.com
Subject: Re: [PULL 0/1] VFIO fix for v7.2-rc0
Message-ID: <Y2g2Wevic4tcnM/s@fedora>
References: <166757797349.2504527.17538714015825495328.stgit@omen>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hEnosIX4tUZrpd8+"
Content-Disposition: inline
In-Reply-To: <166757797349.2504527.17538714015825495328.stgit@omen>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--hEnosIX4tUZrpd8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--hEnosIX4tUZrpd8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNoNlkACgkQnKSrs4Gr
c8h/8wgAmC02xu09pTiB4MjiFPti9BzvE/cPuh1uwzSVOs8g6PkfBCl12PCCVChn
nzeG416o0bnvSShjqu4dZCaLePOQ+uHmjQHsqTt7iziux/DPPh4tgA3zXTA6Pxui
fJipm2KPg2DX9uvjAlRkgvpUh6sePk0sx1Lw6gi8NRc0E0tssAvKS0EcZCh0KTKw
4Gl7VjNRZt5gyzom/23Ks7UpkTo7xc7LOXImdp+duNkbiHPLZbZFIMXxA6+NQdS/
4JZXOgV9C0lzFDdpIfxdFbDx+dtUUasYeqR+KvXLFBiojq/nzpum50OzxIGgBxuG
YQc9dsyZWuIp2aiSg9UjcbkizGlyAw==
=RgPX
-----END PGP SIGNATURE-----

--hEnosIX4tUZrpd8+--


