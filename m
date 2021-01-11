Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57542F11A4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:41:11 +0100 (CET)
Received: from localhost ([::1]:53342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvZO-0006Di-PW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kyvYF-0005nL-Rw
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:39:59 -0500
Resent-Date: Mon, 11 Jan 2021 06:39:59 -0500
Resent-Message-Id: <E1kyvYF-0005nL-Rw@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kyvYD-0001z3-Ga
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:39:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610365189; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CHruopH4nVrZkkwSH62CkcOwtK56R3E96wz281DWCI4aOiiMJTGvNWgL/WmyeUIT68yDnc0BrtRvmFFjHD9fztK6SVbHRktkXCc7429znNvfMCOAwJqvmwcNcBYGuqJISv8yNglQucgUovHHdJ9nZ3FHvTf/zO81m2IL17POCb8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610365189;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=fkeTRiT7d+hPpDsVk9rzG59Hx8keOZtJp60sUvKhOhk=; 
 b=JZQVnDPlgYs9nAh70EqBBTH/0UxpiqgshGjhxf208ovADtyt1YxMfeIoknLtF0mWlKvRKS61yZb0sdx2ntKZS8c7CvtMXsXxa8wS+eQw7qyria77OonusekOozJC8E9bkMLv1bcWjSVvudQ4Am6VvjndJ+yjV9vMY7FS2gYm5tA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610365186716720.8954921199083;
 Mon, 11 Jan 2021 03:39:46 -0800 (PST)
In-Reply-To: <cover.1610364304.git.mrezanin@redhat.com>
Subject: Re: [RHEL7 qemu-kvm PATCH 0/3] Fixing several GCC 11 warnings
Message-ID: <161036518562.99.12385833291548097203@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mrezanin@redhat.com
Date: Mon, 11 Jan 2021 03:39:46 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjEwMzY0MzA0Lmdp
dC5tcmV6YW5pbkByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogY292ZXIuMTYxMDM2NDMwNC5naXQu
bXJlemFuaW5AcmVkaGF0LmNvbQpTdWJqZWN0OiBbUkhFTDcgcWVtdS1rdm0gUEFUQ0ggMC8zXSBG
aXhpbmcgc2V2ZXJhbCBHQ0MgMTEgd2FybmluZ3MKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcg
dGFnXSAgICAgICAgIHBhdGNoZXcvY292ZXIuMTYxMDM2NDMwNC5naXQubXJlemFuaW5AcmVkaGF0
LmNvbSAtPiBwYXRjaGV3L2NvdmVyLjE2MTAzNjQzMDQuZ2l0Lm1yZXphbmluQHJlZGhhdC5jb20K
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpjMDVhMGM0IEZpeCB0Y2dfb3V0X29wIGFy
Z3VtZW50IG1pc21hdGNoIHdhcm5pbmcKYThiOGFjZSBzMzkweDogRml4IHZtIG5hbWUgY29weSBs
ZW5ndGgKYjY0ZTc1NCBGaXggbmV0LmMgd2FybmluZyBvbiBHQ0MgMTEKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvMyBDaGVja2luZyBjb21taXQgYjY0ZTc1NGQxOTNmIChGaXggbmV0LmMgd2Fybmlu
ZyBvbiBHQ0MgMTEpCjIvMyBDaGVja2luZyBjb21taXQgYThiOGFjZTQ4NGY4IChzMzkweDogRml4
IHZtIG5hbWUgY29weSBsZW5ndGgpCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMzNjogRklM
RTogdGFyZ2V0L3MzOTB4L21pc2NfaGVscGVyLmM6MzcyOgorXkleSW1lbXNldCgoY2hhciAqKXN5
c2liLnN5c2liXzMyMi5leHRfbmFtZXNbMF0sIDAsICQKCkVSUk9SOiBjb2RlIGluZGVudCBzaG91
bGQgbmV2ZXIgdXNlIHRhYnMKIzM2OiBGSUxFOiB0YXJnZXQvczM5MHgvbWlzY19oZWxwZXIuYzoz
NzI6CiteSV5JbWVtc2V0KChjaGFyICopc3lzaWIuc3lzaWJfMzIyLmV4dF9uYW1lc1swXSwgMCwg
JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMzc6IEZJTEU6IHRh
cmdldC9zMzkweC9taXNjX2hlbHBlci5jOjM3MzoKK15JXkkgICAgICAgc2l6ZW9mKHN5c2liLnN5
c2liXzMyMi5leHRfbmFtZXNbMF0pKTskCgp0b3RhbDogMyBlcnJvcnMsIDAgd2FybmluZ3MsIDE5
IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy8z
IENoZWNraW5nIGNvbW1pdCBjMDVhMGM0ZWQ0NDcgKEZpeCB0Y2dfb3V0X29wIGFyZ3VtZW50IG1p
c21hdGNoIHdhcm5pbmcpCkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRv
dGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTggbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy8zIGhh
cyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMK
YXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNI
RUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFu
ZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy9jb3Zlci4xNjEwMzY0MzA0LmdpdC5tcmV6YW5pbkByZWRoYXQu
Y29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

