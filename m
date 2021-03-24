Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE43348527
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 00:18:15 +0100 (CET)
Received: from localhost ([::1]:51820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPClS-0003fO-Hi
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 19:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgI-0000Wn-2R
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgD-0001bM-GX
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616627568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JU9kX2qhCNq0zr1Rsv51E29tzWGHxeik4DtqdRSmiUg=;
 b=V/x2Oor7vqTPWTWJLcrWORg/ltnY4QHEoN8H+6HCTU4Tb5ioGhAVMJj88/Ctf94+RCVCy9
 FZssrsK6rwY6Hp+QuWOlkPsu6ng6yUyASEzvi2CDeB8TjZUxwwMJ4S0ts8o2hh0JV0QWRb
 7lPAAGIrkUkSOUZzIOCRbeRuz0npky4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-9WtjtWFxMOGpOm-GafXGVQ-1; Wed, 24 Mar 2021 19:12:44 -0400
X-MC-Unique: 9WtjtWFxMOGpOm-GafXGVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA69688127C;
 Wed, 24 Mar 2021 23:12:42 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 974837094D;
 Wed, 24 Mar 2021 23:12:42 +0000 (UTC)
Date: Wed, 24 Mar 2021 19:11:56 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: gitlab-ci: Only build /staging branch?
Message-ID: <20210324231156.GG3592254@amachine.somewhere>
References: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
MIME-Version: 1.0
In-Reply-To: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YH9Qf6Fh2G5kB/85"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YH9Qf6Fh2G5kB/85
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 07:01:12PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>=20
> Peter's current workflow is push to /staging and if his
> testing succeeds, he pushes the same commit as /master.
>=20
> IMO there is no point in building /master branch, as it
> has already been built earlier as /staging.
>

Hi,

I agree, I currently see no point in running the entire pipeline
again.

But we need to watch out for the job conditional rules. For instance,
both of these pipelines are about the exact same commit:

   https://gitlab.com/qemu-project/qemu/-/pipelines/275925246
   https://gitlab.com/qemu-project/qemu/-/pipelines/275925289

But one has 113, while the other has 119 jobs.  Also, we may want
to check if tags also trigger new (unnecessary) pipelines.

> Regards,
>=20
> Phil.
>=20

Best,
- Cleber

--YH9Qf6Fh2G5kB/85
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBbxzoACgkQZX6NM6Xy
CfOOmxAApGUubiegdialmlSGdQprUtSuZIdWyjZRRFXls+oF3ewAc4q0rx4Ttob6
Qf/w6/ADPfqnVfx8iq1D9z3jixONHQHCzeR3MGlbTA0edrPIXhw/wtKR1A1wek2q
bBiyuZeZvbldNjVADLu/v65Sf895C0GOLamOd8NvrHVvmlpJx5sQ1kK2FLcoz3Ii
KcppODVe59r98L24OqJ8vLP+7V4XYbGcdVc97S25eYrjf0EhHNyb0VZy4MmNyUHI
zDc+lhXgl0Uvbl/o6mdpEgVlFu7BUOoeMIH9qUtiISsPYuWjpdSL8aGS/YSl6mc7
ESBxGRjzbhb2/W1XuJkrF4xsKvoeoiVWxTw4cESMKjeLUj1lm+2wv57ImzL+y3TH
ujgUKsy92QQLqpBZUod9AbNs3hPJjp6iCzGexsxYz/c0Dqp3I4F/OEvH75YVFNDU
Qtnf34prOuanVAw7uEP/ae2mWR+V8gff5DfxGhfLdhngz+LFTGoKvL1xsgu9XfcK
zm45cefxhUK0a0WjDR/cCZnz5EuzLPm07AZbAw+auDxweTx6MmM0qxPVIyIauP0L
0hctntpdnuns1yC9ZpUt0hUdvDV6tPaHsUo32h2LsZDNBmrNJ/FNoii+1BUFIijF
Xh3SrFt3AQdu4gVMNphqizvS7Z9xNJfI1ETPqskiDnxol/WxNKM=
=DL1u
-----END PGP SIGNATURE-----

--YH9Qf6Fh2G5kB/85--


