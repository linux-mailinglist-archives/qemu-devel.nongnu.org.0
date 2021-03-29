Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46D34D5F8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:24:39 +0200 (CEST)
Received: from localhost ([::1]:52802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvd1-0001F9-00
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQvOs-0006zC-JQ
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:10:02 -0400
Resent-Date: Mon, 29 Mar 2021 13:10:02 -0400
Resent-Message-Id: <E1lQvOs-0006zC-JQ@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQvOp-0004we-QW
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:10:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617037789; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UfOaeFepn+zJgRzufkVmxpgZtpALXPDZ3YH9guvJQ3DLca/DR8HvKL+mnL4xgI3gOFLh8A4OF4lefF4VR8W9Owb8c68f3n1xCCkUryWinSpeR6gn75ZcNtD9FWNBHAMGs7pJW9Z+j+s97+sNaILNl/yhMqYcdQI5AqIxqFtqH/Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617037789;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=1YceB/d7dDqlm5NbamhsbymiDdCjvKhQg0sVVnoMjSk=; 
 b=H40RhSX3oz5h/6GIZTxWfDF14H7gWjFXu+hc0nZMNV8hJR6CKrZ5wygSdI7wcvOGdJUo4zrVQLaZXFRtXWeJW2OWSzT5Ke4+Z3BqvhLSsGjiKWgQjOZrxWLAEuA2cp2bbriSBhzYW2BXhGyd5FOMPkQLyugtKYqgq6ZEr+gdWK8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1617037787592832.5860173875667;
 Mon, 29 Mar 2021 10:09:47 -0700 (PDT)
In-Reply-To: <cover.1617035720.git.lukasstraub2@web.de>
Subject: Re: [PATCH v6 0/4] yank: Add chardev tests and fixes
Message-ID: <161703778664.402.7856013538062978620@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lukasstraub2@web.de
Date: Mon, 29 Mar 2021 10:09:47 -0700 (PDT)
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
Cc: marcandre.lureau@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjE3MDM1NzIwLmdp
dC5sdWthc3N0cmF1YjJAd2ViLmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogY292ZXIuMTYxNzAzNTcyMC5naXQu
bHVrYXNzdHJhdWIyQHdlYi5kZQpTdWJqZWN0OiBbUEFUQ0ggdjYgMC80XSB5YW5rOiBBZGQgY2hh
cmRldiB0ZXN0cyBhbmQgZml4ZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBkYXRlXSAg
ICAgIHBhdGNoZXcvMjAyMTAzMjkxMzI2MzIuNjg5MDEtMS1tcmVpdHpAcmVkaGF0LmNvbSAtPiBw
YXRjaGV3LzIwMjEwMzI5MTMyNjMyLjY4OTAxLTEtbXJlaXR6QHJlZGhhdC5jb20KIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy9jb3Zlci4xNjE2NTcwNzAyLmdpdC52aXJlc2gua3VtYXJAbGlu
YXJvLm9yZyAtPiBwYXRjaGV3L2NvdmVyLjE2MTY1NzA3MDIuZ2l0LnZpcmVzaC5rdW1hckBsaW5h
cm8ub3JnCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvY292ZXIuMTYxNzAzNTcyMC5naXQu
bHVrYXNzdHJhdWIyQHdlYi5kZSAtPiBwYXRjaGV3L2NvdmVyLjE2MTcwMzU3MjAuZ2l0Lmx1a2Fz
c3RyYXViMkB3ZWIuZGUKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoyZjg1NTViIHRl
c3RzOiBBZGQgdGVzdHMgZm9yIHlhbmsgd2l0aCB0aGUgY2hhcmRldi1jaGFuZ2UgY2FzZQpkZjU1
ZjVlIGNoYXJkZXY6IEZpeCB5YW5rIHdpdGggdGhlIGNoYXJkZXYtY2hhbmdlIGNhc2UKYWM5NGFl
YSBjaGFyZGV2L2NoYXIuYzogQWx3YXlzIHBhc3MgaWQgdG8gY2hhcmRldl9uZXcKNTQ1YzZkYyBj
aGFyZGV2L2NoYXIuYzogTW92ZSBvYmplY3RfcHJvcGVydHlfdHJ5X2FkZF9jaGlsZCBvdXQgb2Yg
Y2hhcmRldl9uZXcKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvNCBDaGVja2luZyBjb21taXQgNTQ1
YzZkY2RiZjA1IChjaGFyZGV2L2NoYXIuYzogTW92ZSBvYmplY3RfcHJvcGVydHlfdHJ5X2FkZF9j
aGlsZCBvdXQgb2YgY2hhcmRldl9uZXcpCjIvNCBDaGVja2luZyBjb21taXQgYWM5NGFlYTE0OTZj
IChjaGFyZGV2L2NoYXIuYzogQWx3YXlzIHBhc3MgaWQgdG8gY2hhcmRldl9uZXcpCjMvNCBDaGVj
a2luZyBjb21taXQgZGY1NWY1ZTkzYzY4IChjaGFyZGV2OiBGaXggeWFuayB3aXRoIHRoZSBjaGFy
ZGV2LWNoYW5nZSBjYXNlKQo0LzQgQ2hlY2tpbmcgY29tbWl0IDJmODU1NWI1ZGM5NCAodGVzdHM6
IEFkZCB0ZXN0cyBmb3IgeWFuayB3aXRoIHRoZSBjaGFyZGV2LWNoYW5nZSBjYXNlKQpFUlJPUjog
TWFjcm9zIHdpdGggbXVsdGlwbGUgc3RhdGVtZW50cyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gYSBk
byAtIHdoaWxlIGxvb3AKIzIzMTogRklMRTogdGVzdHMvdW5pdC90ZXN0LXlhbmsuYzoxODA6Cisj
ZGVmaW5lIENIQVJfQ0hBTkdFX1RFU1QobmFtZSwgX29sZF95YW5rLCBfbmV3X3lhbmspICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBnX3Rlc3RfYWRkX2RhdGFfZnVuYygiL3lh
bmsvY2hhcl9jaGFuZ2Uvc3VjY2Vzcy8iICMgbmFtZSwgICAgICAgICAgICAgIFwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJihDaGFyQ2hhbmdlVGVzdENvbmZpZykgeyAuYWRkciA9ICZ0
Y3BhZGRyLCAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLm9sZF95YW5rID0gKF9vbGRfeWFuayksXAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5uZXdfeWFuayA9IChfbmV3
X3lhbmspLFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAuZmFpbCA9IGZhbHNlIH0sICAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNoYXJfY2hhbmdlX3Rlc3QpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAorICAgICAgICBnX3Rlc3RfYWRkX2RhdGFfZnVuYygiL3lhbmsvY2hhcl9jaGFuZ2UvZmFpbC8i
ICMgbmFtZSwgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JihDaGFyQ2hhbmdlVGVzdENvbmZpZykgeyAuYWRkciA9ICZ0Y3BhZGRyLCAgICAgICBcCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLm9sZF95
YW5rID0gKF9vbGRfeWFuayksXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC5uZXdfeWFuayA9IChfbmV3X3lhbmspLFwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuZmFpbCA9IHRydWUg
fSwgICAgICAgICBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXJfY2hhbmdlX3Rl
c3QpOwoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyMTYgbGluZXMgY2hlY2tlZAoKUGF0
Y2ggNC80IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVz
ZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy9jb3Zlci4xNjE3MDM1NzIwLmdpdC5sdWthc3N0
cmF1YjJAd2ViLmRlL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

