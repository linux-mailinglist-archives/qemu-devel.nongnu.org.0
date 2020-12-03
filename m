Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F92CDC8E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:40:38 +0100 (CET)
Received: from localhost ([::1]:54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksar-0000AN-Dz
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kksR4-0003tg-9y
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kksQy-0005ja-Ih
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xMjdhHy4gelJX1eHc2KGU3s0wWKi4G8Z+bAnhkPpjqE=;
 b=ewn7kARa8wvyq/Q7GIdRJJK9ZLJh9XjBFnQ5adaNC5Xw18qFdh1WoTbP0L7CsK1eB2xW9r
 9s83Z2RroLNh7h81En5IYOOKp+916ikxUyewBxZKVgnHRRihOD3L4nOsVnA+y5vtUD/snT
 Ky7VoYWA2MGF6zJSTVTiOvw7ajbhTsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-_YFoSxrfMhKRxZhkaNQ5ww-1; Thu, 03 Dec 2020 12:30:09 -0500
X-MC-Unique: _YFoSxrfMhKRxZhkaNQ5ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83BC31800D41;
 Thu,  3 Dec 2020 17:30:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-183.rdu2.redhat.com
 [10.10.118.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07DA727C20;
 Thu,  3 Dec 2020 17:30:00 +0000 (UTC)
Date: Thu, 3 Dec 2020 12:29:59 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH-for-5.2? 1/1] Acceptance tests: bump Fedora to 32
Message-ID: <20201203172959.GA2792185@localhost.localdomain>
References: <20201202215747.2719507-1-crosa@redhat.com>
 <20201202215747.2719507-2-crosa@redhat.com>
 <b00dc7be-cf66-34a0-3260-2a9cfcddde77@redhat.com>
 <20201203165033.GB2787993@localhost.localdomain>
 <20201203170233.GK2952498@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203170233.GK2952498@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 05:02:33PM +0000, Daniel P. Berrang=E9 wrote:
> I think the problem with the Fedora acceptance is that we'll be constantl=
y
> chasing a moving target. Every URL we pick will go away 6-12 months later=
.
> IOW, while the acceptance test pass today, in 6 months time they'll be
> failing.  IOW,  switching to F32 doesn't solve the root cause, it just
> pushs the problem down the road for 6 months until F32 is EOL and hits
> the same URL change problem.
>

Just FIY, the tests will not FAIL when the images are removed from the
official locations.  This is what happens Today:

   JOB ID     : e85527a9d75023070f15b833eac0f91f803afc83
   JOB LOG    : /home/cleber/avocado/job-results/job-2020-12-03T12.21-e8552=
7a/job.log
    (1/1) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm: CA=
NCEL: Failed to download/prepare boot image (0.33 s)
   RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |=
 CANCEL 1
   JOB HTML   : /home/cleber/avocado/job-results/job-2020-12-03T12.21-e8552=
7a/results.html
   JOB TIME   : 0.76 s

And *normally*, we'd have 12+ months between updates, that is from
Fedora 31 -> 33, 33 -> 35, etc.

> One way to avoid this is to *not* actually  test a current Fedora.
> Instead intentionally point at an EOL Fedora release whose URL has
> already moved to the archive site which is long term stable.
>

So the tradeoff is, a patch every 6 or 12 months, versus using a more
modern guest.  With other tests, such as virtiofs_submounts.py,
already depending on the same decision (to avoid multiple guest images
downloaded), I think this tradeoff decision needs more visibility.

IMO, the cost of such a simple patch every 6 or 12 months is very low
provided we'll benefit from the newer guests.

Cheers,
- Cleber.

> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20
>=20

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl/JIJMACgkQZX6NM6Xy
CfMZDg/9GTQ5Vifr7t7dXhb5K+WiELVUVclXaospzizDZ98YRew+btlj1Vdi+LlP
9ogHMJQDXuLvmx7aKtsgZpttDcNn4ard8ZSVYHS06xtxa47VxzElVSinAG0zLDPZ
HFzKxpiQRDPQwf9VyXHwgF4AhkKEaWFjdrvZDtDQrQmB7ZJrTfhbmVamBeup3bCk
++LXTBZie2KjHlyg/BTXIH9emP1DbOthLq20EWcoUdzrYlGjfcDdlkQn42FvW10v
A9BbYxUCvdHl+lHV7LaOCoSVxfZCF1cD+Vkb+j5+gB7tjhughEmhs16ErkFJ8/XM
UX75CONkubjh+pfRQ28OliUXbtfWs8KHtKL3kptNR4vcKP70pdgWh7KUmr6/3d8A
pMtcZUBEy47cKuKQGZC1xm9rHroXmGB2LrrOLGEc9brXV/T+fjZygmb4ST1dRGhu
KFKPoVVNWxLfk511pbPaZisyY84T3jxBqX/8clM1y8lhL8Lp2nP6KB7+YVN9Q1ik
CoMWxBdp+E0Xo2yiYZjZlbmYG2oZ+eZU5nO5DUxPFxZqBVruQt0tcR22llHsxv8a
hdk3J6p48elJFs1IkljIdRvwWaW/JPvHj5cFCMXvho3PKuiMi7ot0WDHUMF2pyue
aGg7eP/llWQlnmsxkOBgp1BlVyR0K7g2YNMcOIVaofDo4EOyfHc=
=WZQt
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--


