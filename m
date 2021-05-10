Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71D33799F9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 00:22:49 +0200 (CEST)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgEIa-00032F-Tk
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 18:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgEHp-0002O8-Gi
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:22:01 -0400
Resent-Date: Mon, 10 May 2021 18:22:01 -0400
Resent-Message-Id: <E1lgEHp-0002O8-Gi@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgEHm-000526-0H
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:22:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620685309; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OuCVANUwZSGKPDettEbBRXSmaIILGJyk/Z65uRY2w+wg2Tvjrz9MMinyW2TtFZPOCorztpd1nK2Ip1eYWIqK2nCw3ORVxPjEMbQ3744oF5WuGGg6zbX3lvyqETEndT+T1mGILbccX43M2xvLDYtZp3gkVpPqfD6esgHxME6bE+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620685309;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=mOp+G8ASf+wYCabJ56I6dPX4vCKVUforSTmQZQPbZiU=; 
 b=YLQgJ6M487P7zHFHEJK/NU5mitPCbhxHMZ3tLqR+bghcvR8Fbmjjo6MaHnYSztHGgRjgmTi3LlrRpyR2fsZrufYCG3M9H85h+piVccaJ58eeC6pW5aWQTzAWdc2Kl8dGyOyOTBj3H9eyvXoLKFLWR7SSgUTLmSP0rmtk0qW76GA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16206853084395.263403977839175;
 Mon, 10 May 2021 15:21:48 -0700 (PDT)
In-Reply-To: <20210510221511.14205-1-imp@bsdimp.com>
Subject: Re: [PATCH 0/3] bsd-user cleanup
Message-ID: <162068530688.31054.12454363904138902731@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: imp@bsdimp.com
Date: Mon, 10 May 2021 15:21:48 -0700 (PDT)
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
Cc: kevans@freebsd.org, qemu-devel@nongnu.org, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxMDIyMTUxMS4xNDIw
NS0xLWltcEBic2RpbXAuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA1MTAyMjE1MTEuMTQyMDUtMS1p
bXBAYnNkaW1wLmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC8zXSBic2QtdXNlciBjbGVhbnVwCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3
LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNTEwMjIxNTEx
LjE0MjA1LTEtaW1wQGJzZGltcC5jb20gLT4gcGF0Y2hldy8yMDIxMDUxMDIyMTUxMS4xNDIwNS0x
LWltcEBic2RpbXAuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvYTg5OGIwZDUtNzA4
Ni05Njk5LWFlOGItOTUyNGFkMzE5YjAxQHQtb25saW5lLmRlIC0+IHBhdGNoZXcvYTg5OGIwZDUt
NzA4Ni05Njk5LWFlOGItOTUyNGFkMzE5YjAxQHQtb25saW5lLmRlClN3aXRjaGVkIHRvIGEgbmV3
IGJyYW5jaCAndGVzdCcKMjk0MzZiMiBic2QtdXNlcjogcmVuYW1lIGxpbnV4X2JpbnBybSB0byBi
c2RfYmlucHJtCjZkZmM2M2IgYnNkLXVzZXI6IFN0b3AgYnVpbGRpbmcgdGhlIHNwYXJjIHBsYXRm
b3Jtcwo3NjY0YmZkIGJzZC11c2VyOiByZW1vdmUgdGFyZ2V0X3NpZ25hbC5oLCBpdCdzIHVudXNl
ZAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8zIENoZWNraW5nIGNvbW1pdCA3NjY0YmZkZThkYWYg
KGJzZC11c2VyOiByZW1vdmUgdGFyZ2V0X3NpZ25hbC5oLCBpdCdzIHVudXNlZCkKVXNlIG9mIHVu
aW5pdGlhbGl6ZWQgdmFsdWUgJGFjcGlfdGVzdGV4cGVjdGVkIGluIHN0cmluZyBlcSBhdCAuL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCBsaW5lIDE1MjkuCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBk
ZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzIyOiAKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDE0IGxp
bmVzIGNoZWNrZWQKClBhdGNoIDEvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoyLzMgQ2hl
Y2tpbmcgY29tbWl0IDZkZmM2M2I5OGVmMSAoYnNkLXVzZXI6IFN0b3AgYnVpbGRpbmcgdGhlIHNw
YXJjIHBsYXRmb3JtcykKVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFsdWUgJGFjcGlfdGVzdGV4cGVj
dGVkIGluIHN0cmluZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBsaW5lIDE1MjkuCldB
Uk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMg
bmVlZCB1cGRhdGluZz8KIzIxOiAKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBl
cnJvcnMsIDEgd2FybmluZ3MsIDAgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi8zIGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCjMvMyBDaGVja2luZyBjb21taXQgMjk0MzZiMmJlOTg1IChic2QtdXNl
cjogcmVuYW1lIGxpbnV4X2JpbnBybSB0byBic2RfYmlucHJtKQpFUlJPUjogImZvbyAqIGJhciIg
c2hvdWxkIGJlICJmb28gKmJhciIKIzU4OiBGSUxFOiBic2QtdXNlci9lbGZsb2FkLmM6MTE0NjoK
K2ludCBsb2FkX2VsZl9iaW5hcnkoc3RydWN0IGJzZF9iaW5wcm0gKiBicHJtLCBzdHJ1Y3QgdGFy
Z2V0X3B0X3JlZ3MgKiByZWdzLAoKRVJST1I6ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpi
YXIiCiM4MDogRklMRTogYnNkLXVzZXIvcWVtdS5oOjEzNDoKK2ludCBsb2FkX2VsZl9iaW5hcnko
c3RydWN0IGJzZF9iaW5wcm0gKiBicHJtLCBzdHJ1Y3QgdGFyZ2V0X3B0X3JlZ3MgKiByZWdzLAoK
RVJST1I6ICJmb28gKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM4MzogRklMRTogYnNkLXVz
ZXIvcWVtdS5oOjEzNjoKK2ludCBsb2FkX2ZsdF9iaW5hcnkoc3RydWN0IGJzZF9iaW5wcm0gKiBi
cHJtLCBzdHJ1Y3QgdGFyZ2V0X3B0X3JlZ3MgKiByZWdzLAoKdG90YWw6IDMgZXJyb3JzLCAwIHdh
cm5pbmdzLCA1MSBsaW5lcyBjaGVja2VkCgpQYXRjaCAzLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBw
bGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVz
IHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJ
TkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6
IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMjEwNTEwMjIxNTExLjE0MjA1LTEtaW1wQGJzZGltcC5jb20vdGVzdGluZy5jaGVja3BhdGNo
Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

