Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852333E1AE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:50:35 +0100 (CET)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIWI-0008KF-2u
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMIV5-0007mt-PO; Tue, 16 Mar 2021 18:49:20 -0400
Resent-Date: Tue, 16 Mar 2021 18:49:19 -0400
Resent-Message-Id: <E1lMIV5-0007mt-PO@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMIV2-00057T-9q; Tue, 16 Mar 2021 18:49:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615934939; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bV6BJdS970lmRrZADS3e8UrN1fwkr9UuhISi6DRU+IyX2yOgVCLy2mwKV1kNbgT3S5YnySG5jItaVZNP34sAHBCc/iwJptk3xeVChRV0ddB8DWZqblwIHyHdy/Ev1EuZQsoBPl6kJ2ioHtJrGB6OLZABZ5nZnNhYEMszmr5lFZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615934939;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=tF8oDA4fa83Iw7SEm+BG8QQkhZXDWl7Jec7f/Xk3zOg=; 
 b=HvAeBi49Ca1dFLzo+4aBOqNd4VlsM2OSjdSTM+wahGQUKasJCKir9KyfTQiAhmaI0hHnWyCSdJrrX8z3rx2HVKoNKaFn1Ux2y3enoO2PZvFyeuIqBDifwscNZR9s78TjqI6qr4ZUZpU6zRHB0stwSVwqGwoO6mEgJjxnB8Gmors=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615934935641742.6421852983427;
 Tue, 16 Mar 2021 15:48:55 -0700 (PDT)
In-Reply-To: <20210316224412.11609-1-olaf@aepfle.de>
Subject: Re: [PATCH v1] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <161593493442.18566.14612876295503290944@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: olaf@aepfle.de
Date: Tue, 16 Mar 2021 15:48:55 -0700 (PDT)
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
Cc: xen-devel@lists.xenproject.org, olaf@aepfle.de, jsnow@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNjIyNDQxMi4xMTYw
OS0xLW9sYWZAYWVwZmxlLmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTYyMjQ0MTIuMTE2MDktMS1v
bGFmQGFlcGZsZS5kZQpTdWJqZWN0OiBbUEFUQ0ggdjFdIHBpaXg6IGZpeCByZWdyZXNzaW9uIGR1
cmluZyB1bnBsdWcgaW4gWGVuIEhWTSBkb21VcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMxMTE0Mzk1OC41NjI2MjUtMS1yaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTAzMTExNDM5NTguNTYyNjI1LTEtcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEw
MzE2MjI0NDEyLjExNjA5LTEtb2xhZkBhZXBmbGUuZGUgLT4gcGF0Y2hldy8yMDIxMDMxNjIyNDQx
Mi4xMTYwOS0xLW9sYWZAYWVwZmxlLmRlClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcK
OWI3ZWMwZiBwaWl4OiBmaXggcmVncmVzc2lvbiBkdXJpbmcgdW5wbHVnIGluIFhlbiBIVk0gZG9t
VXMKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBm
b3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzQxOiBGSUxFOiBody9pZGUvcGlpeC5jOjEx
MzoKKyAgICBpZiAocGNpX3BpaXgzX3hlbl9pZGVfdW5wbHVnX2RvbmUgPT0gdHJ1ZSkKWy4uLl0K
CnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjkgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDli
N2VjMGZlNWQ3YyAocGlpeDogZml4IHJlZ3Jlc3Npb24gZHVyaW5nIHVucGx1ZyBpbiBYZW4gSFZN
IGRvbVVzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMxNjIyNDQxMi4xMTYwOS0xLW9sYWZA
YWVwZmxlLmRlL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

