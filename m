Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42FA4C658E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:19:02 +0100 (CET)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcBJ-0002Qh-Rt
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luofei@unicloud.com>)
 id 1nOcA3-0001Uu-07
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:17:45 -0500
Received: from gw.haihefund.cn ([220.194.70.58]:32352 helo=spam.unicloud.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luofei@unicloud.com>)
 id 1nOc9y-0001zJ-3H
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:17:41 -0500
Received: from eage.unicloud.com ([220.194.70.35])
 by spam.unicloud.com with ESMTP id 21S9HI4t050430;
 Mon, 28 Feb 2022 17:17:18 +0800 (GMT-8)
 (envelope-from luofei@unicloud.com)
Received: from zgys-ex-mb09.Unicloud.com (10.10.0.24) by
 zgys-ex-mb11.Unicloud.com (10.10.0.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.17; Mon, 28 Feb 2022 17:17:17 +0800
Received: from zgys-ex-mb09.Unicloud.com ([fe80::eda0:6815:ca71:5aa]) by
 zgys-ex-mb09.Unicloud.com ([fe80::eda0:6815:ca71:5aa%16]) with mapi id
 15.01.2375.017; Mon, 28 Feb 2022 17:17:17 +0800
From: =?gb2312?B?wt63yQ==?= <luofei@unicloud.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBpMzg2OiBTZXQgTUNHX1NUQVRVU19SSVBWIGJpdCBm?=
 =?gb2312?Q?or_mce_SRAR_error?=
Thread-Topic: [PATCH] i386: Set MCG_STATUS_RIPV bit for mce SRAR error
Thread-Index: AQHYDdpiM0Sj+cD120OyD4W4YWbm6ayo7CVD
Date: Mon, 28 Feb 2022 09:17:17 +0000
Message-ID: <4e86fc594ede4b029d0f82d9d1ca0142@unicloud.com>
References: <20220120084634.131450-1-luofei@unicloud.com>
In-Reply-To: <20220120084634.131450-1-luofei@unicloud.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.1.7]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: spam.unicloud.com 21S9HI4t050430
Received-SPF: pass client-ip=220.194.70.58; envelope-from=luofei@unicloud.com;
 helo=spam.unicloud.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cGluZw0KaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzIwMjIwMTIwMDg0NjM0LjEzMTQ1MC0xLWx1
b2ZlaUB1bmljbG91ZC5jb20vDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQq3orz+yMs6IMLet8kNCreiy83KsbzkOiAyMDIyxOox1MIyMMjVIDE2OjQ2DQrK1bz+yMs6
IHFlbXUtZGV2ZWwNCrOty806IFBhb2xvIEJvbnppbmk7IE1hcmNlbG8gVG9zYXR0aTsga3ZtQHZn
ZXIua2VybmVsLm9yZzsgwt63yQ0K1vfM4jogW1BBVENIXSBpMzg2OiBTZXQgTUNHX1NUQVRVU19S
SVBWIGJpdCBmb3IgbWNlIFNSQVIgZXJyb3INCg0KSW4gdGhlIHBoeXNpY2FsIG1hY2hpbmUgZW52
aXJvbm1lbnQsIHdoZW4gYSBTUkFSIGVycm9yIG9jY3VycywNCnRoZSBJQTMyX01DR19TVEFUVVMg
UklQViBiaXQgaXMgc2V0LCBidXQgcWVtdSBkb2VzIG5vdCBzZXQgdGhpcw0KYml0LiBXaGVuIHFl
bXUgaW5qZWN0cyBhbiBTUkFSIGVycm9yIGludG8gdmlydHVhbCBtYWNoaW5lLCB0aGUNCnZpcnR1
YWwgbWFjaGluZSBrZXJuZWwganVzdCBjYWxsIGRvX21hY2hpbmVfY2hlY2soKSB0byBraWxsIHRo
ZQ0KY3VycmVudCB0YXNrLCBidXQgbm90IGNhbGwgbWVtb3J5X2ZhaWx1cmUoKSB0byBpc29sYXRl
IHRoZSBmYXVsdHkNCnBhZ2UsIHdoaWNoIHdpbGwgY2F1c2UgdGhlIGZhdWx0eSBwYWdlIHRvIGJl
IGFsbG9jYXRlZCBhbmQgdXNlZA0KcmVwZWF0ZWRseS4gSWYgdXNlZCBieSB0aGUgdmlydHVhbCBt
YWNoaW5lIGtlcm5lbCwgaXQgd2lsbCBjYXVzZQ0KdGhlIHZpcnR1YWwgbWFjaGluZSB0byBjcmFz
aA0KDQpTaWduZWQtb2ZmLWJ5OiBsdW9mZWkgPGx1b2ZlaUB1bmljbG91ZC5jb20+DQotLS0NCiB0
YXJnZXQvaTM4Ni9rdm0va3ZtLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9rdm0va3ZtLmMg
Yi90YXJnZXQvaTM4Ni9rdm0va3ZtLmMNCmluZGV4IDJjOGZlYjRhNmYuLjE0NjU1NTc3ZjAgMTAw
NjQ0DQotLS0gYS90YXJnZXQvaTM4Ni9rdm0va3ZtLmMNCisrKyBiL3RhcmdldC9pMzg2L2t2bS9r
dm0uYw0KQEAgLTUzNyw3ICs1MzcsNyBAQCBzdGF0aWMgdm9pZCBrdm1fbWNlX2luamVjdChYODZD
UFUgKmNwdSwgaHdhZGRyIHBhZGRyLCBpbnQgY29kZSkNCg0KICAgICBpZiAoY29kZSA9PSBCVVNf
TUNFRVJSX0FSKSB7DQogICAgICAgICBzdGF0dXMgfD0gTUNJX1NUQVRVU19BUiB8IDB4MTM0Ow0K
LSAgICAgICAgbWNnX3N0YXR1cyB8PSBNQ0dfU1RBVFVTX0VJUFY7DQorICAgICAgICBtY2dfc3Rh
dHVzIHw9IE1DR19TVEFUVVNfUklQViB8IE1DR19TVEFUVVNfRUlQVjsNCiAgICAgfSBlbHNlIHsN
CiAgICAgICAgIHN0YXR1cyB8PSAweGMwOw0KICAgICAgICAgbWNnX3N0YXR1cyB8PSBNQ0dfU1RB
VFVTX1JJUFY7DQotLQ0KMi4yNy4wDQoNCg==

