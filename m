Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5963AA74
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:06:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeku-00046m-4E; Mon, 28 Nov 2022 09:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ozekp-00045d-Nu
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:05:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ozeko-0002y1-31
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669644300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/AxHGrGt+C+IacFsLIjSYGARNJZmCLNM8Qic1MwIBg=;
 b=UuNMw5oKK4Qw2aBewP1ETpMkEUgr3+SO949NTGeY0zhrPC4hz8fsCMvQ3YSssbCZYpdqcr
 lwXWfCTRXWkmTBCn/IZBhC76igi6ONAviD/Byu0N2g+W4uyT9USXa5KCcBtgkZU2cpJ3zQ
 4MO4ZBg5mYgOvACbNH1S3LZVSq8sX9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-7vpZfiDYOl6g8cv48lMnxg-1; Mon, 28 Nov 2022 09:04:56 -0500
X-MC-Unique: 7vpZfiDYOl6g8cv48lMnxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81A6D858F13;
 Mon, 28 Nov 2022 14:04:56 +0000 (UTC)
Received: from localhost (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2F0EC15BB2;
 Mon, 28 Nov 2022 14:04:55 +0000 (UTC)
Date: Sun, 27 Nov 2022 19:31:31 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil via <qemu-devel@nongnu.org>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 for-7.2 0/6] Add format attributes and fix format
 strings
Message-ID: <Y4QBYxg7kbE4tzma@fedora>
References: <20221126152507.283271-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vDGeK4qdcYkh4fA+"
Content-Disposition: inline
In-Reply-To: <20221126152507.283271-1-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--vDGeK4qdcYkh4fA+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--vDGeK4qdcYkh4fA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOEAWMACgkQnKSrs4Gr
c8hv/Af/f+3vtCxuzlASOqjbu5pybaSYVZQAJJkded1Rgl6PI86sGqf7yyf3CNdo
divx8KlfH0EiHeIqW2hTtOeixs+QpnbNZp1dImgZLWh9tQwplv14ZmKqJvPZW7Lk
feAyeT73iXdnH0pLfVLdzZk21O+BX70GsJStDAqPjTrocQ43+g6xXgTibvZ2RvQc
k8jwYYLDX5Y0YMdJFuiDKgEIA/8yfxGCWFzN4acOj6ZoKy7wkZzI7gtmjIDC5AE1
J60eczT+o/q0yhd8FlqDeDr8f/yXkA84GyO23KlTJWmg6dUMyK9nym0Ria0msNyb
vazpXbBXT1D1aM5Li137AM3WGFB3qQ==
=aLRT
-----END PGP SIGNATURE-----

--vDGeK4qdcYkh4fA+--


