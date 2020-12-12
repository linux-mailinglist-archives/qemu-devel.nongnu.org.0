Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594D2D8552
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 10:21:35 +0100 (CET)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko15p-0000Gz-KZ
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 04:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1ko14H-0008BJ-BY
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 04:19:57 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1ko14E-00038g-Le
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 04:19:57 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CtMXQ3pqHzVn1c;
 Sat, 12 Dec 2020 17:18:46 +0800 (CST)
Received: from DGGEMM424-HUB.china.huawei.com (10.1.198.41) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 12 Dec 2020 17:19:44 +0800
Received: from DGGEMM511-MBX.china.huawei.com ([169.254.1.248]) by
 dggemm424-hub.china.huawei.com ([10.1.198.41]) with mapi id 14.03.0487.000;
 Sat, 12 Dec 2020 17:19:39 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 12/12] configure: Compile with -Wimplicit-fallthrough=2
Thread-Topic: [PATCH 12/12] configure: Compile with -Wimplicit-fallthrough=2
Thread-Index: AQHWz9HU3LiHOQmd306wlFcU5/4yeKnzLxAQ
Date: Sat, 12 Dec 2020 09:19:38 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BAF8D22@dggemm511-mbx.china.huawei.com>
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-13-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-13-thuth@redhat.com>
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
> Subject: [PATCH 12/12] configure: Compile with -Wimplicit-fallthrough=3D2
>=20
> Coverity always complains about switch-case statements that fall through =
the
> next one when there is no comment in between - which could indicate a
> forgotten "break" statement. Instead of handling these issues after they =
have
> been committed, it would be better to avoid them in the build process alr=
eady.
> Thus let's enable the -Wimplicit-fallthrough warning now.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Chen Qun <kuhn.chenqun@huawei.com>

Good job, we'll never see such warnings again.

Thanks,
Chen Qun
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/configure b/configure
> index 18c26e0389..dc2bc3c2f0 100755
> --- a/configure
> +++ b/configure
> @@ -2007,6 +2007,7 @@ add_to warn_flags -Wempty-body  add_to
> warn_flags -Wnested-externs  add_to warn_flags -Wendif-labels  add_to
> warn_flags -Wexpansion-to-defined
> +add_to warn_flags -Wimplicit-fallthrough=3D2
>=20
>  nowarn_flags=3D
>  add_to nowarn_flags -Wno-initializer-overrides
> --
> 2.27.0


