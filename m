Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1010B5FE35F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:35:27 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4vO-0003o8-3d
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4pu-0007RO-Em
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4ps-0001VM-6U
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665692983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rLIYg8Ql0cNkJ/UlxocmADyNzTlg0xdQ026oIDepfKk=;
 b=Y52iSoIsdMlK90J8us2upf+hvzyaUxOCKO/IDjt/kljS9GZPKzKmuiKdG7T0hbU2HmDqdW
 zfPe5NWBMNwb5AynqOwnshM3ZQV6SIpDbsju8daVwDxUhrjERzUJCdTKHY8awhIiQkeQlo
 iIVzlDuev+O1oIWDJgHl6LYGnSm5uR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-6gKVAju1OnWJpaYS9-XDqA-1; Thu, 13 Oct 2022 16:29:42 -0400
X-MC-Unique: 6gKVAju1OnWJpaYS9-XDqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15937858282
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 20:29:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22443117DB18;
 Thu, 13 Oct 2022 20:29:40 +0000 (UTC)
Date: Thu, 13 Oct 2022 16:29:39 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 00/16] qtest patches (and one unit test and one avocado fix)
Message-ID: <Y0h1Myxqrw5SlraX@fedora>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fbmz4UxGC36VVvIY"
Content-Disposition: inline
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


--fbmz4UxGC36VVvIY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--fbmz4UxGC36VVvIY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIdTMACgkQnKSrs4Gr
c8htaAf+PhoSuvDHBQ9jyiujzYjEs/h7shANu0yVP5NgojfUO/KLpc6z+PWFebn8
Ct5VopEVzyiUSuaEkH/uK4X3GGczRsy0RlUpKDZmkQes460lkc14Pra7MpM4szuW
cKbuWYXwUwihnMDN7E1SirVd05pkxfqqSTyfmD174DffwmINWG6euCPTVVO1mVbj
zHNCLurGRkMKtdGyAR9MdBYwzfIwzM3mputUTjcUXdAJECjt+Bj6FvY1ErLEU9Vy
+B1ePB2chBsvLrl/rOQAP6b04omgkR+9P0ptIoc2jb99c81Wya8zaVRGzIepGWip
SPO/MzIG7vgYCU/ik8WlVFubB7ab7g==
=weCy
-----END PGP SIGNATURE-----

--fbmz4UxGC36VVvIY--


