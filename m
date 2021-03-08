Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F8331C46
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 02:22:06 +0100 (CET)
Received: from localhost ([::1]:44992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJR4X-0005Yu-Vd
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 20:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJR1k-0004aZ-HF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 20:19:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJR1c-000489-0T
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 20:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615252742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pz7j2Z5X9aLz+/bkYkCgpKljMYPxM55ps2stWWLLGhE=;
 b=gUUiirtRCzBR8joMJu7V6U864uYyf8VwzOxhgDLnQoD5PAH+GHCv7Qncl+8y5NTw1iSVtI
 vAlJQXL7ldt7Yq9cB6zBG2iiDQE/jd94pT2o4ps4gnVjZgZxJVnoFdvEhUR+KQ4JNMoiEk
 yrLuDak2mDcWHZet8CR1qVp3u4Tw3Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232--eADSeQsPceS9FI3FGFy0g-1; Mon, 08 Mar 2021 20:19:00 -0500
X-MC-Unique: -eADSeQsPceS9FI3FGFy0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74729107465C
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 01:18:59 +0000 (UTC)
Received: from localhost (ovpn-117-250.rdu2.redhat.com [10.10.117.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 322DC5D9D3;
 Tue,  9 Mar 2021 01:18:51 +0000 (UTC)
Date: Mon, 8 Mar 2021 11:53:26 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH v3 1/2] avocado_qemu: add exec_command function
Message-ID: <20210308165326.GA2038092@amachine.somewhere>
References: <20210303205320.146047-1-willianr@redhat.com>
 <20210303205320.146047-2-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303205320.146047-2-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIMWL_WL_HIGH=-0.251, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 05:53:19PM -0300, Willian Rampazzo wrote:
> Sometimes a test needs to send a command to a console without waiting
> for a pattern as a result, or the command issued do not produce any kind
> of output, like, for example, a `mount` command.
>=20
> This introduces the `exec_command` function to the avocado_qemu,
> allowing the test to send a command to the console without the need to
> match a pattern produced as a result.
>=20
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBGVoQACgkQZX6NM6Xy
CfMt7g/+JTz2YlUO/ZQxYqiLyIEnGH3ToA/gjuCZd8YBChAKgjv0uuvc4Afyy47H
F3Gmg1vx1G2FZFghzeIID/bif8PNax3fKLk16mcIllukMp4Akw2bgW72pIo62JXM
veRFXmuCCmXq+WJLf0oainF+I74G1JU6fsXEBXDdKiR5qF8X7xZ5BN1DfffLOa2P
d40K7yIt/xowgs5NjllL1RzpBAAdPeKSza5/AfQYjYf7UpcdW2hd8rD1cZc3G4RS
dV0rCb+rVGaIQDwyP3YnUWu9z5WyXXHRQN7mYs+Gl+2uXnlX34SYnujs4DjdjRiD
yxGVPuqQHvLqdtciDJ9UtZmeY+LUJ7M/zSheuA5DmUM8scqmTtExvlqy9f1/eVu/
nMQ1EyvTFOYrkPsr24JilipXgo26JCu6x52OsXwf9D32+/pD0NZYd2tw/80gSeTD
lfJRT9mdhXBofQVslxmgCD7UJWkyjQFvRLQ5g8oFUiGBlXkZ17mJM88W73wykutK
SCa4oP+snV/ma0HDcWDkkG1dwtQM5xSMMS7LmmN/coMJT2m8fJg87rF1GFftmnsH
AL9zeD41wstN8wPe1hh8k9TqbsFFsZPd2osL9/ssb9vOS68EV4smEkfIPSoBn2rP
m6+dNWTndLT+9mnYDyKgzunxBWaeIWMd3u1Jg4qi8v44KF9OIVo=
=Wmgx
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--


