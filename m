Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40D2A2BAD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 14:38:35 +0100 (CET)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZa2c-0001uB-85
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 08:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi.denis.courmont@huawei.com>)
 id 1kZZza-0000rN-3Y; Mon, 02 Nov 2020 08:35:26 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2125 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi.denis.courmont@huawei.com>)
 id 1kZZzW-0004XY-LY; Mon, 02 Nov 2020 08:35:25 -0500
Received: from lhreml723-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 824E2CEB982C5B6183D1;
 Mon,  2 Nov 2020 13:35:04 +0000 (GMT)
Received: from lhreml727-chm.china.huawei.com (10.201.108.78) by
 lhreml723-chm.china.huawei.com (10.201.108.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 2 Nov 2020 13:35:04 +0000
Received: from lhreml727-chm.china.huawei.com ([10.201.108.78]) by
 lhreml727-chm.china.huawei.com ([10.201.108.78]) with mapi id 15.01.1913.007; 
 Mon, 2 Nov 2020 13:35:04 +0000
From: Remi Denis Courmont <remi.denis.courmont@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
Thread-Topic: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
Thread-Index: AQHWsQhB3r8EiOh900GcB06pOPhjvKm0tEgAgAAi8KA=
Date: Mon, 2 Nov 2020 13:35:04 +0000
Message-ID: <2ea39469edfc4968b706826aa63a44c8@huawei.com>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-1-remi.denis.courmont@huawei.com>
 <CAFEAcA9xhfhGToCXk9H+M5=HQKC91o-ED6eWTy32nvjwpFeJOg@mail.gmail.com>
 <CAFEAcA8xrk1Yd3GbkYRMjBwGjZ-f7bSp4gHGGk=tkhKNk5CqRQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8xrk1Yd3GbkYRMjBwGjZ-f7bSp4gHGGk=tkhKNk5CqRQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.66.212]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=remi.denis.courmont@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 08:35:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksDQoNCj4gSSByZXBsaWVkIHRvIHRoaXMgYmVmb3JlIHRoZSBjb3ZlciBsZXR0ZXIgZXhwbGFp
bmluZyB3aGF0IHRoZSBzZXJpZXMNCj4gaXMgZG9pbmcgYXJyaXZlZCBpbiBteSBpbmJveCwgc28g
dGhlIHNlY29uZCBwYXJ0IG9mIG15IHN1Z2dlc3Rpb24NCj4gd291bGQgYmUgYSBiaXQgcG9pbnRs
ZXNzLiBUaGUgZmlyc3QgcGFydCAobWVudGlvbmluZyB0aGUgbmFtZSBvZg0KPiB0aGUgcHNldWRv
Y29kZSBmdW5jdGlvbikgc3RpbGwgc2VlbXMgd29ydGggZG9pbmcuDQoNClllYWggd2VsbCwgc29t
ZSBzcGFtIGZpbHRlciBzZWVtcyB0byBoZWxwZWQgaXRzZWxmIHRvIHRoZSBvcmlnaW5hbCBjb3Zl
ciBsZXR0ZXIsIGhhZCB0byByZXNlbmQgaXQsIHNvIEkgZmlndXJlZC4NCg0KQW5kIHRoZW4gaXQg
c2VlbXMgSSBtYWRlIGEgYm9vYm9vIGFuZCBhY2NpZGVudGFsbHkgZHJvcHBlZCB0aGUgZmlyc3Qg
cGF0Y2ggaW4gdGhlIHNlcmllcywgaGFuZGxpbmcgSENSLntGLEl9TU8gYml0cy4NCg0KDQo=

