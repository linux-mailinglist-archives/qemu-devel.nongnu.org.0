Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D2A67CF09
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3gr-0006e3-Cq; Thu, 26 Jan 2023 09:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pL3gp-0006dt-Cd
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:57:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pL3gn-0005kP-QR
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674745040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ckhl20m0WHAlPDqkcmOs5ybCwonqoD+YHmtiesuBGYY=;
 b=SWbvN9Pxr6YUOiyEhM4PshBZtn9HGSSRaB9T8v5k8XBNFzX/vOsWjbbPLjIgEDQKkFYSqR
 TZJlZ6dv+VDOPwX4ML0liasRSP4/neCkfnFlQJCYMz9PihUALNEbhtF4/ijQRrovVcjgHX
 qbP+VbMCD9AtKfPwm+Y9NPqEvdMk9Lg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-crnuLtSGPraTDT8KOF2X7g-1; Thu, 26 Jan 2023 09:57:17 -0500
X-MC-Unique: crnuLtSGPraTDT8KOF2X7g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A7F28E9C04;
 Thu, 26 Jan 2023 14:57:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30E98492C14;
 Thu, 26 Jan 2023 14:57:15 +0000 (UTC)
Date: Thu, 26 Jan 2023 09:57:14 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v5 3/4] checkpatch: add qemu_bh_new/aio_bh_new checks
Message-ID: <Y9KUynOHFXcmjXA7@fedora>
References: <20230126052558.572634-1-alxndr@bu.edu>
 <20230126052558.572634-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LKRBjvRmeTDZt5mR"
Content-Disposition: inline
In-Reply-To: <20230126052558.572634-4-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--LKRBjvRmeTDZt5mR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 12:25:57AM -0500, Alexander Bulekov wrote:
> Advise authors to use the _guarded versions of the APIs, instead.
>=20
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  scripts/checkpatch.pl | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 6ecabfb2b5..61bb4b0a19 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2865,6 +2865,14 @@ sub process {
>  		if ($line =3D~ /\bsignal\s*\(/ && !($line =3D~ /SIG_(?:IGN|DFL)/)) {
>  			ERROR("use sigaction to establish signal handlers; signal is not port=
able\n" . $herecurr);
>  		}
> +# recommend qemu_bh_new_guarded instead of qemu_bh_new
> +        if ($line =3D~ /\bqemu_bh_new\s*\(/) {
> +			ERROR("use qemu_bh_new_guarded() instead of qemu_bh_new() to avoid re=
entrancy problems\n" . $herecurr);
> +		}
> +# recommend aio_bh_new_guarded instead of aio_bh_new
> +        if ($line =3D~ /\baio_bh_new\s*\(/) {
> +			ERROR("use aio_bh_new_guarded() instead of aio_bh_new() to avoid reen=
trancy problems\n" . $herecurr);
> +		}

These checks should be limited to source code in hw/. Other directories
can use BHs without MemReentrancyGuard.

Stefan

--LKRBjvRmeTDZt5mR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPSlMoACgkQnKSrs4Gr
c8g/Rwf/WdV8DoupQvXDRcPcMspfYnhe/ooBhwkfUKgko43FPlxzn0y9BpssZjqq
eVeQmZhnYbRTOFmXuWdXriPayls2LuG21kdi6TGUP9sm8heZ0MCTOTH2YqI+eA8D
sq4lLlfZDLmmw6m/5GzeLiCANoA0yimmqGMKtIlwY1E1BtfcavfwV4p6ptKWhkSC
/M059SFb88NtUjKwjRKYWlky31aZO+4MOm5u43J8999NybrO5aVGJZeitbgmmDX3
vImTyWborRHqAuG0FYjww/oOaaDXzks/wYkylc1oBvwcCYXSgaZYpUgfaPjyezY+
zwiBKGm44FoPxlwbxdZm6d5t5Sgr7w==
=OiVL
-----END PGP SIGNATURE-----

--LKRBjvRmeTDZt5mR--


