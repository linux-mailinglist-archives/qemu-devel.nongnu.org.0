Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C94512F707
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 12:16:43 +0100 (CET)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inKwc-0006By-Cp
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 06:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1inKvW-0005j7-EE
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1inKvV-0008MW-8A
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:15:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51709
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1inKvV-0008K2-1y
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578050132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WmBX6X5mHTzGsImRm/jWyGXmu+awQBrUvQ1OE3HBsL0=;
 b=F1RNed9Zffn0ULTWrus3wfRLj/EgyBsjjrh48wwLlcmvmpCpAlKTAHJtJwHG1uWdvm1kts
 mMjmEy6fZuBhMlYhd9fdersClUeW+u1noFec96E/dDCDIl4ZJMHgXjeeCXyOHm8iCFqmmB
 oampsWdcsgLeCYsyNJnHYnHEILBH01k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-pkDB4ZTdOCqeaXBzjX60CA-1; Fri, 03 Jan 2020 06:15:25 -0500
X-MC-Unique: pkDB4ZTdOCqeaXBzjX60CA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82BA5800D41;
 Fri,  3 Jan 2020 11:15:24 +0000 (UTC)
Received: from localhost (ovpn-116-102.ams2.redhat.com [10.36.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D3AC7D55A;
 Fri,  3 Jan 2020 11:15:20 +0000 (UTC)
Date: Fri, 3 Jan 2020 11:15:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [PATCH v6 12/21] libqtest: add in-process qtest.c tx/rx handlers
Message-ID: <20200103111518.GG130240@stefanha-x1.localdomain>
References: <20191129213424.6290-1-alxndr@bu.edu>
 <20191129213424.6290-13-alxndr@bu.edu>
MIME-Version: 1.0
In-Reply-To: <20191129213424.6290-13-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QWpDgw58+k1mSFBj"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Thomas Huth <thuth@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QWpDgw58+k1mSFBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 29, 2019 at 09:34:47PM +0000, Oleinik, Alexander wrote:
> +QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
> +                    void (*send)(void*, const char*))
> +{
> +    QTestState *qts;
> +    qts = g_new0(QTestState, 1);
> +    *s = qts; /* Expose qts early on, since the query endianness relies on it */
> +    qts->wstatus = 0;
> +    for (int i = 0; i < MAX_IRQ; i++) {
> +        qts->irq_level[i] = false;
> +    }
> +
> +    qtest_client_set_rx_handler(qts, qtest_client_inproc_recv_line);
> +
> +    /* send() may not have a matching protoype, so use a type-safe wrapper */
> +    qts->ops.external_send = send;
> +    qtest_client_set_tx_handler(qts, send_wrapper);
> +
> +    qts->big_endian = qtest_query_target_endianness(qts);
> +    gchar *bin_path = g_strconcat("/qemu-system-", arch, NULL);
> +    setenv("QTEST_QEMU_BINARY", bin_path, 0);
> +    g_free(bin_path);

Is this a dummy path that is needed to make other code happy?  Or does
the user need to have an actual file at /qemu-system-ARCH?

--QWpDgw58+k1mSFBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4PIkYACgkQnKSrs4Gr
c8g9Dgf+Nl3XdmJQshr+l8Mig122kBvbyK406Qp9SQ3asC8wLtg3RmHyL8/uerGG
rpMoftlttDYc4tGIhJDIs+PlhBW/xQfzzsiBMzTdFrkcagfp+8274ccWMVC0PChj
X1Z7R6+n0pA46zbG7X1CuF2yFn+DL8C3YagisdGQ9NMFXHpoVtvRe9hq0n/CctMw
yPAgKW5gKXSJINLJAsUY1pxD3k7slkbV5y+3SqOpuidUfYj1mQiwZqLtcQVk09Eb
nJt/L2T2OvbiUboh8GXzGVEiuX0YhyRC1YXJCVgfrKI8FFeQZJlZuZv6xishu/BU
SJGvNzfth2Ld/wgkceEcNaHPKOPA7Q==
=wW2L
-----END PGP SIGNATURE-----

--QWpDgw58+k1mSFBj--


