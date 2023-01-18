Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138C671A21
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6Lm-0003rk-0B; Wed, 18 Jan 2023 06:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1pI6Lh-0003rQ-6X
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:11:22 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1pI6Lb-0006vO-H2
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:11:20 -0500
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NxjcC0rg5zqVGg;
 Wed, 18 Jan 2023 19:06:03 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100009.china.huawei.com (7.185.36.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 18 Jan 2023 19:10:57 +0800
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 18 Jan 2023 19:10:56 +0800
Received: from kwepemm600016.china.huawei.com ([7.193.23.20]) by
 kwepemm600016.china.huawei.com ([7.193.23.20]) with mapi id 15.01.2375.034;
 Wed, 18 Jan 2023 19:10:56 +0800
To: Stefan Hajnoczi <stefanha@gmail.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-devel
 <qemu-devel@nongnu.org>, "Wubin (H)" <wu.wubin@huawei.com>, "Chentao (Boby)"
 <boby.chen@huawei.com>, "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
 "Zhangbo (Oscar)" <oscar.zhangbo@huawei.com>, "limingwang (A)"
 <limingwang@huawei.com>, Wangyan <wangyan122@huawei.com>, lihuachao
 <lihuachao1@huawei.com>
Subject: RE: [QUESTION] About virtio and eventloop
Thread-Topic: [QUESTION] About virtio and eventloop
Thread-Index: AdkpcTID0pd8MGv+T9eTVpvXILZMZQAEZemAAGqv8+g=
Date: Wed, 18 Jan 2023 11:10:56 +0000
Message-ID: 187145E2-CA96-43AA-B290-4108F8BFC562
References: <63b89ae069d644b897ea97cc41b030ab@huawei.com>,
 <CAJSP0QVYUb2th_5Do_C6GjYYMzvCkyuta-04+wAdN5NVMGkPDw@mail.gmail.com>
In-Reply-To: <CAJSP0QVYUb2th_5Do_C6GjYYMzvCkyuta-04+wAdN5NVMGkPDw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
 boundary="_000_187145E2CA9643AAB2904108F8BFC562_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhukeqian1@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 INVALID_MSGID=0.568, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  zhukeqian <zhukeqian1@huawei.com>
From:  zhukeqian via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_187145E2CA9643AAB2904108F8BFC562_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RlZmFuLCB0aGlzIGluZGVlZCBoZWxwcywgdGhhbmsgeW91Lg0KDQpLZXFpYW4NCg0KT24g
TW9uLCAxNiBKYW4gMjAyMyBhdCAwMzoyMCwgemh1a2VxaWFuIHZpYSA8cWVtdS1kZXZlbEBub25n
bnUub3JnPG1haWx0bzpxZW11LWRldmVsQG5vbmdudS5vcmc+PiB3cm90ZToNCj4gQW5kIGlmIElP
IG9wZXJhdGlvbiBpcyBibG9ja2VkLCBpcyB2Q1BVIHRocmVhZCB3aWxsIGJsb2NrZWQgd2hlbiBk
byBkZWFjdGl2YXRlPw0KDQpZZXMsIGJsa19kcmFpbigpIGlzIGEgc3luY2hyb25vdXMgZnVuY3Rp
b24uIEl0IGJsb2NrcyB1bnRpbCBpbi1mbGlnaHQNCkkvTyBoYXMgZmluaXNoZWQuIFRoZSB2Y3B1
IHRocmVhZCB3aWxsIGJlIGJsb2NrZWQgaW4NCnZpcnRpb19wY2lfY29tbW9uX3dyaXRlKCkuDQoN
ClN0ZWZhbg0KDQo=

--_000_187145E2CA9643AAB2904108F8BFC562_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVu
dC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPC9tYXRhPjxzdHls
ZSB0eXBlPSJ0ZXh0L2NzcyI+Cioge2JveC1zaXppbmc6Ym9yZGVyLWJveDt9CmJvZHkge2ZvbnQt
ZmFtaWx5OiBDYWxpYnJpO30KPC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj4NCjxkaXYg
aWQ9ImZvY3VzIj4NCjxkaXY+SGkgU3RlZmFuLCB0aGlzIGluZGVlZCBoZWxwcywgdGhhbmsgeW91
LjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+S2VxaWFuPC9kaXY+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPGRpdj48L2Rpdj4NCjxkaXYgbmFtZT0iQW55T2ZmaWNlLUJhY2tncm91bmQtSW1hZ2Ui
IHN0eWxlPSJib3JkZXItdG9wOjFweCBzb2xpZCAjQjVDNERGO3BhZGRpbmc6OHB4OyBiYWNrZ3Jv
dW5kLWltYWdlOnVybChkYXRhOmltYWdlL3BuZztiYXNlNjQsaVZCT1J3MEtHZ29BQUFBTlNVaEVV
Z0FBQUFFQUFBQkJDQVlBQUFBUVRjN2xBQUFBQ1hCSVdYTUFBQXNUQUFBTEV3RUFtcHdZQUFBQUJH
ZEJUVUVBQUxHT2ZQdFJrd0FBQUNCalNGSk5BQUI2SlFBQWdJTUFBUG4vQUFDQTZRQUFkVEFBQU9w
Z0FBQTZtQUFBRjImIzQzO1NYOFZHQUFBQU4wbEVRVlI0Mm1KNDh1N1BmeVlHQm9aL2NPSXZLZ3Ni
OFFlVmhaLzRqWVg3R3dzWHB4aCYjNDM7Z2doVGNMb0ZKNEhtUzJ3RVVsZ0JCZ0FqUGtOUlFsR1Bm
QUFBQUFCSlJVNUVya0pnZ2c9PSk7IGJhY2tncm91bmQtcmVwZWF0OiByZXBlYXQteDsiPg0KPGRp
diBzdHlsZT0id29yZC1icmVhazpicmVhay1hbGw7Ij48c3BhbiBzdHlsZT0iZm9udC13ZWlnaHQ6
IDcwMDsiPjwvc3Bhbj48L2Rpdj4NCjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OiA3MDA7
Ij48YnI+DQo8L3NwYW4+PC9kaXY+DQo8L2Rpdj4NCjxkaXYgbmFtZT0ibWFpbF9oaXN0X2NvbnRl
bnQiPjxmb250PjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEwcHQ7IGJhY2tncm91bmQtY29sb3I6
IGluaGVyaXQ7Ij4NCjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+T24gTW9uLCAxNiBKYW4gMjAyMyBh
dCAwMzoyMCwgemh1a2VxaWFuIHZpYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnFlbXUtZGV2ZWxAbm9u
Z251Lm9yZyI+cWVtdS1kZXZlbEBub25nbnUub3JnPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0OyBB
bmQgaWYgSU8gb3BlcmF0aW9uIGlzIGJsb2NrZWQsIGlzIHZDUFUgdGhyZWFkIHdpbGwgYmxvY2tl
ZCB3aGVuIGRvIGRlYWN0aXZhdGU/PGJyPg0KPGJyPg0KWWVzLCBibGtfZHJhaW4oKSBpcyBhIHN5
bmNocm9ub3VzIGZ1bmN0aW9uLiBJdCBibG9ja3MgdW50aWwgaW4tZmxpZ2h0PGJyPg0KSS9PIGhh
cyBmaW5pc2hlZC4gVGhlIHZjcHUgdGhyZWFkIHdpbGwgYmUgYmxvY2tlZCBpbjxicj4NCnZpcnRp
b19wY2lfY29tbW9uX3dyaXRlKCkuPGJyPg0KPGJyPg0KU3RlZmFuPGJyPg0KPC9kaXY+DQo8L3Nw
YW4+PC9mb250Pjxicj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_187145E2CA9643AAB2904108F8BFC562_--

