Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107F340275
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:51:07 +0100 (CET)
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpJ4-00066E-CH
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lMpHa-0004hY-Qi
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:49:34 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lMpHV-0005MQ-LV
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:49:34 -0400
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F1MdJ6WTbzYKr5;
 Thu, 18 Mar 2021 17:47:32 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 18 Mar 2021 17:49:17 +0800
Received: from dggpemm000003.china.huawei.com (7.185.36.128) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 17:49:17 +0800
Received: from dggpemm000003.china.huawei.com ([7.185.36.128]) by
 dggpemm000003.china.huawei.com ([7.185.36.128]) with mapi id 15.01.2106.013;
 Thu, 18 Mar 2021 17:49:17 +0800
From: zhukeqian <zhukeqian1@huawei.com>
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: RE: The windows guest can't bootup
Thread-Topic: The windows guest can't bootup
Thread-Index: AQHXG9nkH2r9s6n6K0qB9PTiTI9B96qJgDnh
Date: Thu, 18 Mar 2021 09:49:17 +0000
Message-ID: 0885149F-F56E-4533-A3C8-F49F8192901A
References: <20210318092218.GA4275@yangzhon-Virtual>
In-Reply-To: <20210318092218.GA4275@yangzhon-Virtual>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
 boundary="_000_0885149FF56E4533A3C8F49F8192901A_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhukeqian1@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 INVALID_MSGID=0.568, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "yang.zhong" <yang.zhong@intel.com>, pbonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_0885149FF56E4533A3C8F49F8192901A_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClllcC4gSXQgaXMga25vd24gaXNzdWUuIFBhb2xvIHdpbGwgcmV2ZXJ0IGl0Lg0KDQpU
aGFua3MuDQoNCg0KDQoNCg0KDQoNCg0KSGVsbG8sDQoNCkkgc3luY2VkIHRvZGF5IHFlbXUgY29k
ZSwgYW5kIGZvdW5kIHRoZSBxZW11IGNhbid0IGJvb3R1cCB0aGUgd2luZG93cyBndWVzdC4NClRo
aXMgaXNzdWUgd2FzIGNhdXNlZCBieSBjb21taXQgaWQgMzkyMDU1MjggYW5kIHJldmVydCB0aGlz
IHBhdGNoLCB0aGUgd2luZG93cw0KZ3Vlc3QgY2FuIGJvb3R1cC4NCg0KcWVtdS1zeXN0ZW0teDg2
XzY0OiAuLi9hY2NlbC9rdm0va3ZtLWFsbC5jOjY5MDoga3ZtX2xvZ19jbGVhcl9vbmVfc2xvdDog
QXNzZXJ0aW9uIGAoKChzdGFydCB8IHNpemUpICUgKHBzaXplKSkgPT0gMCknIGZhaWxlZC4NCg0K
SSBhbHNvIGVuYWJsZWQgdGhlIHZnYSBkZXZpY2UgaW4gdGhlIExpbnV4IGd1ZXN0LCBhbmQgc2Ft
ZSBpc3N1ZSB3YXMgZm91bmQuDQoNClJlZ2FyZHMsDQoNCllhbmcNCg0K

--_000_0885149FF56E4533A3C8F49F8192901A_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVu
dC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPC9tYXRhPjxzdHls
ZSB0eXBlPSJ0ZXh0L2NzcyI+Cioge2JveC1zaXppbmc6Ym9yZGVyLWJveDt9CmJvZHkge2ZvbnQt
ZmFtaWx5OiBDYWxpYnJpO30KPC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj4NCjxkaXYg
aWQ9ImZvY3VzIj4NCjxkaXY+SGksIDwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+WWVw
LiBJdCBpcyBrbm93biBpc3N1ZS4gUGFvbG8gd2lsbCByZXZlcnQgaXQuIDwvZGl2Pg0KPGRpdj48
YnI+DQo8L2Rpdj4NCjxkaXY+VGhhbmtzLiA8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
Pjxicj4NCjxicj4NCjxicj4NCjxicj4NCjxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjxk
aXY+PC9kaXY+DQo8ZGl2IGlkPSJzaWduYXR1cmUiPjxicj4NCjwvZGl2Pg0KPGRpdiBuYW1lPSJB
bnlPZmZpY2UtQmFja2dyb3VuZC1JbWFnZSIgc3R5bGU9ImJvcmRlci10b3A6MXB4IHNvbGlkICNC
NUM0REY7cGFkZGluZzo4cHg7IGJhY2tncm91bmQtaW1hZ2U6dXJsKGRhdGE6aW1hZ2UvcG5nO2Jh
c2U2NCxpVkJPUncwS0dnb0FBQUFOU1VoRVVnQUFBQUVBQUFCQkNBWUFBQUFRVGM3bEFBQUFDWEJJ
V1hNQUFBc1RBQUFMRXdFQW1wd1lBQUFBQkdkQlRVRUFBTEdPZlB0Umt3QUFBQ0JqU0ZKTkFBQjZK
UUFBZ0lNQUFQbi9BQUNBNlFBQWRUQUFBT3BnQUFBNm1BQUFGMiYjNDM7U1g4VkdBQUFBTjBsRVFW
UjQybUo0OHU3UGZ5WUdCb1ovY09Jdktnc2I4UWVWaFovNGpZWDdHd3NYcHhoJiM0MztnZ2hUY0xv
Rko0SG1TMndFVWxnQkJnQWpQa05SUWxHUGZBQUFBQUJKUlU1RXJrSmdnZz09KTsgYmFja2dyb3Vu
ZC1yZXBlYXQ6IHJlcGVhdC14OyI+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8ZGl2IG5h
bWU9Im1haWxfaGlzdF9jb250ZW50Ij48Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOiAxMHB0OyBiYWNrZ3JvdW5kLWNvbG9yOiBpbmhlcml0OyI+DQo8ZGl2IGNsYXNzPSJQbGFp
blRleHQiPkhlbGxvLCA8YnI+DQo8YnI+DQpJIHN5bmNlZCB0b2RheSBxZW11IGNvZGUsIGFuZCBm
b3VuZCB0aGUgcWVtdSBjYW4ndCBib290dXAgdGhlIHdpbmRvd3MgZ3Vlc3QuIDxicj4NClRoaXMg
aXNzdWUgd2FzIGNhdXNlZCBieSBjb21taXQgaWQgMzkyMDU1MjggYW5kIHJldmVydCB0aGlzIHBh
dGNoLCB0aGUgd2luZG93cyA8YnI+DQpndWVzdCBjYW4gYm9vdHVwLiA8YnI+DQo8YnI+DQpxZW11
LXN5c3RlbS14ODZfNjQ6IC4uL2FjY2VsL2t2bS9rdm0tYWxsLmM6NjkwOiBrdm1fbG9nX2NsZWFy
X29uZV9zbG90OiBBc3NlcnRpb24gYCgoKHN0YXJ0IHwgc2l6ZSkgJSAocHNpemUpKSA9PSAwKScg
ZmFpbGVkLg0KPGJyPg0KPGJyPg0KSSBhbHNvIGVuYWJsZWQgdGhlIHZnYSBkZXZpY2UgaW4gdGhl
IExpbnV4IGd1ZXN0LCBhbmQgc2FtZSBpc3N1ZSB3YXMgZm91bmQuIDxicj4NCjxicj4NClJlZ2Fy
ZHMsIDxicj4NCjxicj4NCllhbmcgPGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250Pjxicj4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_0885149FF56E4533A3C8F49F8192901A_--

