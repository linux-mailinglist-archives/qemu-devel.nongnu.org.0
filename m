Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D937B3BAA40
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 22:38:13 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzmOy-0006o7-GN
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 16:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzmOE-00069j-8Z
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 16:37:26 -0400
Received: from mout.web.de ([217.72.192.78]:38437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lzmOC-0000Rr-Dr
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 16:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625344619;
 bh=BPy8FzlDFV1f/xELwOk8gPTRVbsqruJ6c/hDcfx+Lus=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kkklXxtVBwq10/guWTyQAe87cAG4DuwDivwlPi5LF2tsxlK/1cWjJamLyqbaJmoFn
 yKWgo0Spfd/MXWj3A80O2YuE9kVl11Ni+4NomR/3/p9ZVlsPbjzKpEsjh1uaTiH3uM
 BmZ2DkHu9C30eIN+6RqlvL51HDi4dSR32euiUMlE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.254]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MBkLb-1lswU014jv-00Am89; Sat, 03
 Jul 2021 22:36:59 +0200
Date: Sat, 3 Jul 2021 22:36:20 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Lei Rao <lei.rao@intel.com>
Subject: Re: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex
 mode PVM poweroff
Message-ID: <20210703223620.7dbf323a@gecko.fritz.box>
In-Reply-To: <1623898035-18533-5-git-send-email-lei.rao@intel.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
 <1623898035-18533-5-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OE5w_7uyaynGAa5TCMkw1Wv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:NweilD0b4c7hZDGILDnqM3RNwEQMQBFJSJFOxs1LfJ3xoYxb/WD
 a8Yb7yQOU6C27e06kFFCn7qzNl/Yf9ms//G/NJiNTkKbNZg5sMo6K4vqQ01Slcdi9tnqxZF
 3hOSpB/ORaXOZipVAVpt5snX6jWmgeFwLnSqL22kz8Qtf4kXe8IGLeejdSCZIQ72OHr3nj2
 7WJ5MZKAeF4H+4azVFH2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kn5h7aexzV0=:OTl2ispukgUA207L1ThUS7
 BrnCKcKxxc39UaLMW9TGLNQ3siDntTb3GYse/MXBsxzmLeNqVgQe0tZmeoPjAvEgjlj76RZ0n
 JPS61bPccRwTSfAt5O4m9WVgZ0Q452e+GFfGkpEYwFMSrmxCcOebhERcKwJQ4QOA8Rqo8vus2
 naeHtPPXYx1zZKcQQCvECStjUyFxYxYAaJHcL+CCntp4JPN7R/ZmqbfyH7QivSTUBwJfAuEB1
 elFiHaaIv40DtorTvvha3P7LpbrIvSMTCpugTivPm2IqjpWooJIk71pV6t16DMk+v2TN+ykPf
 msDTZoAf5bgGn65b9u6WX27NJeiK9l0bG5RcjBsDj3NukQmHSzfsw1Q3V/T7mAixoiqkGrIlY
 txFGMgDYiVBQP425kakzOcsmEBKvVA0qtmb4S0wuU7iDXNlKXDU4OEKTYXzawz5s6EXGwl2eX
 y9nudVUfE1AIXeptQX43SXZ+yk1sqOM7EPiPDDV9dZPhwLEh6+AsCuMzYaWM4lvLYNhMLjG08
 umERTeyls66QxMD2viVYNcQk4L1QcPdaYKCh9EPGXIBF7MVf9H0x6RQgEhzthTHJpPhkfbLaW
 hAogzm4ztc5guQeBFIOcWGrpvlGITM8hpoga+Vi3Si4PbkNndfz8Of0S+mHUFGJWHyVJrtyY/
 qUMV3TyidvqofQRoxH3MLfgfP1EnjZuG1/eGtvbcfQjP6nPr+/IQiXdEfAobmlwh6h+70tj3M
 Yq3hWG5waBku7lKQP+8p6QqOUQTjds8KvrkyCCnidi8rOKjK8KnakCtGMbnsD0W4tgGun2ygz
 lv1eVj1OnyHkxIb9yGUELAx+XUTZSGzDuVcn7CQDl8cGGqryTCPcyI8KY1IAtMQctb3TLqmbf
 CevyiLrOVkJUUKm+lKpj4+J0ew586qU4YgxSWkSF2UGBOlnEQBsxbEwDuP4QWs90wqAUYonLQ
 d90m67BI9kCQA4hzbxCNj9S3VY1Uvua8wcWdXmGbQgs149eUUcNwF+1vEjPb0zqEoaJ6KFF5U
 xWV1AeTm5IXVPe0UsvdFtElrjJTqrHMqc6Gyz12sKlJ6hyTM+5KD3P65Uhrn9psq6pXD3q+R4
 YTrsb3w0kMfX9crQ/ce75GB3713zKrVPk6V
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
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
Cc: like.xu.linux@gmail.com, zhang.zhanghailiang@huawei.com,
 lizhijian@cn.fujitsu.com, quintela@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, Like Xu <like.xu@linux.intel.com>, qemu-devel@nongnu.org,
 chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/OE5w_7uyaynGAa5TCMkw1Wv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Jun 2021 10:47:12 +0800
Lei Rao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> When a PVM completed its SVM failover steps and begins to run in
> the simplex mode, QEMU would encounter a 'Segmentation fault' if
> the guest poweroff with the following calltrace:
>=20
> Program received signal SIGSEGV, Segmentation fault.
>=20
> This is because primary_vm_do_failover() would call "qemu_file_shutdown
> (s->rp_state.from_dst_file);" and later the migration_shutdown() would
> do it again. So, we should set the s->rp_state.from_dst_file to NULL.

Hello,
Please provide a backtrace to such bugfixes. It helps the reviewers to
better understand the bug and the fix and it helps yourself to check if
it is actually correct. I suggest you to enable coredumps in your test
(or even production) system, so for every crash you definitely have a
backtrace.

> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/colo.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c
> index 616dc00..c25e488 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -156,14 +156,15 @@ static void primary_vm_do_failover(void)
> =20
>      /*
>       * Wake up COLO thread which may blocked in recv() or send(),
> -     * The s->rp_state.from_dst_file and s->to_dst_file may use the
> -     * same fd, but we still shutdown the fd for twice, it is harmless.
> +     * The s->to_dst_file may use the same fd, but we still shutdown
> +     * the fd for twice, it is harmless.
>       */

This change to the comment is incorrect. Shutting down a file multiple
times is safe and not a bug in it self. If it leads to a crash anyway,
that points to a bug in the qemu_file_shutdown() function or similar.

>      if (s->to_dst_file) {
>          qemu_file_shutdown(s->to_dst_file);
>      }
>      if (s->rp_state.from_dst_file) {
>          qemu_file_shutdown(s->rp_state.from_dst_file);
> +        s->rp_state.from_dst_file =3D NULL;
>      }

This is incorrect, as the file won't be closed after this and is
leaked. And indeed, when applying the patch to master, qemu crashes
when triggering failover on the primary, due to the leak:

qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion=
 `QLIST_EMPTY(&entry->yankfns)' failed.

>      old_state =3D failover_set_state(FAILOVER_STATUS_ACTIVE,



--=20


--Sig_/OE5w_7uyaynGAa5TCMkw1Wv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDgykQACgkQNasLKJxd
slhKag/7Bpi+uvUc0DqaHqq75qW9s+7wyfpPN9BboT6WEzubTS8k1YyUIYdhn8ly
JOFGUliCwBi2mO096Q2/OSJAIcuO10wcRcGa1u8YmPgKzE24RMuHM9mT9846WHlr
6AUfI22IDTVVhumfgfhlB14kTpnlnFBv7Mkh3WxFaXXh0rjVv6siQcSwwtkJ5ZeN
P7ZWrLNR2pazvHiW61/180m4PBuiViF3dVsFsGGJ+4fF6CQnMGsw9ThMkwrLApn1
kNPF6V2VCb2x5Rqefh2okLw1gb9vGH1TrBBiCBbN5JsfL7mZKHTB9a4i9jaJT+ZO
puFqz4EWZDrRBFkXMKvXK9XBc43gAYQ2XxDJrTVL+hcRutc9Rn8uhIGHnKUBWRp1
A+uakTgiSD3m3iC4uDWATjlitYaI9U72uOgnPsHfXYwufnDG2LmAwIiIaaJU1jBB
jUS0dZQkpI58fnzNputCwqNi15fPWr2BcLxTPzMeMykyHsi+wDQrhw4J6/ayRbmI
57shkGOYTVW/y1A/CiApkZkkUFpIsKaB8do0U3tblUyy6GyzEObwJ2xa+8yHvr9e
ove+BWp+orsFEvrCBmO7bIXQFQIbcHByprnDPkk7HN430ubAHrpsRR3OsH/ETUs+
PBK29JiDKEVy8tPvV/K8ZDa3MWDNrGMS1ME0BTCUgmXJWrq6quw=
=fLlO
-----END PGP SIGNATURE-----

--Sig_/OE5w_7uyaynGAa5TCMkw1Wv--

