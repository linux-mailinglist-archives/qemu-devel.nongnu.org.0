Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF29607B6D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:43:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oluBa-0004xL-Fz
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:43:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olttz-0001Xy-Ia
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olttr-0000Th-Gv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:25:31 -0400
Received: from usmailhost21.kioxia.com ([12.0.68.226]
 helo=SJSMAIL01.us.kioxia.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <Clay.Mayers@kioxia.com>)
 id 1olttp-00038u-UU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:25:31 -0400
Received: from SJSMAIL01.us.kioxia.com (10.90.133.90) by
 SJSMAIL01.us.kioxia.com (10.90.133.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 21 Oct 2022 08:25:23 -0700
Received: from SJSMAIL01.us.kioxia.com ([::1]) by SJSMAIL01.us.kioxia.com
 ([fe80::213a:a308:b836:4a06%3]) with mapi id 15.01.2375.032; Fri, 21 Oct 2022
 08:25:23 -0700
From: Clay Mayers <Clay.Mayers@kioxia.com>
To: Klaus Jensen <its@irrelevant.dk>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Keith Busch
 <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?utf-8?B?UGhsaXBwZSBNYXRoaWV1LURhdWTDqQ==?= <f4bug@amsat.org>
Subject: RE: [PATCH 3/4] hw/block/nvme: supply dw1 for aen result
Thread-Topic: [PATCH 3/4] hw/block/nvme: supply dw1 for aen result
Thread-Index: AQHY5OU/qAaeb4SSMkuCZh7IiLhBxq4Y0BoAgAAofsA=
Date: Fri, 21 Oct 2022 15:25:23 +0000
Message-ID: <1317d7329aa3487d870f1fec934055fd@kioxia.com>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
 <20221021001835.942642-4-clay.mayers@kioxia.com>
 <Y1I1PuvbMuO7HGf5@cormorant.local>
In-Reply-To: <Y1I1PuvbMuO7HGf5@cormorant.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.93.77.43]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=12.0.68.226; envelope-from=Clay.Mayers@kioxia.com;
 helo=SJSMAIL01.us.kioxia.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBLbGF1cyBKZW5zZW4gPGl0c0BpcnJlbGV2YW50LmRrPg0KPiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAyMCwgMjAyMiAxMDo1OSBQTQ0KPiANCj4gT24gT2t0IDIwIDE3OjE4LCBjbGF5
Lm1heWVyc0BraW94aWEuY29tIHdyb3RlOg0KPiA+IEZyb206IENsYXkgTWF5ZXJzIDxjbGF5Lm1h
eWVyc0BraW94aWEuY29tPg0KPiA+DQo+ID4gY3FlLmR3MSBBRU4gaXMgc29tZXRpbWVzIHJlcXVp
cmVkIHRvIGNvbnZleSB0aGUgTlNJRCBvZiB0aGUgbG9nIHBhZ2UNCj4gPiB0byByZWFkLiAgVGhp
cyBpcyB0aGUgY2FzZSBmb3IgdGhlIHpvbmUgZGVzY3JpcHRvciBjaGFuZ2VkIGxvZw0KPiA+IHBh
Z2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDbGF5IE1heWVycyA8Y2xheS5tYXllcnNAa2lv
eGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgaHcvbnZtZS9jdHJsLmMgICAgICAgfCAxOSArKysrKysr
KysrKy0tLS0tLS0tDQo+ID4gIGh3L252bWUvbnZtZS5oICAgICAgIHwgIDIgKysNCj4gPiAgaHcv
bnZtZS90cmFjZS1ldmVudHMgfCAgMiArLQ0KPiA+ICBpbmNsdWRlL2Jsb2NrL252bWUuaCB8ICA0
ICsrKy0NCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9ody9udm1lL252bWUuaCBiL2h3L252bWUvbnZt
ZS5oDQo+ID4gaW5kZXggYWU2NTIyNjE1MC4uMmI3OTk3ZTRhNyAxMDA2NDQNCj4gPiAtLS0gYS9o
dy9udm1lL252bWUuaA0KPiA+ICsrKyBiL2h3L252bWUvbnZtZS5oDQo+ID4gQEAgLTQ3Nyw2ICs0
NzcsOCBAQCB0eXBlZGVmIHN0cnVjdCBOdm1lQ3RybCB7DQo+ID4gICAgICB1aW50NjRfdCAgICBk
YmJ1Zl9laXM7DQo+ID4gICAgICBib29sICAgICAgICBkYmJ1Zl9lbmFibGVkOw0KPiA+DQo+ID4g
KyAgICBib29sICAgICAgICB6ZGNfZXZlbnRfcXVldWVkOw0KPiA+ICsNCj4gPiAgICAgIHN0cnVj
dCB7DQo+ID4gICAgICAgICAgTWVtb3J5UmVnaW9uIG1lbTsNCj4gPiAgICAgICAgICB1aW50OF90
ICAgICAgKmJ1ZjsNCj4gDQo+IExvb2tzIHVucmVsYXRlZCB0byB0aGlzIHBhdGNoLg0KDQpZZXAg
LSBzaG91bGQgYmUgaW4gcGF0Y2ggNC4NCg0KPiANCj4gT3RoZXJ3aXNlLA0KPiANCj4gUmV2aWV3
ZWQtYnk6IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo=

