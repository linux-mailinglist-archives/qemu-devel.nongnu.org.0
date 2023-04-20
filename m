Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733316E9071
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:39:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRgG-0004fr-7N; Thu, 20 Apr 2023 06:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppRgE-0004fU-Bi
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:38:22 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppRgC-0007tu-H4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681987095; i=lukasstraub2@web.de;
 bh=5LQlHX6LNiyT/sVONQolnNkU6TluBrwvxyRubt6OgYE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=s72V3Xzq14MpVhzY9gYkjVxAWekWD8sS2pwszGfJqIXARy8aOjQyonVcfjzV+5MtM
 6Di2br1sYLyaUzCxxW2QBAateZc0JWFv6D9LedT8ozoP/00OZ7fNkRSSipsRRiEMnD
 W0BockOmv6s3qxrLDaTYGq7xajPjc9/ZLqVVifkfoZLnCgf7ty68VwhhbzZf2zK8oV
 V5oM0p7QEl0WCs3hI+kccLxF3VcWcv64xRZrqMHKjmpIGwut79AoZfSkh7SR8ZHRdx
 S4+Xd02Se8b0XI+jzPIX6Bx6UltZpb3zpkU952L6yfUD1TqDYJMnLM+SJqgZYgBNU7
 CEuk4t+LMkpZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MGxMP-1q2w4q1fIx-00Ds8d; Thu, 20
 Apr 2023 12:38:15 +0200
Date: Thu, 20 Apr 2023 12:37:56 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>, Thomas
 Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v2 01/13] qtest/migration-test.c: Add postcopy tests
 with compress enabled
Message-ID: <20230420103756.2aada33a@gecko.fritz.box>
In-Reply-To: <87cz3yzwgm.fsf@secure.mitica>
References: <cover.1681983401.git.lukasstraub2@web.de>
 <01a063686e62ce97e7d0bc9fa935389f074ecb4b.1681983401.git.lukasstraub2@web.de>
 <87cz3yzwgm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wPuxOJi=v8+LtsVl5Akokm.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:bawJjkMxckMA77TffB73GqIIPmSuhZZQ9Q8qOs2OU/4ppIHASi5
 xiyi4qIg6AGKvW+Sl4nSt7TZ1KHlkL+EEeakx02LSva23LhH/bxIeIcGPMjQafiO+UJX04t
 oUQWH6rYLFdiNqtUL6+BniHt8tIHYeUN1I6w6imhD7iKLwPiJ0BYBhZfQpzmCSZNWG3y7yU
 N3GEcMMlJN93wFm++nfaw==
UI-OutboundReport: notjunk:1;M01:P0:/H44wgysra0=;zbLO5IXM30UvWtMoouL8cj1YS9L
 F3FveQTQjZgFZPXd91NviE2s+qwWHe+6EgohsSl0Q9tg7eZlCZkZJoRrdoa0CBuAyEqZkrdY+
 +yi1EhZSPPp1GkWsBE7OXY1aTQSnh62ruCwL51z6oqSI2msMkU67cxwsjWsza5qqMhrs/wxaF
 dzn65ZTvWIa0MZcKgxe0Gi4K48959m6slv9T6rVQzZQoEq2JSWmtgV0UpHJkYjdykXo9WmB0i
 t8YpHc/UMh8NW60ty+O649N0LwhuNzkSeq/4fZRrpcZZCa20Zd0TvvGw+yVTNTP50QBmANzz3
 1MdWd9Tk31/qNNZ1N2DBVEDY+Fyllehm3EodfMdVIlH8nYWM83OyHdEQ5/AwXW1M8u6xOKWE4
 enFtNzFlza45YcZcHlEj1t6RPn1YSK/fDh3K2bDkBTNT3bI3lE/vJQMi+JKE+P1uCWeLBfLbK
 g8csa8llm1xb792KvmALRvolFLy1HimBLeqka8UAkD/j0Zl2qWAYmPP72isr9IDZnU3802f0x
 I+EeprNE5RMup5nrcBWTwF93KFAU8/r2RKyAO8e6Fhw6C2ruftOZCJKr8qgJ2mGhdR7jG3Iy5
 Okew39/7TXB/Nnq1eBDcqQble9bxEZGAwHi+Cf86sogJiE1hMWk0vPG5hlbg6b9Ugua8caQDR
 vLK4GZ+D9khpW8jHAgPPHVjGSkdAdQWL/TsWX/th/VZhf3oDVWt9ZZa3aJ2nTF6LkAicODFK6
 1xn2Dr+ovfglF5Nt8W23mo36vbSqGR43z/k9qDsPJyNMSFobT6Cl3sEqcqRpFvZThKjdYAFRp
 +T0VsvSEL3XRJFUkBDFESm4cHXI0wqQjnAGoK7Ui/n6GVqiJ3YnRqei4S/7MJldCa4LHFJVPy
 5P8li0jgNVwH+xOHw/vpx6SE/Hi7DFC9lZQquXA0wd+IEkiE3wX0ph27wcKoNqWhOUzNRPiLB
 OgyX17BRMOu8WzC8bfRNU3B4PGs=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/wPuxOJi=v8+LtsVl5Akokm.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Apr 2023 12:20:25 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Lukas Straub <lukasstraub2@web.de> wrote:
> > Add postcopy tests with compress enabled to ensure nothing breaks
> > with the refactoring in the next commits.
> >
> > preempt+compress is blocked, so no test needed for that case.
> >
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de> =20
>=20
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>=20
> And I wanted to removed the old compression code and it gets new users.  =
Sniff.

Who know how many compress threads users are out there...

By the way, I'm not against deprecating compress threads in the long
run. I'm already working on (cleanly :)) adding colo support with
multifd.

> > ---
> >  tests/qtest/migration-test.c | 83 +++++++++++++++++++++++-------------
> >  1 file changed, 53 insertions(+), 30 deletions(-)
> >
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index 1f2a019ce0..930cb4f29d 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -1127,6 +1127,36 @@ test_migrate_tls_x509_finish(QTestState *from,
> >  #endif /* CONFIG_TASN1 */
> >  #endif /* CONFIG_GNUTLS */
> >
> > +static void *
> > +test_migrate_compress_start(QTestState *from,
> > +                            QTestState *to)
> > +{
> > +    migrate_set_parameter_int(from, "compress-level", 1);
> > +    migrate_set_parameter_int(from, "compress-threads", 4);
> > +    migrate_set_parameter_bool(from, "compress-wait-thread", true);
> > +    migrate_set_parameter_int(to, "decompress-threads", 4);
> > +
> > +    migrate_set_capability(from, "compress", true);
> > +    migrate_set_capability(to, "compress", true);
> > +
> > +    return NULL;
> > +} =20
>=20
> Independently of this patch, we need to change this test to use 4
> compression tests and 3 decompression or anything that is not the same
> number in both sides.
>=20
> I was complaining about this and when I arrived to the end of the path
> found that this was code movement.
>=20
> Later, Juan.
>=20

Oops, forgot to mention, the test is based on this patch
https://lore.kernel.org/qemu-devel/2f4abb67cf5f3e1591b2666676462a93bdd20bbc=
.1680618040.git.lukasstraub2@web.de/

Will probably carry the patch with this series then. So you mean 4
compress _threads_ and 3 decompress _threads_?

--=20


--Sig_/wPuxOJi=v8+LtsVl5Akokm.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBFgQACgkQNasLKJxd
sliXCQ//aS7HT00J7059L4V1SrIHZrmmbte/7ZzDhYPvM/xijs8wUlKESaqu2DAz
DbUMV6WXjj16Dtkp9f+sfyCnnCkhnwqNyMzFOhbwjZUdhVPEpdnhwHi2Pa3nRWVe
dgW7rXDcRcuo85zHSJRz8Jk5m/02tEH9Igyun/gyExGJ5Hb4w4N37Siq+vB3vY5g
JdLi48DTI8owSoRw/dVvWkvNAZCifewlRf/pEFwhjROvQ2k2b3dMIlli/xGoNSie
GJRCNOJCcEFhG64FfXrEsqsXf2eFWqe4D9sqCRzl+pBkY9f+HBoeW6sOh4WD5F+Q
7FTQ7VZPtBMsAyCKI1UMgFczFJlzCu6qeJmOXnZTP4Y+RJZ2pNgFK1q5ikQDJaHv
Byc+RnxoElkR1wsgmYIFofKQjAYg4YEUrETZhTRMLpy8ZF0c1SsRSFzameWbLBII
MGuyFFTyxPUzEqpEb5C+GcyCoVPSUJLAc5tmjIF6MmcwbGdqwtnp8c1DWlsPyR0W
doCmTwUh4p4u7WQaJ0X2tmFMrulfAvAjiS0tPQ9j2R6VwAe6JLFYaUgWgbgc14Hd
rZVRDUXe8KlxTdJHvCSU+4wHpz1QpClryKYEid0YkblzF0wBISMKGcfx15TyapfN
Il+1lgnKvDtCFWLpApxUuot35eBKrHI7T4gsZtOtM3Szm9JWwNw=
=aAKW
-----END PGP SIGNATURE-----

--Sig_/wPuxOJi=v8+LtsVl5Akokm.--

