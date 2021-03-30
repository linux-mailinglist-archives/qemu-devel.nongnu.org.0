Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B264A34F395
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 23:32:30 +0200 (CEST)
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRLyP-0002PP-Af
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 17:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1lRLw1-0001XU-2C
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 17:30:01 -0400
Received: from mailgw01.mediatek.com ([216.200.240.184]:20050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vince.delvecchio@mediatek.com>)
 id 1lRLvx-0007YX-1o
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 17:30:00 -0400
X-UUID: ebd8602d25a146f1a6b6999db8c24415-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:To:From;
 bh=GsUY23GXc3Od02VWGdogYa5YRL3xSZBdOZATHT50n/M=; 
 b=CnUpMGnI2RP2gueTkZb69a5N9k8nl82rnsOCEa8aba+eZuuL3TsYln/Lh+me6ModqamrjE1owADSxoUvzrDYcXWEeMfzjgc7GwhDInpfWV3roYQQv5KxWqKa/or4xnbV2r8d9q45XrixigqlAjCRm8BoyDtuz7kIAjAHNSJl220=;
X-UUID: ebd8602d25a146f1a6b6999db8c24415-20210330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <vince.delvecchio@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 942659494; Tue, 30 Mar 2021 13:29:47 -0800
Received: from MTKMBS62N2.mediatek.inc (172.29.193.42) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 14:29:45 -0700
Received: from MTKMBS62N2.mediatek.inc ([fe80::cd2:704a:13bf:a9b9]) by
 MTKMBS62N2.mediatek.inc ([fe80::cd2:704a:13bf:a9b9%16]) with mapi id
 15.00.1497.012; Tue, 30 Mar 2021 14:29:46 -0700
From: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH-for-5.2] target/mips: Deprecate nanoMIPS ISA
Thread-Topic: [PATCH-for-5.2] target/mips: Deprecate nanoMIPS ISA
Thread-Index: AQHXH/7B05Rt21qbcU2NmE+28F6bNqqRvevQgAtP+LA=
Date: Tue, 30 Mar 2021 21:29:46 +0000
Message-ID: <6a35ffee8354499c9c8994816f546e65@MTKMBS62N2.mediatek.inc>
References: <20201102202710.2224691-1-f4bug@amsat.org> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbXRrNTAxMjdcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wYjBiZmQzYi05MTlmLTExZWItOGRlMS1lOGQ4ZDFlYTQzZTlcYW1lLXRlc3RcMGIwYmZkM2MtOTE5Zi0xMWViLThkZTEtZThkOGQxZWE0M2U5Ym9keS50eHQiIHN6PSIyMTkxIiB0PSIxMzI2MTYxMzM4NDcxNjUyMzAiIGg9Ijk2N2lTUEwrbkRzVjNqSE5Xc3Z5NmxRZ3doYz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.29.193.239]
x-mtk: N
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=216.200.240.184;
 envelope-from=vince.delvecchio@mediatek.com; helo=mailgw01.mediatek.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 James Hogan <jhogan@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Thomas
 Huth <thuth@redhat.com>, Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

W1NvcnJ5IGZvciB0aGUgcmVzZW5kOyBvcmlnaW5hbCBzZWVtcyB0byBoYXZlIGJlZW4gY29ycnVw
dGVkXQ0KDQpPbiAxMS8yLzIwIDEyOjI3IFBNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90
ZToNCj4gVGhlIG5hbm9NSVBTIElTQSBoYXMgYmVlbiBhbm5vdW5jZWQgaW4gMjAxOCBmb3IgdmFy
aW91cyBwcm9qZWN0czoNCj4gDQo+IEdDQzogICBodHRwczovL2djYy5nbnUub3JnL2xlZ2FjeS1t
bC9nY2MvMjAxOC0wNS9tc2cwMDAxMi5odG1sDQo+IExpbnV4OiBodHRwczovL2x3bi5uZXQvQXJ0
aWNsZXMvNzUzNjA1Lw0KPiBRRU1VOiAgDQo+IGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20v
cWVtdS1kZXZlbEBub25nbnUub3JnL21zZzUzMDcyMS5odG1sDQo+IA0KPiBVbmZvcnR1bmF0ZWx5
IHRoZSBsaW5rcyByZWZlcmVuY2VkIGRvZXNuJ3Qgd29yayBhbnltb3JlICh3d3cubWlwcy5jb20p
Lg0KPiANCj4gRnJvbSB0aGlzIFdheWJhY2sgbWFjaGluZSBsaW5rIFsxXSB3ZSBjYW4gZ2V0IHRv
IGEgd29ya2luZyBwbGFjZSB0byANCj4gZG93bmxvYWQgYSB0b29sY2hhaW4gKGEgbW9yZSByZWNl
bnQgcmVsZWFzZSB0aGFuIHRoZSBvbmUgcmVmZXJlbmNlZCBpbiANCj4gdGhlIGFubm91bmNlbWVu
dCBtYWlscyk6DQo+IGh0dHA6Ly9jb2Rlc2NhcGUubWlwcy5jb20vY29tcG9uZW50cy90b29sY2hh
aW4vbmFub21pcHMvMjAxOC4wNC0wMi9kb3cNCj4gbmxvYWRzLmh0bWwNCj4gDQo+IC4uLg0KPiAN
Cj4gT3VyIGRlcHJlY2F0aW9uIHBvbGljeSBkbyBub3QgYWxsb3cgZmVhdHVyZSByZW1vdmFsIGJl
Zm9yZSAyIHJlbGVhc2UsIA0KPiB0aGVyZWZvcmUgZGVjbGFyZSB0aGUgbmFub01JUFMgSVNBIGNv
ZGUgZGVwcmVjYXRlZCBhcyBvZiBRRU1VIDUuMi4NCj4gVGhpcyBnaXZlcyB0aW1lIHRvIGRldmVs
b3BlcnMgdG8gdXBkYXRlIHRoZSBRRU1VIGNvbW11bml0eSwgb3IgDQo+IGludGVyZXN0ZWQgcGFy
dGllcyB0byBzdGVwIGluIHRvIG1haW50YWluIHRoaXMgY29kZS4NCg0KSGkgUGhpbGlwcGUgJiBl
dmVyeW9uZSwNCg0KQXBvbG9naWVzIGZvciB0aGUgbGF0ZSByZXNwb25zZS4NCg0KTWVkaWFUZWsg
aXMgdXNpbmcgdGhlIG5hbm9NSVBTIGFyY2hpdGVjdHVyZSBhbmQgaXMgbm93IGRvaW5nIG5hbm9N
SVBTIHRvb2xjaGFpbiBkZXZlbG9wbWVudC4gIEkgYmVsaWV2ZSBXYXZlL01JUFMgYXJlIG5vdCBh
bnkgbG9uZ2VyLCBzbyB5b3UgY2FuIHByb2JhYmx5IHNheSB3ZSBhcmUgdGFraW5nIG92ZXIgbmFu
b01JUFMgdG9vbGNoYWluIGRldmVsb3BtZW50Lg0KDQpXZSBoYXZlIGp1c3QgcHVibGlzaGVkIGEg
bmV3IHJlbGVhc2Ugb2YgdGhlIHRvb2xjaGFpbiBhdA0KaHR0cHM6Ly9naXRodWIuY29tL01lZGlh
VGVrLUxhYnMvbmFub21pcHMtZ251LXRvb2xjaGFpbi9yZWxlYXNlcy90YWcvbmFub01JUFMtMjAy
MS4wMi0wMQ0KYW5kIHdlIGhhdmUgc3RhcnRlZCB3b3JrIG9uIHVwZ3JhZGluZyB0aGUgdG9vbGNo
YWluIHRvIHRoZSBsYXRlc3QgdmVyc2lvbnMgaW4gcHJlcGFyYXRpb24gZm9yIHVwc3RyZWFtaW5n
LiAgKFdlIGFyZSBhbHNvIGludmVzdGlnYXRpbmcgYW4gTExWTSBwb3J0LikNCg0KV2UgYXJlIGFs
c28gd2lsbGluZyB0byBhY3QgYXMgbWFpbnRhaW5lcnMgZm9yIHRoZSBRRU1VIG5hbm9NSVBTIHBv
cnQsIGFuZCB3ZSBoYXZlIGFncmVlbWVudCB3aXRoIHRoZSBjdXJyZW50IGFuZCBmb3JtZXIgTUlQ
UyBRRU1VIG1haW50YWluZXJzIChBbGVrc2FuZGFyIFJpa2FsbyAmIEFsZWtzYW5kYXIgTWFya292
aWMsIGJvdGggZnJvbSBTeXJtaWEpIHRvIGhlbHAgdXMgaW4gdGhpcyBwcm9jZXNzIGlmIG5lZWRl
ZC4NCg0KVG8gc3VtIHVwLCBuYW5vTUlQUyBpcyBhbGl2ZSBhbmQgaW4gYWN0aXZlIGRldmVsb3Bt
ZW50LCBzbyBiYXNlZCBvbiB5b3VyIGNyaXRlcmlhIGl0IHNob3VsZCByZW1haW4gc3VwcG9ydGVk
IGluIFFFTVUuICBQbGVhc2UgbGV0IHVzIGtub3cgaG93IGVsc2Ugd2UgY2FuIGhlbHAgd2l0aCB0
aGlzIHByb2Nlc3MuDQoNCi1WaW5jZSBEZWwgVmVjY2hpbw0KQ29tcGlsZXIgVGVhbSBMZWFkICYg
RGVwdXR5IERpcmVjdG9yLCBEU1AgQ29yZSBUZWNobm9sb2d5IE1lZGlhVGVrLCBJbmMuDQoNCg==

