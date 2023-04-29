Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB966F2645
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 22:15:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psqxk-0002kK-7V; Sat, 29 Apr 2023 16:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1psqxi-0002jw-3A
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 16:14:30 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1psqxg-000304-4y
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 16:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682799260; i=lukasstraub2@web.de;
 bh=EZ7pT/Ts0DQ3h8D7a1Zxn/h/IhayRrDyxwA9D6ib64Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QUULPNP0xV+sp3dYsyI0qCsy5pPFLpWOUj+RKHgxx00zZs2nhzNM4vyuvklF1Tx75
 y3QbVu9Yl3JPMcNYplNUPqZJTV1Mp5UhTEIwcIitLpQByGc8vIoRoo86q5HTUzZxvF
 LMb23Xzsk0IOOkz+aaEtN3KI7wGiz3MA9rHQ1h/5UJ1anl+HoEbWRs7KRaARM04LDj
 4AeBQwPrNNTWx6Wl0v359q9Ur1wLFDuP9vuYk0XUgEPLek7Z4hPMAjJ/cob6jm09m1
 XTLV5vCy6IZgbQlinnV0u9+AsN7/fu3Ap2if/KK7oeIwTJvCLHRojHmCQHW2YIrqDr
 qTDsPHcEcikaQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.113]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MftBr-1qU5W119hJ-00g5kC; Sat, 29
 Apr 2023 22:14:20 +0200
Date: Sat, 29 Apr 2023 22:14:09 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org, Leonardo
 Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
Message-ID: <20230429201409.4bfdbef9@gecko.fritz.box>
In-Reply-To: <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JL274hUTzEh7IelV_ti9xJ4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:G4WgoPeL577FcqolJkuPZMVQp6bt5QmbVIUFIFcb/4Sz4c+vF1k
 fNmFfeUZV7iEEAPp2KkM1TEXulE2YuPortnEI453X5zlwWlZR4yPw4S4zSFML+6ddkQC4t9
 siz2MBfKlncXghguBv10JKmYMUD9IJEuFlrp6B59li2f9tyZRGJw1jkMrMjP4P97arPFi2o
 Vba8EqAYgO2iQAH97EOHA==
UI-OutboundReport: notjunk:1;M01:P0:Kj9gtu3I/9c=;OBI+z89INdoPn+4b2YSVEqHZrMx
 ua/ZtkdfjkGkY/n349QHvLk+6gDwlX2EkYjIFH8xG4zN/aQKyHDEdezkMBLZZoTWkJ0G/9ynB
 faY9xQxgIO45d8xwJakZ50sDj8QLKoAX3u2zE8+JtnLBKVB2xvENn/xrrCcz7x4bsKf30IeoD
 INdEYImY8K1KIFnesCHd43p9Jboz7rSQlML7ZYwOY8yD6FU3CAnkz+hTEZrIjBsb8AKw0u/p9
 uSCdIRrIMkaHoLkcy2s+f9dVYTyJ5qZd0JylThwW8jffwqR+YzCLDmUrvKAlQjhaUtkqXJp/1
 fws496ffDh2p5zhBXAmgnP1QegaraSpIkT7CbSX9X6kxdbk1AuQsTOId9y1iCiVtV94L6iIQE
 W6J5jyVjEbUKsXVyD/6qAOZn1zfw4cR/tbO9HbEZ/zE09za9ex9d7KSzQmpnW9aCDLCR4v7NR
 l0m1EK433A0eB84Q4NPYVxEuTLJcJiBi0+htRF3rwsKiXDg/X6dM0wUUbga4ycaGlv2Bj4pwq
 AilyIJSMSYAc7i5SWfYLN+GIbti/urMqifqlr5eG6oU1yIkalDmjXKipRmnHZzktULF/B/+DS
 VAVUSSK00uNIYcAMGbfPVSxu0kLae8SjBshpaB9+3pY2E5ibRFePofnyCBh0RE0VQJUaSY+rE
 F4eN5C5ku3Lv/VuYGDqvDqvPhcJC70VMF6fRDL5bFjLSBRE116/vy//kjhO3FDb7GzgUj1tbc
 VSCkoqY/JmQIW/Z6AjLwpKxmXdsYb7Ljd0S26Arvua+v0pJm7ye5EXvlNWrOjhSQrT7Qq8JaA
 mhSpU1JX+D0siVUa5rzV41kS1pWk2IFYj9RlCzaUg1yc+XC6Kj1ElNRZU+xjlxQ+Cj1BNcSOb
 dvVZzHdF6+bQAFhq5ur0kJPBVKDQIyGXXdV0tBw0WXmYWGL1Q1RUrrxU/BIQtAnWANyenM1pc
 tH+BXzh5ptts5rnUNP4rjPukR9Y=
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

--Sig_/JL274hUTzEh7IelV_ti9xJ4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 29 Apr 2023 19:45:07 +0100
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 4/28/23 20:11, Juan Quintela wrote:
> > The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b926=
46e6:
> >=20
> >    Merge tag 'migration-20230427-pull-request' of https://gitlab.com/ju=
an.quintela/qemu into staging (2023-04-28 08:35:06 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >    https://gitlab.com/juan.quintela/qemu.git tags/migration-20230428-pu=
ll-request
> >=20
> > for you to fetch changes up to 05ecac612ec6a4bdb358e68554b4406ac2c8e25a:
> >=20
> >    migration: Initialize and cleanup decompression in migration.c (2023=
-04-28 20:54:53 +0200)
> >=20
> > ----------------------------------------------------------------
> > Migration Pull request (20230429 vintage)
> >=20
> > Hi
> >=20
> > In this series:
> > - compression code cleanup (lukas)
> >    nice, nice, nice.
> > - drop useless parameters from migration_tls* (juan)
> > - first part of remove QEMUFileHooks series (juan)
> >=20
> > Please apply.
> >=20
> > ----------------------------------------------------------------
> >=20
> > Juan Quintela (8):
> >    multifd: We already account for this packet on the multifd thread
> >    migration: Move ram_stats to its own file migration-stats.[ch]
> >    migration: Rename ram_counters to mig_stats
> >    migration: Rename RAMStats to MigrationAtomicStats
> >    migration/rdma: Split the zero page case from acct_update_position
> >    migration/rdma: Unfold last user of acct_update_position()
> >    migration: Drop unused parameter for migration_tls_get_creds()
> >    migration: Drop unused parameter for migration_tls_client_create()
> >=20
> > Lukas Straub (13):
> >    qtest/migration-test.c: Add tests with compress enabled
> >    qtest/migration-test.c: Add postcopy tests with compress enabled
> >    ram.c: Let the compress threads return a CompressResult enum
> >    ram.c: Dont change param->block in the compress thread
> >    ram.c: Reset result after sending queued data
> >    ram.c: Do not call save_page_header() from compress threads
> >    ram.c: Call update_compress_thread_counts from
> >      compress_send_queued_data
> >    ram.c: Remove last ram.c dependency from the core compress code
> >    ram.c: Move core compression code into its own file
> >    ram.c: Move core decompression code into its own file
> >    ram compress: Assert that the file buffer matches the result
> >    ram-compress.c: Make target independent
> >    migration: Initialize and cleanup decompression in migration.c =20
>=20
> There are a bunch of migration failures in CI:
>=20
> https://gitlab.com/qemu-project/qemu/-/jobs/4201998343#L375
> https://gitlab.com/qemu-project/qemu/-/jobs/4201998342#L428
> https://gitlab.com/qemu-project/qemu/-/jobs/4201998340#L459
> https://gitlab.com/qemu-project/qemu/-/jobs/4201998336#L4883
>=20
>=20
> r~

Hmm, it doesn't always fail. Any way to get the testlog from the failed
jobs?

--=20


--Sig_/JL274hUTzEh7IelV_ti9xJ4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRNepEACgkQNasLKJxd
sli/DxAArwjHXYEU6mf1otITFgpcJKwBzPM2MPBBjSuSOryK6cYeVEmFDAsVefXm
5LKzEwuOLXk0teAyFJH6H67+z+uRpTabYe/+y2V4smpEbAIYuRzhvRRCBoTlVsCS
6ynVqAzZ7NAicI5asrdlkb7gKg+ozF4wCnVeD29Sf+KL5DeDorTUT3r044SFYYyF
Th0eDQSFYxxhxyW7EzdtIqTTRcGX+Iz/ygXCq4RmJkexVqgvPHWWmGwyv8BEUdb/
7SCUDKv7SI0jtnJZ4a1m0O066qAr55NFYGWhf1ynhT6cljDjKmto+PDDT1G2EuLK
SlZlG3aPhv/Ik5Ogk/NxD+jwnQ6o1krKbyo2VSByrirCufDBcuPDP5wNyAFk2TR/
S/1HOW67x8lbvFE6vgGPhw1oul23gYXoqcELTr+UlDCjMUMKeQ7fIgYO1YYsImCK
8UhekMYBq7dDHJCs2gaCkbxdv2zZ+D7iQINMkGzKH8rUOrnQZgvnJSRZ+bdgGtYG
J4eGn+/VWQEhLScNamfJxFBrrylaOUTIPVUDuPLHpmT2xVobyARsVmnZLYk0eF04
4m/d7BBozMPMmhmqRLOHGIKbcMZQ7Wur7qthuOAU/6OQ9Efwhcuqxz9k8VoynN9a
643FYerBCYFkLv13aJ2obxvBSC4c2FwWtDPtzfnhKZFavgSXkkc=
=f29U
-----END PGP SIGNATURE-----

--Sig_/JL274hUTzEh7IelV_ti9xJ4--

