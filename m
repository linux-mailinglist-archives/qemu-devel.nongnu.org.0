Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5199332FEC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:31:40 +0100 (CET)
Received: from localhost ([::1]:51324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJj11-0005Ga-Sm
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhtn-00060Q-5z
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhtl-0005hz-7g
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615317604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SGalK1W+r81SehqFNZPi5ZiII+lX6WMtAlCXqPii4+I=;
 b=Al7t+RtVvLrAYUkbjX47Y7fNGKeTpEV0yIuZrWYomTqTWMjlv0iBxeOb9L0NPqrQwCsdNp
 p0PJ07PndijNbmlpagP4mGLMz62uo8OW3OJN4zXyeUFu09+jmNOs+KbKr92C5Y/+l/itwW
 jlw69DktWSRQ0Exsq7I20sBBOgnt30o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-msZiheV3P8SSeQxjhYp9_A-1; Tue, 09 Mar 2021 14:20:00 -0500
X-MC-Unique: msZiheV3P8SSeQxjhYp9_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0BD01923765;
 Tue,  9 Mar 2021 19:19:58 +0000 (UTC)
Received: from localhost (ovpn-117-250.rdu2.redhat.com [10.10.117.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A890C1895D;
 Tue,  9 Mar 2021 19:19:52 +0000 (UTC)
Date: Tue, 9 Mar 2021 13:52:37 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 0/3] tests/acceptance: Handle tests with "cpu" tag
Message-ID: <20210309185237.GB2155904@amachine.somewhere>
References: <20210224212654.1146167-1-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224212654.1146167-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 06:26:51PM -0300, Wainer dos Santos Moschetta wrote=
:
> Currently the acceptance tests tagged with "machine" have the "-M TYPE"
> automatically added to the list of arguments of the QEMUMachine object.
> In other words, that option is passed to the launched QEMU. On this
> series it is implemented the same feature but instead for tests marked
> with "cpu".
>

Good!

> There is a caveat, however, in case the test needs additional arguments t=
o
> the CPU type they cannot be passed via tag, because the tags parser split
> values by comma. For example, in tests/acceptance/x86_cpu_model_versions.=
py,
> there are cases where:
>=20
>   * -cpu is set to "Cascadelake-Server,x-force-features=3Don,check=3Doff,=
enforce=3Doff"
>   * if it was tagged like "cpu:Cascadelake-Server,x-force-features=3Don,c=
heck=3Doff,enforce=3Doff"
>     then the parser would break it into 4 tags ("cpu:Cascadelake-Server",
>     "x-force-features=3Don", "check=3Doff", "enforce=3Doff")
>   * resulting on "-cpu Cascadelake-Server" and the remaining arguments ar=
e ignored.
>=20
> For the example above, one should tag it (or not at all) as "cpu:Cascadel=
ake-Server"
> AND self.vm.add_args('-cpu', "Cascadelake-Server,x-force-features=3Don,ch=
eck=3Doff,enforce=3Doff"),
> and that results on something like:
>=20
>   "qemu-system-x86_64 (...) -cpu Cascadelake-Server -cpu Cascadelake-Serv=
er,x-force-features=3Don,check=3Doff,enforce=3Doff".
>

There are clearly two problems here:

1) the tag is meant to be succinct, so that it can be used by users
   selecting which tests to run.  At the same time, it's a waste
   to throw away the other information or keep it duplicate or
   incosistent.

2) QEMUMachine doesn't keep track of command line arguments
   (add_args() makes it pretty clear what's doing).  But, on this type
   of use case, a "set_args()" is desirable, in which case it would
   overwrite the existing arguments for a given command line option.

> QEMU is going to ignore the first -cpu argument. See the patch 0003 for a=
 reference.
>

But this would still be creating a QEMU command line with multiple
'-cpu' arguments, right?  I understand this could be useful for
testing the behavior of the parameter parsing (if that's intended) but
it's bad practice to be generating incorrect command line in tests.

Maybe just by tackling issue #2 this could be avoided.

Cheers,
- Cleber.

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBHw/MACgkQZX6NM6Xy
CfO1XhAAnAZ3HTO5rfcqGYLhEIDt2NyTeMPpI0pLSEv6OAyUv5aRJpBvpQhovw2Q
ejzARHghzW9WqzITs9A0h39L70+Qs51swp8CmwuAhM39BXkcQzBC/2jXXJFIcW/r
bN1aiJNgXh+Qz1IwfsxOyytmiQrGyR/3WBO4iS/H3y+e9z07hkZm94TbYGFHitrN
/ETyTuygJ5niTeME3vXdpQPB0e6Lw6mnpOKeAxd+rmGNwyLVbTjylp5QwXv5MyFz
/H9FAcvP83AO/p262LQoJNh9RRMuOPTV8vc+XEhC47bjSfQPUnvD1mtBZifh8mIu
whuQQa27FPZedpHXLp99gD68PWP9x0CbTZPynhZcS4O77HhzqGqg75KXAe8vCVJ6
magWFvMauy20vznooRWRteovEk6lYnxunrXgQI5ummWAsQ4LTEPgqKvjWV7Q1w2+
nQXITPsxb1L4mDS+zc/RsP5JRiK5yxslLUTWRyMIVHZZVwSE/SpppB3sZ4//DNIJ
Qxmle5RttIuhaRNxKzHSSlry4vK9F30bwYzdsPqRj8W4WTV5yuHQuIErpT9rToYk
q2vFm4V/XIWiKDgRX8g/njFLD95yMU956v+6ex1esReeq5m9KDi5PgoLtZ89Kbf0
t6OsGrYUg26iuKH6P6UT5qDBPV6J7z5YTBjROljUIDUxf7b/6a4=
=eAlC
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--


