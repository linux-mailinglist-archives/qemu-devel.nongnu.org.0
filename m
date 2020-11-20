Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C42BAAD6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:12:34 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6DJ-00059V-4r
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kg6Ay-0003oe-Gx
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:10:13 -0500
Resent-Date: Fri, 20 Nov 2020 08:10:08 -0500
Resent-Message-Id: <E1kg6Ay-0003oe-Gx@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kg6As-0001b2-Lg
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:10:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605877783; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=f+Qn/5YzfX2bPDjnISQD60rdbETrt6LkJKCSbpGLUWELAEXMF3BOtvBk6E/6skjm6cUG0hLzYdqT+T91zg4vj8eQYBeDqupYWI+7woRgJ3wS0WjjFcnmTH/e6YamNUhztG+Mtz3zs5V4zhpjUFOymfDP2Pb1koTKJ8JP+5vFGa0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605877783;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=c5rfBTXeUDRy8Jf7MhQMNhP2Oz33k9PpBRuSIBVdvpM=; 
 b=Um5qdvwUuZZbnDLJPNUoeqgbtoS2ITx3Fwdd41AkNu2EuCIqG0Ql/iURXGSJOjMObrjf4Rr2QIMdVOyIov6u2TM8vBx+DCo/wDkvcnlCw6nDiQzn8gthTeeiurPpKJf7L9w2Xr7XLOEWVwwxcqlRs9a9tKdSZhPRxaUNp3xp8q8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605877781838455.3808948559282;
 Fri, 20 Nov 2020 05:09:41 -0800 (PST)
In-Reply-To: <20201120130409.956956-1-mst@redhat.com>
Subject: Re: [PATCH for-5.2] Revert "hw/core/qdev-properties: Use
 qemu_strtoul() in set_pci_host_devaddr()"
Message-ID: <160587778016.3039.18309577072260550988@ba092462a7f3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mst@redhat.com
Date: Fri, 20 Nov 2020 05:09:41 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
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
Cc: geoff@hostfission.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org, kherman@inbox.lv, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTEyMDEzMDQwOS45NTY5
NTYtMS1tc3RAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMTIwMTMwNDA5Ljk1Njk1Ni0x
LW1zdEByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCBmb3ItNS4yXSBSZXZlcnQgImh3L2NvcmUv
cWRldi1wcm9wZXJ0aWVzOiBVc2UgcWVtdV9zdHJ0b3VsKCkgaW4gc2V0X3BjaV9ob3N0X2RldmFk
ZHIoKSIKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJz
ZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhj
ZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIu
Y29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAy
MDExMjAwNzMxNDkuOTkwNzktMS1wYm9uemluaUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDEx
MjAwNzMxNDkuOTkwNzktMS1wYm9uemluaUByZWRoYXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAg
IHBhdGNoZXcvMjAyMDExMjAxMzA0MDkuOTU2OTU2LTEtbXN0QHJlZGhhdC5jb20gLT4gcGF0Y2hl
dy8yMDIwMTEyMDEzMDQwOS45NTY5NTYtMS1tc3RAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5l
dyBicmFuY2ggJ3Rlc3QnCjFkOWY2YmQgUmV2ZXJ0ICJody9jb3JlL3FkZXYtcHJvcGVydGllczog
VXNlIHFlbXVfc3RydG91bCgpIGluIHNldF9wY2lfaG9zdF9kZXZhZGRyKCkiCgo9PT0gT1VUUFVU
IEJFR0lOID09PQpFUlJPUjogY29uc2lkZXIgdXNpbmcgcWVtdV9zdHJ0b3VsIGluIHByZWZlcmVu
Y2UgdG8gc3RydG91bAojMzk6IEZJTEU6IGh3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLXN5c3RlbS5j
Ojg3NjoKKyAgICB2YWwgPSBzdHJ0b3VsKHAsICZlLCAxNik7CgpFUlJPUjogY29uc2lkZXIgdXNp
bmcgcWVtdV9zdHJ0b3VsIGluIHByZWZlcmVuY2UgdG8gc3RydG91bAojNDg6IEZJTEU6IGh3L2Nv
cmUvcWRldi1wcm9wZXJ0aWVzLXN5c3RlbS5jOjg4MzoKKyAgICB2YWwgPSBzdHJ0b3VsKHAsICZl
LCAxNik7CgpFUlJPUjogY29uc2lkZXIgdXNpbmcgcWVtdV9zdHJ0b3VsIGluIHByZWZlcmVuY2Ug
dG8gc3RydG91bAojNTg6IEZJTEU6IGh3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLXN5c3RlbS5jOjg5
MToKKyAgICAgICAgdmFsID0gc3RydG91bChwLCAmZSwgMTYpOwoKRVJST1I6IGNvbnNpZGVyIHVz
aW5nIHFlbXVfc3RydG91bCBpbiBwcmVmZXJlbmNlIHRvIHN0cnRvdWwKIzcwOiBGSUxFOiBody9j
b3JlL3FkZXYtcHJvcGVydGllcy1zeXN0ZW0uYzo5MDI6CisgICAgdmFsID0gc3RydG91bChwLCAm
ZSwgMTApOwoKdG90YWw6IDQgZXJyb3JzLCAwIHdhcm5pbmdzLCA1NiBsaW5lcyBjaGVja2VkCgpD
b21taXQgMWQ5ZjZiZDEyMjNmIChSZXZlcnQgImh3L2NvcmUvcWRldi1wcm9wZXJ0aWVzOiBVc2Ug
cWVtdV9zdHJ0b3VsKCkgaW4gc2V0X3BjaV9ob3N0X2RldmFkZHIoKSIpIGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRo
IGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9y
Zy9sb2dzLzIwMjAxMTIwMTMwNDA5Ljk1Njk1Ni0xLW1zdEByZWRoYXQuY29tL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

