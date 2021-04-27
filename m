Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA736BCA7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 02:29:57 +0200 (CEST)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbBbs-0000qs-9H
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 20:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbBa7-0008QB-7B; Mon, 26 Apr 2021 20:28:03 -0400
Resent-Date: Mon, 26 Apr 2021 20:28:03 -0400
Resent-Message-Id: <E1lbBa7-0008QB-7B@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbBa4-0002st-Gw; Mon, 26 Apr 2021 20:28:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619483271; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PistK79IWyNwFJZ+UKgLf8InUQwnr7KIv9hi4/UckgWf8uuldqHX1imEosj5PiJYUZKyv61NvL+Kb5jH3GGgIt9PngjfY99PcCd9Fs8oDsjo7jIr7fWZcbaAT1KiuaBgRxogf6CB0K1LQup/lZ9qmYqlMIxzVUnmv6PJII5NCrw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619483271;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=q3XaUyw2LnMllJAQOyunmaVZF/zd7ErElS0L9dVJmxQ=; 
 b=DdjbgAkvZ27fmMv1Mn0RgSkTs7930hV8S7Zcc//OQL4z2btklelkZupG491QygRpOUCpL2rLU+A4l3RyCBToJTDeYhifTAmmB7Ha0b/GXndmvJXHfeorIt3ymppZdDr10t2F7CmFiGqhDTGmPjFtyWk76bx8sNkWqdUV78swQKA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619483268210137.9999609406176;
 Mon, 26 Apr 2021 17:27:48 -0700 (PDT)
In-Reply-To: <20210426200553.145976-2-dev.devaqemu@gmail.com>
Subject: Re: [PATCH] skip virtio fs cache section to enable NIC passthrough
Message-ID: <161948326671.17047.16287286996009216616@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: dev.devaqemu@gmail.com
Date: Mon, 26 Apr 2021 17:27:48 -0700 (PDT)
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
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, dgilber@redhat.com,
 qemu-devel@nongnu.org, dev.devaqemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyNjIwMDU1My4xNDU5
NzYtMi1kZXYuZGV2YXFlbXVAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MjYyMDA1NTMu
MTQ1OTc2LTItZGV2LmRldmFxZW11QGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIHNraXAgdmly
dGlvIGZzIGNhY2hlIHNlY3Rpb24gdG8gZW5hYmxlIE5JQyBwYXNzdGhyb3VnaAoKPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251
bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFs
Z29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNl
Li4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0
ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9q
ZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDQyNjIwMDU1My4xNDU5
NzYtMi1kZXYuZGV2YXFlbXVAZ21haWwuY29tIC0+IHBhdGNoZXcvMjAyMTA0MjYyMDA1NTMuMTQ1
OTc2LTItZGV2LmRldmFxZW11QGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCjEyMGExYjAgc2tpcCB2aXJ0aW8gZnMgY2FjaGUgc2VjdGlvbiB0byBlbmFibGUgTklDIHBh
c3N0aHJvdWdoCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxk
IG5ldmVyIHVzZSB0YWJzCiMyMzogRklMRTogaHcvdmZpby9jb21tb24uYzo1NDA6CisgICAgXkkg
ICAoIW1lbW9yeV9yZWdpb25faXNfcmFtKHNlY3Rpb24tPm1yKSAmJiQKCnRvdGFsOiAxIGVycm9y
cywgMCB3YXJuaW5ncywgOSBsaW5lcyBjaGVja2VkCgpDb21taXQgMTIwYTFiMGVjOWRlIChza2lw
IHZpcnRpbyBmcyBjYWNoZSBzZWN0aW9uIHRvIGVuYWJsZSBOSUMgcGFzc3Rocm91Z2gpIGhhcyBz
dHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJl
IGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNL
UEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4
aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9w
YXRjaGV3Lm9yZy9sb2dzLzIwMjEwNDI2MjAwNTUzLjE0NTk3Ni0yLWRldi5kZXZhcWVtdUBnbWFp
bC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

