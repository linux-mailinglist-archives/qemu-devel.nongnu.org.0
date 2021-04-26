Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68E36B413
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:21:02 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1Ab-0000Wt-72
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lb18l-00085A-J2
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:19:07 -0400
Resent-Date: Mon, 26 Apr 2021 09:19:07 -0400
Resent-Message-Id: <E1lb18l-00085A-J2@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lb18j-0003Bf-1y
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:19:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619443132; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ru2gf633EFl5nAy0gR8oEcgKK83rGAQKCF6EYJuC0XzsbBMFJtO0Ct62h6L3sAhQlkAr806WEU/NNv1vtahs/0MZxCBf717lx4eRm6ZRsZyR46EZ2fUVug2cG9ZYp9SPIbHX4W8nO8O6145TDTYWfvlP4fF9krWLUebhR1Aiwtw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619443132;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=wWPFr/UZ/lz5jdy+8FxOndIUGra3IpmXslDzPoPE8Lk=; 
 b=OL/22vScHwZzM12Ouzt/jbHeNOpKUVuDWZXF4deSfDaGO2DD+cDSLeSH/XNfFaCImvyRrtUYde0b05I2sbvt+mzEtlmHMVrARwIrqNqEWODOXNKdgKhgqZci3ut1P1R+mgAaFWluqE9SCgFBjj2mTPbYkIQW2UFI50nUgj8FLCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 161944312682343.93171687392919;
 Mon, 26 Apr 2021 06:18:46 -0700 (PDT)
In-Reply-To: <20210426054513.132980-2-edgenfv@gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together by skipping virtio
 fs cache section during vfio memory region add
Message-ID: <161944312564.3515.4044111102616711065@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: edgenfv@gmail.com
Date: Mon, 26 Apr 2021 06:18:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, edgenfv@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyNjA1NDUxMy4xMzI5
ODAtMi1lZGdlbmZ2QGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNDI2MDU0NTEzLjEzMjk4
MC0yLWVkZ2VuZnZAZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSF0gbWFrZSB2ZmlvIGFuZCBEQVgg
Y2FjaGUgd29yayB0b2dldGhlciBieSBza2lwcGluZyB2aXJ0aW8gZnMgY2FjaGUgc2VjdGlvbiBk
dXJpbmcgdmZpbyBtZW1vcnkgcmVnaW9uIGFkZAoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0
YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDQyNjA1NDUxMy4xMzI5ODAtMi1lZGdlbmZ2QGdtYWls
LmNvbSAtPiBwYXRjaGV3LzIwMjEwNDI2MDU0NTEzLjEzMjk4MC0yLWVkZ2VuZnZAZ21haWwuY29t
ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMzJiZGRiMyBtYWtlIHZmaW8gYW5kIERB
WCBjYWNoZSB3b3JrIHRvZ2V0aGVyIGJ5IHNraXBwaW5nIHZpcnRpbyBmcyBjYWNoZSBzZWN0aW9u
IGR1cmluZyB2ZmlvIG1lbW9yeSByZWdpb24gYWRkCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJP
UjogdHJhaWxpbmcgd2hpdGVzcGFjZQojMjE6IEZJTEU6IGh3L3ZmaW8vY29tbW9uLmM6NjcxOgor
ICAgICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMyMjogRklMRTogaHcvdmZpby9jb21t
b24uYzo2NzI6CisgICAgLyogRG8gbm90IGFkZCB2aXJ0aW8gZnMgY2FjaGUgc2VjdGlvbiAqLyAg
ICAgICAgICAgICAgICAgICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMyOTogRklMRTog
aHcvdmZpby9jb21tb24uYzo2Nzk6CisgICAgfSAgJAoKdG90YWw6IDMgZXJyb3JzLCAwIHdhcm5p
bmdzLCAxNSBsaW5lcyBjaGVja2VkCgpDb21taXQgMzJiZGRiM2MyMjUzIChtYWtlIHZmaW8gYW5k
IERBWCBjYWNoZSB3b3JrIHRvZ2V0aGVyIGJ5IHNraXBwaW5nIHZpcnRpbyBmcyBjYWNoZSBzZWN0
aW9uIGR1cmluZyB2ZmlvIG1lbW9yeSByZWdpb24gYWRkKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIxMDQyNjA1NDUxMy4xMzI5ODAtMi1lZGdlbmZ2QGdtYWlsLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

