Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ADC6AC835
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:37:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDob-0002Ob-Gz; Mon, 06 Mar 2023 11:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pZDoZ-0002O8-OP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:35:56 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <m.tyutin@yadro.com>)
 id 1pZDoX-0005Bz-P0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:35:55 -0500
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
 by mta-01.yadro.com (Proxmox) with ESMTP id 8F2CC341DF5;
 Mon,  6 Mar 2023 19:35:47 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=mta-01; bh=pFi0ktNVbMB1jWrrsF
 eh0Ir8tDVpF6WYSV/Wx1pd+m8=; b=Od6cgymRlntscHXffp18ow8z3me3YLsyqv
 VRqa8WEOtwLIKHbFRTJ4eIAyaNsEg+4OlldQ4Xm4Su7TyplJqVgTLuMHGFX/Ep72
 S6ET8N3GBMrIVOjFh9t289wL7yoJC7m5sBqcAnY3ZincmiAyafm675mdx2jA+dsw
 UrXI+HaBo=
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Proxmox) with ESMTPS id 84CD6341DEB;
 Mon,  6 Mar 2023 19:35:47 +0300 (MSK)
Received: from T-EXCH-10.corp.yadro.com (172.17.11.60) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Mon, 6 Mar 2023 19:35:47 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-10.corp.yadro.com (172.17.11.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Mon, 6 Mar 2023 19:35:47 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Mon, 6
 Mar 2023 19:35:47 +0300
From: Mikhail Tyutin <m.tyutin@yadro.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, "erdnaxe@crans.org" <erdnaxe@crans.org>,
 "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: RE: [PATCH v2] TCG plugin API extension to read guest memory content
 by an address
Thread-Topic: [PATCH v2] TCG plugin API extension to read guest memory content
 by an address
Thread-Index: AdlFGzFjtCgLNbPNTzSXOtdOOq1PfAIq/8CAAJ/uHlA=
Date: Mon, 6 Mar 2023 16:35:46 +0000
Message-ID: <65ac5ab41cf74b109d0298c1fd777f63@yadro.com>
References: <5c50db42136d4a908b261c66b132b043@yadro.com>
 <87cz5p98ms.fsf@linaro.org>
In-Reply-To: <87cz5p98ms.fsf@linaro.org>
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

PiBOb3Qgc3VyZSB3aGF0IGhhcHBlbmVkIHdpdGggdGhlIGZvcm1hdHRpbmcgb2YgdGhpcyBwYXRj
aCwgSSB0aGluayB0aGVyZQ0KPiBpcyBhbiBodG1sIHBhcnQgZ2V0dGluZyBpbiB0aGUgd2F5Lg0K
SSBndWVzcyBsaW5lIGVuZHMgd2VyZSBtZXNzZWQgdXAgc29tZXdoZXJlIG9uIG15IHNpZGUuIFdp
bGwgdHJ5IHRvIGZpZ3VyZSBvdXQgdGhlIHJvb3QgY2F1c2UuDQoNCg0KPiA+ICsgICAgcWVtdV9w
bHVnaW5fdmNwdV9yZWFkX3BoeXNfbWVtKHZjcHVJbmRleCwgdmFkZHIsIG1lbUNvbnRlbnQsDQo+
ID4gc2l6ZSk7DQo+IA0KPiBTbyB0aGUgcHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgdGhl
IG1lbW9yeSB2YWx1ZSB5b3UgcmVhZCBoZXJlIG1heSBub3QgYmUNCj4gdGhlIHNhbWUgYXMgdGhl
IHZhbHVlIHRoYXQgd2FzIHJlYWQgYnkgdGhlIGluc3RydWN0aW9uLiBUaGlzIGNvdWxkDQo+IGJl
Y2F1c2Ugb2YgYSBmZXcgcmVhc29uczoNCj4gDQo+ICAgLSBhbiBtbWlvIHdyaXRlIGNoYW5nZXMg
dW5kZXJseWluZyBtZW1vcnkgbGF5b3V0DQo+ICAgLSBhbm90aGVyIHRocmVhZCBjaGFuZ2VzIG1l
bW9yeSBhZnRlciB0aGUgYWNjZXNzDQo+IA0KPiBJIHRoaW5rIGEgYmV0dGVyIHdheSB0byBnZXQg
dGhpcyBpbmZvcm1hdGlvbiB3b3VsZCBiZSB0byByZWdpc3RlciBhIG5ldw0KPiB0eXBlIG9mIGNh
bGwtYmFjayB3aGljaCBjYW4gZHVwbGljYXRlIHRoZSB2YWx1ZSBpbiB0aGUgc3RvcmUvbG9hZCBh
bmQNCj4gcGFzcyBpdCBkaXJlY3RseSB0byB0aGUgY2FsbGJhY2suIEl0IG1pZ2h0IGV2ZW4gYmUg
d29ydGgganVzdCBmaXhpbmcgdXANCj4gdGhlIGV4aXN0aW5nIGNhbGxiYWNrIGFuZCBicmVha2lu
ZyBjb21wYXRpYmlsaXR5IHJhdGhlciB0aGFuIGhhdmluZyB0d28NCj4gY2FsbGJhY2sgdHlwZXM/
DQo+IA0KPiBXZSBkaWRuJ3QgZG8gdGhpcyBvcmlnaW5hbGx5IGFzIHdlIHdlcmUgYmVpbmcgY2F1
dGlvdXMgYWJvdXQgYW55DQo+IGF0dGVtcHRzIHRvIHVzZSBwbHVnaW5zIHRvIHdvcmthcm91bmQg
dGhlIEdQTCBmb3IgZG9pbmcgSFcgZW11bGF0aW9uIC0NCj4gaG93ZXZlciBJIGRvbid0IHRoaW5r
IGFkZGluZyB0aGUgbWVtb3J5IHZhbHVlcyB0byB0aGUgY2FsbGJhY2tzIGdyZWF0bHkNCj4gaW5j
cmVhc2VzIHRoYXQgcmlzay4NCj4gDQo+IC0tDQo+IEFsZXggQmVubsOpZQ0KPiBWaXJ0dWFsaXNh
dGlvbiBUZWNoIExlYWQgQCBMaW5hcm8NCg0KRG8geW91IG1lYW4gY29uY3VycmVudCBhY2Nlc3Mg
dG8gdGhlIHNhbWUgbWVtb3J5IGJsb2NrIGJ5IG11bHRpcGxlIHRocmVhZHM/DQoNCkkgdGhpbmsg
LCBmb3IgZ3Vlc3QgdGhyZWFkcy9jb3JlcyBpZiB3ZSBvYnNlcnZlIG1pc21hdGNoIG9mIG1lbW9y
eSBjb250ZW50IHJlYWQgYnkgYSBwbHVnaW4gYW5kIGluc3RydWN0aW9uDQppdHNlbGYsIHRoZW4g
aXQgc2hvdWxkIGNsZWFybHkgaW5kaWNhdGUgdGhhdCBndWVzdCBzb2Z0d2FyZSBoYXMgdHJ1ZSBk
YXRhIHJhY2UgcHJvYmxlbSBzaXR0aW5nIHNvbWV3aGVyZQ0KaW4gaXRzIGNvZGUuIE90aGVyd2lz
ZSBvdGhlciB0aHJlYWRzIHdvdWxkIHdhaXQgb24gYSBzeW5jaHJvbml6YXRpb24gb2JqZWN0IHRv
IGxldCBjdXJyZW50IHRocmVhZA0KcGVyZm9ybSBib3RoIG1lbW9yeSBvcGVyYXRpb25zIChwbHVn
aW4gY2FsbGJhY2sgKyBpbnN0cnVjdGlvbikuIE9uIHRoZSBvdGhlciBoYW5kLCBjb25jdXJyZW50
IGFjY2Vzcw0KdXNpbmcgYXRvbWljIG9wZXJhdGlvbiB3aWxsIGluZGVlZCBjYXVzZSBlaXRoZXIg
cGx1Z2luIG9yIGluc3RydWN0aW9uIHRvIHJlYWQgaW52YWxpZCBtZW1vcnkgY29udGVudC4NCg0K
SXNu4oCZdCBpdCB0aGUgc2FtZSBwcm9ibGVtIGFzIHdlIGZhY2UgaW4gY2FzZSBvZiBHREIgYXR0
YWNoZWQgdG8gcnVubmluZyBRZW11IGluc3RhbmNlIChnZGJzZXJ2ZXIpIGFuZA0KYXNraW5nIGl0
IHRvIHJlYWQgc29tZSBtZW1vcnk/IEhvdyBpcyBpdCBzb2x2ZWQgdGhlcmU/DQo=


