Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF86F6CA782
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 16:25:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgnlB-0006eD-L9; Mon, 27 Mar 2023 10:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pgnl8-0006dv-MP
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 10:23:42 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pgnl6-0007GJ-IS
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 10:23:42 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PlZMX2Y7kz6F4Gp;
 Mon, 27 Mar 2023 22:05:12 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 15:08:48 +0100
Received: from lhrpeml500004.china.huawei.com ([7.191.163.9]) by
 lhrpeml500004.china.huawei.com ([7.191.163.9]) with mapi id 15.01.2507.021;
 Mon, 27 Mar 2023 15:08:48 +0100
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>
Subject: RE: [PATCH 0/2] Migration time prediction using calc-dirty-rate
Thread-Topic: [PATCH 0/2] Migration time prediction using calc-dirty-rate
Thread-Index: AQHZS3aRtGZM76pP4kuX+gBWTVyc1a7/EcKwgA/B7XA=
Date: Mon, 27 Mar 2023 14:08:48 +0000
Message-ID: <5c145fad0a49471fac6dde21acdd48b6@huawei.com>
References: <cover.1677589218.git.gudkov.andrei@huawei.com> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.199.58.101]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Gudkov Andrei <gudkov.andrei@huawei.com>
From:  Gudkov Andrei via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ping2

https://patchew.org/QEMU/cover.1677589218.git.gudkov.andrei@huawei.com/

-----Original Message-----
From: Gudkov Andrei=20
Sent: Friday, March 17, 2023 16:29
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com; dgilbert@redhat.com
Subject: RE: [PATCH 0/2] Migration time prediction using calc-dirty-rate

ping

https://patchew.org/QEMU/cover.1677589218.git.gudkov.andrei@huawei.com/

-----Original Message-----
From: Gudkov Andrei=20
Sent: Tuesday, February 28, 2023 16:16
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com; dgilbert@redhat.com; Gudkov Andrei <gudkov.andrei@=
huawei.com>
Subject: [PATCH 0/2] Migration time prediction using calc-dirty-rate



