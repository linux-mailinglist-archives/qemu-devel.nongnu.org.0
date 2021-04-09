Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3898359179
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 03:30:56 +0200 (CEST)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUfz5-00073M-RG
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 21:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1lUfk1-00074p-Ir
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:15:21 -0400
Received: from mailgw02.mediatek.com ([216.200.240.185]:3003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1lUfjx-0004P3-Jn
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:15:21 -0400
X-UUID: 9765937a2c4241e8a8f4542d7ece6b1f-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ojNiHuDmXxRvT7q+MfS0Wu0q4xfZmW11Micxz0dqFpU=; 
 b=ZhFy2OPhPHCF2OIXbSYp87gAvbuPIYof1PLN/PLwUbj0eT8u4xpMU9RyFqd01YVfpJC9JcLRw5FBKESYXq4VFRVJMb6k1OlD7D5kgdyrHfKP8LDbJ4hpLXTbhIifQJd5O5WY8C0PffmSWlZp0SYaanZ04uOYcvFeleId6uu1tIY=;
X-UUID: 9765937a2c4241e8a8f4542d7ece6b1f-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <vince.delvecchio@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1079633734; Thu, 08 Apr 2021 18:15:06 -0700
Received: from MTKMBS62N2.mediatek.inc (172.29.193.42) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 18:10:22 -0700
Received: from MTKMBS62N2.mediatek.inc ([fe80::cd2:704a:13bf:a9b9]) by
 MTKMBS62N2.mediatek.inc ([fe80::cd2:704a:13bf:a9b9%16]) with mapi id
 15.00.1497.012; Thu, 8 Apr 2021 18:10:22 -0700
From: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
To: Richard Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo
 <Aleksandar.Rikalo@syrmia.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "f4bug@amsat.org" <f4bug@amsat.org>
Subject: RE: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
Thread-Topic: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
Thread-Index: AQHXLKPThs6mMx/7zUuCqN/Rlv8Zj6qrW1pw
Date: Fri, 9 Apr 2021 01:10:22 +0000
Message-ID: <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
 <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
In-Reply-To: <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbXRrNTAxMjdcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy01OWViYjI2My05OGQwLTExZWItOGRlMi05NGU2ZjdmNmRlYjBcYW1lLXRlc3RcNTllYmIyNjQtOThkMC0xMWViLThkZTItOTRlNmY3ZjZkZWIwYm9keS50eHQiIHN6PSIxNzQ4IiB0PSIxMzI2MjQwNDIyMDQ3MzQyMjUiIGg9InNkUDJzRDlzNmNsVU40OVdOTjNieVRzcmUvUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.29.193.239]
x-mtk: N
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=216.200.240.185;
 envelope-from=vince.delvecchio@mediatek.com; helo=mailgw02.mediatek.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Petar Jovanovic <petar.jovanovic@syrmia.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1cnNkYXksIEFwcmlsIDgsIDIwMjEgMjoxNyBQTSwgUmljaGFyZCBIZW5kZXJzb24gd3Jv
dGU6DQoNCj4gTkFDSywgZm9yIHRoZSByZWFzb25zIHN0YXRlZCBhZ2FpbnN0IHYxOg0KPiBodHRw
czovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wNC9tc2cwMDY2
My5odG1sDQoNCk9uIFR1ZXNkYXksIEFwcmlsIDYsIDIwMjEgMTE6MjEgQU0sIFJpY2hhcmQgSGVu
ZGVyc29uIHdyb3RlOg0KDQo+IEkgdGhpbmsgd2Ugc2hvdWxkIHJldGFpbiB0aGUgZGVwcmVjYXRp
b24gdW50aWwgeW91IGFjdHVhbGx5IGZvbGxvdyB0aHJvdWdoIHdpdGggYW55IG9mIHRoZSB1cHN0
cmVhbWluZy4NCj4gDQo+IFlvdSBkaWRuJ3QgZXZlbiBib3RoZXIgdG8gY29tbWl0IHlvdXIgY2hh
bmdlcyB0byBhIGNvZGUgcmVwb3NpdG9yeSAtLSBtZXJlbHkgdXBsb2FkZWQgdGFyYmFsbHMuICBU
aGVyZSBoYXZlIGJlZW4gbm8gcG9zdHMgdG8gdGhlID4gZ2NjIG1haWxpbmcgbGlzdHMgYWJvdXQg
bmFub21pcHMuDQo+IA0KPiBBIG1lcmUgY29kZSBkdW1wIGlzIG5vdCBhY3RpdmUgZGV2ZWxvcG1l
bnQuDQoNCk1heWJlIG5vdCwgYnV0IHdlIGFyZSBpbiBmYWN0IGFjdGl2ZWx5IGRldmVsb3Bpbmcu
ICA6LSkNCg0KWW914oCZcmUgcmlnaHQgd2UgaGF2ZW7igJl0IHB1Ymxpc2hlZCB0aGUgc291cmNl
IHJlcG9zIG9uIGdpdGh1YiB5ZXQuICBJdCdzIGJlZW4gb24gb3VyIGxpc3QuICBNYXliZSBub3Qg
dG9kYXkvdG9tb3Jyb3csIGJ1dCBpdCdsbCBkZWZpbml0ZWx5IGJlIGRvbmUgYnkgbmV4dCB3ZWVr
Lg0KDQpUaGUgbmFub01JUFMgdG9vbGNoYWluIHdlIGluaGVyaXRlZCBpcyBiYXNlZCBvbiBnY2Mg
Ni4zLiAgV2XigJl2ZSBiZWVuIHdvcmtpbmcgb24gdXBncmFkaW5nIHRvIGdjYyB0cnVuayBzaW5j
ZSBsYXRlIEZlYnJ1YXJ5LCBidXQgaXQncyBub3QgYSB0cml2aWFsIHRhc2suICBBcyBzb29uIGFz
IHdlJ3JlIGRvbmUgKGhvcGVmdWxseSBiZWZvcmUgdGhlIHN1bW1lciksIHdlJ2xsIHByb3Bvc2Ug
dGhlIGNoYW5nZXMgdG8gdGhlIGdjYyBtYWlsaW5nIGxpc3QuDQoNCkZvciBub3csIHdlIGRvbid0
IGhhdmUgbWFueSB0b3BpY3MgZm9yIHRoZSBnY2MgbGlzdHMsIGFsdGhvdWdoIGh0dHBzOi8vZ2Nj
LmdudS5vcmcvcGlwZXJtYWlsL2djYy8yMDIxLU1hcmNoLzIzNTA4Mi5odG1sIGlzIGZyb20gb3Vy
IHdvcmsuDQoNCldlJ3ZlIGFsc28gc3RhcnRlZCBhbiBMTFZNIHBvcnQgKGh0dHBzOi8vZ2l0aHVi
LmNvbS9NZWRpYVRlay1MYWJzL2xsdm0tcHJvamVjdCkgYXMgSSBtZW50aW9uZWQgaW4gbXkgcHJl
dmlvdXMgbWVzc2FnZSAoaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRl
dmVsLzIwMjEtMDMvbXNnMDk3NjQuaHRtbCkuDQoNCkluIHN1bSwgd2UncmUgaW52ZXN0aW5nIGlu
IG9wZW4gc291cmNlIG5hbm9NSVBTIHRvb2xzIGJlY2F1c2UgaXQncyBhbiBpbXBvcnRhbnQgdGVj
aG5vbG9neSBmb3IgdXMsIGFuZCBRRU1VIGlzIG9uZSBvZiB0aGUga2V5IHByb2plY3RzIHdlIHdh
bnQgdG8gaGF2ZSBuYW5vTUlQUyBzdXBwb3J0ZWQgaW4uDQoNCi1WaW5jZSBEZWwgVmVjY2hpbw0K
Q29tcGlsZXIgVGVhbSBMZWFkICYgRGVwdXR5IERpcmVjdG9yLCBEU1AgQ29yZSBUZWNobm9sb2d5
LCBNZWRpYVRlaw0K

