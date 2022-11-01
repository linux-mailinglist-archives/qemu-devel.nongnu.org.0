Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A66152AF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 21:04:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opxUf-0001mT-5m; Tue, 01 Nov 2022 16:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opxUd-0001lg-IP
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 16:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opxUb-000234-DQ
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 16:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667333052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aXSFfU5aVYIFtUz66ezEBoCRvNZVicLHsTqEkUcnCXs=;
 b=hl98O3ajSAU8X+y1zYrh7VeeTf7rRKXsyw5KJ7kuB0Uaw6aLYCZ4XiG60ZSOeU7zqaHpjZ
 JvaTTvrmpsn/KvPIE8QNvj8fCf85MYR+wY1XiGtKcdWz2oZkLslyvO6BmYJxO3m3r1o/Cu
 jbVylIP3sGiC2LExsaCDgIHLnEmhLng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583--_QhfBzgOJKWa8HNh-7Rig-1; Tue, 01 Nov 2022 16:04:11 -0400
X-MC-Unique: -_QhfBzgOJKWa8HNh-7Rig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0666F101A54E;
 Tue,  1 Nov 2022 20:04:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8550B141511F;
 Tue,  1 Nov 2022 20:04:10 +0000 (UTC)
Date: Tue, 1 Nov 2022 16:04:09 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PULL 0/3] Block patches
Message-ID: <Y2F7ualOSyqEJyuN@fedora>
References: <20221031185106.28245-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ngzjz8Ts8UAD6VyV"
Content-Disposition: inline
In-Reply-To: <20221031185106.28245-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--Ngzjz8Ts8UAD6VyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Ngzjz8Ts8UAD6VyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNhe7gACgkQnKSrs4Gr
c8hV1ggAr7nYtOyn1rdD+GOvshobqttG2ZSEGrOqQBUwUDN7TJex0CXI03WGhJcn
Cd4ZaZblxBXhHpRebpHovGTbEzTPEl8K5+bxmYZl4lAmjSpWwCUUdjxdKoM6Szms
IpPs1mOj05ae99lH4kF7g8j5opUPnerBwIZOtDaCmOAaliG99GbtBygRzXhq8OLl
6CwOCBpdiQxM5hErdKnljx5CpooFP/5HHs6VlSp5O0T3gU/gavns79gqLM8jOlzc
dpf37gDkLW44z8b6klt7OELLX+tSneJPMKGJEUENmezyiLRkNckRhalylI51ZrfH
9+xebXDxQya5cNrTPZCLGrI/oSW6MQ==
=xGdb
-----END PGP SIGNATURE-----

--Ngzjz8Ts8UAD6VyV--


