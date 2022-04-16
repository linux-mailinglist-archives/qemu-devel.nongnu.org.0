Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7B5037E1
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 21:05:50 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfnjw-0003lp-Fg
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 15:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1nfniQ-000343-Pc
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 15:04:14 -0400
Received: from mout.web.de ([217.72.192.78]:40023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1nfniO-00013C-RN
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 15:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1650135848;
 bh=Vrtt8eY+1+5xACfLDsJG2IgAW2POtF8cCgogxIAnCpo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aAIqzyIzfPbgKPF9KecmEUqYg44gjLxutYcAGN45qSo4WwWtZQiGmgvRqUl5bVWiK
 Fn3Pr2cke/kzeWlHnJd6+jGkfTZ7ROI7J18xbLIPs3wCxDfg7DIK+Mci8k8gvi987U
 2NbRMPywADNPgztWGKrpj2nBjFc3VqZKgE7eXBVc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.116]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1McZnj-1oDm1F01ld-00cudY; Sat, 16
 Apr 2022 21:04:08 +0200
Date: Sat, 16 Apr 2022 19:03:57 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 for-7.1 0/9] nbd: actually make s->state thread-safe
Message-ID: <20220416190341.561cb3ff@gecko.fritz.box>
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hozlXK8E1uYr/.o.9HB9JUI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:DEHkVApA+rbiiqM9mmleX1SVUEe7odHKprQUiqt5b6FXmyOofb0
 qz/gt2NvLOh2HEiOfb04f6ur9EgDZGlEDcBFcMSzWlxerHVsZ1NSW9iFVHLqm2MGRLaqrlM
 iY5bu/PpEbJ6+yl8vACf8/Q3uCh3mJ8qPnULqVs8lk7sr/rcmne2gLb7MVHbVH8pKNwZ4dr
 lJCo8sAwQeAiUqAjV5YIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B/ahzx+/apw=:IfjjG2nKOwyAD17z9GV0TQ
 R3ivALGFNFpZsTFuSdqUZ5U1wAfnLEzQh9qFPLoK1d0KyC9zzjaBuOUOeFbRa1AgIS1Vzviii
 //HiRjLGSO3+6FHvrOtZYO8ifZJoFgsLTXqqcmTqjDj0IgJhPaYqm+Cthjsm+R+BP3hssdvqA
 LlXAEpkkMAdV1bOU+i+qRdQIb/qY1bSZVZ+fAny3URoL2o6iwZd5j2hMqKKhu7fA7Sw5vu9Oj
 qA8tlUco4e/WlTEd4VZSK9/ZeaeLSvojOu43jkTCF95Irn46ZbQ7aqLwLaaXfva8hF4ft3oYj
 muSU5KD8liW/Sgvgd25KEj9faauMraa2Et85KpOx8d2SAZb4lkNhx15W9C/MkwWu7yVAhNz39
 JmMNC7+hK5Rf7tDKdOEQJgxjtGjfIDy0cQMZl7KghT0R52k2t1aYUi731Om3cy3qp84qT/zaj
 sZOBOkNVyXFDC4mcV+qKNh59/kdbtm3lDiCcX98ilMOLjBssNmKfoHoGodFEmEg6OXpvarQBw
 mD2DGDw3qw2BGQwpx81WH5K9y2gASsuaHftatOB2n6JoNhMVEiEdt6yuaD1AfwslrRueS4A2j
 v1/Nq6z/e5JZw8FxtRYG34P/gRn1hhGS55dAUDtt2ygegzldVrED2fJD6Xrn7WmxcNl1weQW8
 +4DVJO+HJP61K8NCsE0vJ4NEsT58KcgIdOjvmMvvYy6VWKnZIQJNaeaF/L74D7trFtcvPgBoU
 zyllRVJdeIWnnnrHLOU48YvulF8sJVgaVNROKGwFgkaWc5dGS44ymI5n8byLGi1EhDUofqzzT
 MEBu4HFnqa7qTbHq8TzgZV0qdo1uuvofNThaQhRpPxp1UAfRotj4RQu2mn8hXq+a44H08zhj4
 7DIGUYvt0lUjPPtcvBmmuYUFY+oxwiOD/gjf4jdFy64TP6G9eCpo8xjLdh0j/g7uPN6chs7d+
 ggB04jxIpjEoQIwU/XV34qs1XBRecbh4Q0l/fKLKfl7DiijkBg/kQOV0B79Ijd4mylM89VdSL
 Z070gaCPmHqKftxKzvuzUV1S7gZ6/hc/ZyMEEgXYXD7N26twqSl1OfTOLkbLdcOCkCJo4Y9i1
 Pnc9ScDqOUmpJ0=
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/hozlXK8E1uYr/.o.9HB9JUI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Apr 2022 19:57:47 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> The main point of this series is patch 7, which removes the dubious and
> probably wrong use of atomics in block/nbd.c.  This in turn is enabled
> mostly by the cleanups in patches 3-5.  Together, they introduce a
> QemuMutex that synchronizes the NBD client coroutines, the reconnect_delay
> timer and nbd_cancel_in_flight() as well.
>=20
> The fixes happen to remove an incorrect use of qemu_co_queue_restart_all
> and qemu_co_enter_next on the s->free_sema CoQueue, which was not guarded
> by s->send_mutex.
>=20
> The rest is bugfixes, simplifying the code a bit, and extra documentation.
>=20
> v1->v2:
> - cleaner patch 1
> - fix grammar in patch 4
> - split out patch 6
>=20
> Paolo Bonzini (9):
>   nbd: safeguard against waking up invalid coroutine
>   nbd: mark more coroutine_fns
>   nbd: remove peppering of nbd_client_connected
>   nbd: keep send_mutex/free_sema handling outside
>     nbd_co_do_establish_connection
>   nbd: use a QemuMutex to synchronize yanking, reconnection and
>     coroutines
>   nbd: code motion and function renaming
>   nbd: move s->state under requests_lock
>   nbd: take receive_mutex when reading requests[].receiving
>   nbd: document what is protected by the CoMutexes
>=20
>  block/coroutines.h |   4 +-
>  block/nbd.c        | 298 +++++++++++++++++++++++----------------------
>  2 files changed, 154 insertions(+), 148 deletions(-)
>=20

For the whole series:

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

Regards,
Lukas

--=20


--Sig_/hozlXK8E1uYr/.o.9HB9JUI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmJbEx0ACgkQNasLKJxd
slgOSxAAsZR4fNLyZYgxtrzyfj0FbUtPZw4kkbfHDmgtN+2iNdEYdwdBA2SWTjJ3
VX4jBIHp6Bb3bBb/hUl6S3ele34942kAuUWFbwp+7ygyehwKcS8760ev1VFdh6po
OUtgdffwSdbrSkIwbQnhLuZwc9cwHOaOPRbVW8ZmybDnQkZT8XUFcoDZ/bylzvGQ
Nmvr0YcGgEX9BT9PruBSpU/XtGKzHNPvrTIkxDVBj1E8xyN9YbhxaRVNKO7aKtba
rbklcGsl4Qx0GXRGHfvNtZkJ/iV9U6CchU91K+jB0ppRAvz0dkmdD0gWe1dOTVG4
1/xeK3+cAm+LBJ466zmioC0LJPc4nB9oko4pXar1RZbmi8KOmxCdX4zzXNv4oPGs
vuH4P7D0AWwAQnU0QFs9ZhhMGA8BaPIeGAEtBrVK+NaaJw7pB8SwIclW5D9oMxiW
fa3yEJM+F1AvBZz/dO8ewDXtI0klCHZqjaMZgCEizIcktwHfTNmsOwx8lAfKpNYg
Nbo4Vzm/lKc/NC7PRoZd9imyIvB7udlOqshyJx3CPGn38Iij0Gm9u6XTaLimuknS
J2KwqJoBShUtJfp4stCpTqIg431DIXveJk2ObruzuI0UVeBOe9L0sUFL+yJUEQQo
Fqyl+GY3r/OdEYqR7uXETHdYBIIqDLvUN/aJsCJnLY1aYzrSeXo=
=Z6Yt
-----END PGP SIGNATURE-----

--Sig_/hozlXK8E1uYr/.o.9HB9JUI--

