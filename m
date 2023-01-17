Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1D66DED2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:29:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHm1z-0007G1-EW; Tue, 17 Jan 2023 08:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pHm1m-0007C1-EH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:29:29 -0500
Received: from a.mx.secunet.com ([62.96.220.36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus.ripke@secunet.com>)
 id 1pHm1k-0001ax-0Y
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:29:25 -0500
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id 4E210200A7;
 Tue, 17 Jan 2023 14:29:20 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnYa0KZUrBna; Tue, 17 Jan 2023 14:29:19 +0100 (CET)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 611D120078;
 Tue, 17 Jan 2023 14:29:19 +0100 (CET)
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
 by mailout2.secunet.com (Postfix) with ESMTP id 52C7D80004A;
 Tue, 17 Jan 2023 14:29:19 +0100 (CET)
Received: from mbx-dresden-01.secunet.de (10.53.40.199) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 17 Jan 2023 14:29:19 +0100
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mbx-dresden-01.secunet.de (10.53.40.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 17 Jan 2023 14:29:18 +0100
Received: from mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75]) by
 mbx-essen-01.secunet.de ([fe80::1522:bd4f:78cd:ce75%6]) with mapi id
 15.01.2375.034; Tue, 17 Jan 2023 14:29:18 +0100
From: "Ripke, Klaus" <klaus.ripke@secunet.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "philmd@linaro.org"
 <philmd@linaro.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "marcandre.lureau@gmail.com"
 <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Topic: [PATCH] usb-ccid: make ids and descriptor configurable
Thread-Index: AQHZKcG0q3Fh+fkSEUuGnSe3Q7/ht66iH5uAgABrg4A=
Date: Tue, 17 Jan 2023 13:29:18 +0000
Message-ID: <23b908a3a9923f943e82246d0fcaa1f02d6928cd.camel@secunet.com>
References: <c07957e3813d9d2f84e981bb1b8d99862a2998b9.camel@secunet.com>
 <cff14816-39eb-db1c-9bda-51cad7fcb7c1@linaro.org>
In-Reply-To: <cff14816-39eb-db1c-9bda-51cad7fcb7c1@linaro.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EBF5E907661014CB0400AD00A4488AE@secunet.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Received-SPF: pass client-ip=62.96.220.36;
 envelope-from=klaus.ripke@secunet.com; helo=a.mx.secunet.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

aGkgUGhpbGlwcGUsDQoNCk9uIFR1ZSwgMjAyMy0wMS0xNyBhdCAwODowNCArMDEwMCwgUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IElmIHlvdSBjcmVhdGUgMiBkZXZpY2VzIHdpdGgg
ZGlmZmVyZW50IHByb3BlcnRpZXMsIHRoZQ0KPiBmaXJzdCBnZXRzIGl0cyBwcm9wZXJ0aWVzIG92
ZXJ3cml0dGVuIHdpdGggdGhlIHNlY29uZCdzDQo+IG9uZXMuDQpUaGUgIWluaXRpYWxpemVkIGd1
YXJkIHNob3VsZCBwcmV2ZW50IHRoYXQuDQpJbiBwcmFjdGl6ZSB5b3Ugd291bGQgbm90IGNyZWF0
ZSBtb3JlIHVzYi1jY2lkIGRldmljZXMsDQpidXQgdXNiLWNjaWQtcGFzc3RocnUgb24gdGhlIHNh
bWUgY2xhc3MsDQpzbG90cyBhcmUgbm93IHN1cHBvcnRlZCBpbiBjYXJkX3JlYWxpemUuDQpBYmFu
ZG9uaW5nIGFsbCB0aGUgc3RhdGljIHN0cnVjdHVyZXMgc2VlbXMgdG9vIGJpZyBhIGNoYW5nZQ0K
Zm9yIGEgbGl0dGxlIHR3ZWFraW5nLCBhbmQgc2V0dGluZyBmcm9tIEVOViB3YXMgcmVmdXNlZC4N
Cg0KPiA+ICvCoMKgwqDCoMKgwqDCoCBxZW11X2NjaWRfZGVzY3JpcHRvcltERVNDX0ZFQVQyXSA9
IHMtPmZlYXQyOw0KU29tZSBkZXZpY2VzIChsaWJjYWNhcmQgdnNjY2xpZW50KSB3YW50IDQgaGVy
ZSBmb3IgIkF1dG9tYXRpYyBJRlNEDQpleGNoYW5nZSIuDQoNCg0KYmVzdCBLbGF1cw0KDQotLSAN
CktsYXVzIFJpcGtlDQpTZW5pb3IgRGV2ZWxvcGVyDQpQdWJsaWMgQXV0aG9yaXRpZXMgRGl2aXNp
b24NCnNlY3VuZXQgU2VjdXJpdHkgTmV0d29ya3MgQUcNCg0KVGVsZWZvbjogICs0OSAyMDEgNTQ1
NC0yOTgyDQo=

