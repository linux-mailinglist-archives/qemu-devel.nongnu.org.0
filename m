Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE0346B6E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:55:28 +0100 (CET)
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOozm-0003rd-RI
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOoyt-00032D-5C
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOoyo-0001UK-8i
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdG/hg6CN1HQAou0S8J83BDsAoCLVhdhrmHDd5zb6U8=;
 b=HMGQTC72OEqcEvBO8ZDRGP0nLRkhdtJfcM17/3VHjorsEl+M+FhxPcwnvffmPmi8p+C2G1
 7rh1OYSBDk6jH3M1Qv1e63wqBEryWnmW0+SWtcF6y9gVmdi33+LX8PI8BUPND9WVOlLxpn
 dwWboNkrWgK0AIpEt5eyD6XG6Wtix40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-LJRaDxvtMTSdGMYMnV29Eg-1; Tue, 23 Mar 2021 17:54:20 -0400
X-MC-Unique: LJRaDxvtMTSdGMYMnV29Eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB92B107ACCD;
 Tue, 23 Mar 2021 21:54:18 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED32E5D6AD;
 Tue, 23 Mar 2021 21:54:12 +0000 (UTC)
Date: Tue, 23 Mar 2021 17:53:20 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 10/22] Python: add utility function for retrieving port
 redirection
Message-ID: <20210323215320.GB3463681@amachine.somewhere>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-11-crosa@redhat.com>
 <98809672-6cce-cd59-74e8-8976c1fec770@redhat.com>
MIME-Version: 1.0
In-Reply-To: <98809672-6cce-cd59-74e8-8976c1fec770@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 07:25:52PM -0500, John Snow wrote:
> On 2/3/21 12:23 PM, Cleber Rosa wrote:
> > Slightly different versions for the same utility code are currently
> > present on different locations.  This unifies them all, giving
> > preference to the version from virtiofs_submounts.py, because of the
> > last tweaks added to it.
> >=20
> > While at it, this adds a "qemu.util" module to host the utility
> > function and a test.
> >=20
>=20
> qemu.utils, with the s!
>

Nice catch, thanks!

- Cleber.

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBaY00ACgkQZX6NM6Xy
CfOy9Q/+KVfIFeI5mlnLwbWugBzoR/iSyTW8B2yMdpech7kg266RL1QQT25Gxvbr
A3RmUIC+3mJ4qr6kH/pFN0cI59l1amcL4i155/9xyedp5eKi4eE2rzrUkQ0TZNQA
BMR2uGIK8Xc7Uw9feP9sxkkwqOdGDstVRu4uYPH07QIzxVD/EgWXX0pk4SfyXSM0
ayjkY0aAr2unk0sS9dvcvR0kisCkLuUekFi5UUpdT92ZEanWPqpoICGaUP3QDNpn
ZZUZEybiIAvAIMsEyLgpxJ29o6EP9RsnmbWt/NL/DdY+hnStGcX+6OAET7X5HeRN
oxzuX0+nz51wJ3xFBoIiyTgEIqF2osgNNXHjA41rfcwiK/RkdhWm61eDwcTpWoGq
P04gssKxMt6rtz9LUUI9ipyidDGhXzyHqFqmOZWyHSrpoabfRMIzSycrCL4SwRJb
eA79+25XbkXCkec1dt8cGjfnNlamAZDPSMGax3Soj9/711Vgpt1tlYH3amD8FStq
DHrWuvcGG9+tcu0tQiz7H0BXCFZ08iNzvukJy0DXb1d4DRku1b3Cw4Rn0EWJjQq1
0rbZf92jvIMDQDjH1Tgy2kEoX/7iMlmcXEwzKmyufCEl8lKxCOTWrK5b3OjNQ2Ex
J3hPNUTbqWG0O+OTFlF4i6OjSi3bg8iLIu5qK4TJPBILKAazp5Q=
=4ZZr
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--


