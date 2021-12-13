Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275564730BB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:44:26 +0100 (CET)
Received: from localhost ([::1]:59154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnV3-0004nb-8x
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnRD-00029o-DQ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:40:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwnRB-0001gt-9u
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639410024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X9Wg3OO/wLZ8wyPQwPlb6zeOW1YrN/u2YMPvXjxp/jo=;
 b=WAHW2yE+5jjKTRcngF3FO7cYu2uXkFRUYjDm2G2wc3Wi8mCMKUHk1NLgCxqw+eQJZx7Ykz
 NNmsgdMb8tero0W+2+13NRtUyPZF2P+QHQx3ijrP2GDCa4hAvxH3D8F/cSgr/QyQHErrVw
 9uyKj+WHTzDPrIRmZZiWhxGFpckkODE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-8iCU3IW2NZmjL5_P3fVrew-1; Mon, 13 Dec 2021 10:40:21 -0500
X-MC-Unique: 8iCU3IW2NZmjL5_P3fVrew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 672DD801ADC;
 Mon, 13 Dec 2021 15:40:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0438778C1D;
 Mon, 13 Dec 2021 15:40:07 +0000 (UTC)
Date: Mon, 13 Dec 2021 15:40:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 2/4] include/sysemu/blockdev.c: introduce block_if_name
Message-ID: <YbdpV196gy3bJDif@stefanha-x1.localdomain>
References: <20211130094633.277982-1-eesposit@redhat.com>
 <20211130094633.277982-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211130094633.277982-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PDxCzScQVpYDzaCr"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PDxCzScQVpYDzaCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 04:46:31AM -0500, Emanuele Giuseppe Esposito wrote:
> Add a getter function for the if_name array, so that also
> outside functions can access it.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockdev.c                | 5 +++++
>  include/sysemu/blockdev.h | 1 +
>  2 files changed, 6 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PDxCzScQVpYDzaCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3aVYACgkQnKSrs4Gr
c8h0hggAmM0cKBl1TQMgYeyZpOVj6e5Q+pFI0ztPPDCGTuUb/Ly8HLzeC+TnibQ5
PhL3Of3FVWyH9kck9SuDpTl/7FOOD5jfDA0kFlgmdVUd1B355dgiYgkPW9uGpFdr
CEPYVm9QJ3+ie7p8eAOfDxa4mkWIKVmfzoC9lJAVHIbFyqp+9wSXNAiZq6mziknf
hUFTT5SP4za9Ovc2dUQjvCzZ2p9pub5s249uqj4CjM+ykm+DirqZwt7lkl8soe9u
A9QzeglLdXDCKYj4qQhamnOETBlGJJf9E3+RDlrl0rmsgTTvYw92FOwMts6YETPx
0PIc9b6xrqPSYt7ZEda71m2W1bk+NQ==
=DlcL
-----END PGP SIGNATURE-----

--PDxCzScQVpYDzaCr--


