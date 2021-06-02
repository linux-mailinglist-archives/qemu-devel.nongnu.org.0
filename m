Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8713989D7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:41:55 +0200 (CEST)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQC2-0003pu-QW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loQAq-00034s-E7
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loQAd-0000vA-1D
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622637625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l1MkyDOB9KdS8LCqP5gxGfEEeQrl0IrMOxb6mzSuI9I=;
 b=GG8FCJNJzcZEPOE8snaI1I5uD+7XoHiZVha9liNfqrJKVhvKSVehcsocX+44S8dNifdHhT
 nvW0CD92j5zH3s+DC7bUmXHuj8Gj/sh4OlFqaJUPvkLAtrrnAXbRrwaSIECxVu4L8/QY51
 uvLVpxiUX5XSG/sgqu0OeUppuKNvwzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-xRaXzSOgNhyEXLa3C6JTPg-1; Wed, 02 Jun 2021 08:40:21 -0400
X-MC-Unique: xRaXzSOgNhyEXLa3C6JTPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 445C680ED8E;
 Wed,  2 Jun 2021 12:40:20 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A10618E30;
 Wed,  2 Jun 2021 12:39:54 +0000 (UTC)
Date: Wed, 2 Jun 2021 13:39:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 02/12] exec/memattrs: Add attribute/error for address
 alignment
Message-ID: <YLd8GSbbEG4dhu6K@stefanha-x1.localdomain>
References: <20210520110919.2483190-1-philmd@redhat.com>
 <20210520110919.2483190-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520110919.2483190-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B1ESnXUDEiYthY13"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--B1ESnXUDEiYthY13
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 01:09:09PM +0200, Philippe Mathieu-Daud=E9 wrote:
> A bus master might specify the 'aligned' attribute to enforce
> a transaction using aligned address. If the address is not
> aligned, the accessor will return MEMTX_UNALIGNED_ERROR.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  include/exec/memattrs.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 95f2d20d55b..6fe59194e35 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -39,6 +39,8 @@ typedef struct MemTxAttrs {
>      unsigned int requester_id:16;
>      /* Invert endianness for this page */
>      unsigned int byte_swap:1;
> +    /* Memory access must be aligned */
> +    unsigned int aligned:1;
>      /*
>       * The following are target-specific page-table bits.  These are not
>       * related to actual memory transactions at all.  However, this stru=
cture
> @@ -66,6 +68,7 @@ typedef struct MemTxAttrs {
>  #define MEMTX_OK 0
>  #define MEMTX_ERROR             (1U << 0) /* device returned an error */
>  #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
> +#define MEMTX_UNALIGNED_ERROR   (1U << 2) /* address is not aligned */

Most of the time alignment requirements are for "natural alignment"
(i.e. 2-byte accesses must be 2-byte aligned, 4-byte accesses must be
4-byte aligned). I wonder if there exist hardware interfaces that have
other alignment requirements and if the MemTxAttrs::aligned attribute
introduced above will be able to cover those cases?

Stefan

--B1ESnXUDEiYthY13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC3fBkACgkQnKSrs4Gr
c8hsuggAuBhT8KnoM1mYHyVs+JylraSoav+A7uB0ThqzF2AAuyIxpBHMxwktgBMJ
kQNAZxCNdNU3GbJlaY8JOz0ze8rBPw2Kwiw0wdwip0RZ3HR7+oeIWvj4Lex14cGv
eTVKP+nL2VV4HYgVZfCGyCUR1DWeqcaqHsVm/yQcdjbEOBq0H/D+WyKYNhy3Orbk
FjqtF4d1q3/Bequq9D0DrqeZm06M+uechW0F/BRTp8IXy+EGsoEVUjBOILviqb+x
rvVmPIAZ93wzBWQkJzU/aXL0f+klbhbE0hCa90354icA4pRFmSsxPrDbl6m6qnKR
uZVd6isjJajX4gX9yNO3zrqNFNUKqg==
=4AvM
-----END PGP SIGNATURE-----

--B1ESnXUDEiYthY13--


