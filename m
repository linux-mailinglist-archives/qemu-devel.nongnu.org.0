Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E23A963D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:33:19 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRvC-0001Z6-71
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltRrM-0007Ab-S4
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:29:20 -0400
Resent-Date: Wed, 16 Jun 2021 05:29:20 -0400
Resent-Message-Id: <E1ltRrM-0007Ab-S4@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltRrK-0005Rm-CE
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:29:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623835749; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ehm9PyRJGLhZFHo4lGBDcDowa4q3MXWFXlWsS11fGKl/G9cAxFZPBfJpbEJ8P6OL2JSxzMRGR2Ni7xJWBxMiHuw8p4K/SiUJ4Z8j4zBg3uZa6RauF+BBcOMmfhgHXNbzk4Fi0ZHwOoJ4WzLPR8czLNEhwcULHNCrEDt2hq+Jm6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623835749;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=+ZqFwCwTKzAFGbtx/0D3T//Hw97aXvE79AHu2Z3R7ho=; 
 b=aBTR+3CXIYvhU8gsH5LKRcaU3YVcUe8F+QrxMPTc5EudsmLnNthDy2ixJEdKnWQxWh12UvinoxanciCGWCXIIRBGMLcvMQkiMVepwJlJcmBeoaipLr7yFMyc+75gUxopeWtB3IkePgPK8F5G8LJ7kxJMlc/iZYCn6IB5YrB053o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623835667138770.4159927021797;
 Wed, 16 Jun 2021 02:27:47 -0700 (PDT)
In-Reply-To: <20210616091244.33049-1-ysato@users.sourceforge.jp>
Subject: Re: [PATCH 0/3] renesas_sci update
Message-ID: <162383566568.24068.1742047011105037489@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ysato@users.sourceforge.jp
Date: Wed, 16 Jun 2021 02:27:47 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxNjA5MTI0NC4zMzA0
OS0xLXlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MTYwOTEy
NDQuMzMwNDktMS15c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcApTdWJqZWN0OiBbUEFUQ0ggMC8z
XSByZW5lc2FzX3NjaSB1cGRhdGUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBkYXRlXSAg
ICAgIHBhdGNoZXcvMjAyMTA2MTAxMzM1MzguNjA4MzkwLTEtcGJvbnppbmlAcmVkaGF0LmNvbSAt
PiBwYXRjaGV3LzIwMjEwNjEwMTMzNTM4LjYwODM5MC0xLXBib256aW5pQHJlZGhhdC5jb20KIC0g
W3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDYxNTE5Mjg0OC4xMDY1Mjk3LTEtdmVudHVy
ZUBnb29nbGUuY29tIC0+IHBhdGNoZXcvMjAyMTA2MTUxOTI4NDguMTA2NTI5Ny0xLXZlbnR1cmVA
Z29vZ2xlLmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNjE2MDY0MzM0LjUz
Mzk4LTEtbHVrYXMuanVlbmdlckBncmVlbnNvY3MuY29tIC0+IHBhdGNoZXcvMjAyMTA2MTYwNjQz
MzQuNTMzOTgtMS1sdWthcy5qdWVuZ2VyQGdyZWVuc29jcy5jb20KIC0gW3RhZyB1cGRhdGVdICAg
ICAgcGF0Y2hldy8yMDIxMDYxNjA3MzM1OC43NTA0NzItMS1qb2VsQGptcy5pZC5hdSAtPiBwYXRj
aGV3LzIwMjEwNjE2MDczMzU4Ljc1MDQ3Mi0xLWpvZWxAam1zLmlkLmF1CiAqIFtuZXcgdGFnXSAg
ICAgICAgIHBhdGNoZXcvMjAyMTA2MTYwOTEyNDQuMzMwNDktMS15c2F0b0B1c2Vycy5zb3VyY2Vm
b3JnZS5qcCAtPiBwYXRjaGV3LzIwMjEwNjE2MDkxMjQ0LjMzMDQ5LTEteXNhdG9AdXNlcnMuc291
cmNlZm9yZ2UuanAKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoyYWVlMDBmIGh3L3No
NDogc2g3NzUwIHVzaW5nIHJlbmVzYXNfc2NpLgoxNjNiMTdmIGh3L2NoYXI6IHJlbmVzYXNfc2Np
IEFkZCBTQ0kgYW5kIFNDSUYgc3VwcG9ydC4KM2EzNzY1MCBody9jaGFyOiByZW5lc2FzX3NjaTog
UmVmYWN0b3IgZm9yIG1lcmdlIGFsbCBTQ0kgdmFyaWFudC4uCgo9PT0gT1VUUFVUIEJFR0lOID09
PQoxLzMgQ2hlY2tpbmcgY29tbWl0IDNhMzc2NTAyOWQ3YyAoaHcvY2hhcjogcmVuZXNhc19zY2k6
IFJlZmFjdG9yIGZvciBtZXJnZSBhbGwgU0NJIHZhcmlhbnQuLikKMi8zIENoZWNraW5nIGNvbW1p
dCAxNjNiMTdmMmU3OGUgKGh3L2NoYXI6IHJlbmVzYXNfc2NpIEFkZCBTQ0kgYW5kIFNDSUYgc3Vw
cG9ydC4pCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJzonIChjdHg6VnhXKQoj
MjQ6IEZJTEU6IGh3L2NoYXIvcmVuZXNhc19zY2kuYzo2OgorICogICAgICAgIEFuZCBTSDc3NTEg
R3JvdXAsIFNINzc1MVIgR3JvdXAgVXNlcidzIE1hbnVhbDogSGFyZHdhcmUKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpFUlJPUjogc3Bh
Y2UgcHJvaGliaXRlZCBhZnRlciB0aGF0ICcqJyAoY3R4OkV4VykKIzI1OiBGSUxFOiBody9jaGFy
L3JlbmVzYXNfc2NpLmM6NzoKKyAqICAgICAgICAgICAgKFJldi40LjAxIFIwMVVIMDQ1N0VKMDQw
MSkKICBeCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDcxNSBsaW5lcyBjaGVja2VkCgpQ
YXRjaCAyLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRo
ZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFp
bmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvMyBDaGVja2luZyBjb21taXQg
MmFlZTAwZmZjODMwIChody9zaDQ6IHNoNzc1MCB1c2luZyByZW5lc2FzX3NjaS4pCkVSUk9SOiBz
cGFjZSByZXF1aXJlZCBiZWZvcmUgdGhlIG9wZW4gcGFyZW50aGVzaXMgJygnCiM2MzogRklMRTog
aHcvc2g0L3NoNzc1MC5jOjc3MDoKKyAgICBzd2l0Y2goZmVhdCkgewoKRVJST1I6IGJyYWNlcyB7
fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojNzk6IEZJTEU6
IGh3L3NoNC9zaDc3NTAuYzo3ODY6CisgICAgaWYgKHRlaV9zb3VyY2UpClsuLi5dCgpFUlJPUjog
YnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiM4
MTogRklMRTogaHcvc2g0L3NoNzc1MC5jOjc4ODoKKyAgICBpZiAoYnJpX3NvdXJjZSkKWy4uLl0K
CnRvdGFsOiAzIGVycm9ycywgMCB3YXJuaW5ncywgNzkgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy8z
IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJv
cnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2Vl
CkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDYxNjA5MTI0NC4zMzA0OS0xLXlzYXRvQHVzZXJz
LnNvdXJjZWZvcmdlLmpwL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==

