Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2F2D8541
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 09:00:48 +0100 (CET)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knzpb-0007pi-Rj
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 03:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1knznv-0007K6-Tw
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 02:58:59 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1knznr-0005tH-CA
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 02:58:59 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CtKlN2Lb5zXmVv;
 Sat, 12 Dec 2020 15:58:08 +0800 (CST)
Received: from DGGEMM511-MBX.china.huawei.com ([169.254.1.248]) by
 DGGEMM405-HUB.china.huawei.com ([10.3.20.213]) with mapi id 14.03.0487.000;
 Sat, 12 Dec 2020 15:58:36 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 11/12] tests/fp: Do not emit implicit-fallthrough
 warnings in the softfloat tests
Thread-Topic: [PATCH 11/12] tests/fp: Do not emit implicit-fallthrough
 warnings in the softfloat tests
Thread-Index: AQHWz9HMkvqF3NI3p0WE4xMqiDIRpKnzGBxA
Date: Sat, 12 Dec 2020 07:58:35 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BAF7BB9@dggemm511-mbx.china.huawei.com>
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-12-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-12-thuth@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Thomas Huth [mailto:thuth@redhat.com]
> Sent: Friday, December 11, 2020 11:24 PM
> To: Peter Maydell <peter.maydell@linaro.org>; qemu-devel@nongnu.org
> Cc: Chenqun (kuhn) <kuhn.chenqun@huawei.com>; Richard Henderson
> <richard.henderson@linaro.org>; Paolo Bonzini <pbonzini@redhat.com>
> Subject: [PATCH 11/12] tests/fp: Do not emit implicit-fallthrough warning=
s in
> the softfloat tests
>=20
> The softfloat tests are external repositories, so we do not care about im=
plicit
> fallthrough warnings in this code.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
Reviewed-by: Chen Qun <kuhn.chenqun@huawei.com>

The warnings are frequently generated for files in this directory.=20
This is a good solution for the warnings.

Thanks,
Chen Qun
>  tests/fp/meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/fp/meson.build b/tests/fp/meson.build index
> 3d4fb00f9d..8d739c4d59 100644
> --- a/tests/fp/meson.build
> +++ b/tests/fp/meson.build
> @@ -27,6 +27,7 @@ tfdir =3D 'berkeley-testfloat-3/source'
>  sfinc =3D include_directories(sfdir / 'include', sfspedir)
>=20
>  tfcflags =3D [
> +  '-Wno-implicit-fallthrough',
>    '-Wno-strict-prototypes',
>    '-Wno-unknown-pragmas',
>    '-Wno-uninitialized',
> @@ -209,6 +210,7 @@ libtestfloat =3D static_library(
>  )
>=20
>  sfcflags =3D [
> +  '-Wno-implicit-fallthrough',
>    '-Wno-missing-prototypes',
>    '-Wno-redundant-decls',
>    '-Wno-return-type',
> --
> 2.27.0


