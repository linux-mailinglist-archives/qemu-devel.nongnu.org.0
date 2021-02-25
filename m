Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100F325047
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:21:00 +0100 (CET)
Received: from localhost ([::1]:38664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGZe-0008At-V9
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFGXo-00074k-Ko
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:19:06 -0500
Resent-Date: Thu, 25 Feb 2021 08:19:04 -0500
Resent-Message-Id: <E1lFGXo-00074k-Ko@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFGXg-000549-WD
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:19:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614259128; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lFJ8abcXMy8ghb/J7Klsr11jtlwrM3Di3NQD6eVOcVqcAuQG27evEwVhMu44fHLeEjWoScr+xBxWAOgBR1mP1oC6BGpDaAqaJ7tF0eEgvDCfN9S4CkgdmGHjZrFpqN5mPityh6R3Ehmsrw1RJj8mnV+oVN+VDqhtIzdibnqAs+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614259128;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Syt/LBpqG8/Kxwo8KX6i9uYvQAqEMp+aD+64UmAxnYo=; 
 b=byF/Gx/w058wXx5hgQ5rQvj2dOQEQ2VdZVWrPJ9M2cnzVPKIrKCJ+MgJ4K6IWZW9rBKZhoVIYehKZZYg3bcLOD5Prv/6P9H5phEhVFChPPH3OyB6y/3moJ3Uqdc0czdCnIxouPC1ZiJXkMjChgR153ziJQ2JoSHdZ64uD/XwppE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614259126025356.12303515518477;
 Thu, 25 Feb 2021 05:18:46 -0800 (PST)
In-Reply-To: <20210225131316.631940-1-pbonzini@redhat.com>
Subject: Re: [PATCH v2] vl: deprecate -writeconfig
Message-ID: <161425912501.1906.13285337044095609180@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Thu, 25 Feb 2021 05:18:46 -0800 (PST)
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyNTEzMTMxNi42MzE5
NDAtMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMjUxMzEzMTYuNjMx
OTQwLTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIHZsOiBkZXByZWNh
dGUgLXdyaXRlY29uZmlnCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdp
dCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hl
Y2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBk
YXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBw
YXRjaGV3LzIwMjEwMjI0MTMxMTQyLjE5NTIwMjctMS1iZXJyYW5nZUByZWRoYXQuY29tIC0+IHBh
dGNoZXcvMjAyMTAyMjQxMzExNDIuMTk1MjAyNy0xLWJlcnJhbmdlQHJlZGhhdC5jb20KICogW25l
dyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDIyNTEzMTMxNi42MzE5NDAtMS1wYm9uemluaUBy
ZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMjUxMzEzMTYuNjMxOTQwLTEtcGJvbnppbmlAcmVk
aGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjAwMTYwZmUgdmw6IGRlcHJl
Y2F0ZSAtd3JpdGVjb25maWcKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBsaW5lIG92ZXIg
OTAgY2hhcmFjdGVycwojNjY6IEZJTEU6IHNvZnRtbXUvdmwuYzozMzU5OgorICAgICAgICAgICAg
ICAgICAgICB3YXJuX3JlcG9ydCgiLXdyaXRlY29uZmlnIGlzIGRlcHJlY2F0ZWQuICBJdCB3aWxs
IGdvIGF3YXkgaW4gUUVNVSA2LjIgd2l0aCBubyByZXBsYWNlbWVudCIpOwoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCAzNCBsaW5lcyBjaGVja2VkCgpDb21taXQgMDAxNjBmZWE4ZjdmICh2
bDogZGVwcmVjYXRlIC13cml0ZWNvbmZpZykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAyMjUx
MzEzMTYuNjMxOTQwLTEtcGJvbnppbmlAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

