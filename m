Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01BF6B2432
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFQg-00016a-82; Thu, 09 Mar 2023 07:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paFQc-000161-QA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:31:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paFQa-0007hH-Vz
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678365084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qET+4+27RwgrKCcSozi+Q8gXcvGf0cF1/jP1FqbZMSQ=;
 b=f9FquA151L6D1cPlCeZ0Dxmpr/k0vXesGUoXzxoQNk83Jxyy1FV7b3536B6yDSi7ZBps6+
 nfsaJ1YS8HGRBasjlc8YXMqiuXiKOebtgRYxeD1vvSsxzZaY+6dSrb7Mh1RY40vkvs9UyK
 rtIncsqkvGSYm6WIOy8f6R3CvSBnzl8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-X2YokiBUPmioWqFNPfKYaA-1; Thu, 09 Mar 2023 07:31:21 -0500
X-MC-Unique: X2YokiBUPmioWqFNPfKYaA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EB3E889068;
 Thu,  9 Mar 2023 12:31:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F42492B00;
 Thu,  9 Mar 2023 12:31:20 +0000 (UTC)
Date: Thu, 9 Mar 2023 07:31:18 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 2/3] block: make BlockBackend->disable_request_queuing
 atomic
Message-ID: <20230309123118.GB370169@fedora>
References: <20230307210427.269214-1-stefanha@redhat.com>
 <20230307210427.269214-3-stefanha@redhat.com>
 <d9ec7184-460d-f5f6-e45b-79c9979bafa0@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+2Im774SYIXfeyXW"
Content-Disposition: inline
In-Reply-To: <d9ec7184-460d-f5f6-e45b-79c9979bafa0@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--+2Im774SYIXfeyXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 10:07:40AM +0100, Paolo Bonzini wrote:
> On 3/7/23 22:04, Stefan Hajnoczi wrote:
> > This field is accessed by multiple threads without a lock. Use explicit
> > qatomic_read()/qatomic_set() calls. There is no need for acquire/release
> > because blk_set_disable_request_queuing() doesn't provide any
> > guarantees (it helps that it's used at BlockBackend creation time and
> > not when there is I/O in flight).
>=20
> This in turn means itdoes not need to be atomic - atomics are only needed=
 if
> there are concurrent writes.  No big deal; I am now resurrecting the seri=
es
> from the time I had noticed the queued_requests thread-safety problem, so
> this will be simplified in 8.1.  For now your version is okay, thanks for
> fixing it!

I was under the impression that variables accessed by multiple threads
outside a lock or similar primitive need memory_order_relaxed both as
documentation and to tell the compiler that they should indeed be atomic
(but without ordering guarantees).

I think memory_order_relaxed also tells the compiler to do a bit more,
like to generate just a single store to the variable for each occurrence
in the code ("speculative" and "out-of-thin air" stores).

It's the documentation part that's most interesting in this case. Do we
not want to identify variables that are accessed outside a lock and
therefore require some thought?

Stefan

--+2Im774SYIXfeyXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQJ0ZYACgkQnKSrs4Gr
c8hAFgf/SuzUDChVRSoV0ayZokmexDaHGKPPmzpaUdwE8Mxqb0jKDXegIeYejDPB
HoIbIP6wAZeeXumUlZZFqRS1m3XIfG00R4f17MllkXSNNoejVuI8lWF9ZGqKG59g
D4F0jgaZcaYA/RjXouAttH8jc6K0AcGCawTGovVnxK2h0sQbpJHJ+yY8tq3t5g0Q
0jw+S4DbANFktkd0L6DGcfZVmRHoPhOUYkV/rAab8D+zITlqBi0ASNybqjXHUDmM
6F4rTfUVkauMxYdN/IOiUUBmYbJa32BUPt1o8X0DzAH5XAD6ypkDo12YM/V2ETgG
vDUlJnndZJMtayLN/A7RuECTpWJTfA==
=FbR9
-----END PGP SIGNATURE-----

--+2Im774SYIXfeyXW--


