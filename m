Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA545A88E8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 00:19:06 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTW37-0000eB-2T
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 18:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTW0h-0007JN-8r
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 18:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTW0d-0005iL-Iw
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 18:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661984190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hasdEdjwfcsmzpiKhBD3Z2NyOc+gJBXUlvyWwUn2Pg=;
 b=O3NdzGXtGwwvMyn2KODpjKc5DyBK3g6xRDI8z/0I09yBGGkM6poC1EkQTIh+fT93C3ZHZn
 kv7D79/7odaaPBrvhMoHZBV0/qBtDlZxwuyfyjA8YL/EU6r4hY7BGb+SYo0/56D+w6E5aW
 3XIMxuRIg+tzZAdcl2SwRrkx/kZqAKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-th04rIwgO6CtN-o-qtmsYA-1; Wed, 31 Aug 2022 18:16:28 -0400
X-MC-Unique: th04rIwgO6CtN-o-qtmsYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 119CE101A58E;
 Wed, 31 Aug 2022 22:16:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9812A40C141D;
 Wed, 31 Aug 2022 22:16:27 +0000 (UTC)
Date: Wed, 31 Aug 2022 18:16:25 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org
Subject: Re: [PULL 0/6] First s390x updates for QEMU 7.2
Message-ID: <Yw/dufuOOx9HPIJk@fedora>
References: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Py1KETWp9oK7hR5p"
Content-Disposition: inline
In-Reply-To: <20220830171947.71464-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--Py1KETWp9oK7hR5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Py1KETWp9oK7hR5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMP3bkACgkQnKSrs4Gr
c8j5zgf+J/Uk+jAxRO8mjMJFdG9lT0+FC7z//4YVPQLwtIEt2sRywNNW1N80aW0q
GwdVUr/4HOO/OxLpPS8YwLNAbIzTA401egViGXmmK8iqzZQZ5X13xeTiA+azpRy0
HRCQ79lEfAexLJg1dTljxoqSLxZVB/DVw4oXwupUDzGlxdTKZ2HGZOmuS0dYLiwn
IlXVKgVC5MLTbqGBfZXeZq0Cpg8x6+omAmimgI/5jSpdIwSgI//MhqQdbuAVW/Wa
bZ7zxmvkCMUYqzHjAyTgKzd9sL+W+X6WBDhLVXuqAE1U5gME2wRDYU78wAFrEqEJ
E3BVe82zmoAlRI395vmUViPYP3hTyQ==
=v1AM
-----END PGP SIGNATURE-----

--Py1KETWp9oK7hR5p--


