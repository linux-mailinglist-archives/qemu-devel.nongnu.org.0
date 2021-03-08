Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9330B33128C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:52:08 +0100 (CET)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIAx-0007Qs-Ka
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lJI67-0001wE-5W
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:47:09 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:49616 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1lJI5z-000205-QZ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:47:05 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 59F8241292;
 Mon,  8 Mar 2021 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mta-01; t=1615218414; x=
 1617032815; bh=om2f8jao0Hv7O+GnNkA84vVPzxvsdvR/ZOr23YP9ha8=; b=V
 YxKil5jJ9RqDMvSOXameS3vL+F49qEIKfVvPa3KeBsvy1q0ibNEQG4i/xV9LL1Eb
 tfBhUeLequkCvHTdH4k7tLXVWNyyLz+b8BsMDo7pJjDJzUM2DqsLAq2G3pAozyeJ
 u5pGyXsvjTvDgPEaHGdhldyPGgz3QzCVbRYMZqYRZA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8M5MehVN9uou; Mon,  8 Mar 2021 18:46:54 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 702F54126E;
 Mon,  8 Mar 2021 18:46:54 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (172.17.100.103) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Mon, 8 Mar 2021 18:46:53 +0300
Received: from T-EXCH-03.corp.yadro.com ([fe80::39f4:7b05:b1d3:5272]) by
 T-EXCH-03.corp.yadro.com ([fe80::39f4:7b05:b1d3:5272%14]) with mapi id
 15.01.0669.032; Mon, 8 Mar 2021 18:46:54 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
Thread-Topic: [PATCH v2] FreeBSD: Upgrade to 12.2 release
Thread-Index: AQHXE2rSG0bQ1f2FzkKIg08q5Pnksap55WCAgAAgagCAAAP8gIAAM+qy
Date: Mon, 8 Mar 2021 15:46:54 +0000
Message-ID: <E0C80BD2-323B-4101-8DC4-8A920B6CE5AB@yadro.com>
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
 <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
 <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>,
 <f48b0f77-02e7-fcf7-a8bd-9d7990c8db33@redhat.com>
In-Reply-To: <f48b0f77-02e7-fcf7-a8bd-9d7990c8db33@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IDgg0LzQsNGA0YLQsCAyMDIxINCzLiwg0LIgMTg6NDEsIFRob21hcyBIdXRoIDx0aHV0aEBy
ZWRoYXQuY29tPiDQvdCw0L/QuNGB0LDQuyjQsCk6DQo+IA0KPiDvu79PbiAwOC8wMy8yMDIxIDE2
LjI2LCBXYXJuZXIgTG9zaCB3cm90ZToNCj4+IE9uIE1vbiwgTWFyIDgsIDIwMjEgYXQgNjozMCBB
TSBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbSA8bWFpbHRvOnRodXRoQHJlZGhhdC5jb20+
PiB3cm90ZToNCj4+ICAgIE9uIDA3LzAzLzIwMjEgMTYuNTYsIFdhcm5lciBMb3NoIHdyb3RlOg0K
Pj4gICAgID4gRnJlZUJTRCAxMi4xIGhhcyByZWFjaGVkIGVuZCBvZiBsaWZlLiBVc2UgMTIuMiBp
bnN0ZWFkIHNvIHRoYXQgRnJlZUJTRCdzDQo+PiAgICAgPiBwcm9qZWN0J3MgcGFja2FnZXMgd2ls
bCB3b3JrLiAgVXBkYXRlIHdoaWNoIHRpbWV6b25lIHRvIHBpY2suIFdvcmsNCj4+ICAgIGFyb3Vu
ZCBhIFFFTVUNCj4+ICAgICA+IGJ1ZyB0aGF0IGluY29ycmVjdGx5IHJhaXNlcyBhbiBleGNlcHRp
b24gb24gYSBDUkMzMiBpbnN0cnVjdGlvbiB3aXRoDQo+PiAgICB0aGUgRlBVDQo+PiAgICAgPiBk
aXNhYmxlZC4gIFRoZSBxZW11IGJ1ZyBpcyBkZXNjcmliZWQgaGVyZToNCj4+ICAgICA+IGh0dHBz
Oi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVtdS1kZXZlbEBub25nbnUub3JnL21zZzc4NDE1OC5o
dG1sDQo+PiAgICA8aHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdu
dS5vcmcvbXNnNzg0MTU4Lmh0bWw+DQo+PiAgICAgPg0KPj4gICAgID4gU2lnbmVkLW9mZi1ieTog
V2FybmVyIExvc2ggPGltcEBic2RpbXAuY29tIDxtYWlsdG86aW1wQGJzZGltcC5jb20+Pg0KPj4g
ICAgID4NCj4+ICAgICA+IC0tLQ0KPj4gICAgID4gICB0ZXN0cy92bS9mcmVlYnNkIHwgMTQgKysr
KysrKysrLS0tLS0NCj4+ICAgICA+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkNCj4+ICAgIEkgZ2F2ZSB0aGlzIGEgdHJ5LCBidXQgaXQncyBjdXJyZW50
bHkgZmFpbGluZyBpbiB0aGUgdW5pdCB0ZXN0czoNCj4+ICAgIFJ1bm5pbmcgdGVzdCB0ZXN0LWNy
eXB0by10bHNjcmVkc3g1MDkNCj4+ICAgICoqICh0ZXN0cy90ZXN0LWNyeXB0by10bHNjcmVkc3g1
MDk6OTk5OSk6IENSSVRJQ0FMICoqOiAxMjo1NjozNS4xNTc6IEZhaWxlZA0KPj4gICAgdG8gc2ln
biBjZXJ0aWZpY2F0ZSBBU04xIHBhcnNlcjogVmFsdWUgaXMgbm90IHZhbGlkLg0KPj4gICAgRVJS
T1IgdGVzdC1jcnlwdG8tdGxzY3JlZHN4NTA5IC0gQmFpbCBvdXQhIEZBVEFMLUNSSVRJQ0FMOiBG
YWlsZWQgdG8gc2lnbg0KPj4gICAgY2VydGlmaWNhdGUgQVNOMSBwYXJzZXI6IFZhbHVlIGlzIG5v
dCB2YWxpZC4NCj4+ICAgIGdtYWtlOiAqKiogW01ha2VmaWxlLm10ZXN0OjU3NjogcnVuLXRlc3Qt
NzBdIEVycm9yIDENCj4+ICAgIGdtYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLg0KPj4gICAgUnVubmluZyB0ZXN0IHRlc3QtY3J5cHRvLXRsc3Nlc3Npb24NCj4+ICAgICoq
ICh0ZXN0cy90ZXN0LWNyeXB0by10bHNzZXNzaW9uOjEwMDAyKTogQ1JJVElDQUwgKio6IDEyOjU2
OjM1LjI4ODogRmFpbGVkDQo+PiAgICB0byBzaWduIGNlcnRpZmljYXRlIEFTTjEgcGFyc2VyOiBW
YWx1ZSBpcyBub3QgdmFsaWQuDQo+PiAgICBFUlJPUiB0ZXN0LWNyeXB0by10bHNzZXNzaW9uIC0g
QmFpbCBvdXQhIEZBVEFMLUNSSVRJQ0FMOiBGYWlsZWQgdG8gc2lnbg0KPj4gICAgY2VydGlmaWNh
dGUgQVNOMSBwYXJzZXI6IFZhbHVlIGlzIG5vdCB2YWxpZC4NCj4+IFRoYXQncyB0b3RhbGx5IHVu
cmVsYXRlZCB0byBteSBjaGFuZ2UuIFdhcyBpdCBmYWlsaW5nIGJlZm9yZT8gV2hhdCBlbnZpcm9u
bWVudCB3YXMgaXQgZmFpbGluZyBpbiBiZWNhdXNlIGl0IGFsbCBzZWVtZWQgdG8gd29yayBmb3Ig
bWUuLi4NCj4gDQo+IEl0J3MgYmVlbiBhIHdoaWxlIHNpbmNlIEkgbGFzdCByYW4gIm1ha2Ugdm0t
YnVpbGQtZnJlZWJzZCIsIHNvIEkgY2FuJ3QgcmVhbGx5IHRlbGwgd2hldGhlciB0aGUgcHJvYmxl
bSB3YXMgYWxyZWFkeSB0aGVyZSBiZWZvcmUgLi4uIHdoZW4gSSBub3cgdHJ5IHRvIHJ1biBpdCB3
aXRob3V0IHlvdXIgcGF0Y2gsIGl0IGZhaWxzIGZvciBtZSwgdG9vLCBidXQgcmF0aGVyIGR1ZSB0
byBGcmVlQlNEIDEyLjEgYmVpbmcgb3V0IG9mIHNlcnZpY2UgaW5zdGVhZC4NCj4gDQo+PiAgICBJ
IGd1ZXNzIGl0J3MgdGhlIHNhbWUgcHJvYmxlbSBhczoNCj4+ICAgIGh0dHBzOi8vbGlzdHMuZ251
Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIxLTAxL21zZzA2NzUwLmh0bWwNCj4+ICAg
IDxodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMS0wMS9t
c2cwNjc1MC5odG1sPg0KPj4gICAgLi4uIHNvIHRoaXMgd291bGQgcmVxdWlyZSBhIGJ1ZyBmaXgg
aW4gdGhlIGxpYnRhc24gb2YgRnJlZUJTRCBmaXJzdD8gU2VlOg0KPj4gICAgaHR0cHM6Ly9naXRs
YWIuY29tL2dudXRscy9saWJ0YXNuMS8tL21lcmdlX3JlcXVlc3RzLzcxDQo+PiAgICA8aHR0cHM6
Ly9naXRsYWIuY29tL2dudXRscy9saWJ0YXNuMS8tL21lcmdlX3JlcXVlc3RzLzcxPg0KPj4gIElz
IHRoaXMgb24gdGhlIGhvc3QgdGhhdCBidWlsdCBxZW11LCBvciBpbnNpZGUgdGhlIFZNIG9yIHdo
ZXJlIGV4YWN0bHk/DQo+IA0KPiBJdCdzIGluc2lkZSB0aGUgVk0gLi4uIEkgYXNzdW1lIHRoZSBs
aWJ0YXNuIHRoZXJlIGhhcyB0aGUgc2FtZSBidWcgYXMgdGhlIG9uZSBvbiBtYWNPUz8NCj4gDQoN
ClRoZSBnbnV0bHMgZmFpbHVyZXMgb24gbWFjT1MgYW5kIEZyZWVCU0QgKHdpdGggY2xhbmcgYXMg
bWFpbiBjb21waWxlcikgd29u4oCZdCBoYXBwZW4gb25seSBpZiBsaWJ0YXNuMSBmcm9tIG1hc3Rl
ciBpcyB1c2VkLiBPdGhlcndpc2UgbGlidGFzbjEgaGFzIHRvIGJlIGNvbXBpbGVkIHdpdGggLU8x
Ly1PMC4NCg0K0J7RgtC/0YDQsNCy0LvQtdC90L4g0YEgaVBob25lDQoNCj4gVGhvbWFzDQo+IA0K

