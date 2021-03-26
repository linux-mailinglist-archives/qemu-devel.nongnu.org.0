Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3134A2FD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:11:53 +0100 (CET)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhZP-0008P3-75
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPhXt-0007nz-BD
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:10:17 -0400
Resent-Date: Fri, 26 Mar 2021 04:10:17 -0400
Resent-Message-Id: <E1lPhXt-0007nz-BD@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lPhXr-0006jY-3s
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:10:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616746189; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=f/SmG5I4oDQka2mOTlNcsB80XhAKeEDqOsN0BT1Fu/Xi8wf+FVrPckLJJDXelFJxReNisEyLrzqBkGDEgHft6exQOhmy1zyBlSu23l4RYSybE+s2+PsW5txe0ewo+YP3tpFgSsONBdQA8dzEGZy6GMdG8eXWLt8HH+X9iMusEr0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616746189;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=WUfbqS9OYYeVp4tDk/wFjHg+0mNC5qq+TnjyQ723WHA=; 
 b=b6l3iLX2GNGPMCZTCwYiWqvzQSjMWikDokz4ztgjGtlJPr/42Hbl0yrwGA+i+bIV+SznFIAqJDTGrVmOQ8hwdjJXIsCIul34faoiPaRk23wvdYPR1XcyBT6ScI1unUMpk7QhhwCquA4uHZ8zqCwxC2ULnVM3QYLhyftDr4ocTEc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 161674618673481.09460830454486;
 Fri, 26 Mar 2021 01:09:46 -0700 (PDT)
In-Reply-To: <cover.1616744509.git.lukasstraub2@web.de>
Subject: Re: [PATCH v4 0/4] yank: Add chardev tests and fixes
Message-ID: <161674618525.8221.939854043515059690@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lukasstraub2@web.de
Date: Fri, 26 Mar 2021 01:09:46 -0700 (PDT)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjE2NzQ0NTA5Lmdp
dC5sdWthc3N0cmF1YjJAd2ViLmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogY292ZXIuMTYxNjc0NDUwOS5naXQu
bHVrYXNzdHJhdWIyQHdlYi5kZQpTdWJqZWN0OiBbUEFUQ0ggdjQgMC80XSB5YW5rOiBBZGQgY2hh
cmRldiB0ZXN0cyBhbmQgZml4ZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBkYXRlXSAg
ICAgIHBhdGNoZXcvMjAyMTAzMjMxODM3MDEuMjgxMTUyLTEtZjRidWdAYW1zYXQub3JnIC0+IHBh
dGNoZXcvMjAyMTAzMjMxODM3MDEuMjgxMTUyLTEtZjRidWdAYW1zYXQub3JnCiAqIFtuZXcgdGFn
XSAgICAgICAgIHBhdGNoZXcvY292ZXIuMTYxNjc0NDUwOS5naXQubHVrYXNzdHJhdWIyQHdlYi5k
ZSAtPiBwYXRjaGV3L2NvdmVyLjE2MTY3NDQ1MDkuZ2l0Lmx1a2Fzc3RyYXViMkB3ZWIuZGUKU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpiMGU3NjAyIHRlc3RzOiBBZGQgdGVzdHMgZm9y
IHlhbmsgd2l0aCB0aGUgY2hhcmRldi1jaGFuZ2UgY2FzZQpmMDY1MDAwIGNoYXJkZXY6IEZpeCB5
YW5rIHdpdGggdGhlIGNoYXJkZXYtY2hhbmdlIGNhc2UKZTAwNmRjYyBjaGFyZGV2L2NoYXIuYzog
QWx3YXlzIHBhc3MgaWQgdG8gY2hhcmRldl9uZXcKOGExMTMwNyBjaGFyZGV2L2NoYXIuYzogTW92
ZSBvYmplY3RfcHJvcGVydHlfdHJ5X2FkZF9jaGlsZCBvdXQgb2YgY2hhcmRldl9uZXcKCj09PSBP
VVRQVVQgQkVHSU4gPT09CjEvNCBDaGVja2luZyBjb21taXQgOGExMTMwNzRlNjgyIChjaGFyZGV2
L2NoYXIuYzogTW92ZSBvYmplY3RfcHJvcGVydHlfdHJ5X2FkZF9jaGlsZCBvdXQgb2YgY2hhcmRl
dl9uZXcpCjIvNCBDaGVja2luZyBjb21taXQgZTAwNmRjY2ZkZjdlIChjaGFyZGV2L2NoYXIuYzog
QWx3YXlzIHBhc3MgaWQgdG8gY2hhcmRldl9uZXcpCjMvNCBDaGVja2luZyBjb21taXQgZjA2NTAw
MDM1NTc2IChjaGFyZGV2OiBGaXggeWFuayB3aXRoIHRoZSBjaGFyZGV2LWNoYW5nZSBjYXNlKQo0
LzQgQ2hlY2tpbmcgY29tbWl0IGIwZTc2MDJlNDgwMCAodGVzdHM6IEFkZCB0ZXN0cyBmb3IgeWFu
ayB3aXRoIHRoZSBjaGFyZGV2LWNoYW5nZSBjYXNlKQpFUlJPUjogTWFjcm9zIHdpdGggbXVsdGlw
bGUgc3RhdGVtZW50cyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gYSBkbyAtIHdoaWxlIGxvb3AKIzIy
ODogRklMRTogdGVzdHMvdW5pdC90ZXN0LXlhbmsuYzoxNzk6CisjZGVmaW5lIENIQVJfQ0hBTkdF
X1RFU1QobmFtZSwgX29sZF95YW5rLCBfbmV3X3lhbmspICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAorICAgICAgICBnX3Rlc3RfYWRkX2RhdGFfZnVuYygiL3lhbmsvY2hhcl9jaGFuZ2Uvc3Vj
Y2Vzcy8iICMgbmFtZSwgICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJihDaGFyQ2hhbmdlVGVzdENvbmZpZykgeyAuYWRkciA9ICZ0Y3BhZGRyLCAgICAgICBcCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLm9s
ZF95YW5rID0gKF9vbGRfeWFuayksXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC5uZXdfeWFuayA9IChfbmV3X3lhbmspLFwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuZmFpbCA9IGZh
bHNlIH0sICAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXJfY2hhbmdl
X3Rlc3QpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBnX3Rlc3Rf
YWRkX2RhdGFfZnVuYygiL3lhbmsvY2hhcl9jaGFuZ2UvZmFpbC8iICMgbmFtZSwgICAgICAgICAg
ICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJihDaGFyQ2hhbmdlVGVzdENv
bmZpZykgeyAuYWRkciA9ICZ0Y3BhZGRyLCAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLm9sZF95YW5rID0gKF9vbGRfeWFuayks
XAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC5uZXdfeWFuayA9IChfbmV3X3lhbmspLFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAuZmFpbCA9IHRydWUgfSwgICAgICAgICBcCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXJfY2hhbmdlX3Rlc3QpOwoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCAyMTUgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNC80IGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQg
d2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy9jb3Zlci4xNjE2NzQ0NTA5LmdpdC5sdWthc3N0cmF1YjJAd2ViLmRlL3Rlc3Rp
bmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRp
Y2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3Vy
IGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

