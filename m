Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072722D3CFD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:10:44 +0100 (CET)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmuYc-0003BQ-Q0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmuWI-0002Tr-Uz; Wed, 09 Dec 2020 03:08:18 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kmuWF-00063v-J7; Wed, 09 Dec 2020 03:08:18 -0500
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CrV5d6YmVzXlBB;
 Wed,  9 Dec 2020 16:07:33 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.228]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0487.000;
 Wed, 9 Dec 2020 16:07:52 +0800
From: ganqixin <ganqixin@huawei.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: RE: [PATCH 0/7] Fix some memleaks caused by ptimer_init
Thread-Topic: [PATCH 0/7] Fix some memleaks caused by ptimer_init
Thread-Index: AQHWxI2APvESNrJgAUaeyWDM19I3pqnuajHw
Date: Wed, 9 Dec 2020 08:07:52 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065E6084@DGGEMI525-MBS.china.huawei.com>
References: <20201127071803.2479462-1-ganqixin@huawei.com>
In-Reply-To: <20201127071803.2479462-1-ganqixin@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=ganqixin@huawei.com;
 helo=szxga01-in.huawei.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 "jan.kiszka@web.de" <jan.kiszka@web.de>,
 "antonynpavlov@gmail.com" <antonynpavlov@gmail.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping!

Hi all,
  These patches are waiting for review. Could someone help me check them?

Thanks,
Gan Qixin

> -----Original Message-----
> From: ganqixin
> Sent: Friday, November 27, 2020 3:18 PM
> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: peter.maydell@linaro.org; Chenqun (kuhn)
> <kuhn.chenqun@huawei.com>; Zhanghailiang
> <zhang.zhanghailiang@huawei.com>; ganqixin <ganqixin@huawei.com>
> Subject: [PATCH 0/7] Fix some memleaks caused by ptimer_init
>=20
> Hi all,
>=20
> When running device-introspect-test, I found some memory leaks caused
> by ptimer_init in the init function, so I released it in the finalize fun=
ction.
>=20
>=20
> Gan Qixin (7):
>   allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   digic-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_mct: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_pwm: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   exynos4210_rtc: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   mss-timer: Use ptimer_free() in the finalize function to avoid
>     memleaks
>   musicpal: Use ptimer_free() in the finalize function to avoid memleaks
>=20
>  hw/arm/musicpal.c            | 22 +++++++++++++++++-----
>  hw/rtc/exynos4210_rtc.c      | 19 ++++++++++++++-----
>  hw/timer/allwinner-a10-pit.c | 21 ++++++++++++++++-----
>  hw/timer/digic-timer.c       | 18 +++++++++++++-----
>  hw/timer/exynos4210_mct.c    | 24 +++++++++++++++++++-----
>  hw/timer/exynos4210_pwm.c    | 21 ++++++++++++++++-----
>  hw/timer/mss-timer.c         | 23 ++++++++++++++++++-----
>  7 files changed, 113 insertions(+), 35 deletions(-)
>=20
> --
> 2.23.0


