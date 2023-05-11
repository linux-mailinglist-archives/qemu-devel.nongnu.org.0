Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356166FEF27
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:49:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2tq-00066M-Q5; Thu, 11 May 2023 05:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1px2th-00065G-BD
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:47:41 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1px2tc-0005er-6E
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683798450; i=lukasstraub2@web.de;
 bh=KF9MKqsQhXoxdMfmrOofIzK9VVsT7df2F+RBSvD9McM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=eIIF1HAE+fkzlF30CAQo5VkwA84XeSSSEwoQeyuzxgsLapYJm/aRKSN/2/bBG+Je/
 8/Je7+ecS0PH+c2lSm7D2TaheRjlTCuHmfkt6dnaesFSMbPlY/2HrwBvXU4gI3KJtx
 GnP9h9TpzVSVKsv1lgB4hIsruVsuzeuZy/vFgbWJE/pxffBEom4fkbA7jwFJiTMkIz
 9YGVRRORIkq3KwEaKxrbVe0FJdase3kFk9z4ymOC9OXPo4lFrrsAPpeUm/OQ/SRmHy
 utb+aZzRjmeIUgicemP134O/+HLiq47DuBER0qKU5/t6BjnFvPXIUvANLvS2B139/1
 bcI6NYhsZTjrw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.113]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTvvy-1pophT3a3m-00RJ2B; Thu, 11
 May 2023 11:47:29 +0200
Date: Thu, 11 May 2023 11:47:13 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>, Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH] multifd: Add colo support
Message-ID: <20230511094713.6f08730c@gecko.fritz.box>
In-Reply-To: <20230509181528.84212-1-quintela@redhat.com>
References: <20230509181528.84212-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QshliMyG7Nx0KzFFjm94Zux";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:zc/8oUoTGbGgCBPc5yY4iwqaeIQPTOwiKgK+kErCD2kv0blEgGB
 jK0g7+J4bkkEyp+WCoAY3L2hKWMyQNj6Wn3fWLCUt6mioSFTcjgEQ6SfRLW/j3BXg0PBtKh
 sB9YCaIPJdJf80mbq7JLa8e9k+yYzXR+HvyT1e7y2ZGIFrPkCMOAbS+1NHi+xQ0XWMqolc/
 uzrY4gfED6wLhBvKZQGIA==
UI-OutboundReport: notjunk:1;M01:P0:atXEx4SRK+0=;r9lqNAXKQMYXXk8+2Sx2eYKyLk5
 c1MJjIRU3MpWbbGcjsKFHBD1wk/HF0GKuA/RDULYzgvSkq8Pgsqpg0Xxu/zW4FPZwpM2Qdib2
 3L+OLfnd1bTw1iS4dMbVvXE497Ug7vfPJ3oaqDvEj/5cIcyvjWVsx5EY2iB680bQ4h4ZX0UTV
 YtPRl4WpEu622D2y3A5i4S2dMuZ9+n3SB8AxZtVWfi35TpUnArnWGXf/h9AhBqCK8NrR0jick
 4JZ5UICdQiotqkT04Z0f2tKxporAzBnJm3gCIZnAHRf1lGuaf48b9Vw87tfdbJJU1Q8LGhqrV
 5ZaRyfJnXcvcuoNBrv54YTcUMBVw6RQ0+mTp4sCp//Mqn1HD7kUn29S8sSOANv6OUBItb4Urx
 /1i/BiiVSJCFcgQy+F+x9ozhU1lpf1HZ86uXFX+ESqOKHCLHzjOvXw+vTntqtTDS6cRrArbnS
 k9mBH5zYyP+7uXFaVazzRGja8yYXUdthMghqNbU2eucf6tSUEePxFcabSRx01MCGRM+ataCsY
 x/SPatbA6/juFzeDMpz/YoPXE6n/D/CPJQAteWpeC7ZcB8RwxFbMsdImuvMdkVw+HKCsAQT2a
 5624qui6vft0T6Wu4gCc3+OoPsytGlL8/RMIM1h4E+TPrr/jZCD1WOWo9IIr/oQlKnZFKbz+R
 DSPxNfIfmmxP2q/Sqe2p4kq0Z4mmW2HW9x8oI6moYq2wrDG6t0ICaaJ6fy5ayBRP0dHoYwBUd
 aJ/0ClaAaWWP7mas1wodBHGOXZom68ve33wI3/Nn2gwdPC4pj4MhM6p8oEqTJmQ4V4L2C8XHQ
 6hOJ94+aqXwjUW7SHp5KkwxoCeGGf5ClYL42NgDGH0eZ1NjeSK2AfkxPLThobMiFdkdWdzb3z
 0Mgwuc2mrmRR8NUN+7eQcoG6LhKeZmfB4s361SfHA7lDDnVYMsRKZl7BVNc33y6lGI748RBGy
 6/G5qYTlgOd4VRhYL9QTHEWi1ps=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/QshliMyG7Nx0KzFFjm94Zux
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  9 May 2023 20:15:28 +0200
Juan Quintela <quintela@redhat.com> wrote:

> From: Lukas Straub <lukasstraub2@web.de>
>=20
> Like in the normal ram_load() path, put the received pages into the
> colo cache and mark the pages in the bitmap so that they will be
> flushed to the guest later.
>=20
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>=20
> ---
>=20
> Hi Lukas
>=20
> What about this instead of your other three patches?  I think it is
> clearer, and I don't think that we are going to have anything else
> that is going to hook there anytime soon.
>=20
> Notice that I put CONFIG_COLO waiting for Vladimir changes to get in
> before I merge this.
>=20
> Notice also that I "lost" the line:
>=20
>   p->host =3D p->block->host;
>=20
> In the error case.  But in that case we are aborting the migration, so
> we don't care.
>=20
> Can you check if it works for you?
> Here it compiles, so it must be perfect.
>=20
> Thanks, Juan.

This way is okay for now. Though I will send a patch.

Regards,
Lukas Straub

> ---
>  migration/meson.build    |  2 +-
>  migration/multifd-colo.c | 49 ++++++++++++++++++++++++++++++++++++++++
>  migration/multifd-colo.h | 24 ++++++++++++++++++++
>  3 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 migration/multifd-colo.c
>  create mode 100644 migration/multifd-colo.h
>=20
> diff --git a/migration/meson.build b/migration/meson.build
> index 75de868bb7..c9db40d4d4 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -23,7 +23,7 @@ softmmu_ss.add(files(
>    'migration.c',
>    'multifd.c',
>    'multifd-zlib.c',
> -  'multifd-zlib.c',
> +  'multifd-colo.c',
>    'ram-compress.c',
>    'options.c',
>    'postcopy-ram.c',
> diff --git a/migration/multifd-colo.c b/migration/multifd-colo.c
> new file mode 100644
> index 0000000000..10fa1467fa
> --- /dev/null
> +++ b/migration/multifd-colo.c
> @@ -0,0 +1,49 @@
> +/*
> + * multifd colo implementation
> + *
> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "exec/target_page.h"
> +#include "exec/ramblock.h"
> +#include "qemu/error-report.h"
> +#include "qapi/error.h"
> +#include "ram.h"
> +#include "multifd.h"
> +#include "options.h"
> +#include "io/channel-socket.h"
> +#include "migration/colo.h"
> +#include "multifd-colo.h"
> +
> +void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p)
> +{
> +    if (migrate_colo()) {
> +        /*
> +         * While we're still in precopy mode, we copy received pages to =
both guest
> +         * and cache. No need to set dirty bits, since guest and cache m=
emory are
> +         * in sync.
> +         */
> +        if (migration_incoming_in_colo_state()) {
> +            colo_record_bitmap(p->block, p->normal, p->normal_num);
> +        }
> +        p->host =3D p->block->colo_cache;
> +    }
> +}
> +
> +void multifd_colo_process_recv_pages(MultiFDRecvParams *p)
> +{
> +    if (migrate_colo()) {
> +        if (!migration_incoming_in_colo_state()) {
> +            for (int i =3D 0; i < p->normal_num; i++) {
> +                void *guest =3D p->block->host + p->normal[i];
> +                void *cache =3D p->host + p->normal[i];
> +                memcpy(guest, cache, p->page_size);
> +            }
> +        }
> +        p->host =3D p->block->host;
> +    }
> +}
> diff --git a/migration/multifd-colo.h b/migration/multifd-colo.h
> new file mode 100644
> index 0000000000..1636c617fc
> --- /dev/null
> +++ b/migration/multifd-colo.h
> @@ -0,0 +1,24 @@
> +/*
> + * multifd colo header
> + *
> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_MIGRATION_MULTIFD_COLO_H
> +#define QEMU_MIGRATION_MULTIFD_COLO_H
> +
> +#ifndef CONFIG_COLO
> +
> +void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p);
> +void multifd_colo_process_recv_pages(MultiFDRecvParams *p);
> +
> +#else
> +
> +static inline void multifd_colo_prepare_recv_pages(MultiFDRecvParams *p)=
 {}
> +static inline void multifd_colo_process_recv_pages(MultiFDRecvParams *p)=
 {}
> +
> +#endif /* CONFIG_COLO */
> +#endif



--=20


--Sig_/QshliMyG7Nx0KzFFjm94Zux
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRcuaEACgkQNasLKJxd
slhb4A//VgyZRTB9HFqQVc/hpqV+pCcGJFg195Or/3Qfijmv7FPbkKAxmp9653h8
pNc7+w/2i+jRzjW/0+yXQfpVvi5uN4HFuiZlFzF0OUlWgTVTFKKFcOEz4LoCJfQ3
XOy4d/g4Su0HA1yWzVp8FF2071x32sjOtVEDD4LMeraKkUNxZUYDlOhc/XGPvmKN
/0dp5LMjuHFY5n5H2ynjDOwGmO4XodHYch0CTCFlFTr8WTl71abc8o0ePbo8Lubx
r1fDTtUt3d2Vr7Fn7bQkemyWvD+K89oLR9tvcwKjMAFszzWeEEquFZkV2yc830kK
hxaA1XYw2TcniByPydYOeNw6LuOur65B1N+RoO7o7xNJEpRm6KBkhqiVloSHO7Kv
XZqcH34rOA9OMm4u3VWbA8WGkuReW8Pv+oYI/DpdU1qvWqaol8G4yQSTLVcrIrPF
h/SvtR2nqFT8jJeN9w+5b3EB5hTo66l12Q0XtBOcaN5hav8rbQ4Yr3MzcmSvMWrZ
VeqyQ8UDJVSJ/KBNbavp56UGut0O8H5mDYGtrNQlOKqeIuTMODFVnIR6lDa9NY4q
XTAxJpoPDO23wRNuG55Lea74IDjPVI9nQA6LR8B+ePoKcR8NZ0Mv3QydWmqcmO9D
3bUlDJcJ+CqLFpTQzFrH8mXiF6zRCqlSyD2+QfgvLvRxbVHDjQw=
=Wo4J
-----END PGP SIGNATURE-----

--Sig_/QshliMyG7Nx0KzFFjm94Zux--

