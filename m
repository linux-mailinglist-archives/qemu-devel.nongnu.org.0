Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5926D698B88
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:05:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWRT-0004B2-Np; Thu, 16 Feb 2023 00:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pSWRR-0004Ab-Ou
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:04:22 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pSWRP-00058P-0l
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:04:21 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 9329F341AEF;
 Thu, 16 Feb 2023 08:04:15 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=mta-01; bh=jCa3rCroB1T520OZik
 Tf6dwLaW3g4UK8g0hmTbtNT+c=; b=o++RmcbPawo/+B0f0QLq6Up+Jo8GTv6T7Q
 7WhxFZp5QNsgM6J0gIU1sdCOO79ejDX9+s9d2+mhXsG1Q9wtI3DKOPFq5VD6YtGR
 +SQiV4NscTX2rbzTuU/5LHPcXl4hB4CnNvPpQWaXYQk30J43CY2Va/jGWM6fmTf9
 VLdnykoFk=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 89C333419D6;
 Thu, 16 Feb 2023 08:04:15 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 16 Feb 2023 08:04:15 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Thu, 16 Feb 2023 08:04:15 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Thu,
 16 Feb 2023 08:04:15 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>
CC: "erdnaxe@crans.org" <erdnaxe@crans.org>, "ma.mandourr@gmail.com"
 <ma.mandourr@gmail.com>
Subject: RE: [PATCH] Adding ability to change disassembler syntax in TCG
 plugins
Thread-Topic: [PATCH] Adding ability to change disassembler syntax in TCG
 plugins
Thread-Index: Adk9Ytj+mzbZHC9XRGOgcDMHokyEkwEQYdKAAABEsgAAB3tVMA==
Date: Thu, 16 Feb 2023 05:04:14 +0000
Message-ID: <1a19cfd11fd94e658224144d94663330@yadro.com>
References: <7d17f0cbb5ed4c90bbadd3992429006f@yadro.com>
 <be45264f-03d5-e6d1-f12e-c92b0ef7b557@yadro.com>
 <4d474968-dce8-0d69-3e52-2c42a6398e4c@linaro.org>
In-Reply-To: <4d474968-dce8-0d69-3e52-2c42a6398e4c@linaro.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.199.22.165]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=89.207.88.252; envelope-from=m.tyutin@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

PiBPbiAyLzE1LzIzIDE4OjE3LCBNaWtoYWlsIFR5dXRpbiB3cm90ZToNCj4gPiBwaW5nDQo+ID4N
Cj4gPiBwYXRjaGV3IGxpbms6DQo+ID4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzdkMTdmMGNi
YjVlZDRjOTBiYmFkZDM5OTI0MjkwMDZmQHlhZHJvLmNvbS8NCj4gPg0KPiA+IDEwLjAyLjIwMjMg
MTg6MjQsIE1pa2hhaWwgVHl1dGluIHdyb3RlOg0KPiA+PiBUaGlzIHBhdGNoIGFkZHMgbmV3IGZ1
bmN0aW9uIHFlbXVfcGx1Z2luX2luc25fZGlzYXNfd2l0aF9zeW50YXgoKSB0aGF0IGFsbG93cyBU
Q0cNCj4gPj4gcGx1Z2lucyB0byBnZXQgZGlzYXNzZW1ibGVyIHN0cmluZyB3aXRoIG5vbi1kZWZh
dWx0IHN5bnRheCBpZiBpdCB3YW50cyB0by4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogTWlr
aGFpbCBUeXV0aW4gPG0udHl1dGluQHlhZHJvLmNvbT4NCj4gDQo+IFdoeT8NCj4gDQo+IEl0J3Mg
Y2VydGFpbmx5IG5vdCB2ZXJ5IGdlbmVyaWMsIGV4cG9zaW5nIGEgZGlzYXNzZW1ibHkgcXVpcmsg
Zm9yIGV4YWN0bHkgb25lIGd1ZXN0DQo+IGFyY2hpdGVjdHVyZS4gIEkgbWVhbiwgeW91IGNvdWxk
IGp1c3QgYXMgZWFzaWx5IGxpbmsgeW91ciBwbHVnaW4gZGlyZWN0bHkgdG8gbGliY2Fwc3RvbmUN
Cj4gdmlhIHFlbXVfcGx1Z2luX2luc25fZGF0YSgpLg0KPiANCj4gDQo+IHJ+DQogDQpJIGFncmVl
IGl0IGNhbiBiZSBkb25lIG91dHNpZGUgb2YgUWVtdSB1c2luZyBhbm90aGVyIGRpc2Fzc2VtYmxl
ciBsaWJyYXJ5LiBIb3dldmVyLA0KdGhlcmUgYXJlIGZldyByZWFzb25zIHRvIGRvIGl0IGluIFFl
bXUgZnJvbSBhcmNoaXRlY3R1cmUgc3RhbmRwb2ludDoNCg0KMS4gVG8gaGF2ZSBhIHNpbmdsZSBw
bGFjZSBvZiBpbnN0cnVjdGlvbiBkZWNvZGluZyBsb2dpYy4gVENHIGhhcyB0byBkZWNvZGUgZ3Vl
c3QgaW5zdHJ1Y3Rpb25zDQphbnl3YXkuIElmIHBsdWdpbnMgYWRkIGFub3RoZXIgZGVjb2Rlciwg
aXQgY2F1c2VzIGRvdWJsZSB3b3JrIGFuZCBwcm9uZSB0byBlcnJvcnMgKGhvd2V2ZXINCmN1cnJl
bnQgaW1wbGVtZW50YXRpb24gZG9lcyBkb3VibGUgZGVjb2RlIHdvcmsgYW55d2F5KS4gRm9yIGV4
YW1wbGUsIFRDRyBtaWdodCBzdXBwb3J0DQpuZXcgaW5zdHJ1Y3Rpb24gd2hpY2ggaXMgbm90IGF2
YWlsYWJsZSBpbiBleHRlcm5hbCBkZWNvZGVyIHlldC4NCg0KMi4gVW5kZXIgdGhlIGhvb2QgUWVt
dSB1c2VzIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgb2YgZGVjb2RlciAoaW4gYWRkaXRpb24g
dG8gY2Fwc3RvbmUpDQp3aGljaCBpcyBub3QgZXhwb3NlZCBpbiBwdWJsaWMgaW50ZXJmYWNlLiBJ
ZiB0aGVyZSBpcyBhIG5lZWQgdG8gY29uZmlndXJlIGl0cyBvdXRwdXQsIHByb3Bvc2VkDQpBUEkg
YWxsb3dzIHRoYXQgYXMgd2VsbC4NCg0KMy4gSWYgbXVsdGlwbGUgcGx1Z2lucyB3YW50IHRvIHVz
ZSBhbm90aGVyIGRpc2Fzc2VtYmxlciBzeW50YXgsIHRoZXkgaGF2ZSB0byBzaGFyZQ0KaW1wbGVt
ZW50YXRpb24gYXMgdXRpbGl0eSBmdW5jdGlvbi4NCg==


