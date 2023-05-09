Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62D6FC93E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:40:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOUr-0005QO-QJ; Tue, 09 May 2023 10:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOUh-0005Ol-Qf
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwOUb-0008Mt-5E
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683643134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2/Nt4u/MGgf7PJFW94ZwhuA03wLC5NiekNMiO+6dYhg=;
 b=hNnxgJmV08DQXrQZGIRnxQ0qvZhccMJA2J0Nc1mkGaTnhKMx8LkjQz5soOW2+ooYP90ZWR
 +PSVBijJ1hPUJo7VPAx8lLUGnMBUQKdaPoqjU7nXlq9OvPMUQk/apMwOmlAMTyBc26zfza
 /bXfQgfdZzflNG9qPSYRT1eGpON0MpQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-lhE4yT3ZP-q8rLLFWroVOg-1; Tue, 09 May 2023 10:38:52 -0400
X-MC-Unique: lhE4yT3ZP-q8rLLFWroVOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 480BD89C7F1;
 Tue,  9 May 2023 14:38:52 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D712040C6E67;
 Tue,  9 May 2023 14:38:50 +0000 (UTC)
Date: Tue, 9 May 2023 10:38:49 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2 04/12] simpletrace: update code for Python 3.11
Message-ID: <20230509143849.GG1008478@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-5-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nrZCGRtTX9vDX9gs"
Content-Disposition: inline
In-Reply-To: <20230502092339.27341-5-mads@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--nrZCGRtTX9vDX9gs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 11:23:31AM +0200, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> The call to `getargspec` was deprecated and in Python 3.11 it has been
> removed in favor of `getfullargspec`.

Please add that getfullargspec() is available in Python 3.6, the minimum
Python version required by QEMU.

That makes it clear that its safe to merge this patch.

Otherwise:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--nrZCGRtTX9vDX9gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaWvkACgkQnKSrs4Gr
c8gNnwf+Lu3uEfY/YGUWq/Uxlg/+zgNmIGBy7ccMTrFxlQGKZH12uIodnaoPmNdK
MaJnSfesFHSH0T3hbG27/Y5ok4e2B9loYjZ7g0st4glHtZxFFUqPgRqBIJ/vIkHD
VeucXXY8jYvBWiu5AhWgx5xm0lAg2h7CS9kVMWjMNeDD+IHQk5Tk2Mbf44zOG2Wy
ncAGX/IWZkB2JY9c+OerSzRBBloPp5ddV6wmOrGnv2l+DZQYp8RsncpqECaBhVg8
MV74MdyJnyjeea+9Lsl35wqM3M/vtibQXC5CFiygq7+Y8IrJXcyU1m9DHZdYnCIQ
X/HDG7GoDeNVMtMheGxwk7brTJQPrg==
=d0KD
-----END PGP SIGNATURE-----

--nrZCGRtTX9vDX9gs--


