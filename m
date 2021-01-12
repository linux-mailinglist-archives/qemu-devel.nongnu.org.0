Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180A2F2E27
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:41:50 +0100 (CET)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI3Z-0000hJ-Dp
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzHee-0004C6-7v
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzHeV-0005E5-Bn
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610450152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xBe9Bdd4nQgkzlZLX9iywRTDJ6X+BzyFAhjHVoeYcLo=;
 b=eyNIGAbj+b7kCKyr4pq+Dxv1qRH+rTXHPqtIQt+uZ1yFQJ4DWFPxIqWEOVXg2qlEAOAQcy
 DMpJK+4DG8prVAqCEgXE8XwtKVXDC55SKUWGXxgoujUKn77lWxM//0CB3UN3wybYS0UVSm
 z4N7iXIelfJEEz7HoT2FkCsNtwlKRH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-hg3f5o36M_eKhVL0bqF_Qw-1; Tue, 12 Jan 2021 06:15:48 -0500
X-MC-Unique: hg3f5o36M_eKhVL0bqF_Qw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC797107ACFA;
 Tue, 12 Jan 2021 11:15:46 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F8517047C;
 Tue, 12 Jan 2021 11:15:37 +0000 (UTC)
Date: Tue, 12 Jan 2021 11:15:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v16 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Message-ID: <20210112111537.GD194658@stefanha-x1.localdomain>
References: <cover.1610339529.git.jag.raman@oracle.com>
 <f55038eb623c809e474181a090ede9d11567ed63.1610339529.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <f55038eb623c809e474181a090ede9d11567ed63.1610339529.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 12:05:53AM -0500, Jagannathan Raman wrote:
> @@ -112,20 +132,36 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                  qio_channel_wait(ioc, G_IO_IN);
>              }
>              continue;
> -        } else if (len < 0) {
> -            goto cleanup;
> -        } else if (len == 0) {
> -            if (partial) {
> -                error_setg(errp,
> -                           "Unexpected end-of-file before all bytes were read");
> -            } else {
> -                ret = 0;
> +        }
> +
> +        if (len <= 0) {
> +            size_t fd_idx = nfds ? *nfds : 0;

This loads uninitialized memory when len < 0 and the caller has not
initialized *nfds because qio_channel_readv_full() does not set *nfds =
0 in the failure case.

qio_channel_readv_full() should clear nfds at the start of the function:

  if (nfds) {
      *nfds = 0;
  }

> +            if (len == 0) {
> +                if (partial) {
> +                    error_setg(errp,
> +                               "Unexpected end-of-file before all bytes were read");
> +                } else {
> +                    ret = 0;
> +                }
> +            }
> +
> +            while (fds && fd_idx) {
> +                close(*fds[fd_idx - 1]);

The type of fds is int **. Taking operator precedence into account, we
get:

  int *ptr = fds[fd_idx - 1]; /* fds = {&int1, &int2, &int3, ...} */
  close(*ptr);

That is not the intended behavior. I think this should be:

  close((*fds)[fd_idx - 1]);

> +                fd_idx--;
> +            }
> +
> +            if (fds) {
> +                g_free(*fds);
>              }
> +
>              goto cleanup;

Please clear fds and nfds so there is no way the caller can accidentally
use the freed values.

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/9hNgACgkQnKSrs4Gr
c8hj6Qf+LWj9Y7hY0CDevlImegMUBGiZPCsy1WUikwcHj032VYYIaZqvhzy/d4h1
3HBFbSB1zndfn3Cbb+M45iVfkVSreZhfU/2xBBE84FinCVcbrTXZJF8Y0p5rZo6c
bjuPRQa6n8LxkMwZDcPmqoBWPlkFfMeLQU2NCJrCEI0DaG77rQBqMaNoqyL2WV4C
T1KAsfvqRZbumjBN445Z7238cAlrEzR0BUJnan77zqAnRuTxHsUJ2gfJOtPCaQWF
mRkpBbzDovjA0oOcUWjp3BvjQxBvcknsZsXxISh5A4f1IG2zwlKqFOAD4Ay6ME+X
SiddBtnM0h4ZuqNKdWosDN2EsyvH0Q==
=ULwA
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--


