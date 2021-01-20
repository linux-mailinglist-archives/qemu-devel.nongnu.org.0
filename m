Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE62FD9AA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:30:47 +0100 (CET)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2JBm-00018M-IW
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2J9p-0000Ky-Fr
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:28:45 -0500
Received: from mout.web.de ([212.227.15.4]:51151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2J9n-0003KQ-Pt
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1611170904;
 bh=8OESxAGtj792oFeVAjM0ZiTCjurfhijkTwbnUNDlw+E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=p+SDwcaLivTCcr3OjPC0Kxrc+g4tDSIVVIASbgU/gpNUGYJlcVm4O7XmSHraGFOvT
 2Xb3qU8aDbtTT9gkhLxqMkx3cxGdk83Dx/8xccTUGMojJTCNtp9R+nTcsox1Ib2H32
 WrBg0pbUGrnrQNQGf75F0N6U3kG3A4wkRyCQMeu4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.127]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LrHMi-1m0m4S1VEK-0137eZ; Wed, 20
 Jan 2021 20:28:24 +0100
Date: Wed, 20 Jan 2021 20:28:21 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 04/10] Remove migrate_set_block_enabled in checkpoint
Message-ID: <20210120202821.2875155f@gecko.fritz.box>
In-Reply-To: <1610505995-144129-5-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-5-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ejo/wHFl1dpTCitQidvy1j5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:M1eqgtUXw6Gv2RdssnX+E0iNHPY6TXkU5NKA+tbD8Ei5zN5evQZ
 vIvUrYfYOEiioGDv2HL9n52cR2nSpkul3RFRBbR5mVg/oQd3P4Shk6ytEJO+gLwXwyJfkOD
 1kPoFtCjiEIdP7cqkLtF6lNAYCwXnfvquld4Cj8k2Ov2OFOm7IP86dv00Xmq+s6RAEUjWwe
 oON/+d8uq6CJ2gE5YE+ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:heh6mn6HBCs=:Xjw4tTC5aF9drzIPZobpyW
 E6+hjqa+irvj9OTunaynbeF8IVbHVj/a9wW2Gy5ZW3/fWBSwmDKfQfCFFzebq9tYZ3f8YaDEl
 TdHKU4A8eNWRHIvcs9csEVfY5xr7HViXFQ7TFlUIX0cZz4Q9SFor8LwJO3FALef7+tz7EYB2m
 hX+QSyDdWiu3aYEEtLM4/PrNULDpF7Mz9NAB0XZWyNxI0KS/J/KVcVgse/DlRwEzQNxTCGeaB
 5LYFY2llw/U9e1M7YWr09aEPTrS8a65HlwHZNDkkDCQ++CS2HF3Qpg7axM+TTO7ZwhcnrTocA
 n/9ULgk7XljhSmNlP412lw/TxuCGeCgavS5stLbmQCiJ97u0xpeC9Nxsad8CPkI1RjUzZhN9f
 EUwbeMTUS1Vq3ICOXhYGHSTwB5T1KAMRUEbdqj+vBxX2LMya4R94JR0cL3iT+luJEFClE3FWI
 uKKXD9aDNzWJ0U9Ol2vHztmpDarzv0vW886cUnaamdF5aJ1O+rLeIKyE3sHH39qgkDZdwoVnI
 5S7QZ7XrEWbEUTkVw3fpW061vhgCre8BpGNk0inUDobkTJhgRVavpT0ZNHXZk9U/ge2hyIwA2
 V2WZWUGRHOc3nsvRxjGhaikTe4WBUSnJDi9MiqEJbrgcXncN2GwGEWfLgqBGzk+nWaEj3+EwJ
 Xka4qy9pse6tzwccG2ePFijjVsFoP42LgVotcI0OoN7nkUwEVkS7wwBzp8/FD5Y5tRJvsaxm6
 onZSyK1CK0YZUAWSJE9nve3qE6OzzaxqHyleBPer5lESo9CK2pyK4DTMBnTzT5QzVMSS9IY+f
 iPDdQGGUZKbyyKCIJTQH0gH3alkkGx2GVy5mxvx3R4RBhLUyVj3oBEHbF2E0qgnJXstWePLm/
 vbikr04G092W2qWBkxJw==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ejo/wHFl1dpTCitQidvy1j5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 10:46:29 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> We can detect disk migration in migrate_prepare, if disk migration
> is enabled in COLO mode, we can directly report an error.and there
> is no need to disable block migration at every checkpoint.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Looks good to me,

Reviewed-by: Lukas Straub <lukasstraub2@web.de>


> ---
>  migration/colo.c      | 6 ------
>  migration/migration.c | 4 ++++
>  2 files changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c
> index de27662..1aaf316 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -435,12 +435,6 @@ static int colo_do_checkpoint_transaction(MigrationS=
tate *s,
>      if (failover_get_state() !=3D FAILOVER_STATUS_NONE) {
>          goto out;
>      }
> -
> -    /* Disable block migration */
> -    migrate_set_block_enabled(false, &local_err);
> -    if (local_err) {
> -        goto out;
> -    }
>      qemu_mutex_lock_iothread();
> =20
>  #ifdef CONFIG_REPLICATION
> diff --git a/migration/migration.c b/migration/migration.c
> index a5da718..31417ce 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2107,6 +2107,10 @@ static bool migrate_prepare(MigrationState *s, boo=
l blk, bool blk_inc,
>      }
> =20
>      if (blk || blk_inc) {
> +        if (migrate_colo_enabled()) {
> +            error_setg(errp, "No disk migration is required in COLO mode=
");
> +            return false;
> +        }
>          if (migrate_use_block() || migrate_use_block_incremental()) {
>              error_setg(errp, "Command options are incompatible with "
>                         "current migration capabilities");



--=20


--Sig_/ejo/wHFl1dpTCitQidvy1j5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAIhFUACgkQNasLKJxd
slhMjg//RATmvSXY47/XcgoNWILIkgW/FmVmreG6kIdf5DLtJVa2rqvZU+m6UIsz
OsdLvXE3VF87r3PZoflkELgz930V49Os8dsvYoH1HLxodmHL+kfrENwvc6NbOhfl
FLIYzsEjQPeLUdSulvxL9CDIfBE56e1Npy2c6ScK8Nm+l7bf47yfQS1BTKWiTtwQ
Hu/6WH289lus2ZG4z1FZ1bMTOSklby8INSb8NscW/Mngug9gt+EvT5AfFLnjY7sg
vi5TeH/hc8mKzd2ZuzK60aCTUPSmRxoZ1CHU70vXAw8w0MVT821D7eKdj1gqkpOv
9J2Rwzsjh85nA6iIc3eWz2DxyUQwvaNcDHCg5+E5IDw8CT/m3FbBR/3j0/8n3N9E
CtedGoMbYUxNUwD6lwWj5bVveCE+Dv91AjfVgmP6ZOAL2/rwXz1mS+XXeppL8lVu
9E3sHS/3tSf1crRVv6YkxJlu2uwGNpaTXNknq3rFcdije+/dp4yXa0XLzjmBYaZI
umVKsAHrkWz1h1WdezVRsyQqcbAgEVu3SbIjJ2dQKc3ExiR2pZ4bVxJma+kUyzYC
+76VxWW9OPShv9x3zHuOD4HTjcULeDUeWH6RpYDUWQ2a+t7FSiizfnMJnWEvMmmQ
WOuoluGNQbp0tyhKYN1F+dfU0PKFmon/iIBW2y31AB8owrlQuDo=
=9IUM
-----END PGP SIGNATURE-----

--Sig_/ejo/wHFl1dpTCitQidvy1j5--

