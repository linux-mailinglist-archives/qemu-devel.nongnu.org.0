Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB1A3297EA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:32:48 +0100 (CET)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1OY-00057L-S8
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH1Ma-00047T-7d
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lH1MV-00072H-Jl
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614677438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MoEeyXzPTN/fmSc59oXgYccFiHwVPvTfrW3VWZTwXkY=;
 b=AMRqFlu5ULgx2H04QdcwlDoIIrUDb0ehYjH3tLgtpEApagmH82J7KsZpYIJIzwp8DkDb/X
 CbIlqJ6O1iDYtB8cBKvkqVbpiCkoZ4rfy84XteyeP55aWgsJM/rVnUllkAC7XztZw8Fpdp
 6lGZS6VhfcUQWD5qAZI9iCDmTDyJnFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-v4UNLmpbM3GQquHJNOOpXQ-1; Tue, 02 Mar 2021 04:30:36 -0500
X-MC-Unique: v4UNLmpbM3GQquHJNOOpXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D179B107ACED
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 09:30:34 +0000 (UTC)
Received: from localhost (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61C9C10013C1;
 Tue,  2 Mar 2021 09:30:34 +0000 (UTC)
Date: Tue, 2 Mar 2021 09:30:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
Message-ID: <YD4FuYrq63+UV5UZ@stefanha-x1.localdomain>
References: <20210301172837.20146-1-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301172837.20146-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XBd3JxINCsAu1KmV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: jsnow@redhat.com, hhan@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--XBd3JxINCsAu1KmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 11:28:37AM -0600, Connor Kuehl wrote:
> The contents of this patch were initially developed and posted by Han
> Han[1], however, it appears the original patch was not applied. Since
> then, the relevant documentation has been moved and adapted to a new
> format.
>=20
> I've taken most of the original wording and tweaked it according to
> some of the feedback from the original patch submission. I've also
> adapted it to restructured text, which is the format the documentation
> currently uses.
>=20
> [1] https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01253.htm=
l
>=20
> Reported-by: Han Han <hhan@redhat.com>
> Co-developed-by: Han Han <hhan@redhat.com>
> Fixes: https://bugzilla.redhat.com/1763105
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  docs/tools/qemu-img.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--XBd3JxINCsAu1KmV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA+BbkACgkQnKSrs4Gr
c8i1LAgAnBxtBt2TLJV+wLYK/D2GobqqDcBHdtVzj/rxvGgGX0GPZ+2zK867Rg8s
XIHzCdm83nV0v4FXRCcGIV6YDj9IW3speGZKcTRgSNxe/9EjaE1ShKcxYLDCUK+w
jtDqFjE/xJiVSTVtUjjUon6z/b+TzUAQEi/uPDu8uz5jobBLyeQuhR4NtQaJIBI3
QyVkTLJ7ud45iyXCdMrRC3IRPd4IpB5S35zgQxjIay6bv5p+L2sbpeXn7HcYjaKb
qGz66Rd9opOw8AW4emNiQwj7pU+VGQti9gtYIOQSO3wPsqJvEgxpoGtrjNPur2BE
Ktm4cIQPMi8w1bHkk+9wzwHWUUD1Gg==
=d8tI
-----END PGP SIGNATURE-----

--XBd3JxINCsAu1KmV--


