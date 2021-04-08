Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC79A3584AB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:29:14 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUig-00078V-0P
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <puwen@hygon.cn>) id 1lUUh4-00066I-TD
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:27:34 -0400
Received: from [110.188.70.11] (port=32053 helo=spam2.hygon.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <puwen@hygon.cn>) id 1lUUh1-0004uB-27
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:27:33 -0400
Received: from spam2.hygon.cn (localhost [127.0.0.2] (may be forged))
 by spam2.hygon.cn with ESMTP id 138D1BTR043292
 for <qemu-devel@nongnu.org>; Thu, 8 Apr 2021 21:01:11 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from MK-FE.hygon.cn ([172.23.18.61])
 by spam2.hygon.cn with ESMTP id 138CxXFc042629;
 Thu, 8 Apr 2021 20:59:33 +0800 (GMT-8) (envelope-from puwen@hygon.cn)
Received: from cncheex02.Hygon.cn ([172.23.18.12])
 by MK-FE.hygon.cn with ESMTP id 138CxVi6086253;
 Thu, 8 Apr 2021 20:59:31 +0800 (GMT-8) (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex02.Hygon.cn
 (172.23.18.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Thu, 8 Apr 2021
 20:59:32 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Thu, 8 Apr 2021 20:59:32 +0800
From: Wen Pu <puwen@hygon.cn>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC] target/i386: Add Intel CPU model versions supporting
 'xsaves'
Thread-Topic: [PATCH RFC] target/i386: Add Intel CPU model versions supporting
 'xsaves'
Thread-Index: AQHXK8UMJzz2NKmnOkaug03xbtMMlqqqEGGA
Date: Thu, 8 Apr 2021 12:59:32 +0000
Message-ID: <e6500701-19e5-d779-0326-376a110c5514@hygon.cn>
References: <20210407154342.640584-1-vkuznets@redhat.com>
In-Reply-To: <20210407154342.640584-1-vkuznets@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <428220761C9B1547A943C85B0C9F96D3@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 138D1BTR043292
X-DNSRBL: 
X-Host-Lookup-Failed: Reverse DNS lookup failed for 110.188.70.11 (failed)
Received-SPF: permerror client-ip=110.188.70.11; envelope-from=puwen@hygon.cn;
 helo=spam2.hygon.cn
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, MAY_BE_FORGED=2.799,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMjAyMS80LzcgMjM6NDMsIFZpdGFseSBLdXpuZXRzb3Ygd3JvdGU6DQo+IEh5cGVyLVYgMjAx
NiByZWZ1c2VzIHRvIGJvb3Qgb24gU2t5bGFrZSsgQ1BVIG1vZGVscyBiZWNhdXNlIHRoZXkgbGFj
aw0KPiAneHNhdmVzJy8ndm14LXhzYXZlcycgZmVhdHVyZXMgYW5kIHRoaXMgZGl2ZXJnZXMgZnJv
bSByZWFsIGhhcmR3YXJlLiBUaGUNCj4gc2FtZSBpc3N1ZSBlbWVyZ2VzIHdpdGggQU1EICJFUFlD
IiBDUFUgbW9kZWwgcHJpb3IgdG8gdmVyc2lvbiAzIHdoaWNoIGdvdA0KPiAneHNhdmVzJyBhZGRl
ZC4gRVBZQy1Sb21lL0VQWUMtTWlsYW4gQ1BVIG1vZGVscyBoYXZlICd4c2F2ZXMnIGVuYWJsZWQg
ZnJvbQ0KPiB0aGUgdmVyeSBiZWdpbm5pbmcgc28gdGhlIGNvbW1lbnQgYmxhbWluZyBLVk0gdG8g
ZXhwbGFpbiB3aHkgSW50ZWwgQ1BVcw0KPiBsYWNrICd4c2F2ZXMnIGlzIGxpa2VseSBvdXRkYXRl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhh
dC5jb20+DQo+IC0tLQ0KPiBUaGUgb25seSBDUFUgbW9kZWwgd2hlcmUgSSBrZWVwIHRoZSBvcmln
aW5hbCBjb21tZW50IGFuZCBkb24ndCBhZGQNCj4gYSB2ZXJzaW9uIHN1cHBvcnRpbmcgJ3hzYXZl
cycgaXMgIkh5Z29uIERoeWFuYSIgYXMgSSBkb24ndCBrbm93IG11Y2gNCj4gYWJvdXQgaXQuDQoN
CkhpIFZpdGFseSwNCg0KSHlnb24gRGh5YW5hIHN1cHBvcnRzICd4c2F2ZXMnLCBjb3VsZCB5b3Ug
cGxlYXNlIGFkZCBhIHZlcnNpb24gc3VwcG9ydGluZw0KJ3hzYXZlcycgZm9yIEh5Z29uICJEaHlh
bmEiPw0KDQpUaGFua3MuDQoNCi0tIA0KUmVnYXJkcywNClB1IFdlbg==

