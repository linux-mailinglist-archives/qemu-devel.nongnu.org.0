Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7514C3AEB33
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:26:41 +0200 (CEST)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKsq-0000cN-Hx
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvKrN-0006sh-Ud; Mon, 21 Jun 2021 10:25:09 -0400
Resent-Date: Mon, 21 Jun 2021 10:25:09 -0400
Resent-Message-Id: <E1lvKrN-0006sh-Ud@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvKrL-0008UV-BX; Mon, 21 Jun 2021 10:25:09 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624285493; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fg8fdbPj2TyuzZfZfgqStqDMCGUc7rUZicM0CXgt2enpI+ca15mfeUyGzlc00aDPsRE/fEoLwMzBHUNfGo+LBRWxKsRq0IJJbe6X2lPquDnshczL0wzQc6muyu6aIwKsePyfcBoBGJtUuEGRgyb/UY/VbwJyPA3wuhnVdtwUPW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624285493;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=vQ/T7tXw+5AsEB8k9XzGp9nqkQZyb9qCjc8/F8A/mWM=; 
 b=c6GwXgbCNgeum9ged8f89TK/auhHf5CQ2Jp3cyEMbN3gxFAZHTaRgwksmZqFW8pGKOPS2QyAOV/B4+xu7hoqAbHMGjZ5gsxPodsoj7CFZHu1MjULmf+pS66jDuPqtZNmhfZdKsXYEBhPG9BmDsCGDl+lMbPXbe+wAiXgl36MuaE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 162428549193288.59323331390158;
 Mon, 21 Jun 2021 07:24:51 -0700 (PDT)
In-Reply-To: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Message-ID: <162428549032.6049.5201517690369890765@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jonathan.albrecht@linux.vnet.ibm.com
Date: Mon, 21 Jun 2021 07:24:51 -0700 (PDT)
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
Cc: jonathan.albrecht@linux.vnet.ibm.com, iii@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMTE0MTQ1Mi4yMDQ1
LTEtam9uYXRoYW4uYWxicmVjaHRAbGludXgudm5ldC5pYm0uY29tLwoKCgpIaSwKClRoaXMgc2Vy
aWVzIHNlZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQg
YmVsb3cgZm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAy
MTA2MjExNDE0NTIuMjA0NS0xLWpvbmF0aGFuLmFsYnJlY2h0QGxpbnV4LnZuZXQuaWJtLmNvbQpT
dWJqZWN0OiBbUEFUQ0ggMC8yXSBsaW51eC11c2VyL3MzOTB4OiBzaWduYWwgd2l0aCBTSUdGUEUg
b24gY29tcGFyZS1hbmQtdHJhcAoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFz
aApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1s
b2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBU
cnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0K
ClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBo
dHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAg
ICAgcGF0Y2hldy8yMDIxMDUyNjE0MjQzOC4yODE0NzctMS1mNGJ1Z0BhbXNhdC5vcmcgLT4gcGF0
Y2hldy8yMDIxMDUyNjE0MjQzOC4yODE0NzctMS1mNGJ1Z0BhbXNhdC5vcmcKIC0gW3RhZyB1cGRh
dGVdICAgICAgcGF0Y2hldy8yMDIxMDYxNDA4MzgwMC4xMTY2MTY2LTEtcmljaGFyZC5oZW5kZXJz
b25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwNjE0MDgzODAwLjExNjYxNjYtMS1yaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA2
MjExNDE0NTIuMjA0NS0xLWpvbmF0aGFuLmFsYnJlY2h0QGxpbnV4LnZuZXQuaWJtLmNvbSAtPiBw
YXRjaGV3LzIwMjEwNjIxMTQxNDUyLjIwNDUtMS1qb25hdGhhbi5hbGJyZWNodEBsaW51eC52bmV0
LmlibS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpjNmIzYmE2IHRlc3RzL3Rj
ZzogVGVzdCB0aGF0IGNvbXBhcmUtYW5kLXRyYXAgcmFpc2VzIFNJR0ZQRQo3YmFiNDQyIGxpbnV4
LXVzZXIvczM5MHg6IHNpZ25hbCB3aXRoIFNJR0ZQRSBvbiBjb21wYXJlLWFuZC10cmFwCgo9PT0g
T1VUUFVUIEJFR0lOID09PQoxLzIgQ2hlY2tpbmcgY29tbWl0IDdiYWI0NDI3YTVlOSAobGludXgt
dXNlci9zMzkweDogc2lnbmFsIHdpdGggU0lHRlBFIG9uIGNvbXBhcmUtYW5kLXRyYXApCjIvMiBD
aGVja2luZyBjb21taXQgYzZiM2JhNjI1ODA1ICh0ZXN0cy90Y2c6IFRlc3QgdGhhdCBjb21wYXJl
LWFuZC10cmFwIHJhaXNlcyBTSUdGUEUpCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVk
IGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzI1OiAKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKCkVSUk9SOiBkbyBub3QgaW5pdGlhbGlzZSBnbG9iYWxzIHRvIDAgb3IgTlVM
TAojNzE6IEZJTEU6IHRlc3RzL3RjZy9zMzkweC90cmFwLmM6NDI6CitpbnQgc2lnZnBlX2NvdW50
ID0gMDsKCkVSUk9SOiBkbyBub3QgaW5pdGlhbGlzZSBnbG9iYWxzIHRvIDAgb3IgTlVMTAojNzI6
IEZJTEU6IHRlc3RzL3RjZy9zMzkweC90cmFwLmM6NDM6CitpbnQgc2lnaWxsX2NvdW50ID0gMDsK
CkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiM4MzogRklMRTogdGVzdHMvdGNnL3MzOTB4L3Ry
YXAuYzo1NDoKKyAgICAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojMTE2OiBGSUxFOiB0
ZXN0cy90Y2cvczM5MHgvdHJhcC5jOjg3OgorICAgICAgICA6ICQKCnRvdGFsOiA0IGVycm9ycywg
MSB3YXJuaW5ncywgMTA0IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMiBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGgg
Y29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3Jn
L2xvZ3MvMjAyMTA2MjExNDE0NTIuMjA0NS0xLWpvbmF0aGFuLmFsYnJlY2h0QGxpbnV4LnZuZXQu
aWJtLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVy
YXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxl
YXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

