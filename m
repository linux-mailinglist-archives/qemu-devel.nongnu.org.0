Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0503BAD5A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 16:16:35 +0200 (CEST)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m02vC-0004cv-9a
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 10:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m02uF-0003yf-VW
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:15:35 -0400
Received: from mout.web.de ([217.72.192.78]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m02uD-0005tj-Ut
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625408110;
 bh=q/eUK9jKMPwc3yigefg2ouR+B3caLjaquOjKMhbOlK8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=qiRPv/TqkJWG7BPafi3xSNRwhZ0vE0GyKr6vRfq9Mjbw3btMINADZ+xSbCS5pS1pr
 ZhHphMpfsvzg7B4APE0XkWJ2M2pX1nATKf6ONhjBkEv4qD11i0HvviHT91NF5lnFRb
 +ZpqiZCBHNi/nj4WHWSz3QYCqUJfplXYIhbI6IdE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.115]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCXZh-1lrYRK2vsx-009jza; Sun, 04
 Jul 2021 16:15:09 +0200
Date: Sun, 4 Jul 2021 16:14:57 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <20210704161457.17505f40@gecko.fritz.box>
In-Reply-To: <20210703183115.17f385f6@gecko.fritz.box>
References: <20210630200805.280905-1-peterx@redhat.com>
 <20210703183115.17f385f6@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R6+E=B=aXGSNR+hP/LMjABx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:kjwxYZmsJJqSXQsV8XFjVxeVRxz0kN4QDRlIpj+1eNDLuwYPYRY
 MjWS86m7PX/2lfIyues+FPskQzBCE2yxg2zZmsiXQatZLQSBXSVVK/oh7yOjlWfkxjo3vfu
 OWXqsU71OeY/5iL987FS71AOciDAziCBHnbqr/rdsqjdpTv7+qTwonyex1kd3SzlF+GcmI4
 d05BGNUJi5t3xDXaEli5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QWG207JjoI8=:y1TVKIjlT3cItTfGCqElCi
 6n3Vy44sRXt69riAsWNdeJiRZ6hTZP89dR/aNwsGkXSh3HcJLZEzCcqKU1ud/LHAbCP9/e/DI
 57pL8KfIOij3D5YRRTOsmjpOcucilFROZ3O9lWsbCkG5fQiDOo8sld4Z+sNv7p6l2gHsRUuHx
 kf4FGYJZpQLyYEt0jihcU1UVl+TB87NOdGtIlfh3C+8VJsFq+Je/6Beq3wUCJoipMHUNkmmuw
 ZS2RLxYCO7b7EiAMGyj6YcI4RsQv62CWeIunPkWoj/ZN2vvNLSJjdA8eamRnjEZ6f1nwRM301
 Zs+qUulhk5Ewx9ANvGQJOgY73vTdTANqWx53oxUXXVGRzXZhAQjcVX1Q3JNg64tzPmAIoP+n/
 VOee9U4JtwaTZ500dvMAxsPQTAYbLns8Vt+AEhn0VCoIntoLK+kyhuG252OGP8EmQCJgv0XWD
 o8re7d7cKU9WfkH6v/QVCe+M2axxNVpb8ou4iyKoh4eR6mYpB+dnTiXUmdPp8uF0v1MTubk+H
 EgKlOwwMxNbb9UM1nV8kePq9/lwimhAIbAR8i61FzkgG84oUDdCweWsr11HHazn5y9g1itZBO
 EIYyXZhvEQpYy0KoA3Qeq2yKy5k4QCF8FXPgXPZBPxDCODNZtEuKL117nXJVrpGbWw+FFrIvy
 BMJMIbQY3MLvJkJ/BknTzC6C0DVao+fny7rzTsc3Fj59pFqj7hffRnshJ+LAtFDxUrqvlOeUU
 ukzNpE8jUC+zvpudCbo326ttbHFmJLvhWceiq9cRtdXzZg2ktKBKDxzo2N/SkLSUROq9xqpk6
 TG+bD/1mSQMy7A0Mlju2Oy0wsNWa2o8cKRr5InpgWC43458cSBKgxE6OkuJNzMsgDKCKTR03r
 RZ9C9hrzdpVSK0fAsBbq6JxmKJfStkIXVJ5rZMAALxOz/vcAs2hGRea6lB+9UwIIN2b8KpGwI
 o3uv74PAvteK2/NyxmCSRHZERnphpDkYZcO+QPmi1bBAyb19NvBlGU51bI5hMFBmql3sAHrvQ
 tD7a9kjT68RMvpvYlyu0PYSnYTJmG1tm4JCBewV5WjFR7y7MpzlPcNXGE6DWRATro34uXsiP9
 ckZll/Oe0CiFa93YiiOSmIWwC7i79GoI3jSz31accTPWBEEpFnCupi+Zw==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/R6+E=B=aXGSNR+hP/LMjABx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 3 Jul 2021 18:31:15 +0200
Lukas Straub <lukasstraub2@web.de> wrote:

> On Wed, 30 Jun 2021 16:08:05 -0400
> Peter Xu <peterx@redhat.com> wrote:
>=20
> > Taking the mutex every time for each dirty bit to clear is too slow, es=
pecially
> > we'll take/release even if the dirty bit is cleared.  So far it's only =
used to
> > sync with special cases with qemu_guest_free_page_hint() against migrat=
ion
> > thread, nothing really that serious yet.  Let's move the lock to be upp=
er.
> >=20
> > There're two callers of migration_bitmap_clear_dirty().
> >=20
> > For migration, move it into ram_save_iterate().  With the help of MAX_W=
AIT
> > logic, we'll only run ram_save_iterate() for no more than 50ms-ish time=
, so
> > taking the lock once there at the entry.  It also means any call sites =
to
> > qemu_guest_free_page_hint() can be delayed; but it should be very rare,=
 only
> > during migration, and I don't see a problem with it.
> >=20
> > For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to=
 take
> > that lock even when calling ramblock_sync_dirty_bitmap(), where another=
 example
> > is migration_bitmap_sync() who took it right.  So let the mutex cover b=
oth the
> > ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls. =
=20
>=20
> Hi,
> I don't think COLO needs it, colo_flush_ram_cache() only runs on
> the secondary (incoming) side and AFAIK the bitmap is only set in
> ram_load_precopy() and they don't run in parallel.
>=20
> Although I'm not sure what ramblock_sync_dirty_bitmap() does. I guess
> it's only there to make the rest of the migration code happy?

To answer myself, it syncs the dirty bitmap of the guest itself with
the ramblock. Of course not only changed pages on the primary need to
be overwritten from the cache, but also changed pages on the secondary
so the ram content exactly matches the primary's.

Now, I still don't know what would run concurrently there since the
guest is stopped when colo_flush_ram_cache() runs.

Regards,
Lukas Straub

> Regards,
> Lukas Straub
>=20
> > It's even possible to drop the lock so we use atomic operations upon rb=
->bmap
> > and the variable migration_dirty_pages.  I didn't do it just to still b=
e safe,
> > also not predictable whether the frequent atomic ops could bring overhe=
ad too
> > e.g. on huge vms when it happens very often.  When that really comes, w=
e can
> > keep a local counter and periodically call atomic ops.  Keep it simple =
for now.
> >=20
> > Cc: Wei Wang <wei.w.wang@intel.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/ram.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > ...



--=20


--Sig_/R6+E=B=aXGSNR+hP/LMjABx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDhwmEACgkQNasLKJxd
slhNgg/9FkfrrDOD6sPu/cC7b1eav3fTRY0O76r4sndmIWceKOBi4ofTigZDB39/
qsERr1eOF0kM+zBKSuM0I03lxa+vejhqxarGKqhpzVBNL7CKD8mglglKyE3LGqwC
l8rg1RSysBX+z+YjFCHEpMrVZwSjoHI8NTQ7h1pworKrDXv//lxoe1Bs6i8Oyjzs
1gwKgAtikR1XqZrbuDYrwEDHU3ZPQFQG89gEUwljOZYpJsg65RTI8sIO98A3/aiT
1EQMUvLcvgcFjsij3cozGqvh5Ct5CS6qCMRYJzBZ1BRPRo57IlgEIQtSb5/Y2ctW
SPzya8jXxA5rD2w/fmvUdZPLQVZR/NJWLMV2k+Yj7ZnKqrb3h1mdKkZWF4kIZ60u
xFiw4YfzPJfocrvuUeCVV+75Vh/5NXUuNzqd4Qa71P4kNI9eCRBwno/Ts1OHXk2M
vrDLpgiGWujnluHHt+/gnASWHVdeCOWAFuw3s/o/lpws1vvIvWdnTN7GqDzLrFYn
lXabMhYWlTswr3lTTKOXAvNrvczlsHNCE7WzFXbFy+/e/6hc0Udh9+h0/cS0DWdB
Gua3DGBQonYaeDFekksV44YNsUmOJJOhjpO/D3JSmDofEXx+2HsoWPUGqtYO6/bk
HfYRe0HuRQRHNSYAzfa6H7nvGXez0q3cpdtVQE1wBW48sixlJp4=
=nogT
-----END PGP SIGNATURE-----

--Sig_/R6+E=B=aXGSNR+hP/LMjABx--

