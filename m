Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D789423EE54
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 15:37:38 +0200 (CEST)
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k42Yz-0008GK-Vi
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 09:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linwei6@ruijie.com.cn>)
 id 1k3rOK-0000sG-23
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 21:41:52 -0400
Received: from mxfz.ruijie.com.cn ([120.35.11.201]:48979
 helo=FZEX4.ruijie.com.cn)
 by eggs.gnu.org with esmtps (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <linwei6@ruijie.com.cn>)
 id 1k3rOF-0008Dv-Q3
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 21:41:49 -0400
Received: from FZEX3.ruijie.com.cn ([fe80::9480:e49e:2190:b001]) by
 FZEX4.ruijie.com.cn ([fe80::4814:fd0d:3b:861c%16]) with mapi id
 14.03.0123.003; Fri, 7 Aug 2020 09:34:45 +0800
From: <linwei6@ruijie.com.cn>
To: <qemu-devel@nongnu.org>
Subject: any virtio-mac80211 (alternative) implementations
Thread-Topic: any virtio-mac80211 (alternative) implementations
Thread-Index: AQHWbFrtRu47+qiyQ0GkgYJGGgCC2A==
Date: Fri, 7 Aug 2020 01:34:44 +0000
Message-ID: <8d001dcb4089f282b2c05406c152db8e257cf005.camel@ruijie.com.cn>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.101.236]
Content-Type: text/plain; charset="utf-8"
Content-ID: <97085D8A69EF1540A6C678EB3CF508F7@ruijie.com.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=120.35.11.201; envelope-from=linwei6@ruijie.com.cn;
 helo=FZEX4.ruijie.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 21:35:06
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Aug 2020 09:36:22 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSBzZWUgYSBwcm9qZWN0IG9uIGdpdGh1YiBodHRwczovL2dpdGh1Yi5jb20vcmE3bmFyYWptL3Zp
cnRpby1tYWM4MDIxMQ0KDQp3aGljaCBzZWVtcyBsaWtlIGEgaW1wbGVtZW50YXRpb24gb2Ygdmly
dC13aWZpIGluIFZNDQoNCmFmdGVyIEkgZGlnIGludG8gdGhlIHByb2plY3QgYW5kIHRyeSB3aGF0
IHRoZSBhdXRob3Igc2F5LA0KSSBmb3VuZCBpdCB3YXMgYW4gdW5maW5pc2hlZCBwcm9qZWN0LCht
YXliZSwgc28gZmFyIGFzIEkgY2FuIHRlbGwpDQoNCklzIGFueSBvbmUgZ290IGFueSBpZGVhcyBh
Ym91dCB0aGlzIHByb2plY3Qgb3IgYW55IGFsdGVybmF0aXZlDQpzb2x1dGlvbnModmlydC13aWZp
IGluIFZNKT8NCg0KSG93IGNhbiBJIHV0aWxpemUgdGhlIHdpZmkgY2FyZCBvbiBIT1NUIG1hY2hp
bmUgZm9yIFZNPw0K

