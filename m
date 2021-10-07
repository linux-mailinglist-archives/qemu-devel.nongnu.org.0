Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0829425536
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:19:34 +0200 (CEST)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUFB-0006Zi-9O
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUEM-0005li-LD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:18:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYUEL-0002TV-72
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=99q9cG4VhMiGLtTBG97u1C7hBsxIUU/BrS4DOGWyE8Y=;
 b=Sl1BT/Mx0uf+La2LG/TzqWlIre7OsxVKzAxZveAXg0aUExPUgzLeYHECjs3fAMB4VG/SF3
 48QkSkP7LlY1iW3gMBVw+D59fqguwuxWfgzXsy6vsQa6/uDrO7EmX7zTnU2rbcC977/D0h
 PvSJ/YfPBsqb+rgRql7dy86qoVuPXnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-_sey4WXEMEu6ky5jSem8DA-1; Thu, 07 Oct 2021 10:18:39 -0400
X-MC-Unique: _sey4WXEMEu6ky5jSem8DA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 305E018125C9;
 Thu,  7 Oct 2021 14:18:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5CA05C1CF;
 Thu,  7 Oct 2021 14:18:37 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:18:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 08/25] block: introduce assert_bdrv_graph_writable
Message-ID: <YV8BvCy7MUhQLsqX@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-9-eesposit@redhat.com>
 <9a778b91-d175-8062-6783-740ba42c4321@redhat.com>
 <4dfda254-2ff0-8977-9e42-8c0f5f1075d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4dfda254-2ff0-8977-9e42-8c0f5f1075d8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c/eSPTFfsdmqKDoK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--c/eSPTFfsdmqKDoK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 07, 2021 at 03:47:42PM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> On 07/10/2021 14:02, Paolo Bonzini wrote:
> > > --- a/block/io.c
> > > +++ b/block/io.c
> > > @@ -739,6 +739,11 @@ void bdrv_drain_all(void)
> > > =A0=A0=A0=A0=A0 bdrv_drain_all_end();
> > > =A0 }
> > > +void assert_bdrv_graph_writable(BlockDriverState *bs)
> > > +{
> > > +=A0=A0=A0 g_assert(qatomic_read(&bs->quiesce_counter) > 0 ||
> > > qemu_in_main_thread());
> > > +}
> >=20
> > Hmm, wait - I think this should be an "&&", not an OR?
> >=20
>=20
> You are right, && makes more sense. But as you said, using an AND will ma=
ke
> the assertion fail in multiple places, because the necessary drains are
> missing. So I am going to remove the check for drains and leave it as tod=
o.
> I will handle this case in another patch.

BTW when an assertion expression tests unrelated things it helps to use
separate assert() calls instead of &&. That way it's obvious which
sub-expression failed from the error message and it's not necessary to
inspect the coredump.

In other words:

  assert(a && b) -> Assertion `a && b` failed.

This doesn't tell me whether it was a or b that was false. The assertion
failure is easier to diagnose if you split it:

  assert(a); -> Assertion `a` failed.
  assert(b); -> Assertion `b` failed.

Stefan

--c/eSPTFfsdmqKDoK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFfAbwACgkQnKSrs4Gr
c8hX+Qf+OOekZonSbauMfnjk5Gk8XFxznXrwyf3JVVHkwWLGH0NViXsNPVKiE6+X
pd4EV2UMEy/x6m8S8zK8riun48AZypiJB0u8Q0kSroGQWtXVp0x15QjsE9Y+wKfG
D6x69CFi721LOMufpLmvFWRzV1jaSyMcjPH5pcqgENL+3c72/iZrk9aUuoixs2vm
MQCklEifNu7NwZwiyLkv7tirSs9rR7Sag6xkxsnToK1ZXgh/6/zLkAj1e6XgIkIZ
zx8xpJAvThF7CJjNfBhPFyDfO2PSDLbTSUzajRySEdtYwM+d8Ki9R2m+uKM7RaR4
vXlAyAkdczbJDXSCbk7vLagN0J9iEQ==
=SoaZ
-----END PGP SIGNATURE-----

--c/eSPTFfsdmqKDoK--


