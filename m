Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E583537C1
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 12:23:37 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSzuq-0002NQ-Ay
	for lists+qemu-devel@lfdr.de; Sun, 04 Apr 2021 06:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lSztw-0001u8-Qu
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 06:22:40 -0400
Received: from mout.web.de ([212.227.15.4]:46811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lSztu-0001Xo-VF
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 06:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617531742;
 bh=f+lnW/8vWruDLFVbEhH0PYI6AUlf+Jji+DofNz8JaPs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Vph71CG3mUGFHlO/ltSWCI+KYmRqvtq7l4iig5lTFj82XbERIIg9L0c3DD0quCpAB
 Lj4D2X9drZxTvFGTCDBHZB2DG3J6CAtFhSGXEzAe17GEMX8S/QvhZRbYu7N0oUQnt6
 6Cnsfk/nXZWMsdQbYKfEDeE0VNiJ6MN9WhNZ7AnM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.89]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MIBu2-1lSSSe1VEs-003yYP; Sun, 04
 Apr 2021 12:22:22 +0200
Date: Sun, 4 Apr 2021 12:22:11 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH v5 00/10] Fixed some bugs and optimized some codes for COLO
Message-ID: <20210404122211.7690e592@gecko.fritz.box>
In-Reply-To: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x.Mf96U++/mZ7g9qkSfr4RD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:lyUD4oHT1urz+8FKbbQHVgi7kPEVrzdQMNuQQdkdZhEKt96GMv1
 Ep+rctvOE+aUr+XEnuw4dMvcm/03M5aCprYmFPIC6bNhS9rzTqjmaYj6eT8H+S2c1EVX4+c
 sYUIR6XWazFY4LiC7h3vCw1pjnzkFDvfRKryAdIxt+CAI8mTKPyNHYqV774W7e7fJLarQ5G
 ++gbI3kV98f6TTn49YJUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uLYyAarEbAs=:VYUq7mONgMC5Ejkx7jJh/3
 RV2hCcZdp5j4xoJzeDzhkahKGn/siXGpSmkVrU/+A7aLQ8DsmnsdWgce3VPC5oI+4oOexZ2dZ
 sMaKOaSuO5bw7eA6WZ/C/K1kHt+XHFhrei6RvErFSnoEijp+nep12gDLiankVgDMB9I2j39nN
 jIpftwFDEPnRgBSCtHuR+m/sSn2jbSZT7WXabN9hLLcR12Zad5HUAX3NT61m+gny9MBo8r+Qq
 6BCEaRARh9ncKJtxPX5dMscqN4HUFj1THYMCtGbp3gDRrYw7CkuhIbOVYQaLjZuXS96Qum/oM
 /7L775/pAK6FTnhuvM8E7ZQGVEnYIXVSL7wzz7fKrWAk68K4eh7evDN7veFmxTX+DxDnIjJRl
 i6/YzYmlzYLUfXH3QE9EMn4fQMNRC4LNDuLi+Hzj+g7oE/ZHAMjUYv2+SGUDL55GgHHs8A2Wp
 yYVw1SnbldWAjJ64quEccLy6wLchwAY3u6hraTI5VMViQpzPgD0csPZSms/MbG9ypeVAzptOH
 9YSqPB1ZbadiGsC2x2lfc7YZLSPqaYgi9VVrXcoVSHS84hmUTRE4aso1AJyRePQSFFWYBISEF
 ty11xf/uIENzAYdUnP3c9XcBhhJQ9s3Mn7YskZjSisFACRqpvTWBiwgfEpYBxi7RhxVoVml3S
 AeDAbu763MQdEAY0AUkLv2DwTdSZWFvkgDsoeP7qgMnFPiwCfaenp4XjTouQbJGlLMAFoF2yt
 gFl6BpnU2O0mtpv+e2UX/vMnCJyayHlPqnHb+ejq0qsSmRMu6Ll0GCnHNSVKE371aF2S+loSr
 de1HrXHqclH286XKSg7/Vq+roe4PoymVY5hJZDTTJoxM0ViJqa3CsclDUCBREL5uA5+IJ39Vl
 JeyKymhCKehD4e5stjXeFsoJ35nZfBHtePrcbv74Y1k15O1WsyKBMVq6bpHuQwSnasoTjSA2e
 1JI2yof9oPJ/N9dss+2FW0CHG/xy3TY60aL4q7OW6LC8bg9Y/E1IRDzhIadcGmEqOq1gW30ad
 U+wvaGAThq4TAYWiQ3D5zaXxP86Tk4a+295PIctcJdCvQ81CHkjHY7KaDEll4FIZbUH5hixG4
 Hz3QHY7g3ylfFXwSc6eA2+A8qLAqnvCxmOU0HtF/QYaOj6ZS9w38ppxHrAahWHcGJBFP5KKYs
 jtd8vMdkXDLnWuJfBuYa11NAEFn+d4OsayGEIfMJYdm8pxrz3xC+O4qQfLBKrqxKrQv1c/KL3
 u7dtnrm8hXjtcb+Pv
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
Cc: lizhijian@cn.fujitsu.com, quintela@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org, chen.zhang@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/x.Mf96U++/mZ7g9qkSfr4RD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu,  1 Apr 2021 15:47:19 +0800
leirao <lei.rao@intel.com> wrote:

> From: Rao,Lei <lei.rao@intel.com>
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
>  net/colo.c            | 23 ++++++++++++++
>  net/colo.h            |  1 +
>  net/filter-mirror.c   |  8 ++---
>  net/filter-rewriter.c |  3 +-
>  net/net.c             |  4 +++
>  softmmu/runstate.c    |  1 +
>  12 files changed, 135 insertions(+), 29 deletions(-)
>=20

Looks good to me and works well in my tests:

Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>

Regards,
Lukas Straub

--=20


--Sig_/x.Mf96U++/mZ7g9qkSfr4RD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBpk1MACgkQNasLKJxd
slhd6hAAo9blXThzyTEsdM1aAt90nKeuiQp5dd5u2noUaL8aFxEmt70MiYPvp8jr
xab2ceYJOpzY6KMm21QfzZwv3q4w/P29iU0P7KzBnOLMO275s9SFQv/wdT3IKfuY
w0CeII90OVuVSXGJQGjioT0XaDGGMPsJ+ON+5GQ2eHIDXiQlwf9su7CxpisMyUyD
Rob7OFdZ+xdzoiF7lZV0KDxjjDpNOeaM+1lrGtWbLCHFWjg6+wJOZkurH4AgbPvh
FQe6SQnEZnJx7RP7m086oq45tJyi3oBcwc5x058g7o7S63o9SlfD1Nnr1vO5oMKd
zq5kPEHiZnQVZXkl3ScgRN/z7lom1uzG3n92jkXmLi4IOWVF7v7bTbICapvubdbo
UuN+J2S25bBHDRkDbpW0JPYkKFPfBagmYyjtqb0O+MAVLBlABjPW/kkq21wE+04r
hXecKPpSjLoYi17Dp03wVDOY8z+HNwce4/6dnYCCiM8d+dNxbgZaaWdNZoTKc656
b16dLZNQHomKQrELpQ62sPzfbXfL4k3gi7TyJI9cRsWKBEJWxnLamYaqt+d1qxud
+JWqxChOqPIJylP2QYG9vgCt3vfSa4WpnDWtkK4ttFu9jyPzEEXACp+383pMwIpt
uA3q9OKK18ivpOm8DeP6vao5T0B0ue96AHLZjdYRjspdmyDupOg=
=Ni9i
-----END PGP SIGNATURE-----

--Sig_/x.Mf96U++/mZ7g9qkSfr4RD--

