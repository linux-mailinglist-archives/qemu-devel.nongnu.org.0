Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BE2FCDD7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:33:32 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Anr-0007c5-GK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l2AlT-00070U-LT
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:31:10 -0500
Resent-Date: Wed, 20 Jan 2021 05:31:03 -0500
Resent-Message-Id: <E1l2AlT-00070U-LT@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l2AlN-0001xv-ER
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:31:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611138647; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z7bUfs4QHuhgdswNRSka6yRyu5PeMR4qx2IX8u2721/ojxb0UU6q6hyy5B5V3KFAMFhpCtdVgCm/hNYa0nVu2tg8/fLSKS88azKInYMrtcc9HmIao8aRl57vaOGvblAV3/Osr7IDe3vJZUaq/QvSYLLkl7L3ynsNjx3J5XJ2kW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1611138647;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=HaJINp0bdzg2xy2cqt5Y4OkFtNJHNBTzWKaKyHfzp/4=; 
 b=X1/fiSYKwtc3M6QNoHclmQyHUEFyRuTrWX3VzxbBot6Xd0ReR20xS2t0Y6R0lHxOI0wqZwU9a3ydCLv83U9vNVpm45CLF0PMe02QvWsv7A2KC2MR8f+YaCFjh76xZ5riP6iYxnB5O1DwvzVqNQGaga7gotxAgKhtvfJ5wTor5wQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1611138644659926.9537308988473;
 Wed, 20 Jan 2021 02:30:44 -0800 (PST)
In-Reply-To: <20210120102556.125012-1-marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3] sphinx: adopt kernel readthedoc theme
Message-ID: <161113864319.2905.684438159547635166@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Wed, 20 Jan 2021 02:30:44 -0800 (PST)
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, bmeng.cn@gmail.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyMDEwMjU1Ni4xMjUw
MTItMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDEyMDEw
MjU1Ni4xMjUwMTItMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENI
IHYzXSBzcGhpbng6IGFkb3B0IGtlcm5lbCByZWFkdGhlZG9jIHRoZW1lCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8
fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3Jp
dGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9
PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRl
ZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3Qv
cWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjAxMjA3MTcyMDMwLjI1MTkwNS0x
LXN0ZWZhbmhhQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIwMTIwNzE3MjAzMC4yNTE5MDUtMS1z
dGVmYW5oYUByZWRoYXQuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAxMjAw
NjAyNTUuNTU4NTM1LTEtYWx4bmRyQGJ1LmVkdSAtPiBwYXRjaGV3LzIwMjEwMTIwMDYwMjU1LjU1
ODUzNS0xLWFseG5kckBidS5lZHUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDEy
MDEwMjU1Ni4xMjUwMTItMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8y
MDIxMDEyMDEwMjU1Ni4xMjUwMTItMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20KIC0gW3Rh
ZyB1cGRhdGVdICAgICAgcGF0Y2hldy85NmViNGY5NGU2MzgxMDgyZWMwMTg4YWQxODBmNjBmMTlm
MjU4M2ZjLjE2MTEwNTk2NTIuZ2l0Lm1wcml2b3puQHJlZGhhdC5jb20gLT4gcGF0Y2hldy85NmVi
NGY5NGU2MzgxMDgyZWMwMTg4YWQxODBmNjBmMTlmMjU4M2ZjLjE2MTEwNTk2NTIuZ2l0Lm1wcml2
b3puQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkOGJhMjUyIHNw
aGlueDogYWRvcHQga2VybmVsIHJlYWR0aGVkb2MgdGhlbWUKCj09PSBPVVRQVVQgQkVHSU4gPT09
CldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5F
UlMgbmVlZCB1cGRhdGluZz8KIzQyOiAKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CgpFUlJPUjog
bGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzY0OiBGSUxFOiBkb2NzL2NvbmYucHk6MTU4OgorICAg
IHN5cy5zdGRlcnIud3JpdGUoJ1dhcm5pbmc6IFRoZSBTcGhpbnggXCdzcGhpbnhfcnRkX3RoZW1l
XCcgSFRNTCB0aGVtZSB3YXMgbm90IGZvdW5kLiBNYWtlIHN1cmUgeW91IGhhdmUgdGhlIHRoZW1l
IGluc3RhbGxlZCB0byBwcm9kdWNlIHByZXR0eSBIVE1MIG91dHB1dC4gRmFsbGluZyBiYWNrIHRv
IHRoZSBkZWZhdWx0IHRoZW1lLlxuJykKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiM5ODog
RklMRTogZG9jcy9jb25mLnB5OjE4MzoKKyAgICAiZ2l0bGFiX3VzZXIiOiAicWVtdS1wcm9qZWN0
IiwgJAoKdG90YWw6IDIgZXJyb3JzLCAxIHdhcm5pbmdzLCAyNjAgbGluZXMgY2hlY2tlZAoKQ29t
bWl0IGQ4YmEyNTI2OTcwMCAoc3BoaW54OiBhZG9wdCBrZXJuZWwgcmVhZHRoZWRvYyB0aGVtZSkg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1h
bmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAxMjAxMDI1NTYuMTI1MDEyLTEtbWFyY2FuZHJlLmx1
cmVhdUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==

