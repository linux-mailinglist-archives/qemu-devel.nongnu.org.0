Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30EB6F3360
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 18:05:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptW17-00030X-4d; Mon, 01 May 2023 12:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptW14-0002zp-EV
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptW13-0003Q3-1e
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682957079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CnlNSf5AicnVhdOg5VGU/N9cEIMOZMo8/oAqbuvgwZ4=;
 b=cUf7mPkl+fwC/IemkG1blmFmBL7sNFvq59flFH5TUvod/hpB+gyCoeEhfNUqYIFFx8h0GG
 EeOGeQJt5sknmE1riHNuigfXLBha8dWo0+S3xmH1XoU8BVih8nAHxbqffKf7yyqjPYLV7f
 N+LsWpH8uzMCtMPRqUCq+kDigYnK/k8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-WW7_pcCSNp6FcdJ5d_r96A-1; Mon, 01 May 2023 12:03:20 -0400
X-MC-Unique: WW7_pcCSNp6FcdJ5d_r96A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 875F6884628;
 Mon,  1 May 2023 16:02:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BBE92027043;
 Mon,  1 May 2023 16:02:34 +0000 (UTC)
Date: Mon, 1 May 2023 12:02:33 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 09/20] nbd: Remove nbd_co_flush() wrapper function
Message-ID: <20230501160233.GK14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-10-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OMSBNPMb41AdF/ji"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-10-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--OMSBNPMb41AdF/ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:47PM +0200, Kevin Wolf wrote:
> The only thing nbd_co_flush() does is calling nbd_client_co_flush().
> Just use that function directly in the BlockDriver definitions and
> remove the wrapper.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/nbd.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--OMSBNPMb41AdF/ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP4pkACgkQnKSrs4Gr
c8gKXAf/XdKE5y9rE1MiEYGbAshn6k4RLrtvGC3uaqzDKzPUITe8wEdbepLSrOpb
GpfD7xlxZjqjimx8zVWbybaeDCCupV8JQkGbL/ALgbKirmf/nDgGXnkT8IpBpHZr
5I8c79d6OHaPI3WAwXtP+WOFvAVHIPLzUt/5deHnR513Oo0yaJ55HmG8NAbG1RLs
Z0iFPHYl5egdcu7wOX4b9wHwrNDseY/0lEDbXz7LiKoppZzuKtrDZ52U/PuEjajm
bSGM5Y5tPXWcSPoXVUtgAtNS9o1V59iZw4rnxPYTUGdV8DS+e7X+KmlTjJraX+ws
6XUE7WpYI5AvSKOwyyExwuiD8/DIxg==
=EapH
-----END PGP SIGNATURE-----

--OMSBNPMb41AdF/ji--


