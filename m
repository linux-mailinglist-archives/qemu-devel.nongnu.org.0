Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BDA4D5E88
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 10:34:50 +0100 (CET)
Received: from localhost ([::1]:33912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSbfd-000346-Gq
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 04:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSbZ4-00012r-HL
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSbZ1-0006yP-BS
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646990878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PIxWQAY8Tjs8+OAQCwMi03/wRWI3hjFg/mB5yE0zlZk=;
 b=G3uVR0fRDYFvPa2KlvUWJaof161TeflLkJyDBwmaHoOl+OCl8gy09NRYG+OPlkzJHio4GX
 +4kaMOHViTRORJy/LLJ9rkN8385ttH9mnAjfoIcsMC7CRRPU04UZX3ohC8LjG6ih7CoEdF
 RJ/iN9a18KMR62478zTll2XJQ3UwkKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-bz2rKpIWPiSatIH-lVzarQ-1; Fri, 11 Mar 2022 04:27:55 -0500
X-MC-Unique: bz2rKpIWPiSatIH-lVzarQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1BD8FC80;
 Fri, 11 Mar 2022 09:27:53 +0000 (UTC)
Received: from localhost (unknown [10.39.195.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 824CE519BF;
 Fri, 11 Mar 2022 09:27:53 +0000 (UTC)
Date: Fri, 11 Mar 2022 09:27:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/35] stackless coroutine backend
Message-ID: <YisWGCF9oIkr5yeB@stefanha-x1.localdomain>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
 <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
 <a8997433-dfe6-58f7-d5ca-e0ec3e12b7f1@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/qzOp/OInWNsVE9f"
Content-Disposition: inline
In-Reply-To: <a8997433-dfe6-58f7-d5ca-e0ec3e12b7f1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/qzOp/OInWNsVE9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 09:14:07PM +0100, Paolo Bonzini wrote:
> On 3/10/22 18:42, Stefan Hajnoczi wrote:
> > There are a lot of details to decide on in the translator tool and
> > runtime to optimize the code. I think the way the stack frames are
> > organized in this patch series is probably for convenience rather than
> > performance.
>=20
> Yes, sometimes the optimizations are there but mostly because they made my
> job easier.
>=20
> > Out of curiousity, did you run the perf tests and compare against
> > ucontext?
>=20
> Not quite voluntarily, but I noticed I had to add one 0 to make them run =
for
> a decent amount of time.  So yeah, it's much faster than siglongjmp.

That's a nice first indication that performance will be good. I guess
that deep coroutine_fn stacks could be less efficient with stackless
coroutines compared to ucontext, but the cost of switching between
coroutines (enter/yield) will be lower with stackless coroutines.

Stefan

--/qzOp/OInWNsVE9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIrFhgACgkQnKSrs4Gr
c8gYSwf+Omwwn2d3uf53Qm9Kb2RuDxb1dsCfyjeMgqZczEC4SBN+TI8u6ZWwB6E/
GiOcSLDv/kxayOzipxfd/Gfl9KQ9/EcKI9YnHQBg5R1ZSPlRB7lJwglaxIxB5siz
G//b5Cp2aGB4Wg8jmrIgVkKjrv7wnHaQkVDHM4EkJpcqx8yjhStjGGUUzHIBgOaj
2EGAsXtErxj0k0zJIsLeisUOQE4nDIDwt4yCF7o7oVCKkf1RvRRTzXy6v3PS0v7W
e9k3TOb2MKtfl/8KKiFeH+glaAiPTcfQ6AlSTG/plxJHE3UgOrmbz9uNlwCYNaMs
SETxsOSSu4uOkVmbWTNSxwFkqe+d+w==
=Yw7K
-----END PGP SIGNATURE-----

--/qzOp/OInWNsVE9f--


