Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62C34FBE5
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 10:50:36 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRWYc-0003sn-UG
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 04:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lRWXL-0003FY-Sg; Wed, 31 Mar 2021 04:49:15 -0400
Resent-Date: Wed, 31 Mar 2021 04:49:15 -0400
Resent-Message-Id: <E1lRWXL-0003FY-Sg@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lRWXJ-0005Rt-Bv; Wed, 31 Mar 2021 04:49:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617180530; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V12Ax7Bf/Nre4qAyM16kDSSYkDegwIJrTbZyTS3ZBGmZ7Y4nwoD97vXKCw8xOsiYBCNAK7t4RMpvhX9c9PByJWabfhKJnTr7ttmJcXB/qxQtZtw53razMT53KveA11G3QVcf1QnOnChdHojOI2JfAXKS7OnP59qtMpUZxHa1dk0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617180530;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=oyHWjsmxT8/rcfndotYvbqLCDnOwpdw4vglhuncCxbw=; 
 b=dKL+Ke6icGtREpUTLx0U5fBdKHWFmyFJOzNu/txMb5hno8KZmfMQh4ToqVb8wILosZehAATcP2zgWFgjjq3w5D2Ojr4cLkkzL48Q3CqJwGYW1xzRJG1SIJdweZNNnJnkRiF3kByxio0YRjL8eVrz+caTiNpY1Uw1nJtlIL0jTws=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1617180527600468.8388090592706;
 Wed, 31 Mar 2021 01:48:47 -0700 (PDT)
In-Reply-To: <20210331083306.12461-1-anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2] hw/block/nvme: add device self test command support
Message-ID: <161718052599.402.17507548813435466937@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: anaidu.gollu@samsung.com
Date: Wed, 31 Mar 2021 01:48:47 -0700 (PDT)
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 anaidu.gollu@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kbusch@kernel.org, stefanha@redhat.com, its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMzMTA4MzMwNi4xMjQ2
MS0xLWFuYWlkdS5nb2xsdUBzYW1zdW5nLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzMxMDgzMzA2
LjEyNDYxLTEtYW5haWR1LmdvbGx1QHNhbXN1bmcuY29tClN1YmplY3Q6IFtQQVRDSCB2Ml0gaHcv
YmxvY2svbnZtZTogYWRkIGRldmljZSBzZWxmIHRlc3QgY29tbWFuZCBzdXBwb3J0Cgo9PT0gVEVT
VCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYv
bnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
YWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJh
c2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIx
NjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXBy
b2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzMxMDgzMzA2LjEy
NDYxLTEtYW5haWR1LmdvbGx1QHNhbXN1bmcuY29tIC0+IHBhdGNoZXcvMjAyMTAzMzEwODMzMDYu
MTI0NjEtMS1hbmFpZHUuZ29sbHVAc2Ftc3VuZy5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNo
ICd0ZXN0JwowMThmODY5IGh3L2Jsb2NrL252bWU6IGFkZCBkZXZpY2Ugc2VsZiB0ZXN0IGNvbW1h
bmQgc3VwcG9ydAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFs
dWUgJGFjcGlfdGVzdGV4cGVjdGVkIGluIHN0cmluZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCBsaW5lIDE1MjkuCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyks
IGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzMzNzogCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojMzY5OiBGSUxFOiBvdXRnb2luZy8wMDAx
LWh3LWJsb2NrLW52bWUtYWRkLWRldmljZS1zZWxmLXRlc3QtY29tbWFuZC1zdXBwb3J0LnBhdGNo
OjI4OgorICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMzNzQ6IEZJTEU6IG91dGdvaW5n
LzAwMDEtaHctYmxvY2stbnZtZS1hZGQtZGV2aWNlLXNlbGYtdGVzdC1jb21tYW5kLXN1cHBvcnQu
cGF0Y2g6MzM6CisgJAoKRVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzQxODogRklMRTogb3V0
Z29pbmcvMDAwMS1ody1ibG9jay1udm1lLWFkZC1kZXZpY2Utc2VsZi10ZXN0LWNvbW1hbmQtc3Vw
cG9ydC5wYXRjaDo3NzoKKyAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNTEyOiBGSUxF
OiBvdXRnb2luZy8wMDAxLWh3LWJsb2NrLW52bWUtYWRkLWRldmljZS1zZWxmLXRlc3QtY29tbWFu
ZC1zdXBwb3J0LnBhdGNoOjE3MToKKyAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNTE1
OiBGSUxFOiBvdXRnb2luZy8wMDAxLWh3LWJsb2NrLW52bWUtYWRkLWRldmljZS1zZWxmLXRlc3Qt
Y29tbWFuZC1zdXBwb3J0LnBhdGNoOjE3NDoKKyAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFj
ZQojNTIyOiBGSUxFOiBvdXRnb2luZy8wMDAxLWh3LWJsb2NrLW52bWUtYWRkLWRldmljZS1zZWxm
LXRlc3QtY29tbWFuZC1zdXBwb3J0LnBhdGNoOjE4MToKKyAkCgpFUlJPUjogdHJhaWxpbmcgd2hp
dGVzcGFjZQojNTM1OiBGSUxFOiBvdXRnb2luZy8wMDAxLWh3LWJsb2NrLW52bWUtYWRkLWRldmlj
ZS1zZWxmLXRlc3QtY29tbWFuZC1zdXBwb3J0LnBhdGNoOjE5NDoKKyAkCgpFUlJPUjogdHJhaWxp
bmcgd2hpdGVzcGFjZQojNTQ0OiBGSUxFOiBvdXRnb2luZy8wMDAxLWh3LWJsb2NrLW52bWUtYWRk
LWRldmljZS1zZWxmLXRlc3QtY29tbWFuZC1zdXBwb3J0LnBhdGNoOjIwMzoKKyAkCgpFUlJPUjog
dHJhaWxpbmcgd2hpdGVzcGFjZQojNTY2OiBGSUxFOiBvdXRnb2luZy8wMDAxLWh3LWJsb2NrLW52
bWUtYWRkLWRldmljZS1zZWxmLXRlc3QtY29tbWFuZC1zdXBwb3J0LnBhdGNoOjIyNToKKyAkCgpF
UlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNjAyOiBGSUxFOiBvdXRnb2luZy8wMDAxLWh3LWJs
b2NrLW52bWUtYWRkLWRldmljZS1zZWxmLXRlc3QtY29tbWFuZC1zdXBwb3J0LnBhdGNoOjI2MToK
KyAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNjU3OiBGSUxFOiBvdXRnb2luZy8wMDAx
LWh3LWJsb2NrLW52bWUtYWRkLWRldmljZS1zZWxmLXRlc3QtY29tbWFuZC1zdXBwb3J0LnBhdGNo
OjMxNjoKKyAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNjY1OiBGSUxFOiBvdXRnb2lu
Zy8wMDAxLWh3LWJsb2NrLW52bWUtYWRkLWRldmljZS1zZWxmLXRlc3QtY29tbWFuZC1zdXBwb3J0
LnBhdGNoOjMyNDoKKyAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNjc0OiBGSUxFOiBv
dXRnb2luZy8wMDAxLWh3LWJsb2NrLW52bWUtYWRkLWRldmljZS1zZWxmLXRlc3QtY29tbWFuZC1z
dXBwb3J0LnBhdGNoOjMzMzoKKy0tICQKCnRvdGFsOiAxMyBlcnJvcnMsIDEgd2FybmluZ3MsIDYx
NyBsaW5lcyBjaGVja2VkCgpDb21taXQgMDE4Zjg2OWVjMmQ0IChody9ibG9jay9udm1lOiBhZGQg
ZGV2aWNlIHNlbGYgdGVzdCBjb21tYW5kIHN1cHBvcnQpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjEwMzMxMDgzMzA2LjEyNDYxLTEtYW5haWR1LmdvbGx1QHNhbXN1bmcuY29tL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

