Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDFB5B4686
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 15:42:31 +0200 (CEST)
Received: from localhost ([::1]:46172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oX0kg-0005C9-6A
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 09:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei@inspur.com>)
 id 1oWy1T-0006K8-UD; Sat, 10 Sep 2022 06:47:40 -0400
Received: from unicom146.biz-email.net ([210.51.26.146]:12393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuhaiwei@inspur.com>)
 id 1oWy1L-0006hF-7Q; Sat, 10 Sep 2022 06:47:34 -0400
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id FLG00102;
 Sat, 10 Sep 2022 18:47:02 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 10 Sep 2022 18:47:03 +0800
Received: from jtjnmail201607.home.langchao.com ([fe80::c5ea:abc2:7a50:1de9])
 by jtjnmail201607.home.langchao.com ([fe80::c5ea:abc2:7a50:1de9%8])
 with mapi id 15.01.2507.012; Sat, 10 Sep 2022 18:47:03 +0800
From: =?utf-8?B?U2Vhd2F5IExpdSjliJjmtbfkvJ8p?= <liuhaiwei@inspur.com>
To: "vsementsov@yandex-team.ru" <vsementsov@yandex-team.ru>,
 "liuhaiwei9699@126.com" <liuhaiwei9699@126.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "fam@euphon.net"
 <fam@euphon.net>, "eblake@redhat.com" <eblake@redhat.com>, "jsnow@redhat.com"
 <jsnow@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: Re: [PATCH] bugfix:migrate with block-dirty-bitmap (disk size is big
 enough) can't be finished
Thread-Topic: [PATCH] bugfix:migrate with block-dirty-bitmap (disk size is big
 enough) can't be finished
Thread-Index: AQHYxQKpZis3FYlWMUCIpAFiLj3N5g==
Date: Sat, 10 Sep 2022 10:47:02 +0000
Message-ID: <p5hg4fm3akts7k6e3oe04m1j.1662806822058@email.android.com>
References: 12:12725
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D57CFAF03DED444987EF73488942ED6@inspur.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
tUid: 202291018470202b12f5c80f56dbb60536375f7c3f2d8
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Received-SPF: pass client-ip=210.51.26.146; envelope-from=liuhaiwei@inspur.com;
 helo=unicom146.biz-email.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 10 Sep 2022 09:40:18 -0400
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

aGksaSBoYXZlIGEgcXVlc3Rpb24NCmlmIGZhaWxlZCBpbiBtaWdyYXRpb24gdXNpbmcgcG9zdC1j
b3B5IG1vZGUsaXMgdGhlcmUgc29tZSB3YXkgdG8gcmVzdG9yZSB0aGUgbWVtb3J5IGRhdGEgYmFj
ayB0byBzb3VjcmUgVk0/DQoNCg0KDQoNCuWPkeiHquaIkeeahOWwj+exsw0K5ZyoIFZsYWRpbWly
IFNlbWVudHNvdi1PZ2lldnNraXkgPHZzZW1lbnRzb3ZAeWFuZGV4LXRlYW0ucnU+77yMMjAyMuW5
tDnmnIgxMOaXpSDkuIvljYg2OjE45YaZ6YGT77yaDQoNCk9uIDkvMTAvMjIgMDk6MzUsIGxpdWhh
aXdlaSB3cm90ZToNCj4gRnJvbTogbGl1aGFpd2VpIDxsaXVoYWl3ZWlAaW5zcHVyLmNvbT4NCj4N
Cj4gYnVnIGRlc2NyaXB0aW9uIGFzICBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3Fl
bXUvLS9pc3N1ZXMvMTIwMw0KPiBVc3VhbGx5LHdlIHVzZSB0aGUgcHJlY29weSBvciBwb3N0Y29w
eSBtb2RlIHRvIG1pZ3JhdGUgYmxvY2sgZGlydHkgYml0bWFwLg0KPiBidXQgaWYgYmxvY2stZGly
dHktYml0bWFwIHNpemUgbW9yZSB0aGFuIHRocmVzaG9sZCBzaXplLHdlIGNhbm5vdCBlbnRyeSB0
aGUgbWlncmF0aW9uX2NvbXBsZXRpb24gaW4gbWlncmF0aW9uX2l0ZXJhdGlvbl9ydW4gZnVuY3Rp
b24NCj4gVG8gc29sdmUgdGhpcyBwcm9ibGVtLCB3ZSBjYW4gc2V0dGluZyAgdGhlIHBlbmRpbmcg
c2l6ZSB0byBhIGZha2UgdmFsdWUodGhyZXNob2xkLTEgb3IgMCkgdG8gdGVsbCAgbWlncmF0aW9u
X2l0ZXJhdGlvbl9ydW4gZnVuY3Rpb24gdG8gZW50cnkgdGhlIG1pZ3JhdGlvbl9jb21wbGV0aW9u
LGlmIHBlbmRpbmcgc2l6ZSA+IHRocmVzaG9sZCBzaXplDQo+DQoNCg0KQWN0dWFsbHksIGJpdG1h
cHMgbWlncmF0ZSBpbiBwb3N0Y29weS4gU28sIHlvdSBzaG91bGQgc3RhcnQgcG9zdGNvcHkgZm9y
IGl0IHRvIHdvcmsgKHFtcCBjb21tYW5kIG1pZ3JhdGUtc3RhcnQtcG9zdGNvcHkpLiBUaGlzIGNv
bW1hbmQgc2ltcGx5IHNldCB0aGUgYm9vbGVhbiB2YXJpYWJsZSwgc28gdGhhdCBpbiBtaWdyYXRp
b25faXRlcmF0aW9uX3J1bigpIHdlJ2xsIG1vdmUgdG8gcG9zdGNvcHkgd2hlbiBuZWVkZWQuIFNv
LCB5b3UgY2FuIHN0YXJ0IHRoaXMgY29tbWFuZCBpbW1lZGlhdGVseSBhZnRlciBtaWdyYXRlIGNv
bW1hbmQsIG9yIGV2ZW4gYmVmb3JlIGl0LCBidXQgYWZ0ZXIgc2V0dGluZyB0aGUgImRpcnR5LWJp
dG1hcHMiIGNhcGFiaWxpdHkuDQoNCkZha2UgcGVuZGluZyBpcyBhIHdyb25nIHRoaW5nIHRvIGRv
LCBpdCBtZWFucyB0aGF0IHlvdSB3aWxsIG1ha2UgZG93bnRpbWUgdG8gYmUgbGFyZ2VyIHRoYW4g
ZXhwZWN0ZWQuDQoNCi0tDQpCZXN0IHJlZ2FyZHMsDQpWbGFkaW1pcg0K

