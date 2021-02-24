Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AC3241A6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:08:51 +0100 (CET)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwiY-0001P7-Kc
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lEwgw-0000HK-3d
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:07:10 -0500
Resent-Date: Wed, 24 Feb 2021 11:07:10 -0500
Resent-Message-Id: <E1lEwgw-0000HK-3d@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lEwgt-0007Fe-GE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:07:09 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614182809; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ghwjtn2BLMUMklZ38+FPaqr7jNv5Ce+ez3jzWmMD6bSroKtx9QO4NY5+zyKvC8aCqnzJOScc4qEJm41ecUTlNxiXakMD3Rl5fYbojpzB3N7bDHjYNgPQbQj2VKVOTdQB43zIoLzQBpHprNKkbMb1BkQ9FYYVUjmogzp1JafsuQY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614182809;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=OzfJsVpujr4q/wo4sWGitJ3RZQFfO63poqxmQe2l0xU=; 
 b=i2Z7Q05+4KAA6BxTSk+wUHUkto+JP0ijVbaMkFcG2hSkPQ2KN6R6rG9DUMBEwcOKEVNfHO+awU/WqwkZLqP9iNdNaci4RLreheMXujVOLvzk4x5cez3qvGoeUxIb0jQi/+Qq1V0mXIHtxVZ4yoyrIe6a2VJQVDAONIFNUZrjGrI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614182806595623.0188280894371;
 Wed, 24 Feb 2021 08:06:46 -0800 (PST)
In-Reply-To: <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
Subject: Re: RE: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
Message-ID: <161418280538.22746.213192956655978464@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: babu.moger@amd.com
Date: Wed, 24 Feb 2021 08:06:46 -0800 (PST)
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
Cc: qemu-devel@nongnu.org, pankaj.gupta.linux@gmail.com,
 richard.henderson@linaro.org, ehabkost@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jZDlhODRhMy1mMTUxLWZhMDAt
MGIzNC0yNjUyODI0YmJiZmNAYW1kLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IGNkOWE4NGEzLWYxNTEtZmEw
MC0wYjM0LTI2NTI4MjRiYmJmY0BhbWQuY29tClN1YmplY3Q6IFJFOiBbUEFUQ0ggdjJdIGkzODY6
IEFkZCB0aGUgc3VwcG9ydCBmb3IgQU1EIEVQWUMgM3JkIGdlbmVyYXRpb24gcHJvY2Vzc29ycwoK
PT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2Ug
PiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWls
YmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIx
ZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0
Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDIxOTE1
MzM0OC40MTg2MS0xLW1yZWl0ekByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMTkxNTMzNDgu
NDE4NjEtMS1tcmVpdHpAcmVkaGF0LmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIw
MjEwMjIyMTQxNTE0LjI2NDYyNzgtMS1mNGJ1Z0BhbXNhdC5vcmcgLT4gcGF0Y2hldy8yMDIxMDIy
MjE0MTUxNC4yNjQ2Mjc4LTEtZjRidWdAYW1zYXQub3JnCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBh
dGNoZXcvMjAyMTAyMjMyMjUyNTAuMjM5NDUtMS12Z295YWxAcmVkaGF0LmNvbSAtPiBwYXRjaGV3
LzIwMjEwMjIzMjI1MjUwLjIzOTQ1LTEtdmdveWFsQHJlZGhhdC5jb20KIC0gW3RhZyB1cGRhdGVd
ICAgICAgcGF0Y2hldy8yMDIxMDIyNDEzMTE0Mi4xOTUyMDI3LTEtYmVycmFuZ2VAcmVkaGF0LmNv
bSAtPiBwYXRjaGV3LzIwMjEwMjI0MTMxMTQyLjE5NTIwMjctMS1iZXJyYW5nZUByZWRoYXQuY29t
CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAyMjQxMzUyNTUuMjUzODM3LTEta3dv
bGZAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMjI0MTM1MjU1LjI1MzgzNy0xLWt3b2xmQHJl
ZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy9jZDlhODRhMy1mMTUxLWZhMDAt
MGIzNC0yNjUyODI0YmJiZmNAYW1kLmNvbSAtPiBwYXRjaGV3L2NkOWE4NGEzLWYxNTEtZmEwMC0w
YjM0LTI2NTI4MjRiYmJmY0BhbWQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcK
OTgyYmU5MCBpMzg2OiBBZGQgdGhlIHN1cHBvcnQgZm9yIEFNRCBFUFlDIDNyZCBnZW5lcmF0aW9u
IHByb2Nlc3NvcnMKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1v
ZmYtYnk6IGxpbmUocykKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjAgbGluZXMgY2hl
Y2tlZAoKQ29tbWl0IDk4MmJlOTA4YzNkMiAoaTM4NjogQWRkIHRoZSBzdXBwb3J0IGZvciBBTUQg
RVBZQyAzcmQgZ2VuZXJhdGlvbiBwcm9jZXNzb3JzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFz
ZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVw
b3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJT
Lgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy9jZDlh
ODRhMy1mMTUxLWZhMDAtMGIzNC0yNjUyODI0YmJiZmNAYW1kLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

