Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A3E6269DB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 15:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otrIK-0002X5-IA; Sat, 12 Nov 2022 09:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otrIH-0002Rv-Bx
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:15:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otrIF-0001Ng-Ri
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668262534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jO720zhYDYeAVryGF0nTDloXfBg4GgQ26ZccO1I5afw=;
 b=d08JI04xt7FNfx2gjhAlQj5GSWoB5D+kKnQ9Vg8sfeyzYaJdp1MCQaevpBpmbeJ4lfg9V7
 1phpR53+AzvzvbwNzfA/DslTV5kNIYnIJQDPFDJ98M/uVeGX3foJ/J7RsTgs9XlLUnKXVg
 vMnzOul+9kcoOYyZvrwhNSY+NbY+pVw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-g2Q3Q2ZkPF6UkIjW2zz01A-1; Sat, 12 Nov 2022 09:15:31 -0500
X-MC-Unique: g2Q3Q2ZkPF6UkIjW2zz01A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE6FB2932480;
 Sat, 12 Nov 2022 14:15:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43F3C2023A16;
 Sat, 12 Nov 2022 14:15:30 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:32:31 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL 0/1] ppc queue
Message-ID: <Y28Fv7Zoj0Hg13AE@fedora>
References: <20221111100551.1076171-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9kq9QiAo0tkcbcNk"
Content-Disposition: inline
In-Reply-To: <20221111100551.1076171-1-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
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


--9kq9QiAo0tkcbcNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--9kq9QiAo0tkcbcNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNvBb8ACgkQnKSrs4Gr
c8iMGwgAohEGdEiBymgNmsxLEQjTh0peTI7XAqSfxSTwINWBPYODtO26wftxsXAR
jzn4/03BaFoNUsdfXT3SY2bdeSb087KrXtNDo067W3pZXp8HmPFmVF4vc/0SnyZl
mEp4DIFSmuxW7XuzhCs+JyLK40owU5a9HTBHUClFn1TRBggVd4JqVgkjdqo9ar0T
3ce4xh+paRaURN+jRXypGizm3X0J3xouNpUiH9s4zwNW9phsHoxm5CshSupdVmAQ
ILXKyTo+a4i4Tfa9h8HiUCbOB/J4bN7I0KDuOqfnt5jpZJM6ZFaOTFEijZ3uFTVy
Nb0HPbK/wOoF3iloGKoEuYybD1JtAA==
=ceLl
-----END PGP SIGNATURE-----

--9kq9QiAo0tkcbcNk--


