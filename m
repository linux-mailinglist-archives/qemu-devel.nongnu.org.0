Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D62FD942
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:16:00 +0100 (CET)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2IxT-0003K7-R2
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2Iut-0002f3-0v
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:13:22 -0500
Received: from mout.web.de ([212.227.15.4]:50259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2Iuq-0006tr-Jv
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1611169976;
 bh=B19kX3Zn5rvmr/Qf0jSRAO8HBPEZyNsEXly38lO7gCg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=agdGkqa9Ya2mnUj+/Xb5Y3lwNd1mp7N7d5/ep+j3uTnXDQ8echwBVmdAVoS86rA7Y
 2wvlKPsQFU5dRL0vlf8mXtrPJboFDYhy6CkBQL5J7xs8b/fIFM79WI+kegs4u0mfaN
 IpO36jtNTs89zI0DVpVZwxit4ALYFU76MLm8KhRU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.127]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LpfJW-1lhR9F3kKU-00fW6N; Wed, 20
 Jan 2021 20:12:55 +0100
Date: Wed, 20 Jan 2021 20:12:44 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Message-ID: <20210120201244.3e4b30d9@gecko.fritz.box>
In-Reply-To: <1610505995-144129-3-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-3-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=6_iyRwu3BKeW3P/NTCsDf0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:e6cxv36EExVByXyS4dNFcaJ53F1CRb1BZVL0cvM5wMbF+cGd/3U
 RHKm6cywABmFhEsOHoPPzg1osV8VjV9u0c5Ij1+cHG+dGdEvfOGqC2+CXZ757JePRM07XZv
 MXyXPTuqzrXnIRUP1jrg10cy/3km2MgyWN4yg/qGuOC1tpssf84qs7mPb4z917APeBgX8vd
 M9EBRa7hvepup4uWd1pTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yw9v7Ag7KY4=:HwCxA2yhMuQvY4sWzH41Jt
 0+BnIq1rT6bgYeU/P6DnNaUvCo8TWlnnBl+QJNm1zKVvZaVyBvnH0FqhKq44E9syxhhjklDXu
 rb4Swbyl6P8cDu4Fe/wa1f0JobXe+dYcrE8HIVjCvhSeVczhrvOQ7k+sKzXGUw31KTj2YekwQ
 VyWSuY4C+Vo9fVgkNUIXdqJBoFQ0M70bRj5lAsVzQXRqxo/u2FlDCXASBmFMC+6Mkbg3QG1ep
 qKw8/mogG7n5dKR4GCLQaU9PLcw9IW2Y/prIhN5R59Xm7qgwt3wTM9asicjXW+16/4ZT+eSlM
 HQrvtelLsBYYABSKXaoDc1MGkrm43iLKrYxQoUtjkUr1RxNZMyac68Bsm5+ey+O7cwXvvHmqr
 BeUSdrGq8ttwypRwqhtqbsgzWqbAYPF35p58Tvt/ncsglxn0Uh+AdbtucwdrKAcIT9FsnuI1u
 dzqzUAPY8fa6z18DFvX/kgisg71OiRMdv6oV4iOd+9rg332wrTxrFPNt7CI3hSOJ8VncO4SQg
 Vxp8VGTtdNIK96YXIuJEeuh99AGtAyA6wFRaGxPDYwwYgRjZQOhPzWFes+5029NQ7w/+He6u6
 WzYUMP+RZfbEsKVi9brsEo7Fs377NvkvwtdsyLpYrp6vvUDCBNBFtWw8F2dKkMpRQmNF0/5mk
 JQlAs0sjZYycnXIoDzT8iwwA7/NGulHlcOKR+O2sq138F3swjwwtFuNyb4PTWYuj6f/ZZf7rP
 2j2Pmb78BJOuPf8No6h8r/BzoZKr6vIMBj5df6aztv3R6sZveQ9HlWr4vZadnunqbd8ZmEx03
 e23XHr8IJqNUN0CGBkXH7bP9T2pyBuXpPRkyheVW+LuQOc7UWqtBJQwIWHU9bAYQXrfPPaGfZ
 pu15cqk7fiYnRfeCA6RA==
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

--Sig_/=6_iyRwu3BKeW3P/NTCsDf0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 10:46:27 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> This patch fixes the following:
>     qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdown'
>     Aborted (core dumped)
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

I wonder how that is possible, since the VM is stopped during 'colo' state.

Unrelated to this patch, I think this area needs some work since
the following unintended runstate transition is possible:
'shutdown' -> 'colo' -> 'running'.

> ---
>  softmmu/runstate.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 636aab0..455ad0d 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -125,6 +125,7 @@ static const RunStateTransition runstate_transitions_=
def[] =3D {
>      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
> =20
>      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> +    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
> =20
>      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
>      { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR },



--=20


--Sig_/=6_iyRwu3BKeW3P/NTCsDf0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAIgKwACgkQNasLKJxd
sliuBg//Xc1m1JzGDKOlv7X3512Er9H+sgOfZR64M3TxLDHZaLlE9xiXpJlc8Yhf
f45F3UkoREYwQ03Op9t0UEvKii9I3G4BBaQXSSP0GzF38IyDcrv3FRiXRKlHpH9v
ekLy0SAOBm9t7a1xdKIk171s7OeNfBD5JzP9wpQy2hSDxWqPqVspSNS0wmc9embl
8mGL3HW2twSeMx68MAUOKlhdPD3xjC3YdCP9OKfm31BaBJ3CDpgnuny4ZfCFIAG1
oBMN1VgDgHznWN1+OTmCm+QVt/UJUzsk2eRvfNdpweUmHuPvSGAbRz9hk86ZXMWf
3ff1HOaR2K29pJ0gNGQptzLZlt/3Oxv8MZdnYRVETqNn+AsQMeYY+RMpJ5UcclAW
JmXv/K9qdyybUpV22fvjE7wDRLkjhb6VkyzSRANHJony2vIJQb08R3cDguboouKe
7nSJ++zHrJjVBUg94Y0OPTX1TcmcAK68XIgKg32xBenercNXRydeALVG9tE2jRmN
mLYJOsP8iYQ0ShnEha2G0YHUcoxUDB3+lQ0NnSeW5sBGw7O4MtWWZzooVP+JnPny
HV5z0nv7hyThfBusZUwvKSdXNCdIxefeXvaRVJpQ9VE4VlDzdBMDt8ubdKYg4goI
tULJrAJ/MjRp9kWO66BLgJEbA4PuGzOUXAywg0UR/v1wHEG4a+E=
=wMd3
-----END PGP SIGNATURE-----

--Sig_/=6_iyRwu3BKeW3P/NTCsDf0--

