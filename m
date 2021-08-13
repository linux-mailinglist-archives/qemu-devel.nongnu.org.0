Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF53EAF03
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 05:56:39 +0200 (CEST)
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEOJB-0001TO-Rs
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 23:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mEOHt-0000je-Ec
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 23:55:17 -0400
Received: from mail-ma1ind01olkn081b.outbound.protection.outlook.com
 ([2a01:111:f400:fea4::81b]:36853
 helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mEOHr-0006d9-C1
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 23:55:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkWwU3tLNtDif72Oun4C9IAR7G7VqcSCUmDDjiABjaQQTsIeCyaqLevWlVboPW90PvW+Z8+gnQdryhPGke8zH6GL2yEVy8K6C/RZxUHvagxb3yF2OXR2aGs2+YxD05WNNPh2bwLcg1mQzCCxQmA5/cQftMDN3ErOYieB4id/D1jgve3k0wTNT2oND1AtYfI9I089V0sVXRt5SViViGd/Kumni9wOGt6PYK0zDmFz/xSqvd4MkzHqwQqgv/fx23vI2WHPPxqj5uGZO27JqlvSL8/a9FYOtwocxnlWWfJyVsD6gxvhezO1VaMGBqDaXW7REsgPmsom3W8/5hiaSqML8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5qCpbTqezCYSWjoi8uitsNfunRufjn4T3AAE7MnIRo=;
 b=OueBFAXUy3oWeAmMfU6y5S+tchUMgThwYA2t2uNBuAy545vnWsmrvDuBxLAXzg9NCuifPNgniSATtMPNdVJLBIIOcZcJQv2EL4U5ElGH4qOaPLrOm+HUdSRHbF5ENu4hkllJhuKuEex4yQAmMsIuzAMXbPrVPs7yLh9eFtEUznflflkU7nGMeG86fjr4Ll05ilfZ1rnm9vU29LcX+RqOIxa56AadD7Va2huuPz2Jf5kE03v8YmZWes4jIYTvq0MkAlH4C4GeKbNyAIhgaU1hMs7IhBRks5+e4yQZ93M6eyuG0j1LRH73j6b5ixO97clQMutuhwbMhElGQ78A1EPebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5qCpbTqezCYSWjoi8uitsNfunRufjn4T3AAE7MnIRo=;
 b=gxkmtt1FJuuZLADITYuLWoeBRmKqIfYHD9vIHyZFjcwDEL0y5ISWFrah0zvyuEVTfQBKwfeWC4GThMcSMKycx71pmu4gbN+5XHxl21UD1/drBDTFqlu+EjkHqv5zRbp6NzLo9aCEcIgDeSDN5T3Q9w2/bO4mzQtbQ2Rzp0mc9hU4tyESagahhennHwE8AgM1+Kxmat2fnrbygmLuNbre2xnBQ1LC5zV4kZ6PS9Socf5aK1CpTx8gU7VDH9+dcPeHuLo2xP94y6wU4BJDR4Chj8l5lPpDUKBX3s2I3vzYWxidPxEz9dRovLtBTE657r2nhuh3imfI3kWu2dbcp8QeEQ==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PNYPR01MB5036.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 03:49:57 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c%5]) with mapi id 15.20.4394.026; Fri, 13 Aug 2021
 03:49:57 +0000
From: Li Qiuhao <Qiuhao.Li@outlook.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [Question] fuzz: double-fetches in a memory region map session
Thread-Topic: [Question] fuzz: double-fetches in a memory region map session
Thread-Index: AQHXj3UwK7/Rtehqb0upDCU4V4SEqA==
Date: Fri, 13 Aug 2021 03:49:57 +0000
Message-ID: <PN0PR01MB6352FCDBE92B94EF0A05E658FCF99@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [cmzwkL6mV7M7ljeO28WIAnH4xMrbBCQ99VPjgxYSxGUHAbyP/etXYXbrzH3Pkd99]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc645ac7-e8ca-4319-6dc0-08d95e0d6af0
x-ms-traffictypediagnostic: PNYPR01MB5036:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9wMjxwawgYEUgEduzLvvCAhYndXaAjxdbSoJtt1u0ZPVbiZrVD3q4EpIcqa1hyuUzatGjsUpi9tA0LjEd4OzrMJXObrL7oaiDV94I3vliDiuQQkBDxqYO1XKielpRiz2WCPsNxW8J3tw+Mr8wdueY1k6VcyVbEpn4G7Ad2zfH+/HMdfb/ZGEX2tve/Ff7rS4Rw9p4ovpkKFNbf0USLK6mRY3fm/3vesGmaqxgW2ZMjn5kvWUnEAt0oUgXarxcbprdlq5qd/b4YRz+bl671ANbHgTHDQDVUt8ox+qMMor4+a9SRS2tgK90kIGTN2bmj0oBNs0L9ph67SSux2M9udiTuN+Qic30DdHFUW6n/aaIyHxo1yU0+4jXxptYiL3LC6bntvmoWzLL/VCkyxuVRu40CiaToJn0QoVDaJRH92SHut8bg4EKS06ls2iIKnD276i
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: vostMp0JCW722YSCjpslJ0fec9e8JDAd8KwKKzlFnY1UnJYALAWd8ISm9LZidEjiLxI7mR12x/6mK/srerqdnQneJRF6NDGnQZkD7Ascs7sXkdfXb6aoMVoyfQ4L+tv35+uMNUBoqt7U47V7klWDHQXsesBp7B0ERzJS3PYvNtmvyC+ppvnx9lUDp2zBFcqqzTkJmWzj0R+TNoXvZXMPTA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fc645ac7-e8ca-4319-6dc0-08d95e0d6af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 03:49:57.0437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB5036
Received-SPF: pass client-ip=2a01:111:f400:fea4::81b;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-MA1-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQWxleCwKClJlY2VudGx5IEkgd2FzIHJlYWRpbmcgdGhlIERNQSBjYWxsLWJhY2sgZnVuY3Rp
b25zIGluIHRoZSBmdXp6ZXIuIEl0IHNlZW1zCmZ1enpfZG1hX3JlYWRfY2IoKSBpcyBpbnNlcnRl
ZCBpbnRvIGZsYXR2aWV3X3JlYWRfY29udGludWUoKSBhbmQKYWRkcmVzc19zcGFjZV9tYXAoKSB0
byBtYWtlIHRoZSBob3N0IHJlYWQgY2hhbmdlZCBjb250ZW50IGJldHdlZW4gZGlmZmVyZW50CkRN
QSBhY3Rpb25zLgoKTXkgcXVlc3Rpb24gaXMgYWJvdXQgYWRkcmVzc19zcGFjZV9tYXAoKSAtLSBI
b3cgZG8gd2UgZW11bGF0ZSBkb3VibGUtZmV0Y2gKYnVncyBpbiB0aGUgc2FtZSBtYXAvdW5tYXAg
c2Vzc2lvbj8gRm9yIGV4YW1wbGU6CgoKICBGT08gKmd1ZXN0X2ZvbyA9IChGT08gKikgYWRkcmVz
c19zcGFjZV9tYXAoYXMsIC4uLik7CiAgCiAgdWludDY0X3Qgc2l6ZSA9IGd1ZXN0X2Zvby0+c2l6
ZTsgICAgLy8gZmlyc3QgZmV0Y2gKICBpZiBzaXplID4gbGltaXQKICAgIGdvdG8gZXJyb3I7CiAg
CiAgLyogdGltZSB3aW5kb3cgKi8KICAKICBtZW1jcHkoZGVzdCwgc3JjLCBndWVzdF9mb28tPnNp
emUpOyAvLyBkb3VibGUtZmV0Y2ggPwogIAogIGVycm9yOgogIGFkZHJlc3Nfc3BhY2VfdW5tYXAo
YXMsIGd1ZXN0X2ZvbywgLi4uKQoKClRoYW5rcywKICBRaXVoYW8gTGkK

