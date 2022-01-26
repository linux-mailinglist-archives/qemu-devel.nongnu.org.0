Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE549CABF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:26:09 +0100 (CET)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCiJM-0006Qd-8j
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiEF-0003rs-1p
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:20:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCiEB-0003zC-E8
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643203232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K4WqBlrFYYHzbcJiFcv2rr2Le6hVqF5/t2POjsDr8KA=;
 b=gR50nfpVwe/1B2zz0zVECAuFTaU3akxv1/KVsPW8adSGSN3USzxoFMLzhAfC4XTtdGyDRV
 /wrl93z3eML6lloQevSCwGTA5sxJaIOnXru3u6cM5swGqPo8e4cW/nLVQjyvp5Xf3qwCa1
 f4R8Jpgp7DmgpH2+fG5zjsZZ/ucEqks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-RvoMA1dkNf-3Iq2_U_jCiQ-1; Wed, 26 Jan 2022 08:20:28 -0500
X-MC-Unique: RvoMA1dkNf-3Iq2_U_jCiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AEF91006AA0;
 Wed, 26 Jan 2022 13:20:27 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A7306F119;
 Wed, 26 Jan 2022 13:20:11 +0000 (UTC)
Date: Wed, 26 Jan 2022 13:20:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 1/7] scripts/qapi/gen.py: add FOO.trace-events output
 module
Message-ID: <YfFKimcv/Eyn4jIb@stefanha-x1.localdomain>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
 <20220125215655.3111881-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8CusYXCK/VaYYQni"
Content-Disposition: inline
In-Reply-To: <20220125215655.3111881-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8CusYXCK/VaYYQni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 10:56:49PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> @@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
>          assert self._current_module is not None
>          return self._module[self._current_module][1]
> =20
> +    @property
> +    def _gent(self) -> QAPIGenTrace:

If you respin maybe rename this to _gentrace() or even
_gen_trace_events() so the name is clearer (although the latter collides
with the self._gen_trace_events field and may need to be renamed to
enable_trace_events or similar).

--8CusYXCK/VaYYQni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxSooACgkQnKSrs4Gr
c8hw8Af/fhZswwvxNzPmk3Q/SOl6KityIKQWDscy25PZ5ct7uz33Q6W8gQFsblSO
/fr7PyyJ8Zqlj4dG536hzTTdeGo2RxyHprcqFT6Ai0Y35RPq+L0pzbOak20FtWTB
qZERYfeLwc0HL+0gbNDagV8UYVy6wAotX0JjveZ/rp1qug/Tlb3chx6e66LnIoZA
1PuEkKVIaStKrmXGQioS1RCRrX1nBemlnZJo4FQyQKKB0kxX6iio40UBrJFRpHRr
YNns9oJ3f07nfDylQqoYFctBis+U/HFb6UuoLs0CHQmNGdLPKl6uN9J2SYKKT4BX
h0qU5cq9NtjmDDjUULZoHa3W3hVWsg==
=6RkR
-----END PGP SIGNATURE-----

--8CusYXCK/VaYYQni--


