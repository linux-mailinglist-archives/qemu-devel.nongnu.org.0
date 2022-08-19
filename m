Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E386159944B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 07:00:56 +0200 (CEST)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOu7q-00070W-PP
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 01:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOu3j-0004Fv-9H; Fri, 19 Aug 2022 00:56:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOu3f-0004nQ-K1; Fri, 19 Aug 2022 00:56:39 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M88by200Lz4x1N; Fri, 19 Aug 2022 14:56:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660884990;
 bh=ggTCKA/SfJVp8heHcZNZocbLLNp1+5LSgWPJdTuWugM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+JUOBazvosqhx6Pxv6pBnG8RQtDZXClwi8V33AE2MmpXp6H/RjWDhIn3UHBnoX0T
 +EEWs0t/irtVnhzdtMd0Ld936cn9b/qR3MmQZLcPCEQtl1p0/ezUGaiYmThdCeBNt/
 pWS/Q5pnqwpEy4AX04H958FE/rxWwkLR3BR1Wk38=
Date: Fri, 19 Aug 2022 12:33:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-7.2 v2 10/20] hw/ppc: set machine->fdt in spapr machine
Message-ID: <Yv72cDIs56AmWNq/@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-11-danielhb413@gmail.com>
 <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qo3W/rCF1R56+vMA"
Content-Disposition: inline
In-Reply-To: <99485a63-f799-2741-8006-f4167c985e54@ozlabs.ru>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qo3W/rCF1R56+vMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 12:11:40PM +1000, Alexey Kardashevskiy wrote:
>=20
>=20
> On 05/08/2022 19:39, Daniel Henrique Barboza wrote:
> > The pSeries machine never bothered with the common machine->fdt
> > attribute. We do all the FDT related work using spapr->fdt_blob.
> >=20
> > We're going to introduce HMP commands to read and save the FDT, which
> > will rely on setting machine->fdt properly to work across all machine
> > archs/types.
>=20
> Out of curiosity - why new HMP command, is not QOM'ing this ms::fdt prope=
rty
> enough?

Huh.. I didn't think of that.  For dumpdtb you could be right, that
you might be able to use existing qom commands to extract the
property.  Would need to check that the size is is handled properly,
fdt's are a bit weird in having their size "in band".

"info fdt" etc. obviously have additional funtionality in formatting
the contents more helpfully.


> Another thing is that on every HMP dump I'd probably rebuild the entire F=
DT
> for the reasons David explained. Thanks,

This would require per-machine hooks, however.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qo3W/rCF1R56+vMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL+9lYACgkQgypY4gEw
YSKTNhAAqSFHun+pCyzgiuBRP7R1T2T2kO9Ve6uRTidePmoQ6q4i7dygOBw6M/1p
wEZWLdQhPq1GXEhSX6bBJh/jWS9ry6XA7luC/JuZzYkvycM+ByIMabUyfzDqxb6k
aVlb1ybJJU++TND8mNgGDoIOymDWYDRtMGmZ/m6F3qtjuKSlSl8kYMse8kRPwRsI
nNthZeDUvkNFkdUy4INbltZ9MBfTDTLCUwentnAqgdgIdbMgdxO1eZFhoC2F4GJc
X6g/3M5ZA6B2FTfg2KyyVba3uauW3cWn/jI7wjBnMjhmwHhrQFz1GuvHeAxtGBms
7dW5zDw6is1ycGDWpfR7U/jCDFlsqF5l/NQl6mgyMJqVrACdtAq4oYjCRfyPISeS
GrK3TX1EiPh4L2/O1ddUUu1oEk59+G5ucHzTHN9+dpV5mlixSu0dgDKiYqZfwZLQ
XyJXKB9qsxxaYBNLud/ufeFZkaIpsk2FDFSimqET3kWYbi0OOVT5X8opyygE/SIF
2mqVRbJW8Nqg+ATElfPbmgQKZARaGYV4anh7+q8kLTP4FXtCsEG3XVYOJPUldh+N
TAVd8cT2lu5/eHyRMzow3mEyXLMBvhxeUPmK0vHcT2ohH5+nD4yGTf6u40Qxg/8u
Jmy9iatPKqkmLlyhv6FFf0osln8NhUQ1X+3QFWt6oXxgoNu4RpQ=
=Bzv9
-----END PGP SIGNATURE-----

--qo3W/rCF1R56+vMA--

