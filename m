Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5AE6E8CC3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:30:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPfO-00030t-4s; Thu, 20 Apr 2023 04:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppPfE-000301-9p
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:29:13 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppPfC-0006WI-0X
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681979343; i=lukasstraub2@web.de;
 bh=jg8xKlTDONv7B/+GWs/Ygt7cNenC2EUZEjOFvgps4rE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=r4l5uo7WCvNC/8kQhSbo68vjaFXWJBGt7NQ3kNRhnlhEnNshS6wPvvC7at8ICCkuT
 8+D68KL00a8GT+vIPuds8ogOHXjqV7f6cgGjmq347KE+VIFts2udMAvRJ5jj8WyorX
 NYOuHOgRdKtDOjxG+meGL/+TFBZLMadsMwY1DsP0jov5n1blHvkWQ+MCOqW13KvaYY
 jzRF8ZtnYA0VVgvRyWaVWMKbmrQWepQqSKUEI7Crux+z3y0alKYU1Ay5WRODupColY
 q+kqCrqy3glOTBqMe4VX2yKemT7o5GkOVTXb3eKhqeXq/XBpiuEo5c+7L0bZm2aA2D
 w+Vf1Fpvzf8Uw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzTLO-1qBBfz2XUO-00veyZ; Thu, 20
 Apr 2023 10:29:03 +0200
Date: Thu, 20 Apr 2023 10:28:38 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: [PATCH v2] migration: Handle block device inactivation failures
 better
Message-ID: <20230420082838.13d64e0f@gecko.fritz.box>
In-Reply-To: <20230414153358.1452040-1-eblake@redhat.com>
References: <20230414153358.1452040-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JfsnpQgErKKrHeFUTqfNGvV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:dvmM7maqUxpReqVJ6rguBfX0Cme81j6Af91MADKTAuJL2JW1hlC
 /Bi0aKpdxDDRxDIjJnlqqiuXQgrhnxifE76/JnQJ6EQiV/9ICJxselG2T0sZvn/uYGxFSq3
 FbLEgaCkfARsxGvDhbg9ZWf/sbI+FSQLawoXU6+UDh0TOJnTudkvk55Th6oDQQCoN+7gGc/
 apPQkGLGVdgAz4qdQVS3A==
UI-OutboundReport: notjunk:1;M01:P0:5EH0KzG5bPU=;uc9xlkfQ47ze8+8IBAXiQjcI0Ib
 JmtghzKAhDFZounnmk0BFD7xpZ290qu3uu35HjFCRupQBAPzQNkfNxDa2/KpN9g4UhubZvjoS
 dWTZ6QDC6JHSVkw++QLUoB5X+H4C1JnCjF+izq8S9ePui1hyqIIVFNJxwVseAbcgupUwqeINz
 pwntOGxlAD8uDtBiSz4H4Lp4CYX9N1SGX/Ty2mFEppDEio5fFp/LcONZCP6LW6A8rsnBunSMl
 4PC783V6x/DNCiyVZOddOR+IrTfR6dcj4eM98iG1LMihTDoqPqT2n0l4NHaYHnPgIJJ7N9vTp
 QxMf0NkqfizQthY7VYl35kuj+pL4K7E/ZpXGvYHLQEsMmsEPDuEY/IwXl9v0FZ04Mhkr0PvWf
 Dq2x3aaikx0p2f7jEr9chU4FR1akBk1yqanfRNSeeTNMuMd8NtyCjMADthhV/AgcfruL3PgAt
 NudmxkJ1jeM0F+QWqQuoYRqMUJl6620P5ARBTXv6LtnsuobxlkE8tj4o3SSveccVSyUdRgSUG
 8vQLocPIGBvLdKN/wGe8i+6w+MY6AHWlAR0wIf6SWphTFjq1KFZgS2ePksfsIaqVrcPmJr6Ct
 sefdaEaKVcOsHgZZqYSu2CTctPBYgD0b6vCyBnp3KGymyVcTgs1/GYXXJWFdslPn2qMPZqJ7X
 +Wd7pzQlyr9p9h6+fTOI825mPjfdNRjdsPvgjumKM/QbQ9a0piLeq3phjeZ4fhLfnJg2GY3Ar
 28LWFyUW7CsKgmR4duG1CjTCDDdWCTZaqKCuYrIoNP5TNX0TMepP9pAKcGkeBd16UJ6XwAv15
 19wHymL1D/Q+Gcy6wbAFCMPHJ8cxHAAOWiqDINRY+Bm5kHVlNB0Gugx21x8DaXU7SW01JCGYt
 DHtI1fcJG5h9PCQvpUyAwn63mObuYXGFppjeWD8m3Pp48MdyfRvhWeoBUbiEjZPMPkF6dYGp1
 UiSxHbuuDblMqpUf84cj3sE5I6Y=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--Sig_/JfsnpQgErKKrHeFUTqfNGvV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Apr 2023 10:33:58 -0500
Eric Blake <eblake@redhat.com> wrote:

> Consider what happens when performing a migration between two host
> machines connected to an NFS server serving multiple block devices to
> the guest, when the NFS server becomes unavailable.  The migration
> attempts to inactivate all block devices on the source (a necessary
> step before the destination can take over); but if the NFS server is
> non-responsive, the attempt to inactivate can itself fail.  When that
> happens, the destination fails to get the migrated guest (good,
> because the source wasn't able to flush everything properly):
>=20
>   (qemu) qemu-kvm: load of migration failed: Input/output error
>=20
> at which point, our only hope for the guest is for the source to take
> back control.  With the current code base, the host outputs a message, bu=
t then appears to resume:
>=20
>   (qemu) qemu-kvm: qemu_savevm_state_complete_precopy_non_iterable: bdrv_=
inactivate_all() failed (-1)
>=20
>   (src qemu)info status
>    VM status: running
>=20
> but a second migration attempt now asserts:
>=20
>   (src qemu) qemu-kvm: ../block.c:6738: int bdrv_inactivate_recurse(Block=
DriverState *): Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed.
>=20
> Whether the guest is recoverable on the source after the first failure
> is debatable, but what we do not want is to have qemu itself fail due
> to an assertion.  It looks like the problem is as follows:
>=20
> In migration.c:migration_completion(), the source sets 'inactivate' to
> true (since COLO is not enabled), then tries
> savevm.c:qemu_savevm_state_complete_precopy() with a request to
> inactivate block devices.  In turn, this calls
> block.c:bdrv_inactivate_all(), which fails when flushing runs up
> against the non-responsive NFS server.  With savevm failing, we are
> now left in a state where some, but not all, of the block devices have
> been inactivated; but migration_completion() then jumps to 'fail'
> rather than 'fail_invalidate' and skips an attempt to reclaim those
> those disks by calling bdrv_activate_all().  Even if we do attempt to
> reclaim disks, we aren't taking note of failure there, either.
>=20
> Thus, we have reached a state where the migration engine has forgotten
> all state about whether a block device is inactive, because we did not
> set s->block_inactive in enough places; so migration allows the source
> to reach vm_start() and resume execution, violating the block layer
> invariant that the guest CPUs should not be restarted while a device
> is inactive.  Note that the code in migration.c:migrate_fd_cancel()
> will also try to reactivate all block devices if s->block_inactive was
> set, but because we failed to set that flag after the first failure,
> the source assumes it has reclaimed all devices, even though it still
> has remaining inactivated devices and does not try again.  Normally,
> qmp_cont() will also try to reactivate all disks (or correctly fail if
> the disks are not reclaimable because NFS is not yet back up), but the
> auto-resumption of the source after a migration failure does not go
> through qmp_cont().  And because we have left the block layer in an
> inconsistent state with devices still inactivated, the later migration
> attempt is hitting the assertion failure.
>=20
> Since it is important to not resume the source with inactive disks,
> this patch marks s->block_inactive before attempting inactivation,
> rather than after succeeding, in order to prevent any vm_start() until
> it has successfully reactivated all devices.
>=20
> See also https://bugzilla.redhat.com/show_bug.cgi?id=3D2058982
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>

Looks good to me from colo side of things.

Acked-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>

Best Regards,
Lukas Straub

> ---
>=20
> v2: Set s->block_inactive sooner [Juan]
> ---
>  migration/migration.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index bda47891933..cb0d42c0610 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3444,13 +3444,11 @@ static void migration_completion(MigrationState *=
s)
>                                              MIGRATION_STATUS_DEVICE);
>              }
>              if (ret >=3D 0) {
> +                s->block_inactive =3D inactivate;
>                  qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>                  ret =3D qemu_savevm_state_complete_precopy(s->to_dst_fil=
e, false,
>                                                           inactivate);
>              }
> -            if (inactivate && ret >=3D 0) {
> -                s->block_inactive =3D true;
> -            }
>          }
>          qemu_mutex_unlock_iothread();
>=20
> @@ -3522,6 +3520,7 @@ fail_invalidate:
>          bdrv_activate_all(&local_err);
>          if (local_err) {
>              error_report_err(local_err);
> +            s->block_inactive =3D true;
>          } else {
>              s->block_inactive =3D false;
>          }
>=20
> base-commit: 7dbd6f8a27e30fe14adb3d5869097cddf24038d6



--=20


--Sig_/JfsnpQgErKKrHeFUTqfNGvV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRA97YACgkQNasLKJxd
slgNTg//WgiEQCM6/+99LjLuTsu/IWTlc7HPFhHdjdgWeSRhjrYFzB0tEx+7JWuX
dbWDzactMoI+Y12aBtsef9vbffmrLjNiIuDOlP8+wf4vzRmY+KYk57cejOVFSTyC
AKW0btHsE31tPqtbJxyMLVMwBuewoly7bBpj+wXIKNjj5WkYmb9ZUXhmtsCs2pGk
yO2CAFaiXBoQSAzhz4CR135kmBBYdpz+RKRyMPfjBmsCvAb/my9BF9lNJO3fzJuz
m0uWZWUI0Hqf142kg9SnMLOMVNwg+Snd5CvRFRMoQxsfasnMJ5cMFRWhF5dXxjcj
SynBlBVMmkqmFFzjsXpgr8aU4JZ0orDEXXOFP6/mORB3+HVD3Xj4dMX/R/y5nM/U
DyKasv5bc/OPWtjSEpZuko78HJTi1VIj5PyL1G3SYjwXPsuC/tVoCxc9vyZsDALd
ubdgqxxN0mY/XvovRSXl2Tg/pJ3MuXI62UIrd2M48TDiGpMeiPKZf6x6OrPkWKR4
SuFW3srbiYWqKLeXwDb+kT1yIUeVUqlS0zUqDkWeHDiskB+SH61YwPV5NS/2Iws2
uYKuR7Hx1zUv1Mgr5ice628VtlPe1+1BiN3VJFNAyujGYpP2WMzYp0VWCF47mQJJ
C4VgONNcDojxTWEqo+lqcDPFjmpcWxsyKBp1yI17X1todpUqUqs=
=qekJ
-----END PGP SIGNATURE-----

--Sig_/JfsnpQgErKKrHeFUTqfNGvV--

