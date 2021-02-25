Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CA3256A0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:28:02 +0100 (CET)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFMIq-0006dd-SJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFMFI-0005Qv-0i
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lFMFG-0003KU-7K
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614281056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sU0+PYJhKrQUtP4l2217cfPU6meef0Kv0AHcS6UpluA=;
 b=AoVPqL6FZ/B1gLkztMWpSCZ79WLCsQPwxFWePrQZOfQ7ljgwsFAQNQCclvtkNnqPQwu2DH
 1zrBUKBsYobzNbSzseJKq4VkS/+AuQkW/vn0cguAZFn4MUpxyLNEoD6hFfmH8Zog/JuExC
 ZbVN20GhVgKtfnxY1tpGLUS6CQ0EJCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-djUJ_AvKP6Gmdt8B1Ep1BA-1; Thu, 25 Feb 2021 14:24:14 -0500
X-MC-Unique: djUJ_AvKP6Gmdt8B1Ep1BA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21DD4C73A2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:24:13 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B322310013D6;
 Thu, 25 Feb 2021 19:24:09 +0000 (UTC)
Date: Thu, 25 Feb 2021 14:24:02 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: QEMU CI failed due to canceled download
Message-ID: <20210225192402.GD1074102@amachine.somewhere>
References: <e8880ea6-7bc0-df19-4355-2c0b59c3d087@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e8880ea6-7bc0-df19-4355-2c0b59c3d087@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 05:51:08AM +0100, Thomas Huth wrote:
>=20
>  Hi,
>=20
> I just faced this failure in the CI:
>=20
>  https://gitlab.com/thuth/qemu/-/jobs/1053467007#L73
>=20
> I thought we'd handle CANCEL as "skipped"? Why did this
> cause the CI to fail?
>

Hi Thomas,

Like Wainer pointed out, your expectations are correct.  CANCEL behaves
like a skip, but because the test was underway, rather than never
tried, Avocado calls it that way.

So, in this particular case, the test was actually interrupted, and it
was interrupted while downloading the Fedora 31 image, which it
*shouldn't* be doing during the test.  The "get-vm-images" target
defined in tests/Makefile.include is a prerequisite for
"check-acceptance", so that those files get downloaded before the
Avocado job even starts.

It looks like that on c401c058a1c a TARGETS variable was introduced
with a different format than it was coming from the main Makefile.
And, IIUC, that made the "get-vm-images" succeed because there was
no matching architecture to download.

I've reproduced the issue on my system, and I'm sending a patch with
a proposed fix.

Thanks,
- Cleber.

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA3+VAACgkQZX6NM6Xy
CfMUSQ/+Jqbt/eUGGn/9jW5/aEnd78h8Wd2CqJ4uoo+67r0OKLEzGCZVHRXO+IoZ
xTza2Y87jrOCQaecqeO9uZUoTZNEAZA3UQHcrKvlVWrkoixT/T3OnU1gsdU3G6UD
/IUtm0A2hKm/drGS2dT9P827SnMJEba1gjwYyYX4EY98b6GsrUEwjD5alzOOOE19
fidFhKnT5DYyYtGvdFez5N2Ha50otu0c8GB4+Q+BO0vE1begOvuLeJZNZMXy/nNN
/r4a1FCsZP2H5xk6TFz8JKNZ7hIaA7kGazwh80ovhJRAKuZso9jueYJ1fh6ieQ1v
dtYLCzFl2lEV4ee2tFRsxiAWYJarBth/hCaYwYmqIaPca7TcXXMCXy7SExFE88O8
HZ1e48Sc7lagnMKKj9kqtF1on34gWv6z2l9eh9ySKyflC/UoFQJySuR9RvJVtFjx
DjOXlS8PMDhEkTaBFmORxocHXepAKoHEbXneuOcZ4hA2GPieIdhJkbs82nDmYKde
u3mAGXfEdvkYFSgarT5Bodmu/5Hs9uqmsPihGZpVt6i/yXxtB5+LkoqyFhODaD5+
Y6ypfgh22zcJyy4OY1+cbbUQzyZRjNfh0pCy/tmScBrzbbuVx8Um0Bv5btpV4nuJ
XJEGjAJc9cP2PTlV4hEe8CmWoI3COtF21E6zxLMkLC9S/wjz7cU=
=6TQ2
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--


