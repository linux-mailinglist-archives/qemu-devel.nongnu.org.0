Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5960CD2E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:15:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJii-0000Cp-7U; Tue, 25 Oct 2022 09:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onJiW-0007bt-5j
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onJiS-0007fr-9k
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666703493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Wj3K6e0+DID0Fb4Tb2nQpTRNBc2dpmntC/297GfQ7k=;
 b=br1qG7rLQRXHcdk/oqLv2Tw2phoH/dIc4iir5M5a0ShPaswsUXIzJxyiOoyXdMC7+QLcU3
 Lnh2RVn10zDGfBhFm1/6FTBjAbSkcIvij7+9pYAZenzdkDrAyVYINuHjUNcoP23vsfGykY
 prL6q/w63o52/1NHTvaowde8aqk2GFE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-ZseLWBnZNuG9__hSUbgRZw-1; Tue, 25 Oct 2022 09:11:27 -0400
X-MC-Unique: ZseLWBnZNuG9__hSUbgRZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E41511C08991;
 Tue, 25 Oct 2022 13:11:23 +0000 (UTC)
Received: from localhost (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 399C620290A6;
 Tue, 25 Oct 2022 13:11:23 +0000 (UTC)
Date: Mon, 24 Oct 2022 17:07:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Greg Kurz <groug@kaod.org>, Linus Heckemann <git@sphalerite.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
Message-ID: <Y1b+ovFFbizpz5vK@fedora>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VRDRZ7kApmjsCSWY"
Content-Disposition: inline
In-Reply-To: <cover.1666608862.git.qemu_oss@crudebyte.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.517, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--VRDRZ7kApmjsCSWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--VRDRZ7kApmjsCSWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNW/qIACgkQnKSrs4Gr
c8h6WAgAlREWrkxpsY+fed/4mwQVbmd/0W6pS5cVGkgQE/OuBHNoU28q3w13/Zd+
06lEAx3OwVOWTneFxJt5ebejLRWP3QlBpgL9mX1nNCLqiyROpc2pFPZDhShQoLDL
++sFnDw9o7J+KTxrNaW9J73D30s/Pz+84EX1xhxEGfikVLs+hhy+HvPGjzIr8Tue
ozwxLOsYszIcJnCU7NcsuxLFsQOUxdnkd1lk3qTs42JAejtUxDKHvJtT/GHRl99/
DWoNh4qFaHz8XHUPAgTNUK9UIfintLPVaGQs/JKwH4P0jCR5ISVG547tPKfHGGMf
b01DmvbtgUmgU1va28vq2J7WRjHwhw==
=bW21
-----END PGP SIGNATURE-----

--VRDRZ7kApmjsCSWY--


