Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C73BA982
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:33:48 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lziaR-0006W1-Re
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lziYc-0004sc-Ex
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:31:54 -0400
Received: from mout.web.de ([212.227.17.11]:60047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lziYa-0002RW-Cc
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625329892;
 bh=ia6mEFxqJpPpUgP8OkBgmdgb8wK2HOKM/jnSNHJ48sg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Grh3OcuxtAVnzY9cFlJNgcj5Q0Ie+6L70hqpKiIRuQG3lTI2B5cIRMGr1yUqZbPYO
 lHdnrcRUobYZCdmO2UpzBfwxM8ouFRg9SIjBT8745+joeJwcXOVOcQd1SyhaULRS7J
 0Q63OMpSA7qs1vSJlsMFCamb9RaGg6AdlglsHzsg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.254]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LcxtU-1lHcI81DhA-00iCys; Sat, 03
 Jul 2021 18:31:32 +0200
Date: Sat, 3 Jul 2021 18:31:15 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <20210703183115.17f385f6@gecko.fritz.box>
In-Reply-To: <20210630200805.280905-1-peterx@redhat.com>
References: <20210630200805.280905-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XV=JqG8PO+lVKwX6g9QBeAj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ZI+9ZP47e1FgOQypysgCsGMP9Q4onVqMqOd5tF9idFx6xs766YZ
 dhT09+qHTXGC57pHvWRBuno819CkjQx/cd55Cu/m8+t+FLTmRb+hHxzD+RPaSrcpBPx2V/I
 sbhKklk47+L00Y5eehY0qOwctw6cgyoRU3xeSjWMyVfN+d/5mPZVmDJDSrjvRe22q6tlNZh
 N+I1JUhRE++cq0jv8dOWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1uKRPzUJcyg=:Qxtfo9wAMlNcRD1RKWW3DX
 xoXpUQHRkgHf6x7PUQSWT0NFGyRIPfvnaXVuiatxbUVrX+Csz9LNaPwo16mpBypA0xzRhuxYs
 IUeu5SALM7P/9MIPjX+wYR3Z/lDJYTO3QhCT6VsacC4HlprrlI5jT6BVXz1YZ36WQ+mteu1+4
 YOs/3ehk3oX93NUvgWIzcnM77/khmBfjuRGtQ26slGZGrgU0rOwAEb1NThuDMH/N9S4/zw3Xm
 hpws3gRzKqp2HZtUSFooZpUYoRXXLWpJKjSOUBuV+pV6+siPLK67n99n5GHu+dsbhCwjxZVfN
 Pr89QONwVrVLbXfotUsp09hS2drTpLcRDBjtbDRQ8eWn9Q3Y/6+jyioTXaGuSe8GcOP/CuEa0
 VYUVN4eMXBBOXeYAxKug+KIKxs/1i+BLrVvWgNLH9X4p/8oDkbDYj5N0lut4F45Ms7YGnfrAx
 pnAsxCctScqAu9rLnBHsNnKH1VTc1tpIv6XK1Zkv5vQUFzWWnOjL7PciW9nPyY9fFCErdlO+6
 4OG0n/8slGzH3CoOmeEPFX2CsDt7r9GPVS/EAshJ/1v2iDBowA+X4h+43yglvGAhxuCGJlmF9
 kOZaTFZK8z9rbnAGNtaOXVjDSYGVNFQ9qYji3KqGG27M0Bxz9N8fA/JUazD6fRp4WD85dKA0v
 hNAvuCwf33n65ILva3XkOfcuaKzMmSzlDUFDUgOrXlofrHWb2/ftAW2Vi6ardZRZqVfsdimEd
 1q2XtDFzUdcNiRZWy9+hmMKJ4b9AFx8ZDS859mLqtmeym9g06bzHlg5lIxLecTtazF0WTkFQz
 Cx6tBMqFEQv5YrOQEpj1/RqmSrsjgzkuCkPwHKtEGhVXjyNnsDOeQ1hg+5y8AFxivyKOzc0I3
 dg6A4c05GHbQ0fk9oRBBYGRacZGXpiM1x/AsKUY6axUx1qpempMBj7jhzFd0pDjjOuz7kXfEc
 d5JK0i5NIo+C6jebSv7QxK25ZgebGBALfhrcY1uOT98a+GNp4Vlmw5l78/gP5UbcAtq6mv7Bh
 61huIzMFyEGQ/j4OZX2NXAqgQX1lX7zQcJ0TiWu6jGShHjC4w78xTepw8cgzT4L8P+olOmecs
 MrI+EHFSy/YCKAj3PZLl9nPBLYqWYfWFPQk
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/XV=JqG8PO+lVKwX6g9QBeAj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Jun 2021 16:08:05 -0400
Peter Xu <peterx@redhat.com> wrote:

> Taking the mutex every time for each dirty bit to clear is too slow, espe=
cially
> we'll take/release even if the dirty bit is cleared.  So far it's only us=
ed to
> sync with special cases with qemu_guest_free_page_hint() against migration
> thread, nothing really that serious yet.  Let's move the lock to be upper.
>=20
> There're two callers of migration_bitmap_clear_dirty().
>=20
> For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
> logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, =
so
> taking the lock once there at the entry.  It also means any call sites to
> qemu_guest_free_page_hint() can be delayed; but it should be very rare, o=
nly
> during migration, and I don't see a problem with it.
>=20
> For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to t=
ake
> that lock even when calling ramblock_sync_dirty_bitmap(), where another e=
xample
> is migration_bitmap_sync() who took it right.  So let the mutex cover bot=
h the
> ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.

Hi,
I don't think COLO needs it, colo_flush_ram_cache() only runs on
the secondary (incoming) side and AFAIK the bitmap is only set in
ram_load_precopy() and they don't run in parallel.

Although I'm not sure what ramblock_sync_dirty_bitmap() does. I guess
it's only there to make the rest of the migration code happy?

Regards,
Lukas Straub

> It's even possible to drop the lock so we use atomic operations upon rb->=
bmap
> and the variable migration_dirty_pages.  I didn't do it just to still be =
safe,
> also not predictable whether the frequent atomic ops could bring overhead=
 too
> e.g. on huge vms when it happens very often.  When that really comes, we =
can
> keep a local counter and periodically call atomic ops.  Keep it simple fo=
r now.
>=20
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/ram.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index 723af67c2e..9f2965675d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -795,8 +795,6 @@ static inline bool migration_bitmap_clear_dirty(RAMSt=
ate *rs,
>  {
>      bool ret;
> =20
> -    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
> -
>      /*
>       * Clear dirty bitmap if needed.  This _must_ be called before we
>       * send any of the page in the chunk because we need to make sure
> @@ -2834,6 +2832,14 @@ static int ram_save_iterate(QEMUFile *f, void *opa=
que)
>          goto out;
>      }
> =20
> +    /*
> +     * We'll take this lock a little bit long, but it's okay for two rea=
sons.
> +     * Firstly, the only possible other thread to take it is who calls
> +     * qemu_guest_free_page_hint(), which should be rare; secondly, see
> +     * MAX_WAIT (if curious, further see commit 4508bd9ed8053ce) below, =
which
> +     * guarantees that we'll at least released it in a regular basis.
> +     */
> +    qemu_mutex_lock(&rs->bitmap_mutex);
>      WITH_RCU_READ_LOCK_GUARD() {
>          if (ram_list.version !=3D rs->last_version) {
>              ram_state_reset(rs);
> @@ -2893,6 +2899,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaq=
ue)
>              i++;
>          }
>      }
> +    qemu_mutex_unlock(&rs->bitmap_mutex);
> =20
>      /*
>       * Must occur before EOS (or any QEMUFile operation)
> @@ -3682,6 +3689,7 @@ void colo_flush_ram_cache(void)
>      unsigned long offset =3D 0;
> =20
>      memory_global_dirty_log_sync();
> +    qemu_mutex_lock(&ram_state->bitmap_mutex);
>      WITH_RCU_READ_LOCK_GUARD() {
>          RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>              ramblock_sync_dirty_bitmap(ram_state, block);
> @@ -3710,6 +3718,7 @@ void colo_flush_ram_cache(void)
>          }
>      }
>      trace_colo_flush_ram_cache_end();
> +    qemu_mutex_unlock(&ram_state->bitmap_mutex);
>  }
> =20
>  /**



--=20


--Sig_/XV=JqG8PO+lVKwX6g9QBeAj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDgkNMACgkQNasLKJxd
sljb4xAAu2GrPmGwCucmwmry3DdMYwxnOArom82jCNMsw3LpkcrO8sQR3zCGjdiG
gvagvlE6AzPUfA/KFZlRiCTPTW2FymFUyiOJPrp4BcljFpmPAC7krsRYxFDfkMY+
wuREthLp+2y5lrHsmBxljbMRJt1VA1VYwt8U4cEomEKw/hMZky0qa1WBIf/tNYiZ
0D/ObPMoyLiDzGr8OL9wnxkAaDeYJuK/Zts/Cw6ES5v2ol1ibsaKVTbFiEnEwHbi
npcDzJYT562mg5osXaL4YWv84RUKnv9D++qc/EoNUKgDIBGrBsFoGLq0qPog1XZX
iRu4FG7TUIt31Y7cQDSquyA4PvQXPHD/kJxaSnIGxtglF6prYqCsD4JF8SiWSr0v
AbtQTuiyBVjnB9iIyQRej5uP5WpG1/hkKH2Pv0Lxxn3D3z0w2vD6S/l1Fl/jRfir
zpFjyWFRR+y8tWZeT41hSJDMfPHxXsYlSF+n9Do9tp8WPpCVsxNyDSRxfpgdMbl9
qF8Yg46crC8wKLaVzn76kJOApu6udUz0utUpyczYdkj7tEt0C2ywW9sKU0ZL/NGH
oSMgWHF7tJzbYcu0OlO/cKnhGDnPFtAo71AazxYLeyxRkWAH74Gzezrgs8tyH2ud
oxc6ljzafvGDGgqhyUC5o1xkncMnxmLrd3n5b3VS5/ULppjJFMU=
=axAt
-----END PGP SIGNATURE-----

--Sig_/XV=JqG8PO+lVKwX6g9QBeAj--

