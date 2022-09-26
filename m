Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDA5EB139
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:24:55 +0200 (CEST)
Received: from localhost ([::1]:59226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octin-0001G5-Jn
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1octgz-000868-6l
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:23:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1octgv-0001bt-7S
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 15:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664220175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lxc/J9GWJ2Jeq43NRk69x24s7v3+rMTmhZj1Qj4kkCE=;
 b=AYSjGKEqLiee2H/x9PyIz88wOOyIoE+dgAmdvvXnfchLSqa4e18Gg6l9e71U53t9K/rTI7
 IPPwi0syVQlgdZyNhVWP1xuPoD/adOPrQFt7n8j6e4FaaVMUgosRtRsKoCQWakIF6hP5ms
 TMnaTiKqVbFjLV++XRmKjzWBcnenLD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-1pUNmR2BOWqzDGyfwEaKbQ-1; Mon, 26 Sep 2022 15:22:53 -0400
X-MC-Unique: 1pUNmR2BOWqzDGyfwEaKbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 546F8185A7A3;
 Mon, 26 Sep 2022 19:22:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6CA840C6EC2;
 Mon, 26 Sep 2022 19:22:52 +0000 (UTC)
Date: Mon, 26 Sep 2022 15:22:50 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/39] target-arm queue
Message-ID: <YzH8CosdmbjxpeSo@fedora>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bRwyClUZXBXig4Sc"
Content-Disposition: inline
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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


--bRwyClUZXBXig4Sc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--bRwyClUZXBXig4Sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMx/AoACgkQnKSrs4Gr
c8gMgQf/dIUAXHjfb1qpC4c8xacI34pubd5PCKgOPCoLDYJtOTFd3P5eAl0fIlKP
s+UvnBYMoHUQwKYxXUi1KPmDXezjv4ddSlup1ifRg3fFETLmbU1xjdN0XBLzNLun
/dh8JyyAY3XFQwyOkEaKrPuDy9Od3mJkTdTz1l98jdYUbRAfAD072hg/oxm5vIfj
4FI8928srITguJBZSUd6DnS6iHulrEqVHX9UON32rP+Xft36UrZRFEmxcYuJX577
4L80oBXisLyXNHv30IpOf35vQnO47jgZrnOPd43vuqalrF6mXmP1ByDKcbPHjPMK
BI2vOfUsbbjYzR6RuKoErhSZshLIeg==
=bogY
-----END PGP SIGNATURE-----

--bRwyClUZXBXig4Sc--


