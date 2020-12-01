Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1692A2C9F0C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:23:30 +0100 (CET)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk2oi-0005s1-Ke
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kk2nt-0005Qn-OO
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:22:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kk2nq-0007j5-JD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xCCMudTgos4dhuSy0G/NE4sUkDdAb31Imd0X5mMOsGw=;
 b=Jv31nU6eKfHG6DhxVexfVMVTmjkOIY6j32Ov79fNH4wB5+P+2rBAsa1SeUgZQgjxOFJa/e
 psRl7louXNPaF4yOHzklD8xwNoDBgiwtgNjEF6hhcy0pTk7WRRAnK7Tsx+ufY0KT/NYQGf
 OjBwq6ACdYvriZYXBkjxuMR/q9w/9Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-jxevObvCOneDUF7RUJ_Fyw-1; Tue, 01 Dec 2020 05:22:30 -0500
X-MC-Unique: jxevObvCOneDUF7RUJ_Fyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ED34192D795;
 Tue,  1 Dec 2020 10:22:11 +0000 (UTC)
Received: from localhost (ovpn-114-82.ams2.redhat.com [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2355660C0F;
 Tue,  1 Dec 2020 10:22:10 +0000 (UTC)
Date: Tue, 1 Dec 2020 10:22:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <20201201102210.GC567514@stefanha-x1.localdomain>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201130132530.GE422962@stefanha-x1.localdomain>
 <35db4764-22c4-521b-d8ee-27ec39aebd3e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <35db4764-22c4-521b-d8ee-27ec39aebd3e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Charles Shih <cheshi@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 09:05:49AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> Dne 30. 11. 20 v 14:25 Stefan Hajnoczi napsal(a):
> > On Thu, Nov 26, 2020 at 09:10:14AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> > What is the minimal environment needed for bare metal hosts?
> >=20
>=20
> Not sure what you mean by that. For provisioning I have a beaker plugin, =
other plugins can be added if needed. Even without beaker one can also prov=
ide an installed machine and skip the provisioning step. Runperf would then=
 only apply the profiles (including fetching the VM images from public sour=
ces) and run the tests on them. Note that for certain profiles might need t=
o reboot the machine and in such case the tested machine can not be the one=
 running run-perf, other profiles can use the current machine but it's stil=
l not a very good idea as the additional overhead might spoil the results.
>=20
> Note that for a very simple issue which do not require a special setup I =
am usually just running a custom VM on my laptop and use a Localhost profil=
e on that VM, which basically results in testing that custom-setup VM's per=
formance. It's dirty but very fast for the first-level check.

I was thinking about reprovisioning the machine to ensure each run
starts from the same clean state. This requires reprovisioning.

Stefan

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/GGVEACgkQnKSrs4Gr
c8iN+AgAvJyVq19b9PPBDIeaeTR918B+Sn2IBCeyEKH0S7bSgHmWHAxDWp8KaEhH
H4u6ZXBhFlAjzxSIxaaL+aFK3rvESGvI5Adit+bC932ejifkxm3ljpJGbqA1PQR8
BN4/KiUYeX/dVBEFXF8JEZuRcbmJEHTLPCbaUuICYfYNNYZYKC5rOnufUG3juJyp
MBtDir/X7R5oO3Dl/IEIV5O0chaCOVD2kLqmr+NQRspn+7xOnXDuFQCX5xOlqVsk
iXZdawt7YR4tDVlza0rOz+QHFQGA66QuAJQ2of2oddNvAbBcJh9Ns1h166YMsm9+
2yjLsliuQAqzlPIkDUQnUgfl/ouYBQ==
=VZ/k
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--


