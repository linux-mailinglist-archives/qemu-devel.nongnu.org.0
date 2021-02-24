Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81D323BDD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:27:37 +0100 (CET)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtGS-0001NM-UH
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEtEv-0000bS-0q
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEtEs-0001Cp-9Y
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614169557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mrd+JOCyGUWT1coeDHBht+wmRiMfvIAB5cNx1y97zHE=;
 b=UO5jGc7vqUZVrQEXpkzRPnSuykt+3rZGgBzzxX5qQEROdcR6dg9I0pfPo8UvS8+O+xUA8z
 SZkGvZ4cmCNlq9BNcWnez+aS6EYmLqewVUeV6vDMqIfN4PTcP1YgKeK3taWSnOM3kXM0sp
 rCVNX8CJ9oDM5O+r6l4k2eFWm+vzbIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-Ll0_lf0mP6GVxN1-yG5R5Q-1; Wed, 24 Feb 2021 07:25:54 -0500
X-MC-Unique: Ll0_lf0mP6GVxN1-yG5R5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A0DC801981;
 Wed, 24 Feb 2021 12:25:53 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE8BD5D9D3;
 Wed, 24 Feb 2021 12:25:49 +0000 (UTC)
Date: Wed, 24 Feb 2021 12:25:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3 1/2] virtiofsd: Add umask to seccom allow list
Message-ID: <YDZFzGSkzlNC2xz+@stefanha-x1.localdomain>
References: <20210223225250.23945-1-vgoyal@redhat.com>
 <20210223225250.23945-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223225250.23945-2-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LQ1RUayJWBLhbxyk"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
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
Cc: virtio-fs@redhat.com, lhenriques@suse.de, miklos@szeredi.hu,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--LQ1RUayJWBLhbxyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 05:52:49PM -0500, Vivek Goyal wrote:
> Patches in this series  are going to make use of "umask" syscall.
> So allow it.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LQ1RUayJWBLhbxyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2RcwACgkQnKSrs4Gr
c8j5bwf9GOjSn9zhlXu6g9boOZzii6dzYutZpyVLXbqc0XFLZv4nXb0T/eA0ZhlL
B//PSDpkBD/lrk6kQJz9UcIUw2LYvC3GGFVye1Ys80WFcVGate4k/j3H6Se9PPhf
dqkPDKcfP+HkKpzb1pbCUPj1XUGLVh8iTbDWQCZQTbsfMQw+jnLLvaejTUPWAgPK
IE4QLhD8RcZW/b4wso9Q2jGNqZ8KJ1/O3P4LRTstVFF6Tfr3/IuS8hwG4oLfc4SQ
QrsYAUYumdYFXT2lf+nNMa25HHftByZ3xPMwzLL3LzFgu+8qnhI09OexJPiU5ifH
WZInBHD4fbse40hRCCJqfIFTVj/i5A==
=AaQM
-----END PGP SIGNATURE-----

--LQ1RUayJWBLhbxyk--


