Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC230A8AE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:28:24 +0100 (CET)
Received: from localhost ([::1]:41674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ZFf-00031f-8l
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l6ZD9-0001u2-R8; Mon, 01 Feb 2021 08:25:48 -0500
Received: from m1323.mail.163.com ([220.181.13.23]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l6ZD0-000218-0u; Mon, 01 Feb 2021 08:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=0vHSa
 Vl2sTaae8c43QJApA57nXn/mEUObDMj2tq6LfQ=; b=C3pC0M/QNUflZjyeHtgw4
 Zqx0LmB4WyRf2dt0h32CrN0rEOqDDkphOuAosQTv2iFJOIHigwHo9ihKBsZo4+TH
 VOfNo/3iX4bgkeHOPD+3ggva2OHEoKweGsPqf6VRCXcgJEJs1lHGiVODrYiousyP
 kTp5nCj1oCmVjRiSBvGJto=
Received: from qiudayu$huayun.com ( [36.154.235.86] ) by
 ajax-webmail-wmsvr23 (Coremail) ; Mon, 1 Feb 2021 21:09:32 +0800 (CST)
X-Originating-IP: [36.154.235.86]
Date: Mon, 1 Feb 2021 21:09:32 +0800 (CST)
From: "Michael Qiu" <qiudayu@huayun.com>
To: "Vladimir Sementsov-Ogievskiy" <vsementsov@virtuozzo.com>, 
 liangpeng10@huawei.com
Subject: Re:Re: [PATCH v4] blockjob: Fix crash with IOthread when block
 commit after snapshot
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <8041055c-b542-ad14-c8be-6266679d5142@virtuozzo.com>
References: <20210126032545.13349-1-08005325@163.com>
 <20210128013053.23266-1-08005325@163.com>
 <ce0a7f2b-ccf1-f898-4bf5-5b256e9c2f3b@virtuozzo.com>
 <BJXPR01MB0776C4B34AEED1F927EBA870CFB69@BJXPR01MB0776.CHNPR01.prod.partner.outlook.cn>
 <3058f4e4-fdec-6ffa-498c-66f609158451@huawei.com>
 <8041055c-b542-ad14-c8be-6266679d5142@virtuozzo.com>
X-CM-CTRLDATA: I7HTXWZvb3Rlcl9odG09MjE1NDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_49832_1303739125.1612184972631"
MIME-Version: 1.0
Message-ID: <42519db5.35bf.1775db66d57.Coremail.qiudayu@huayun.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: F8GowAD3_6eM_Rdg86VlAA--.28472W
X-CM-SenderInfo: qqyqikqtsvqiywtou0bp/1tbi8QIsrF-PJ+BwCQACsf
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.23; envelope-from=08005325@163.com;
 helo=m1323.mail.163.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_49832_1303739125.1612184972631
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

UGVuZywKCgoKSW4gbXkgYW5hbHlzaXMsIHRoZSByb290IGNhc3VlIHNob3VsZCBiZSB0aGUgbG9j
azogYWlvX2NvbnRleHQsIHFlbXUgbWFpbiB0aHJlYWQgZG8gYW4gdW5uZWNlc3NhcnkgcmVsZWFz
ZS9hcXVpcmUgYWN0aW9uLApUaGF0J3Mgd2h5IElPIHRocmVhZCBjb3VsZCBnZXQgdGhlIGxvY2sg
aXQgc2hvdWxkbid0IGhvbGQgYXQgdGhpcyBzdGFnZS4KVGhhbmtzLApNaWNoYWVsCgoKCgoKCgoK
CgoKCgoKQXQgMjAyMS0wMi0wMSAyMDo0NDowMCwgIlZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNr
aXkiIDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyb3RlOgo+SGkhCj4KPjAxLjAyLjIwMjEg
MTU6MDcsIFBlbmcgTGlhbmcgd3JvdGU6Cj4+IEhpLAo+PiAKPj4gSSBlbmNvdW50ZXJlZCB0aGUg
cHJvYmxlbSBtb250aHMgYWdvIHRvby4gIENvdWxkIHdlIG1vdmUgdGhlIGNyZWF0aW9uIG9mCj4+
IHRoZSBibG9jayBqb2IgKGJsb2NrX2pvYl9jcmVhdGUpIGJlZm9yZSBhcHBlbmRpbmcgdGhlIG5l
dyBicyB0bwo+PiBtaXJyb3JfdG9wX2JzIChiZHJ2X2FwcGVuZCkgYXMgSSB3cm90ZSBpbiBbKl0/
ICBJIGZvdW5kIHRoYXQgYWZ0ZXIKPj4gYmRydl9hcHBlbmQsIHFlbXUgd2lsbCB1c2UgbWlycm9y
X3RvcF9icyB0byBkbyB3cml0ZS4gIEFuZCB3aGVuIHdyaXRpbmcsCj4+IHFlbXUgd2lsbCB1c2Ug
YnMtPm9wYXF1ZSwgd2hpY2ggbWF5YmUgTlVMTC4KPj4gCj4+IFsqXQo+PiBodHRwOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9xZW11LWRldmVsL3BhdGNoLzIwMjAwODI2MTMxOTEwLjE4
NzkwNzktMS1saWFuZ3BlbmcxMEBodWF3ZWkuY29tLwo+PiAKPgo+SW4gdGhpcyBwYXRjaCB5b3Ug
Y3JlYXRlIGpvYiBvdmVyIG9yaWdpbmFsIGJzLCB3aGVuIGpvYnMgYXJlIG5vcm1hbGx5IGNyZWF0
ZWQgb3ZlciBqb2ItZmlsdGVyIGJzLiBJIGRvbid0IGtub3cgaXMgaXQgd3JvbmcsIGJ1dCBpdCBh
dCBsZWFzdCByZXF1aXJlcyBzb21lIHJlc2VhcmNoLCBhbmQgcHJvYmFibHkgdGhlIGNvZGUgdGhh
dCByZW1vdmVzIHRoZSBmaWx0ZXIgc2hvdWxkIGJlIGFkanVzdGVkIHNvbWVob3cuIEFsc28sIHlv
dSBtYWtlIGJzLT5vcGFxdWUgYmUgbm9uLXplcm8uIEJ1dCBzdGlsbCwgam9iIGlzIG5vdCBmdWxs
eSBpbml0aWFsaXplZCwgYW5kIHNvbWUgYW5vdGhlciBwcm9ibGVtIG1heSBvY2N1ci4gU28sIGRv
IHdlIGNyZWF0ZSBqb2IgcHJpb3IgdG8gZmlsdGVyIGluc2VydGlvbiBvciBhZnRlciBpdCwgcGFy
YWxsZWwgaW8gcmVxdWVzdHMgdG8gYnMgc2hvdWxkIG5vdCBpbnRlcnJ1cHQgbWlycm9yX3N0YXJ0
X2pvYigpLiBTbyBJIHRoaW5rIE1pY2hhZWwncyBwYXRjaCBpcyBjbG9zZXIgdG8gcmVhbCBwcm9i
bGVtIHRvIGZpeC4KPgo+Cj4tLSAKPkJlc3QgcmVnYXJkcywKPlZsYWRpbWlyCg==
------=_Part_49832_1303739125.1612184972631
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6IGFyaWFsOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij5QZW5nLDwvc3Bhbj48L3A+
PGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7Ij48ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsiPjxicj48
L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46IDBweDsiPkluIG15IGFuYWx5c2lzLCB0aGUgcm9vdCBj
YXN1ZSBzaG91bGQgYmUgdGhlIGxvY2s6IGFpb19jb250ZXh0LCBxZW11IG1haW4gdGhyZWFkIGRv
IGFuIHVubmVjZXNzYXJ5IHJlbGVhc2UvYXF1aXJlIGFjdGlvbiw8L2Rpdj48ZGl2IHN0eWxlPSJt
YXJnaW46IDBweDsiPlRoYXQncyB3aHkgSU8gdGhyZWFkIGNvdWxkIGdldCB0aGUgbG9jayBpdCBz
aG91bGRuJ3QgaG9sZCBhdCB0aGlzIHN0YWdlLjwvZGl2PjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdp
bjogMHB4OyI+PGZvbnQgZmFjZT0iYXJpYWwiPjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTogcHJl
LXdyYXA7Ij4gPC9zcGFuPjwvZm9udD48L2Rpdj48cHJlPjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+
TWljaGFlbDwvZGl2PjwvcHJlPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxl
PSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxkaXYg
c3R5bGU9InBvc2l0aW9uOnJlbGF0aXZlO3pvb206MSI+PC9kaXY+PGRpdiBpZD0iZGl2TmV0ZWFz
ZU1haWxDYXJkIj48L2Rpdj48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cHJlPjxicj5B
dCAyMDIxLTAyLTAxIDIwOjQ0OjAwLCAiVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSIgJmx0
O3ZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbSZndDsgd3JvdGU6CiZndDtIaSEKJmd0OwomZ3Q7MDEu
MDIuMjAyMSAxNTowNywgUGVuZyBMaWFuZyB3cm90ZToKJmd0OyZndDsgSGksCiZndDsmZ3Q7IAom
Z3Q7Jmd0OyBJIGVuY291bnRlcmVkIHRoZSBwcm9ibGVtIG1vbnRocyBhZ28gdG9vLiAgQ291bGQg
d2UgbW92ZSB0aGUgY3JlYXRpb24gb2YKJmd0OyZndDsgdGhlIGJsb2NrIGpvYiAoYmxvY2tfam9i
X2NyZWF0ZSkgYmVmb3JlIGFwcGVuZGluZyB0aGUgbmV3IGJzIHRvCiZndDsmZ3Q7IG1pcnJvcl90
b3BfYnMgKGJkcnZfYXBwZW5kKSBhcyBJIHdyb3RlIGluIFsqXT8gIEkgZm91bmQgdGhhdCBhZnRl
cgomZ3Q7Jmd0OyBiZHJ2X2FwcGVuZCwgcWVtdSB3aWxsIHVzZSBtaXJyb3JfdG9wX2JzIHRvIGRv
IHdyaXRlLiAgQW5kIHdoZW4gd3JpdGluZywKJmd0OyZndDsgcWVtdSB3aWxsIHVzZSBicy0mZ3Q7
b3BhcXVlLCB3aGljaCBtYXliZSBOVUxMLgomZ3Q7Jmd0OyAKJmd0OyZndDsgWypdCiZndDsmZ3Q7
IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3FlbXUtZGV2ZWwvcGF0Y2gvMjAy
MDA4MjYxMzE5MTAuMTg3OTA3OS0xLWxpYW5ncGVuZzEwQGh1YXdlaS5jb20vCiZndDsmZ3Q7IAom
Z3Q7CiZndDtJbiB0aGlzIHBhdGNoIHlvdSBjcmVhdGUgam9iIG92ZXIgb3JpZ2luYWwgYnMsIHdo
ZW4gam9icyBhcmUgbm9ybWFsbHkgY3JlYXRlZCBvdmVyIGpvYi1maWx0ZXIgYnMuIEkgZG9uJ3Qg
a25vdyBpcyBpdCB3cm9uZywgYnV0IGl0IGF0IGxlYXN0IHJlcXVpcmVzIHNvbWUgcmVzZWFyY2gs
IGFuZCBwcm9iYWJseSB0aGUgY29kZSB0aGF0IHJlbW92ZXMgdGhlIGZpbHRlciBzaG91bGQgYmUg
YWRqdXN0ZWQgc29tZWhvdy4gQWxzbywgeW91IG1ha2UgYnMtJmd0O29wYXF1ZSBiZSBub24temVy
by4gQnV0IHN0aWxsLCBqb2IgaXMgbm90IGZ1bGx5IGluaXRpYWxpemVkLCBhbmQgc29tZSBhbm90
aGVyIHByb2JsZW0gbWF5IG9jY3VyLiBTbywgZG8gd2UgY3JlYXRlIGpvYiBwcmlvciB0byBmaWx0
ZXIgaW5zZXJ0aW9uIG9yIGFmdGVyIGl0LCBwYXJhbGxlbCBpbyByZXF1ZXN0cyB0byBicyBzaG91
bGQgbm90IGludGVycnVwdCBtaXJyb3Jfc3RhcnRfam9iKCkuIFNvIEkgdGhpbmsgTWljaGFlbCdz
IHBhdGNoIGlzIGNsb3NlciB0byByZWFsIHByb2JsZW0gdG8gZml4LgomZ3Q7CiZndDsKJmd0Oy0t
IAomZ3Q7QmVzdCByZWdhcmRzLAomZ3Q7VmxhZGltaXIKPC9wcmU+PC9kaXY+PGJyPjxicj48c3Bh
biB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_49832_1303739125.1612184972631--


