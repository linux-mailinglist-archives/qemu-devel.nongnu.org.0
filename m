Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655FA33F121
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:26:36 +0100 (CET)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWC3-0007zC-E8
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMWAr-00070Q-LF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:25:21 -0400
Resent-Date: Wed, 17 Mar 2021 09:25:21 -0400
Resent-Message-Id: <E1lMWAr-00070Q-LF@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMWAo-0005WH-FY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:25:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615987489; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XpfF5/tmhM6ZhOWOEPVirKDOxifyZ9Z6Ggu98AYteTiscvhIJw/wpZwyh7xiTWLStPNGukRM/jvfXHBW5iv/JL6G7sj8KbR/cimL8oYswTRxjDCH+njF10QAFcnmjCx9imyh/gW6ESapxaNv/RS8dcGgINtz9oQdoEhy/fKPhJU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615987489;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=HH83vPvBAk2mIvkB76CsafnW79/ucNsb+mu0yHxI5z8=; 
 b=hS/hd6aMq1RBINimI7VlmZaCAvxoHF/RKJirM76S+GRIcvPyXl2D+/nwJV2pFVVTJo9jycA9Pr/BRUT6+vMGsRGnBroq48mnhf3tBX4TkGOqGpl1TrMj8zHA1GNLUOXA+rFttTg6uz1ZYK9sMZbUuW6BokW6I+8Mcoynxyqv3kY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615987486310941.3762774875769;
 Wed, 17 Mar 2021 06:24:46 -0700 (PDT)
In-Reply-To: <20210317125457.5733-1-arkaisp2021@gmail.com>
Subject: Re: [PATCH v2] block: increased maximum size of vvfat devices
Message-ID: <161598748470.29996.5892485801339811586@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: arkaisp2021@gmail.com
Date: Wed, 17 Mar 2021 06:24:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 arkaisp2021@gmail.com, ivanovrkasha@gmail.com, pavel.dovgaluk@ispras.ru,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNzEyNTQ1Ny41NzMz
LTEtYXJrYWlzcDIwMjFAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTcxMjU0NTcuNTcz
My0xLWFya2Fpc3AyMDIxQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIGJsb2NrOiBpbmNy
ZWFzZWQgbWF4aW11bSBzaXplIG9mIHZ2ZmF0IGRldmljZXMKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMTcxMjU0NTcuNTczMy0xLWFya2Fpc3Ay
MDIxQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzIwMjEwMzE3MTI1NDU3LjU3MzMtMS1hcmthaXNwMjAy
MUBnbWFpbC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3MjJmNjgxIGJsb2Nr
OiBpbmNyZWFzZWQgbWF4aW11bSBzaXplIG9mIHZ2ZmF0IGRldmljZXMKCj09PSBPVVRQVVQgQkVH
SU4gPT09CkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMxNDA6IEZJTEU6IGJsb2NrL3Z2ZmF0
LmM6MTI2MDoKKyAgICAgICAgICAgICAgICAgICAgICBzLT5zZWN0b3JzX3Blcl9jbHVzdGVyLCBz
LT5mYXRfdHlwZSwgc3VtLCAkCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDE0MSBsaW5l
cyBjaGVja2VkCgpDb21taXQgNzIyZjY4MThiZjkxIChibG9jazogaW5jcmVhc2VkIG1heGltdW0g
c2l6ZSBvZiB2dmZhdCBkZXZpY2VzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VU
UFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMxNzEyNTQ1
Ny41NzMzLTEtYXJrYWlzcDIwMjFAZ21haWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==

