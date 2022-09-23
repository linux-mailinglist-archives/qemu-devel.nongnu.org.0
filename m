Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718695E76AF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:19:16 +0200 (CEST)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obeq2-00062e-Ut
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1obeWI-0005WB-Sz; Fri, 23 Sep 2022 04:58:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1obeWG-0001sM-5g; Fri, 23 Sep 2022 04:58:50 -0400
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYmFt2C8dzpTsc;
 Fri, 23 Sep 2022 16:55:46 +0800 (CST)
Received: from dggpeml100021.china.huawei.com (7.185.36.148) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 16:58:37 +0800
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggpeml100021.china.huawei.com (7.185.36.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 16:58:36 +0800
Received: from kwepemm600016.china.huawei.com ([7.193.23.20]) by
 kwepemm600016.china.huawei.com ([7.193.23.20]) with mapi id 15.01.2375.031;
 Fri, 23 Sep 2022 16:58:36 +0800
To: Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, "Wanghaibin
 (D)" <wanghaibin.wang@huawei.com>
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Thread-Topic: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Thread-Index: AdjPKnJtqSBn4jhsHkm9jn/UrlgR8g==
Date: Fri, 23 Sep 2022 08:58:36 +0000
Message-ID: <521edea5d2894a50874463ba812b0169@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.224]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhukeqian1@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  zhukeqian <zhukeqian1@huawei.com>
From:  zhukeqian via <qemu-devel@nongnu.org>

Pj4gPiBJIG5vdGljZSB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGdvbmUgaW4geWV0IC0tIHdo
b3NlIHRyZWUgaXMgaXQgDQo+PiA+IGdvaW5nIHRvIGdvIHZpYT8NCj4+DQo+PiBJJ2QgZ3Vlc3Mg
QVJNIHRyZWUgKGR1ZSB0byBhbG1vc3Qgc29sZSB1c2VyIHZpcnQtYXJtKS4NCj4+ICh0aGVyZSBh
cmUgdG95IHVzZXJzIGxpa2UgbWljcm92bSBhbmQgbmV3IGxvb25nYXJjaCkNCj4NCj5PSzsgYXBw
bGllZCB0byB0YXJnZXQtYXJtLm5leHQsIHRoYW5rcy4NCg0KVGhhbmtzLCBQZXRlci4NCg0KS2Vx
aWFuLg0K

