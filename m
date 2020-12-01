Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676F12CA2CF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:37:28 +0100 (CET)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4uN-0004qh-Fa
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kk4t5-0004Bl-3t
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:36:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kk4t2-0003vI-Po
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606826162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1AXBgTOwy281yRZQH03edk4lLXG48+v4F+MMyKPSig=;
 b=EgRdv0UqJETRRq4d8i/2Z5bvEn9GhrSrDSGcaqbHjlEmzP5UyILnEd9Cy3Qg53yoBlGnB/
 MGa3fvwjxYxoQO0jZVDT5SZIpbEz/tRg+bAP7Wocp6mXQKTLqcogt0ATTHmPm1aF+wFUMN
 zet1FA0oTOJWwF0AGZMsYiUxF9+jFeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-hQ_ilX2IMCS3QWj4JqmPpw-1; Tue, 01 Dec 2020 07:36:00 -0500
X-MC-Unique: hQ_ilX2IMCS3QWj4JqmPpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756631E7C5;
 Tue,  1 Dec 2020 12:35:59 +0000 (UTC)
Received: from localhost (ovpn-114-82.ams2.redhat.com [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D84C110013BD;
 Tue,  1 Dec 2020 12:35:58 +0000 (UTC)
Date: Tue, 1 Dec 2020 12:35:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <20201201123557.GD585157@stefanha-x1.localdomain>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <20201130132530.GE422962@stefanha-x1.localdomain>
 <35db4764-22c4-521b-d8ee-27ec39aebd3e@redhat.com>
 <20201201102210.GC567514@stefanha-x1.localdomain>
 <d6b002c6-2e64-ac17-a301-9dd351fdb3a5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d6b002c6-2e64-ac17-a301-9dd351fdb3a5@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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

--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 01:06:35PM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> Dne 01. 12. 20 v 11:22 Stefan Hajnoczi napsal(a):
> > On Tue, Dec 01, 2020 at 09:05:49AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> > > Dne 30. 11. 20 v 14:25 Stefan Hajnoczi napsal(a):
> > > > On Thu, Nov 26, 2020 at 09:10:14AM +0100, Luk=C3=A1=C5=A1 Doktor wr=
ote:
> > > > What is the minimal environment needed for bare metal hosts?
> > > >=20
> > >=20
> > > Not sure what you mean by that. For provisioning I have a beaker plug=
in, other plugins can be added if needed. Even without beaker one can also =
provide an installed machine and skip the provisioning step. Runperf would =
then only apply the profiles (including fetching the VM images from public =
sources) and run the tests on them. Note that for certain profiles might ne=
ed to reboot the machine and in such case the tested machine can not be the=
 one running run-perf, other profiles can use the current machine but it's =
still not a very good idea as the additional overhead might spoil the resul=
ts.
> > >=20
> > > Note that for a very simple issue which do not require a special setu=
p I am usually just running a custom VM on my laptop and use a Localhost pr=
ofile on that VM, which basically results in testing that custom-setup VM's=
 performance. It's dirty but very fast for the first-level check.
> >=20
> > I was thinking about reprovisioning the machine to ensure each run
> > starts from the same clean state. This requires reprovisioning.
> >=20
> > Stefan
> >=20
>=20
> Sure, I probably shorten it unnecessary too much. In my setup I am using =
a beaker plugin that reprovisions the machine. As for others they can eithe=
r use beaker plugin as well or they can just prepare the machine prior to t=
he execution as described in the previous paragraph.

FWIW I'm not aware of anyone else taking on this work upstream. Whatever
you can do for upstream will be the QEMU disk/network/etc preformance
regression testing effort. Someone might show up with engineering time
and machine resources, but the chance is low.

Stefan

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/GOK0ACgkQnKSrs4Gr
c8ilBAgAh5POE7o+VobDXr1FCiOZ3d4M74WFoJcn2ALak5cFi77tSc88S3XD99qj
IuOyaxOIXvvzabSiRdVMLbJLG2KsXItc+tTtF3VJ2YohOm6s9thmrpCttaqj+fiq
Xf8K3mPSzcsIjnE5vHMs9JlXTwVtbKrD0UpFlY99y3v/OY+PAQNA0/IYTKrdxVYO
+96OUU2vog42M5XI8xjF4gLQsdZOdMikN4jeENtDIFd5IDVJRgoMQTvs4uKbHVGF
NYlJvmtxAlEI8KJMyfiyZS0jDww/eR6nhlFU4UHHcB87lElgrZhHPyk3O2T2oWfO
ZuT0+PEGk2bIXegovvMWUclheTseSg==
=sZvy
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--


