Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B913D48D9
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 19:23:03 +0200 (CEST)
Received: from localhost ([::1]:40638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7LMc-0002q6-GJ
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 13:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m7LLg-0001gs-LZ
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 13:22:06 -0400
Received: from mout.web.de ([212.227.17.11]:34453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m7LLd-0001hI-RS
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 13:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1627147315;
 bh=EGyjQcSiOxgN517ZRoBBZ0PpkQPrLEn8iQ58lTL3b9I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kf6Lr1TquGK5MqIedDl1INVDSYu2r6Vl5E60Bzu3bB2deOsi3W7nvx/QIqItceUv5
 DW54Lxyst1kJ08HJIpxxkm/wBUcz7vniSCrBJCkdxS5O8Kc2cuskesKkCX2sPeTKtj
 vSLEJTF+BOwloD2zPdh1np0lGcncL+R2MF56vhKk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.243]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjgSv-1lO8cr2ved-00lAKA; Sat, 24
 Jul 2021 19:21:54 +0200
Date: Sat, 24 Jul 2021 17:21:44 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 0/5] migrations: Fix potential rare race of
 migration-test after yank
Message-ID: <20210724172144.216a8e9d@gecko.fritz.box>
In-Reply-To: <20210722175841.938739-1-peterx@redhat.com>
References: <20210722175841.938739-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GVpLfHgowDW1koKZpITHkmk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:kPCn+P6Z+D0Z3VTcp2k8vnleIfmE5Gg0neiXao+VcBa5l8uIDGn
 RyfHnzRarNaifsouxwaf/RzWPMUay6Xq4/Fn/QIVDTmlHmjcajTDSOXzhh3tftH+eDxK3hI
 r029A5AyF87jiwXfSmzZoZ69SyjCldY19GeHYbN8jK3ZFmqua06ECKYHZ3duYLvdJVViFUb
 a+qpGuW754Q6AW4gYP59g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GRFLGT3M2rs=:0ulzSBqNMr5RmRpW8+Rmtg
 b9pW+kdGvX5WPhJeeYTxuZgRyR41KGLJZphYDiTXI86SnZYcuAr+Y/+SdbEzCS+gX9HIdpPmC
 iJa+rMbGjOyrDO2FrA0an/wETTe+dLL0nWvaYSyMYhFEHjxA+9f/STFUc911daWvPk8+eHuCc
 bVhzea9oSSzD6AZYpnR7cHNRlaemBm4lvSAobl8u7XWc/PSFRqiyvdhMY2hweELHsVkzo4JMB
 truMbot10P8813coJlzIpe8GYWW3EhOGcIQShGJDdu/rudXe0g6ro2MQoShaTQ9Y9gsrhFyLA
 dA9agEGgI6uPbL6oF4a0aNQbysIonPPS0AmlQwjvt/k/eYfB5onUTedgsp4iSfpq0HuzsutNE
 4HBq8DCMX0THg8BbtqZKTZG29H0ZloOUo8yH0QXoLGQCZCJYnRoMWcg0gvFgjFA+uvLPbpf0s
 mYnD7lYpJogIUdQToTU+fiy2nBXLX1CTM3SiNdf6H65xnAyr+jKX3YGfFXA21XcCANh5mn8t6
 9cVotmeLi8qfOHHuCtaH5sRpbxBgf3ZKe4ofpe+CgQEuGSDCbyOidaNnRHmKziN40ZYYVl7HZ
 RAp7Llv7f0PiKCbYHOVYD19lCqFCIs8ZKoALzgO+N8BVdX2R+86A8me7URPgFcmueXrdidkFN
 cuuG9NKMDLruNfLR90VAtSGpYY2KsIeeBFeMNdrzwWPymu0aUdVzncyStU0ZmUlVX5Bx8ElbH
 ML/oaS2YfA62gyYWEer8MpHhGkJtyXnkkpwpt22zDn3odARi/m8mvn12chY97dQO7rJgcpHsk
 mhV0HnGbS79dWbVB5WJQjGDhquwfbeBt0jNBqfdAXl9u1xmYNZW03quvIWE2Tw2la/8Acm4Jc
 UE+200DEAhn8a/VB0wZO9qSUghH5m3Vn4FLxKkCXmW7eHQKgSDowRRfIeoh2PSyRUQw0M4m0S
 rgKrFFoJlzkUvdhvTvajIg6p5wETxVXpi7bM5wg/ssjVp2o0CRoeGKkLSJ5cgtqB6pDj2c6rh
 so/kvCorPeWjXSxbeGWs8H857v+c5u0bMtrsHh538snvhhngXQKq8CYfi0eEz3hHfK5YzgDS1
 ztF34ZhRRXHm7/vge+oqs99C+rvx9wD7TWTCsz1CJ2cbT9Ju920E8vpsQ==
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/GVpLfHgowDW1koKZpITHkmk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jul 2021 13:58:36 -0400
Peter Xu <peterx@redhat.com> wrote:

> v3:
> - Use WITH_QEMU_LOCK_GUARD() for patch 2 [Eric]
>   (potentially I can also replace other existing uses of qemu_file_lock i=
nto
>    WITH_QEMU_LOCK_GUARD, but I decided to took Dave's r-b first and leave=
 that
>    for later)
> - Added r-bs for Dave on patch 2/4
> - Add a comment in patch 5 to explain why it's safe to unregister yank wi=
thout
>   qemu_file_lock, in postcopy_pause() [Dave]
>=20
> v2:
> - Pick r-b for Dave on patch 1/3
> - Move migration_file_get_ioc() from patch 5 to patch 4, meanwhile rename=
 it to
>   qemu_file_get_ioc(). [Dave]
> - Patch 2 "migration: Shutdown src in await_return_path_close_on_source()=
" is
>   replaced by patch "migration: Make from_dst_file accesses thread-safe" =
[Dave]
>=20
> Patch 1 fixes a possible race that migration thread can accidentally skip
> join() of rp_thread even if the return thread is enabled.  Patch 1 is sus=
pected
> to also be the root cause of the recent hard-to-reproduce migration-test
> failure here reported by PMM:
>=20
> https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/
>=20
> I didn't reproduce it myself; but after co-debugged with Dave it's suspec=
ted
> that the race of rp_thread could be the cause.  It's not exposed before b=
ecause
> yank is soo strict on releasing instances, while we're not that strict be=
fore,
> and didn't join() on rp_thread wasn't so dangerous after all when migrati=
on
> succeeded before.
>=20
> Patch 2 fixes another theoretical race on accessing from_dst_file spotted=
 by
> Dave.  I don't think there's known issues with it, but may still worth fi=
xing.
>=20
> Patch 3 should be a cleanup on yank that I think would be nice to have.
>=20
> Patch 4-5 are further cleanups to remove the ref=3D=3D1 check in channel_=
close(),
> finally, as I always thought that's a bit hackish.  So I used explicit
> unregister of the yank function at necessary places to replace that ref=
=3D=3D1 one.
>=20
> I still think having patch 3-5 altogether would be great, however I think=
 patch
> 1 should still be the most important to be reviewed.  Also it would be gr=
eat to
> know whether patch 1 could fix the known yank crash.
>=20
> Please review, thanks.
>=20
> Peter Xu (5):
>   migration: Fix missing join() of rp_thread
>   migration: Make from_dst_file accesses thread-safe
>   migration: Introduce migration_ioc_[un]register_yank()
>   migration: Teach QEMUFile to be QIOChannel-aware
>   migration: Move the yank unregister of channel_close out
>=20
>  migration/channel.c           | 15 ++-------
>  migration/migration.c         | 57 +++++++++++++++++++++++++++--------
>  migration/migration.h         | 15 +++++++--
>  migration/multifd.c           |  8 ++---
>  migration/qemu-file-channel.c | 11 ++-----
>  migration/qemu-file.c         | 17 ++++++++++-
>  migration/qemu-file.h         |  4 ++-
>  migration/ram.c               |  3 +-
>  migration/savevm.c            | 11 +++++--
>  migration/yank_functions.c    | 42 ++++++++++++++++++++++++++
>  migration/yank_functions.h    |  3 ++
>  11 files changed, 138 insertions(+), 48 deletions(-)
>=20

Looks good to me,
Reviewed-by: Lukas Straub <lukasstraub2@web.de>

--=20


--Sig_/GVpLfHgowDW1koKZpITHkmk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmD8TCgACgkQNasLKJxd
slhGKQ//Un3wdZq/gQ1fblhQ/Nyff1mUvatiu6241URAP7gcrQ/oj/zVD0ndZGi2
ObikGC2hLvvsd0p1sGgHrv7fPXqWBCOIQZKRt72YlIkmX4N2ll828RGoYILb2dQU
FF3USSlWubFvIO3iUjkEpFFbGfxqfkTZttkxOZZL+GMm+BjzdUBZSw+kPyFPOWak
t0Eo/OWU0assvYWKnOFWtRHwbv1GVz1xOLSELEMenxoUul9lATKqwGLBSWvTzofR
rTqcuX1/k5E06TynwgiifXYktoeeil+YSJx4spAl5zwXZtw1pkgywztRVpKge4tb
5Aydjtyafe4F3F/pCvoghJSW83P/cGEkir+5QU+DVX57ZA/I7yJNP//Ti9sBbcEc
130kSH+hbDvWxHzYkBYbuG8pSmwjJmdQMVCr6wuPJBhamSM71Qu8TpMkZxycwy1y
3CACmiJYWqRp7fOlPBUjOCVEzKhaYRdwI51gJPlBbvZX62ltkqw8UJGvrF317tSC
UiVN/Mis1M6XH81mI0SIbq6v4WsAg/ULGQ+MuIOCSHO7U2guZwkQnlBuZJmYUFd2
Kd7SGGL2oHQ9bctbeCyqgoOjs7SMTfvrEhWirK5RBCJSIKixv3ztnWBrLVaHakng
LdBZhsscVDcz/17sBRymZGz2VCvxHuXb7lSsKtEXZH4SaizDo5Q=
=f/bw
-----END PGP SIGNATURE-----

--Sig_/GVpLfHgowDW1koKZpITHkmk--

