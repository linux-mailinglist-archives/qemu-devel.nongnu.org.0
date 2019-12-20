Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE59127B4F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 13:51:45 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiHku-0004Up-Ck
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 07:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iiHjg-0003I5-CS
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:50:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iiHje-00020m-3y
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:50:28 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25354
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iiHjc-0001sS-Cx
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576846222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lVj8LpesAG4dl2XQtdR3hqxBwCm3v7ZCy+eZ9vP+fE8=;
 b=Sy9CiMMMGk6Le4yC/QZqf0Dy9N5ujUcZV+6I0iJ7wI2aLeae+YJQZ0mz87lxZvn1MRAbPE
 QHv+KFJIYICPkDA+5A7JlSuortSptJK/j0fk4983ajlW/UMhd1f3W1GHDgqu6CZubLl1zj
 QbJhqe7mJKuWZDIO39ZDgpNpo7+JdTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-tMJTraSiPDq8eCpfvysWPw-1; Fri, 20 Dec 2019 07:50:20 -0500
X-MC-Unique: tMJTraSiPDq8eCpfvysWPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C449F107ACC4;
 Fri, 20 Dec 2019 12:50:19 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E581A7E3;
 Fri, 20 Dec 2019 12:50:18 +0000 (UTC)
Date: Fri, 20 Dec 2019 13:50:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 00/18] block: Allow exporting BDSs via FUSE
Message-ID: <20191220125017.GF4019@dhcp-200-226.str.redhat.com>
References: <20191219143818.1646168-1-mreitz@redhat.com>
 <20191220100846.GC1635864@stefanha-x1.localdomain>
 <a372e742-182a-ec98-d297-ed8d43e10734@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a372e742-182a-ec98-d297-ed8d43e10734@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 20.12.2019 um 11:30 hat Max Reitz geschrieben:
> I placed it into block/ because that just seemed like the least bad
> place to me (apart from creating a new top-level directory like nbd has)
> =E2=80=93 and also because we already have quite some few non-driver file=
s in
> block/ (io.c, the jobs (where some got drivers only rather recently),
> accounting.c, ...).

We could consider block/exports/ and eventually also move the NBD server
there.

Kevin

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJd/MOJAAoJEH8JsnLIjy/WHnEQAJK8eBgvsr30JamWb0ji9zfP
FFkxB5CE3tK2gzjIT+3mAYip1CNhum+wmMKF97HZq9qJL9KMZrVaZMzcCLdpNOB+
xndCpinY+D8BmF04j8Z4ojGFXdzHRIuRMSxFJpSwqQUbevK2KYXK11B0T6VGeShU
tS7JZEH5mUeuSyjmiIJjlsciKAcao16wnPW2B7yUT1pdeLGX+LgPlo3RrkaaGR2X
Xhr3NsutNgDBpEIFP5w+Hb4DXta5F7Dnmjr9xsEQF55GEsLcOQhupr99Tn3t7lwp
upS53+AVE9fBsb0pmELT4wHMp0pLOWwLyRG873z+sUqlE4cCAwztjGGsGPva+BiR
jjkVEIamNoOmep89xQjBcw82ukLigvlaI4WFtkGhpfegdbWd6XUl0zSfV/WSk0fx
PyeVbbwUkFBdWVZ3DFHnrTkX0Md62jshPjVBdX4Q5crd+0kgUdWWoWp7w9BRwZNy
d9r9SgNDvNrvV9KlCpUvRqD8LonE6URdGTGPQ5MKVFAELsI3Zt9inI5FtFYQUpNp
5XSgVpsaqUyH66yTaGj6IChlr7+qCGA1ikrvUeLcyQbRioLJu+5BAtEzchNi16SS
ZFMUaclzpJvE+gKEbYDE/Fc2YfuLA5psatlmPVIkX9dwOSq7ytGlE/RBR93eO7R+
3CqvPWaTMH3Vo+MIyfGc
=CL/C
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--


