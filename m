Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B43214B2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:03:46 +0100 (CET)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE90D-0008DN-JL
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lE8xY-00070x-9P
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:01:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lE8xS-0000f3-5C
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613991653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OQsowFSZT2FkjHC7p4XytM9nxxaN2iiOWZtJwSPNtLA=;
 b=h/nq5XZnbuM10nQkjrz5vUhYKve1mRtUitRhoAp+tHUdhZcrOntePGwo1m/7VWJbLfopOs
 mtEtb+F0b6/haxXeptMvXeXNHOS5tgEf5SmC4AxC+43Yy+4PGkqkgeEnZcaECJB1wQhGNd
 jUyTiKE197v6zAeVESfMJYBCnBKPwhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-P2TaUnD9OE26kR2sUlEKng-1; Mon, 22 Feb 2021 06:00:48 -0500
X-MC-Unique: P2TaUnD9OE26kR2sUlEKng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DB4F107ACE8;
 Mon, 22 Feb 2021 11:00:47 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D9C1189A4;
 Mon, 22 Feb 2021 11:00:43 +0000 (UTC)
Date: Mon, 22 Feb 2021 11:00:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v5 0/9] block: Add retry for werror=/rerror= mechanism
Message-ID: <YDOO2s/lxm/i6I+D@stefanha-x1.localdomain>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <3375c2f3-4e85-95b1-cb8b-ab77b77be1eb@huawei.com>
MIME-Version: 1.0
In-Reply-To: <3375c2f3-4e85-95b1-cb8b-ab77b77be1eb@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AzcP3nHGarznZhdL"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 fangying1@huawei.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--AzcP3nHGarznZhdL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 10, 2021 at 09:22:38AM +0800, Jiahui Cen wrote:
> Kindly ping.
> Any comments and reviews are wellcome :)

I lost track of this series. Sorry!

Feel free to ping me on #qemu IRC (my nick is "stefanha") if I'm not
responding to emails.

I will review the series now.

Stefan

--AzcP3nHGarznZhdL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAzjtgACgkQnKSrs4Gr
c8h23AgAyKO40g5xTP1dx5qRlRI9gHwTcyCieHmD/faHQW1fKwXZlVMlCpOOTShf
MsnRR6DW7DzL8t4c1/gAovbHBJQkx+r0n0grMzEaDBQ4wPP1x9W37kdAdwdL7MHE
vbAydGF6emPMV1lBt1LUcWHp8dbJtvBLZCeYb5PxXjKVJa4VOCZgjcX8B2B4al6/
NByOvvjkMLc8ZXF7X/fvHNi1KLB5Xn0kfQza/xjD8R/1gZZCC/YSf4sfKT0FixHo
eASOUAx8Y4+QNSsmSEs15W4cxOh6CSGFBurkn59LbtZ4RX9JC8EWRDwu93BaJAXF
H1VPj3ZYsWFfIX2UweWJ2CWDE0FIeg==
=n+Hl
-----END PGP SIGNATURE-----

--AzcP3nHGarznZhdL--


