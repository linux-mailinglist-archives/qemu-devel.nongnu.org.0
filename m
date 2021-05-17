Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1E0383DD1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:52:22 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijHp-0005LR-A6
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijEc-0002BG-A9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:49:02 -0400
Received: from mout.web.de ([217.72.192.78]:51963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijEa-00027G-8v
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1621280921;
 bh=V8jW5z8IiSu6Gl2/FArMTPv/pFXpOZET6RD0dz5OVXQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Pc2MCMDxVgXp0m6EL5SiwBXRNJnEiQzzc0wR7+yIYL8T14lol+ZlnWh/OHNrcfHsW
 2fRLIND6CuesPHUE2pQq0jagvn/fllNNqdQNu+o7w7+OQprFPbWi+Vjwh5EwBfUfUJ
 uogK7AGMjevOGWKJvooXGw01bxeQp9ObkvGKCZyw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.102]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LdF0f-1l0u6L3Z0j-00iUEV; Mon, 17
 May 2021 21:48:40 +0200
Date: Mon, 17 May 2021 21:46:38 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH v6 00/10] Fixed some bugs and optimized some codes for COLO
Message-ID: <20210517214638.7519781b@gecko.fritz.box>
In-Reply-To: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zLVyA1L_zSmacvbB3tU3rUc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:jfsFq+DIM+8T476SHKTW5YRFwm6mbdROhw2eSqr0H7deDSm/xRr
 q7THpYZOWYMwEfNJ1fub5bl6L1kQ6g5wVnD8wP6YAOkZTM7pb7MhIZtgYxZr2+h8IGPNJsp
 n40KjCSFyJ+ARs8GT2dm3WU1JFksV5QHe34abcihBJE3covpgHK4v4D7mtdaMANOUlvp64V
 FK8hwS9Cy/bMbJljNqY2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G8isGeUQAqw=:hl+yJiZKIDIGgNtGIgS2Oe
 ZGoZdbfsracY8pJnLD9iV4pOh0N6p3Lwi7YwHqW+/fBbAyPX6QAVMNmwljzaE+NOXifAa9OXP
 Op6Iysa40mf8FZnxUfJP62eSUtAz+Wozaa/14QJiksF3ddJZIbbcTwhtvD7WxBmCa+/YsvqJo
 ZPxrkpnYB8oq7EEqQicpEGd5Mpqx5rI1sBnkzfNqcm5hpf8YUf/Qpdx8WfKyiXQ7r6CC7tzmr
 Zh5NMBQAO3a7RaNTJ7xIfdE3rwFGffjbWjuzJpRIv1G7n8ZinkXgVJ/sug4LgYopZXT/H8wps
 flNCarnJ/wNxoAVbYCAzPnlYQOv+/t0Kimub4eMHrTzv8dbQNYEYaBJIcqRDO6AA3iURpNZmO
 XidpnfeyjkmcxQcfb7k8+AruZxiMXtr5qyuq0Rhgh+QY9VZHsFKRps5p1iIstiysDSDtviJ64
 aL3fLQKl1+fkYXU1CSKMkMsIfInWJ/5eXlCO7mCUQ2pDg7Eov1kz/SgQH+skkSSRZOiets1IS
 NplCDygOcmuMScCMYtZegcdTjTpuUELtHAr/6kCJakQcd6hLOv6uFVA4SPFrryzU/+sF0VHpu
 KfSXc+PQ8D53njutqdJJb7u3gmYRETiyirOpJAToC4gJkF9UpkzvQ0GgiWwbvkEaXoSbHM/aX
 L3LGrBT8HrKAa5CYQ5eTlqDoG/d03u/Z7eGNyuXQlHOmRkaGvpt/P5jTKub2yEn3tPi8T0PO2
 P30CF3uQFaMZfm+uh7mxNueVEHtNELA9/h6rtLXKM7drR8Lo6Xt6WORg2UJgcgLp/prQF1Xkn
 IZgqSbyvmOV6jp6sEqrFcja/JJC6NjaCet0TQS/HG9LB4mp0/Vx234uF4MoP6Eeabntls6oQ7
 /9oHhmylidCVgIiHUThhXHOzi7nabJOfr7tZZzhlLaRl9rOADgn7OZNHCnStqACM9YKvP/qMY
 UphhJDojzIchPVdyPI9FKjP36YcPI/mHs0uUKG3Gbo0ErGFmaHKa1euT81g92GMGyqe5cwdCS
 iRI274fEF+XtYnJkdDPetBkotyZqkeU3cVDOI3dBPGRm34/dCsYjvczodz24KjEohiwEVlt61
 ptfu6Q0bV7GhpNghViPRWke+KpaUgMtCzDJFWlKDCc6LujJ3T+4XGvwMXcODxmrPDnXgu8zlf
 tvKE1NsfGF+hpPCcX7+72V4tLgSdQYvsfCV5ltwy97sMz8PwvkckMKIqF242tdoizESN4=
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
Cc: lizhijian@cn.fujitsu.com, quintela@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org, chen.zhang@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/zLVyA1L_zSmacvbB3tU3rUc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu,  8 Apr 2021 23:20:46 -0400
leirao <lei.rao@intel.com> wrote:

> From: Rao, Lei <lei.rao@intel.com>
>=20
> Changes since v5:
>         --Replaced g_slice_new calls with g_slice_new0.
>=20
> Changes since v4:
>         --Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD in colo_bit=
map_clear_dirty.
>         --Modify some minor issues about variable definition.
>         --Add some performance test data in the commit message.
>=20
> Changes since v3:
>         --Remove cpu_throttle_stop from mig_throttle_counter_reset.
>=20
> Changes since v2:
>         --Add a function named packet_new_nocopy.
>         --Continue to optimize the function of colo_flush_ram_cache.
>=20
> Changes since v1:
>         --Reset the state of the auto-converge counters at every checkpoi=
nt instead of directly disabling.
>         --Treat the filter_send function returning zero as a normal case.
>=20
> The series of patches include:
>         Fixed some bugs of qemu crash.
>         Optimized some code to reduce the time of checkpoint.
>         Remove some unnecessary code to improve COLO.
>=20
> Rao, Lei (10):
>   Remove some duplicate trace code.
>   Fix the qemu crash when guest shutdown during checkpoint
>   Optimize the function of filter_send
>   Remove migrate_set_block_enabled in checkpoint
>   Add a function named packet_new_nocopy for COLO.
>   Add the function of colo_compare_cleanup
>   Reset the auto-converge counter at every checkpoint.
>   Reduce the PVM stop time during Checkpoint
>   Add the function of colo_bitmap_clear_dirty
>   Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()
>=20
>  migration/colo.c      | 10 +++----
>  migration/migration.c |  4 +++
>  migration/ram.c       | 83 +++++++++++++++++++++++++++++++++++++++++++++=
++++--
>  migration/ram.h       |  1 +
>  net/colo-compare.c    | 25 +++++++---------
>  net/colo-compare.h    |  1 +
>  net/colo.c            | 25 +++++++++++-----
>  net/colo.h            |  1 +
>  net/filter-mirror.c   |  8 ++---
>  net/filter-rewriter.c |  3 +-
>  net/net.c             |  4 +++
>  softmmu/runstate.c    |  1 +
>  12 files changed, 129 insertions(+), 37 deletions(-)
>=20

I guess Zhang Chen can already take the network-related patches through his=
 tree.

Regards,
Lukas Straub

--=20


--Sig_/zLVyA1L_zSmacvbB3tU3rUc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCiyB4ACgkQNasLKJxd
slhoVxAAiTLu43okD3UbuHcBqJlC8hw2wFIrsVbjpunidzTZqItN9rcxxB+KqA+j
jFNs4I7ssX7SRICYSn3W2afQ3jjT+lfv22b6n13loB9G7AsCJjf4TWPIV+YCEI9l
EfzxPAfRHZFpYwWsWA6hnRa9+A77HbIBoy2xYeiRUIo5SmOOtBjo7q727HNbLnLL
nh59DIIz/7C8b40PdUS6ARX0kmQE+tLz7DZ8yA8CHEXVdvB4qDfaQVTNX23fNVSG
aImY+Pozdoq3rtwVldagqlZdC1d3QR/RXeL5OFOxWrcRLRttOgbWE+iaKNqmzN/w
TXPMlzjVzxAeN99YBjE12gjPKlF6/+gnjS1kOfYBDeMXMyYEENakcS/Ldi7l2ZP0
bCUcl0OvxzQzKfDdpcFM9KAVbuX9rPMOfBFpYgzpo6qbQL6T00besRgoW2lmw0Qp
br7C85PBMg4pW/0VQ9NlWwmWnF3GQ0bxKuCASWKcifAYEZiv5xUUnj7sP4qV/450
WJp/+R88/EA7UAHxP6K19Rj55cJOSjSGlsw/8m3mh04G3rVIW5t065QD6jVTZCHp
QcpM1cGzLwtXYtBQfg1H/64laBS+gd0HSrEIj5eC/P7s4PPxR5SfGI9S/FsOk47M
cglBHNq/wnllCmhzxh8ABFnIZMlPR3TP8nLI7WJTTkEXJYdYuzo=
=MJvD
-----END PGP SIGNATURE-----

--Sig_/zLVyA1L_zSmacvbB3tU3rUc--

