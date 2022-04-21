Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D398509D33
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:13:49 +0200 (CEST)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTop-0007zy-Pt
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhTi9-0008Rh-Ty
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhTi6-0006ue-4u
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650535608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m1caiV50nQU2hVUzpsHU2LMrLaitmIR7I/ASM1WIXBM=;
 b=f7Op0T8h01dUskZavya04JgJIDCC4h8MCXfLAjp9daaB8vBeZoehxCzdEmhxyxLwyLqy3S
 C0jeJY/q1mUpNl6gZeuCzF6rmlEBdH+Z2bYOZV8z573d8EA/V6lPNW667GEm/dG6lSCBzO
 z0CAdmuV2QWQDYuVGjsvGaS0EqB8VuE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-0h5_8zOBPhuNfaFzfwxWeQ-1; Thu, 21 Apr 2022 06:06:46 -0400
X-MC-Unique: 0h5_8zOBPhuNfaFzfwxWeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9901C05AA3;
 Thu, 21 Apr 2022 10:06:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E00B014A4F80;
 Thu, 21 Apr 2022 10:06:45 +0000 (UTC)
Date: Thu, 21 Apr 2022 12:06:44 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH] virtiofsd: Add docs/helper for
 killpriv_v2/no_killpriv_v2 option
Message-ID: <YmEstOJPikLygK6U@stefanha-x1.localdomain>
References: <20220421095151.2231099-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nkXtqSJxTRNAk59B"
Content-Disposition: inline
In-Reply-To: <20220421095151.2231099-1-liuyd.fnst@fujitsu.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nkXtqSJxTRNAk59B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 05:51:51PM +0800, Liu Yiding wrote:
> virtiofsd has introduced killpriv_v2/no_killpriv_v2 for a while. Add
> description of it to docs/helper.
>=20
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  docs/tools/virtiofsd.rst | 5 +++++
>  tools/virtiofsd/helper.c | 3 +++
>  2 files changed, 8 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--nkXtqSJxTRNAk59B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJhLLQACgkQnKSrs4Gr
c8hLHAf+L90KRMGYnguz5S2mwe1lITvn0qa0e5YE7bTUNTRgTAtdfs8vmYCsoWHb
d/lxkk8dkAR5Fc6SM7mBr0TsaLxzux4VOnZWzQ9yJ1CZYrdVLNaOVwcoJxgS9KeH
5bEthwkaYC3jPRwQr2ppD0of6HYsyskq6HJrRI5XjG8A40XBdP9j2LWnIKrp7V//
SzKaL6hZ25UIAMLm+mFNIkMFOLG1a3nI3ciF7CcHEYgLxOOujqlhdm0dwr76GGpz
PGLSVJuzGY8bBg8kMixF9GGMbqctVOedg2bH/z00gET8dwppKiib3HGM+YJ12KS7
DB5pEZPETqh+/RrCIQbg+WNCBP2RmQ==
=U0i8
-----END PGP SIGNATURE-----

--nkXtqSJxTRNAk59B--


