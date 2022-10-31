Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90949613EEF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbJW-00039i-6m; Mon, 31 Oct 2022 16:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opbJR-00035B-JA
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opbJP-0003h5-Lh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667247791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KW82uMg08RrTFIet0DPDk1c8UGaKmsKI9nLWhVYh7Tw=;
 b=NDZN+Xwd07DVohjHZJGwjZXDVRaPcQeVOXS4PKScVSZMkVk9cg3+UCcva5eselg+MMUA0z
 YQDgykF9lUiDNid+bwsPPJ42KQrfZ6a3CP9Imvxq/DgMKQ8XMIgQEX7BZJ4mgSrJOaAyVU
 r82MoNQwI6jolrr7Z8ErUOEaaABxJzs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-3bmF9mLOP8OQIEvN6sHysw-1; Mon, 31 Oct 2022 16:23:06 -0400
X-MC-Unique: 3bmF9mLOP8OQIEvN6sHysw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DF2F383D0C8;
 Mon, 31 Oct 2022 20:23:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA3DC492B0A;
 Mon, 31 Oct 2022 20:23:05 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:48:49 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 3/3] thread-pool: use ThreadPool from the running thread
Message-ID: <Y2AmofA8VfCMtiTT@fedora>
References: <20221031125936.3458740-1-eesposit@redhat.com>
 <20221031125936.3458740-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AFXSj+O9rxPZ+epF"
Content-Disposition: inline
In-Reply-To: <20221031125936.3458740-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--AFXSj+O9rxPZ+epF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 08:59:36AM -0400, Emanuele Giuseppe Esposito wrote:
> @@ -251,6 +247,9 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,

Documentation must be added to explain that thread_pool_submit_aio(),
thread_pool_submit_co(), and thread_pool_submit() must be called on the
thread's current AioContext's ThreadPool.

>  {
>      ThreadPoolElement *req;
> =20
> +    /* Assert that the thread submitting work is the same running the po=
ol */
> +    assert(pool->ctx =3D=3D qemu_get_current_aio_context());

Did you decide not to remove the ThreadPool *pool argument from this
function because it requires too many changes? All callers must pass
aio_get_thread_pool(qemu_get_current_aio_context()) so it seems like the
argument is unnecessary?

--AFXSj+O9rxPZ+epF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgJqEACgkQnKSrs4Gr
c8ionQf+NPF+JAgalD3xZd9R184khQgoRZ4tIvKpLBaseLbUGFFrv718FJ/fJYKn
krb+0rEzEjyL9CssAIyeFhioDRYfphTzKOJGV5qpAZi3N8oTsF8Xq9YXpCHzBcl1
lagr4eMQitGhx9cc/C7qUpwl5WeBdJSHYQG1WTTCnCEFVQFT5wK6pBs485mBsq8e
lv7pxk6fQhODGCOFZK9xM0GwLsp5o6zBn4XcUn/QgAFr2g8jxHB0EX53pka1ofJE
/7NCxbs0mgalQ4xx6n70EPj8aUGQwUFitaOxotu9SytSmPJYlnfsLY9vZsDzhD9J
ASBETcDyrZFo+ocm74wbIKAAZ4DTzw==
=CNgY
-----END PGP SIGNATURE-----

--AFXSj+O9rxPZ+epF--


