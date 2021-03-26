Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7D34B19F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:56:33 +0100 (CET)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPuRU-0004mE-Nn
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPuQ1-000476-3h
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:55:01 -0400
Resent-Date: Fri, 26 Mar 2021 17:55:01 -0400
Resent-Message-Id: <E1lPuQ1-000476-3h@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPuPy-00088U-RX
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:55:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616795686; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QpEAaNtTXZp1Dwb1e1CaP+FNGqFJyUc4umGkgFxKq1rKA5O/KFCo7KEYr+lToLjgxO4Ep+L88E344CryI22zCztOv+1bKpzNzWHIPasvXUmsdXDt3cTA1lVe3KGEC1o7FG17hH4DU4Z0uRrEFOpkHqVWpN1R1IOjwQpmt/sHiNs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616795686;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Fjo95N2XcZh4RQe7W/xo3y3vgYWBtdx/dBGbZnQJrsg=; 
 b=CBcN9IXyzpteqUG4+WU4Snbuzch10uqwOTCEEZzsQr0ZzEW15mENfPpyJonym5R1V4l4FS0LmHWSDzuMLmWgKqtglmygWCs5CdhUy57Oj75ys9/2KIlL5tQLKXBfQ6n8uZU5exeoiwzaB+pTzxagk6gjUl6gnhXaZUXhGnWwlpo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616795684797210.2257483634769;
 Fri, 26 Mar 2021 14:54:44 -0700 (PDT)
In-Reply-To: <cover.1616794852.git.lukasstraub2@web.de>
Subject: Re: [PATCH v5 0/4] yank: Add chardev tests and fixes
Message-ID: <161679568352.21878.16847327682221094070@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lukasstraub2@web.de
Date: Fri, 26 Mar 2021 14:54:44 -0700 (PDT)
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 zhlcindy@gmail.com, pbonzini@redhat.com, marcandre.lureau@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjE2Nzk0ODUyLmdp
dC5sdWthc3N0cmF1YjJAd2ViLmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogY292ZXIuMTYxNjc5NDg1Mi5naXQu
bHVrYXNzdHJhdWIyQHdlYi5kZQpTdWJqZWN0OiBbUEFUQ0ggdjUgMC80XSB5YW5rOiBBZGQgY2hh
cmRldiB0ZXN0cyBhbmQgZml4ZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAg
ICAgIHBhdGNoZXcvY292ZXIuMTYxNjc5NDg1Mi5naXQubHVrYXNzdHJhdWIyQHdlYi5kZSAtPiBw
YXRjaGV3L2NvdmVyLjE2MTY3OTQ4NTIuZ2l0Lmx1a2Fzc3RyYXViMkB3ZWIuZGUKU3dpdGNoZWQg
dG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo2ZTQ3OTc4IHRlc3RzOiBBZGQgdGVzdHMgZm9yIHlhbmsg
d2l0aCB0aGUgY2hhcmRldi1jaGFuZ2UgY2FzZQowMTI0MDViIGNoYXJkZXY6IEZpeCB5YW5rIHdp
dGggdGhlIGNoYXJkZXYtY2hhbmdlIGNhc2UKODhmYjVlOCBjaGFyZGV2L2NoYXIuYzogQWx3YXlz
IHBhc3MgaWQgdG8gY2hhcmRldl9uZXcKZWVhN2NjMyBjaGFyZGV2L2NoYXIuYzogTW92ZSBvYmpl
Y3RfcHJvcGVydHlfdHJ5X2FkZF9jaGlsZCBvdXQgb2YgY2hhcmRldl9uZXcKCj09PSBPVVRQVVQg
QkVHSU4gPT09CjEvNCBDaGVja2luZyBjb21taXQgZWVhN2NjMzkyMDJkIChjaGFyZGV2L2NoYXIu
YzogTW92ZSBvYmplY3RfcHJvcGVydHlfdHJ5X2FkZF9jaGlsZCBvdXQgb2YgY2hhcmRldl9uZXcp
CjIvNCBDaGVja2luZyBjb21taXQgODhmYjVlOGQ0NzM1IChjaGFyZGV2L2NoYXIuYzogQWx3YXlz
IHBhc3MgaWQgdG8gY2hhcmRldl9uZXcpCjMvNCBDaGVja2luZyBjb21taXQgMDEyNDA1YjM3Nzcw
IChjaGFyZGV2OiBGaXggeWFuayB3aXRoIHRoZSBjaGFyZGV2LWNoYW5nZSBjYXNlKQo0LzQgQ2hl
Y2tpbmcgY29tbWl0IDZlNDc5NzgxYjYwNSAodGVzdHM6IEFkZCB0ZXN0cyBmb3IgeWFuayB3aXRo
IHRoZSBjaGFyZGV2LWNoYW5nZSBjYXNlKQpFUlJPUjogTWFjcm9zIHdpdGggbXVsdGlwbGUgc3Rh
dGVtZW50cyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gYSBkbyAtIHdoaWxlIGxvb3AKIzIzMTogRklM
RTogdGVzdHMvdW5pdC90ZXN0LXlhbmsuYzoxODA6CisjZGVmaW5lIENIQVJfQ0hBTkdFX1RFU1Qo
bmFtZSwgX29sZF95YW5rLCBfbmV3X3lhbmspICAgICAgICAgICAgICAgICAgICAgICAgICAgXAor
ICAgICAgICBnX3Rlc3RfYWRkX2RhdGFfZnVuYygiL3lhbmsvY2hhcl9jaGFuZ2Uvc3VjY2Vzcy8i
ICMgbmFtZSwgICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJihD
aGFyQ2hhbmdlVGVzdENvbmZpZykgeyAuYWRkciA9ICZ0Y3BhZGRyLCAgICAgICBcCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLm9sZF95YW5r
ID0gKF9vbGRfeWFuayksXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC5uZXdfeWFuayA9IChfbmV3X3lhbmspLFwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuZmFpbCA9IGZhbHNlIH0s
ICAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXJfY2hhbmdlX3Rlc3Qp
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBnX3Rlc3RfYWRkX2Rh
dGFfZnVuYygiL3lhbmsvY2hhcl9jaGFuZ2UvZmFpbC8iICMgbmFtZSwgICAgICAgICAgICAgICAg
IFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJihDaGFyQ2hhbmdlVGVzdENvbmZpZykg
eyAuYWRkciA9ICZ0Y3BhZGRyLCAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLm9sZF95YW5rID0gKF9vbGRfeWFuayksXAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5uZXdf
eWFuayA9IChfbmV3X3lhbmspLFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAuZmFpbCA9IHRydWUgfSwgICAgICAgICBcCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNoYXJfY2hhbmdlX3Rlc3QpOwoKdG90YWw6IDEgZXJyb3JzLCAw
IHdhcm5pbmdzLCAyMTYgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNC80IGhhcyBzdHlsZSBwcm9ibGVt
cywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0
aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJ
TlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcv
bG9ncy9jb3Zlci4xNjE2Nzk0ODUyLmdpdC5sdWthc3N0cmF1YjJAd2ViLmRlL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

