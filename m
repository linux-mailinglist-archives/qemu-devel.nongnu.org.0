Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CA6FEF98
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:03:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px38G-0002DL-KB; Thu, 11 May 2023 06:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1px38D-0002Cm-FL
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:02:41 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1px38B-0000Ul-IF
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683799355; i=lukasstraub2@web.de;
 bh=5RU7csYvlyAP+CalYJnZu976MlFLMGDmdbgIG1HQ02Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hrrNpXH+nW6JYLucr15zWmEUndBVEM3huDfyzEvNPFkmfGHT60RG6NSo/uru8QHeF
 ttucKIv6Eoq+xzV3evIYsfg+33Evp2ZOCZo3fJHuKscSSjRMnYqMyk4rTPBhGR6z6i
 aumwoGUbWtP0GuuaZx719+7Xcbc7ePz1gwC6IyVr9Y2ID6lLZtAhBgHlW84ER2140h
 jteWZQMYc5Qfh+9wNASwzJe72K5BCIwOAPF3TzHIEgrjXKuIfeDfVZTPhZg4BDnBgj
 xuw2cpXdfl5bP05RCX4I5+eJ1DtQOFQWY6l2PkUJIu1gPVIjr4F8OvrWr9te40RNDG
 t/X/J7q9NxjbA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.113]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4bO-1q49rN1q9q-00BYr4; Thu, 11
 May 2023 12:02:35 +0200
Date: Thu, 11 May 2023 12:02:27 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>, Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH] multifd: Add colo support
Message-ID: <20230511100227.2fd1b86d@gecko.fritz.box>
In-Reply-To: <87fs835h54.fsf@secure.mitica>
References: <20230509181528.84212-1-quintela@redhat.com>
 <20230511094713.6f08730c@gecko.fritz.box>
 <87fs835h54.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5eTsIMCTm+V0vG_rgx+_/lm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:U97mlDcGOoHV2Tn/nEQc1PVw+N1O7Q/0Q8sE+wXIvYEGTsUJk5A
 49PInQBQ8VgEIpRgU4USC6oXg2M5EsiLqt82bHG2jPF8r/m7pxao6jJQuV/jEncjKs0XKGa
 9absTLkx8yOD4Fb338Z38j5rpggoATXTrw7kW1VXwwmIC/LtuWmPm8OMBnNegKQR/ejx6lG
 VUXrTZ5b2Lhi4R+hAvXsQ==
UI-OutboundReport: notjunk:1;M01:P0:l1gZ5Ms0rEM=;wrmfn07wlXGt8k755dfsm6Vh97Z
 9Ls0Avm310nD/1WctmdV0UxEJXdBVplS2Q6XR0D764o1Loe+yQnx11J+TWoNW91cG+63+Kc+v
 zt44y5bZy7NZuIu6jxoC0B2R31BLQVHFfgSA2vdHkGCRpefDvGEXTILIWqFnmI1yy1dqB0085
 beVhq8XxxXRLUk+t1C0ymJwCG/E500CFVe++th+6lannl0T/p6SPPXg30R2MoxIH7VNSHfVVc
 NaoSSNs2cmCuDNyb9j+zOr1mmcrlEMkP3UfUEkX7i7TEgIp8ac84QM09z3CO8We7Z4Yz86XAu
 pf5A9Q2kWk8LS6XwnF1AFca5ZYFKasf5c6MDiWbhmCSbdFm1hPV+nmBlk99eMPc4c9OCCr8XM
 NuP2PdSLC00ZMMqH+NqwYRgoHoEfzM+uedGj0rQApIdc69q0M/jEzebBLtmGZubExOJ6IFR2q
 xfzpA6UDMhSj5mMWQOreAr2MVH5ZEZL30dyvkr/AQxtzEnNd3IHDh/Ft54fH3db3VINyN+VrF
 mpymNJlaWNXudEOihKC+sK3dA/D95Kwsg490Pe470/qczl5TzLoPtvxNt7tGvMGmSkSMNM/5T
 k0HwH5F+7CF7zQhLpExS1oJ7W7bQwy48FCbORCrwIeStlzhleG6qvbusEkb2R90GPPWRZYDYP
 xaA+FoH1zRxJg0YDYdTWNf+Bax+Zg+iur3Ss6sbi3m8tg/me2FPz+DDnzjEJRa/w/Pdw8nS/k
 zzkPnerUX0L/CBaGkHdVWqQQMaGeyLESY6/J9m90v5fFmzu3v5BMgjCv5CAU3tzL950ziwLHc
 mOqupNvAPY36xxrPC0MorxKWJgV6HycIooYWRjbILHqmR4Xf3az+IzbajHivIm7SaD82FzesB
 MKwPzITmBUee9jvsyBuxv9XDNtEu+zC+NozEq4IvIf0p5AZJIjGzebJx+eoj5VPR0lPlLJZcj
 2sBEAeq8k8eA36IOpNOQjT1itPk=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
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

--Sig_/5eTsIMCTm+V0vG_rgx+_/lm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 May 2023 11:52:55 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Lukas Straub <lukasstraub2@web.de> wrote:
> > On Tue,  9 May 2023 20:15:28 +0200
> > Juan Quintela <quintela@redhat.com> wrote:
> > =20
> >> From: Lukas Straub <lukasstraub2@web.de>
> >>=20
> >> Like in the normal ram_load() path, put the received pages into the
> >> colo cache and mark the pages in the bitmap so that they will be
> >> flushed to the guest later.
> >>=20
> >> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> >>=20
> >> ---
> >>=20
> >> Hi Lukas
> >>=20
> >> What about this instead of your other three patches?  I think it is
> >> clearer, and I don't think that we are going to have anything else
> >> that is going to hook there anytime soon.
> >>=20
> >> Notice that I put CONFIG_COLO waiting for Vladimir changes to get in
> >> before I merge this.
> >>=20
> >> Notice also that I "lost" the line:
> >>=20
> >>   p->host =3D p->block->host;
> >>=20
> >> In the error case.  But in that case we are aborting the migration, so
> >> we don't care.
> >>=20
> >> Can you check if it works for you?
> >> Here it compiles, so it must be perfect.
> >>=20
> >> Thanks, Juan. =20
> >
> > This way is okay for now. Though I will send a patch. =20
>=20
>=20
> If it works for you, you can add a review-by and I will integrate in
> next PULL.

Nack, There are quite few things wrong at a glance. I will cook up my
own patch, similar to this one.

>=20
> Later, Juan.
>=20
> >
> > Regards,
> > Lukas Straub
> > =20
> >> ---
> >>  migration/meson.build    |  2 +-
> >>  migration/multifd-colo.c | 49 ++++++++++++++++++++++++++++++++++++++++
> >>  migration/multifd-colo.h | 24 ++++++++++++++++++++
> >>  3 files changed, 74 insertions(+), 1 deletion(-)
> >>  create mode 100644 migration/multifd-colo.c
> >>  create mode 100644 migration/multifd-colo.h
> >>=20
> >> diff --git a/migration/meson.build b/migration/meson.build
> >> index 75de868bb7..c9db40d4d4 100644
> >> --- a/migration/meson.build
> >> +++ b/migration/meson.build
> >> @@ -23,7 +23,7 @@ softmmu_ss.add(files(
> >>    'migration.c',
> >>    'multifd.c',
> >>    'multifd-zlib.c',
> >> -  'multifd-zlib.c',

???

> >> +  'multifd-colo.c',
> >>    'ram-compress.c',
> >>    'options.c',
> >>    'postcopy-ram.c',
> >> diff --git a/migration/multifd-colo.c b/migration/multifd-colo.c

With just this patch, this file is not compiled in at all. And
multifd_colo_prepare_recv_pages and multifd_colo_process_recv_pages
aren't called from anywhere.

I guess they should be called before and after
multifd_recv_state->ops->recv_pages(p, &local_err);
?

> >> new file mode 100644
> >> index 0000000000..10fa1467fa
> >> --- /dev/null
> >> +++ b/migration/multifd-colo.c
> >> @@ -0,0 +1,49 @@
> >> +/*
> >> + * multifd colo implementation
> >> + *
> >> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
> >> + * See the COPYING file in the top-level directory.
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "exec/target_page.h"
> >> +#include "exec/ramblock.h"
> >> +#include "qemu/error-report.h"
> >> +#include "qapi/error.h"
> >> +#include "ram.h"
> >> +#include "multifd.h"
> >> +#include "options.h"
> >> +#include "io/channel-socket.h"
> >> +#include "migration/colo.h"
> >> +#include "multifd-colo.h"
> >> +
> >> +void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p)
> >> +{
> >> +    if (migrate_colo()) {
> >> +        /*
> >> +         * While we're still in precopy mode, we copy received pages =
to both guest
> >> +         * and cache. No need to set dirty bits, since guest and cach=
e memory are
> >> +         * in sync.
> >> +         */
> >> +        if (migration_incoming_in_colo_state()) {
> >> +            colo_record_bitmap(p->block, p->normal, p->normal_num);
> >> +        }
> >> +        p->host =3D p->block->colo_cache;
> >> +    }
> >> +}
> >> +
> >> +void multifd_colo_process_recv_pages(MultiFDRecvParams *p)
> >> +{
> >> +    if (migrate_colo()) {
> >> +        if (!migration_incoming_in_colo_state()) {
> >> +            for (int i =3D 0; i < p->normal_num; i++) {
> >> +                void *guest =3D p->block->host + p->normal[i];
> >> +                void *cache =3D p->host + p->normal[i];
> >> +                memcpy(guest, cache, p->page_size);
> >> +            }
> >> +        }
> >> +        p->host =3D p->block->host;
> >> +    }
> >> +}
> >> diff --git a/migration/multifd-colo.h b/migration/multifd-colo.h
> >> new file mode 100644
> >> index 0000000000..1636c617fc
> >> --- /dev/null
> >> +++ b/migration/multifd-colo.h
> >> @@ -0,0 +1,24 @@
> >> +/*
> >> + * multifd colo header
> >> + *
> >> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.
> >> + * See the COPYING file in the top-level directory.
> >> + */
> >> +
> >> +#ifndef QEMU_MIGRATION_MULTIFD_COLO_H
> >> +#define QEMU_MIGRATION_MULTIFD_COLO_H
> >> +
> >> +#ifndef CONFIG_COLO

Should be CONFIG_REPLICATION

> >> +
> >> +void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p);
> >> +void multifd_colo_process_recv_pages(MultiFDRecvParams *p);
> >> +
> >> +#else
> >> +
> >> +static inline void multifd_colo_prepare_recv_pages(MultiFDRecvParams =
*p) {}
> >> +static inline void multifd_colo_process_recv_pages(MultiFDRecvParams =
*p) {}
> >> +
> >> +#endif /* CONFIG_COLO */
> >> +#endif =20
>=20



--=20


--Sig_/5eTsIMCTm+V0vG_rgx+_/lm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRcvTMACgkQNasLKJxd
sligUhAApX1+y4huWdLQWdTg+8EaU4CaY1riW6rbr/IAXkznKa+28UsKT4EN+O7F
RxVH9aGY8ZqV6DmhzkgJuYVslkXzjAObtdU+rcQrTAbSs1MvCladrBlufzlnBv65
bhpVbON7nglmthabwQFU3UxE/xtufIbpXVsFAmO3pLWtcBAtnT29zUtMu334sXOs
bTnRK94CI2rr+QwHj/aZUJA93EBFcKxUBY0MhB7fbHSPYTEyLu/6Nn8AAkLkB1UJ
MjobzYOhXSeJE3PJiYYh2H9v/6GVp0himkyXepRtNEl4NT6KULPMUjs/axxdGBXT
5fs+uhE0n7N6Cl7RFsV57drJszsHkPjU/+pYPFMEH9XJb+f8iKByK4f5ZtVDOa++
dWGx+nIUzylHIy5pTvAN+Q/XDVh8udOG8LblS2aLp8e4dJQ9xovZVCNcmUBIwZeJ
46pjXAwa9k8YDk/O8cYHnSQEHL4XQ4uzIkxcnavFatQnN15tDwgRsCOErzNXOqDe
O/Z8IWqUbjr+xnvM9zwv5WTBBIgoSb61z3Xf8Vtn8LaZ0HvH22zs5M9kM3Dxa38+
ughdTSPRMQ79WuRAA42WWBR7r/B+QKoOTurqejK5cTx7ASsxyJHcYcQDZ7ZgiAM1
aMElyKVvTG0mWAGRXp5RECal9BJSwNt2YOItcWZMcoXdK9Zhg7k=
=mrTD
-----END PGP SIGNATURE-----

--Sig_/5eTsIMCTm+V0vG_rgx+_/lm--

