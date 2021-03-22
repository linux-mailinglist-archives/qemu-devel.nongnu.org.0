Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6843344C53
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:52:51 +0100 (CET)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONnO-0002qE-M9
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lONmd-0002Q4-HG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lONmb-0003Md-O8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616431920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ibLmIMxLgqrU0mntaLOr1gRhVjzk4aj5KeVxkz7kra4=;
 b=D8IlPGIuyfAJvEjy06jOEk15sCNwkHQFLfl+Fv+CQiInWQsijOSLpZFDamait093+Awrn9
 8axS8n/7ZoKNnL7VCarVlgnLGXfs3569HV7sAS+UIOXx2MOwr7Ym8F+yUoyV40M72JNP4i
 NKjjYneb2GnOaqOAHeRw61KCQZg1ohI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-sZUllBywM16zY9arsbMBvA-1; Mon, 22 Mar 2021 12:51:57 -0400
X-MC-Unique: sZUllBywM16zY9arsbMBvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826921052A1A
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:51:56 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1355C60936;
 Mon, 22 Mar 2021 16:51:51 +0000 (UTC)
Date: Mon, 22 Mar 2021 16:51:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add virtio-fs mailing list
Message-ID: <YFjLJhoWq5FvFvsM@stefanha-x1.localdomain>
References: <20210318154157.1357224-1-ckuehl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318154157.1357224-1-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KNpvOIHK1jcV75R2"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KNpvOIHK1jcV75R2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 10:41:57AM -0500, Connor Kuehl wrote:
> General discussion and patch reviews take place on this list for both
> virtiofsd (tools/virtiofsd/*) and the guest kernel module.
>=20
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KNpvOIHK1jcV75R2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYyyYACgkQnKSrs4Gr
c8gh8wgAoQ6hvmljU15VNNLv7yOdDevR1VsY3gJ6jEQB6sLXCMHHtzrAyMvGFDUr
9LXLcZxRVcDP90LJ54llUCtU8kWF3MrhIxsGPVnem2eiuVMq6UV7W+4z8zEi8FtR
m7u/9EVSdMb/HcMvrqBP1ReWv64M5YRIRiJMDLdVfoBAgcniCI0hxoqOMx+DJjdU
Cb/2hrCPEEjXl+/v/E3KSqELLPvdRYpSGLCz6lLIjJQ76MHtEa0xcAyuYHa873MO
ajv18kFbXr1te15aypc08jQV1XWXp5ZUxiESWPM2jgw3OyyWkFY7InPFyUyx818R
3o1fYF7xSAx1Wzr5JwKP3xyt+awo8Q==
=iFDI
-----END PGP SIGNATURE-----

--KNpvOIHK1jcV75R2--


