Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14436C175
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:06:42 +0200 (CEST)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJg1-0003TX-PO
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbJdU-0001vy-C1
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:04:04 -0400
Resent-Date: Tue, 27 Apr 2021 05:04:04 -0400
Resent-Message-Id: <E1lbJdU-0001vy-C1@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbJdQ-0005uH-Gd
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:04:04 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619514229; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eqZKdc4Q4vZGRNe8qEotvdQFuIo5fnbrK4DUwG0ZiF/FRurzS3H0oYt7iniyrEp/umbUZCaHaknU/TYyQ1Xq7cAXMQ2FyEJeOTqV3/9iJ5mgJdS1P2lbQYbsz6klLD7y5+M8TDqDedWQDAOLrm8ltHQdNSBjWhVrNh3wBRlhFRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619514229;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=k+Y+qH28yS/b9NAjEWY51T9DdKLTAQJUZRbohNsoDk0=; 
 b=BKxBIglLB6xWw+y1ReucD13yn17BDhfdto7KM/5nhXxQ26GME8jA0CZxQZa72OmQhQJP4EDcrTdDW4EGPLhD3Jsh73titJnGmrLp2xfD4U4g/erO8ikJbxrEm7kNjl8auzn/2PBzDxdYo71uDQAEyLQVS/slOHVxHM01QpReQg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619514224754984.3532976123363;
 Tue, 27 Apr 2021 02:03:44 -0700 (PDT)
In-Reply-To: <161951314717.4719.489219171575884785.malone@gac.canonical.com>
Subject: Re: [Bug 1926246] Re: chrome based apps can not be run under qemu
 user mode
Message-ID: <161951422366.28712.7900526561988962095@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1926246@bugs.launchpad.net
Date: Tue, 27 Apr 2021 02:03:44 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE5NTEzMTQ3MTcuNDcxOS40
ODkyMTkxNzE1NzU4ODQ3ODUubWFsb25lQGdhYy5jYW5vbmljYWwuY29tLwoKCgpIaSwKClRoaXMg
c2VyaWVzIHNlZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRw
dXQgYmVsb3cgZm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDog
MTYxOTUxMzE0NzE3LjQ3MTkuNDg5MjE5MTcxNTc1ODg0Nzg1Lm1hbG9uZUBnYWMuY2Fub25pY2Fs
LmNvbQpTdWJqZWN0OiBbQnVnIDE5MjYyNDZdIFJlOiBjaHJvbWUgYmFzZWQgYXBwcyBjYW4gbm90
IGJlIHJ1biB1bmRlciBxZW11IHVzZXIgbW9kZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0
YWddICAgICAgICAgcGF0Y2hldy8xNjE5NTEzMTQ3MTcuNDcxOS40ODkyMTkxNzE1NzU4ODQ3ODUu
bWFsb25lQGdhYy5jYW5vbmljYWwuY29tIC0+IHBhdGNoZXcvMTYxOTUxMzE0NzE3LjQ3MTkuNDg5
MjE5MTcxNTc1ODg0Nzg1Lm1hbG9uZUBnYWMuY2Fub25pY2FsLmNvbQogLSBbdGFnIHVwZGF0ZV0g
ICAgICBwYXRjaGV3LzIwMjEwNDIzMDQ0NzEzLjM0MDMtMS1kb25nbGkuemhhbmdAb3JhY2xlLmNv
bSAtPiBwYXRjaGV3LzIwMjEwNDIzMDQ0NzEzLjM0MDMtMS1kb25nbGkuemhhbmdAb3JhY2xlLmNv
bQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNDIzMDgzMzUxLjIwOTY3MzQtMS1r
cmF4ZWxAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNDIzMDgzMzUxLjIwOTY3MzQtMS1rcmF4
ZWxAcmVkaGF0LmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3L2NvdmVyLjE2MTcyODEy
OTAuZ2l0LmhhaWJvLnh1QGxpbmFyby5vcmcgLT4gcGF0Y2hldy9jb3Zlci4xNjE3MjgxMjkwLmdp
dC5oYWliby54dUBsaW5hcm8ub3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKN2Rl
ZmFlMyBjaHJvbWUgYmFzZWQgYXBwcyBjYW4gbm90IGJlIHJ1biB1bmRlciBxZW11IHVzZXIgbW9k
ZQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiMy
MjogRklMRTogbGludXgtdXNlci9zeXNjYWxsLmM6ODU0MDoKKyAgICAgICAgICAgIHJldCA9IGdl
dF9lcnJubyhzYWZlX2V4ZWN2ZShpc19wcm9jX215c2VsZihwLCAiZXhlIikgPyBleGVjX3BhdGgg
OiBwLCBhcmdwLCBlbnZwKSk7CgpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMp
Cgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDggbGluZXMgY2hlY2tlZAoKQ29tbWl0IDdk
ZWZhZTNmMzE2OSAoY2hyb21lIGJhc2VkIGFwcHMgY2FuIG5vdCBiZSBydW4gdW5kZXIgcWVtdSB1
c2VyIG1vZGUpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0
aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRh
aW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoK
VGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxh
YmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzE2MTk1MTMxNDcxNy40NzE5LjQ4OTIxOTE3
MTU3NTg4NDc4NS5tYWxvbmVAZ2FjLmNhbm9uaWNhbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90
eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3
IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0
Y2hldy1kZXZlbEByZWRoYXQuY29t

