Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277DC325F6B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:49:01 +0100 (CET)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYo0-00041e-4k
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1lFYAS-0004Ap-JN; Fri, 26 Feb 2021 03:08:08 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1lFYAO-0005QP-QA; Fri, 26 Feb 2021 03:08:08 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Dn2JT3GzCz13ygH;
 Fri, 26 Feb 2021 16:05:13 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.241]) by
 DGGEMM404-HUB.china.huawei.com ([10.3.20.212]) with mapi id 14.03.0509.000;
 Fri, 26 Feb 2021 16:07:32 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH] qtest: delete redundant qtest.h header files
Thread-Topic: [PATCH] qtest: delete redundant qtest.h header files
Thread-Index: AQHXCzq0m9Zm0zBtCEWUxbS1+LUCgqpolS9sgAF/PMA=
Date: Fri, 26 Feb 2021 08:07:31 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E844790AD8@dggemm531-mbx.china.huawei.com>
References: <20210225055251.192104-1-kuhn.chenqun@huawei.com>
 <87h7m0v7jm.fsf@dusky.pond.sub.org>
In-Reply-To: <87h7m0v7jm.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga08-in.huawei.com
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 ganqixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Markus Armbruster [mailto:armbru@redhat.com]
> Sent: Thursday, February 25, 2021 5:08 PM
> To: Chenqun (kuhn) <kuhn.chenqun@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org; lvivier@redhat.com;
> thuth@redhat.com; Zhanghailiang <zhang.zhanghailiang@huawei.com>; ganqixi=
n
> <ganqixin@huawei.com>
> Subject: Re: [PATCH] qtest: delete redundant qtest.h header files
>=20
> Chen Qun <kuhn.chenqun@huawei.com> writes:
>=20
> > There are 23 files that include the "sysemu/qtest.h", but they do not
> > use any qtest functions.
> >
> > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>=20
> The subject sounds as if you were deleting file include/sysemu/qtest.h, w=
hich
> would be wrong.  You're actually deleting inclusions.  Suggest to say
>=20
>     qtest: delete superfluous inclusions of qtest.h
This subject is good to me.  Thanks for your point !
I will change it in v2.

>=20
> or
>=20
>     delete superfluous #include "sysemu/qtest.h"
>=20
> Perhaps the maintainer merging your patch can do that for you.


