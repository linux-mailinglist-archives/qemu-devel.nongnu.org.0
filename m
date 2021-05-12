Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871837C90C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:45:49 +0200 (CEST)
Received: from localhost ([::1]:32974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrzY-0005sv-By
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgrws-0003pn-4S
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:43:05 -0400
Resent-Date: Wed, 12 May 2021 12:43:02 -0400
Resent-Message-Id: <E1lgrws-0003pn-4S@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgrwn-0003c1-7x
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:43:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620837768; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TdCoteRQ0fyzPlNZF9YahUff2dBFSZ8hkNVJswqzaTooL/8EeIuQvSpUwzLrbYSfV5u+FlZCmu5os4B9fFzDdhcvm9oizgl+WS3DS08L0SNJ/iaeLN+jTwK+8KMFd/YJSSM6zyIu0wKGq+cFqYkbaghVq5Z9YgQtMYXTDPb6ZRk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620837768;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=0BHTkTJB5nxL5/Yk+wDxmaC1OxpxPgiE6x5bsp897Rs=; 
 b=MV+YX2PvU/16o9+gEW3twWhZ/OfYd59Lqu+n0IWwIM++SCvG44nxsH+J0uPy5++7xfpXSrrSQqHI+L2j97FRglW353PbdJRd/OH1mzUb05hDd+pP3ehQk25V+qXjGT7BdkTgyRgWV24kwwi0ALOcwTIcpToI0CjMUn1LeKCGPx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620837766570747.431764304545;
 Wed, 12 May 2021 09:42:46 -0700 (PDT)
In-Reply-To: <20210512162412.338120-1-armbru@redhat.com>
Subject: Re: [PULL 0/5] Miscellaneous patches for 2021-05-12
Message-ID: <162083776548.16443.10926192666761880773@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: armbru@redhat.com
Date: Wed, 12 May 2021 09:42:46 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxMjE2MjQxMi4zMzgx
MjAtMS1hcm1icnVAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTEyMTYyNDEyLjMzODEy
MC0xLWFybWJydUByZWRoYXQuY29tClN1YmplY3Q6IFtQVUxMIDAvNV0gTWlzY2VsbGFuZW91cyBw
YXRjaGVzIGZvciAyMDIxLTA1LTEyCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogICBhNWNjZGNjLi4zMTU4
OTY0ICBtYXN0ZXIgICAgIC0+IG1hc3RlcgogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIw
MjEwNTA2MDkwNjIxLjExODQ4LTEtdnNlbWVudHNvdkB2aXJ0dW96em8uY29tIC0+IHBhdGNoZXcv
MjAyMTA1MDYwOTA2MjEuMTE4NDgtMS12c2VtZW50c292QHZpcnR1b3p6by5jb20KIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDUxMTEwNDE1Ny4yODgwMzA2LTEtcGhpbG1kQHJlZGhh
dC5jb20gLT4gcGF0Y2hldy8yMDIxMDUxMTEwNDE1Ny4yODgwMzA2LTEtcGhpbG1kQHJlZGhhdC5j
b20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDUxMjEyNTU0NC45NTM2LTEtbXJl
aXR6QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDUxMjEyNTU0NC45NTM2LTEtbXJlaXR6QHJl
ZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDUxMjE2MjQxMi4zMzgx
MjAtMS1hcm1icnVAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNTEyMTYyNDEyLjMzODEyMC0x
LWFybWJydUByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZTdhZDNj
NyBEcm9wIHRoZSBkZXByZWNhdGVkIHVuaWNvcmUzMiB0YXJnZXQKYmFiMmQ0OSBEcm9wIHRoZSBk
ZXByZWNhdGVkIGxtMzIgdGFyZ2V0Cjc4OTljNGIgYmxvY2s6IERyb3AgdGhlIHNoZWVwZG9nIGJs
b2NrIGRyaXZlcgowZmM4NzkzIFJlbW92ZSB0aGUgZGVwcmVjYXRlZCBtb3hpZSB0YXJnZXQKMzUz
MTA3YyBtb25pdG9yL3FtcDogZml4IHJhY2Ugb24gQ0hSX0VWRU5UX0NMT1NFRCB3aXRob3V0IE9P
QgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS81IENoZWNraW5nIGNvbW1pdCAzNTMxMDdjZjFlM2Mg
KG1vbml0b3IvcW1wOiBmaXggcmFjZSBvbiBDSFJfRVZFTlRfQ0xPU0VEIHdpdGhvdXQgT09CKQoy
LzUgQ2hlY2tpbmcgY29tbWl0IDBmYzg3OTMxNWYzZCAoUmVtb3ZlIHRoZSBkZXByZWNhdGVkIG1v
eGllIHRhcmdldCkKMy81IENoZWNraW5nIGNvbW1pdCA3ODk5YzRiZTRmZDggKGJsb2NrOiBEcm9w
IHRoZSBzaGVlcGRvZyBibG9jayBkcml2ZXIpCjQvNSBDaGVja2luZyBjb21taXQgYmFiMmQ0OTNj
YmE1IChEcm9wIHRoZSBkZXByZWNhdGVkIGxtMzIgdGFyZ2V0KQpFUlJPUjogbGluZSBvdmVyIDkw
IGNoYXJhY3RlcnMKIzk5Njg6IEZJTEU6IHRlc3RzL3RjZy9jb25maWd1cmUuc2g6OTk6CisgICAg
YWxwaGF8Y3Jpc3xoZXhhZ29ufGhwcGF8aTM4NnxtaWNyb2JsYXplfG1pY3JvYmxhemVlbHxtNjhr
fG9wZW5yaXNjfHJpc2N2NjR8czM5MHh8c2g0fHNwYXJjNjQpCgp0b3RhbDogMSBlcnJvcnMsIDAg
d2FybmluZ3MsIDQ5NCBsaW5lcyBjaGVja2VkCgpQYXRjaCA0LzUgaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KCjUvNSBDaGVja2luZyBjb21taXQgZTdhZDNjN2NkZDQyIChEcm9wIHRoZSBkZXBy
ZWNhdGVkIHVuaWNvcmUzMiB0YXJnZXQpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5k
IGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6
Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNTEyMTYyNDEyLjMzODEyMC0xLWFybWJydUByZWRoYXQu
Y29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

