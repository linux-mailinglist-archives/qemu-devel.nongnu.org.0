Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F72F6273
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:54:34 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0357-0004SF-7X
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l030E-0007Wi-Ke
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l030C-0002JF-5q
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bdRIevoURLp/1Vi7BBhGamlHj9PYe765JjYYuUBxuXY=;
 b=Z/wwOQJHeqA5qQf1Cz7lIJjG5vsPTDLkQJkDRwWHNqky46SHj26yIihGZiRyg33QhsPqHg
 vFah0rUKiiPwGairqkS27QNiM42TwSCuO8ofmD5y4Di0ynbbZC1zoC4du+I2oSys6FM7OQ
 tQ37pzMMu+RkFolRhLGXQv+d3SAM654=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-YYqtVEGVOleqM4tXhGpu6Q-1; Thu, 14 Jan 2021 08:49:23 -0500
X-MC-Unique: YYqtVEGVOleqM4tXhGpu6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43C3B8066E8;
 Thu, 14 Jan 2021 13:49:21 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D35260C47;
 Thu, 14 Jan 2021 13:49:05 +0000 (UTC)
Date: Thu, 14 Jan 2021 13:49:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Message-ID: <20210114134904.GC299876@stefanha-x1.localdomain>
References: <cover.1610570756.git.jag.raman@oracle.com>
 <68865004c4ecce557214bac5b3c527cfe3681b77.1610570756.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <68865004c4ecce557214bac5b3c527cfe3681b77.1610570756.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2021 at 03:53:27PM -0500, Jagannathan Raman wrote:
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len = qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
> +        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
> +                                     local_nfds, errp);
>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_IN);
> @@ -112,20 +140,41 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                  qio_channel_wait(ioc, G_IO_IN);
>              }
>              continue;
> -        } else if (len < 0) {
> -            goto cleanup;
> -        } else if (len == 0) {
> -            if (partial) {
> +        }
> +
> +        if (len <= 0) {
> +            if ((len == 0) && partial) {
> +                size_t fd_idx = 0;
> +
>                  error_setg(errp,
>                             "Unexpected end-of-file before all bytes were read");
> -            } else {
> +
> +                if (nfds) {
> +                    fd_idx = *nfds;
> +                    *nfds = 0;
> +                }
> +
> +                while (fds && fd_idx) {
> +                    close((*fds)[fd_idx - 1]);
> +                    fd_idx--;
> +                }
> +
> +                if (fds) {
> +                    g_free(*fds);
> +                    *fds = NULL;
> +                }
> +            } else if (len == 0) {
>                  ret = 0;
>              }

The len < 0 case is missing. This function will return -1 and errp has
been set by qio_channel_readv_full(). However, we may have received fds
in a previous loop iteration (partial == true), so it is necessary to
close, free, and reset fds/nfds before returning.

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAAS88ACgkQnKSrs4Gr
c8goMAf9Fa4OP9ZBYFpUHnuDiuiLuf15KqgDaQt3jXtCgz4w7W2DjIi0RPxIO7yv
/XHXROi8JF8NOPgtoItEqQ2tKsVl/gWtQhmJSckoNUyx0HDR3q2GfsF7QPw2si4w
jyOXteLoDjYqxV+pTw5I686UjqTR4DiVNrwtF9WetaZ2iJAfoLf4TkpZCseMCDou
UG4EcWgNutJCBgxw0ugpUjNCRwebkdHFzSQTVUepLMYOBe1yUyhs+37ZFOwoWgkY
d0aKt2U63Aij6bLzAuC4itaOONBHvqUpyPT9TZrNVP9wL0IIzF9ahoxgKH4SZQPX
R4JjTRUgahVcPiI60kdsy83BxupI5g==
=NpaJ
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--


