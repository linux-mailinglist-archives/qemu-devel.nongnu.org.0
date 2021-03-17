Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2233E7D4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:44:02 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMN6H-0008OJ-7P
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMN5J-0007sm-6v
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:43:01 -0400
Resent-Date: Tue, 16 Mar 2021 23:43:01 -0400
Resent-Message-Id: <E1lMN5J-0007sm-6v@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMN5G-0005KH-VT
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:43:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615952570; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BT+Hdk9aeT43ce4YJ64EQCbWJ9ODcp57EEA86II4TFlgxgK7seD/FVDuJ/Qf3yuYlGgTrEk/YwMBTxhuAWnUIvjDt7WAgEOzI8jarl0q02SwzLnt18tEtWE0isPqq6Zsvsw0doCjFuLvBb26Q23f54LngPqBJTzjIMRRVY1dTkU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615952570;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=YCR2eM38ERfyBaIq+MrpMbd/4pFQDdBpKSWFk17hvOI=; 
 b=elCAXDV9hPELrBIuukbsHoH3lkY8NUGprjKndb3yU1pUYcodbFQmGPWvto9o188VXGCKtjd4eKIr0OvpleNzumwn2h+LkeAf1+7U944QvG2LobOH8jTi/rEQ6DEqmaiA4coDw2+4cGP1yFkOi77nJ8Nu4I/9uqEw8FOux+KeUJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615952567804466.5555189776817;
 Tue, 16 Mar 2021 20:42:47 -0700 (PDT)
In-Reply-To: <20210317032217.1460684-1-michael.roth@amd.com>
Subject: Re: [PULL for-6.0 0/6] qemu-ga patch queue for soft-freeze
Message-ID: <161595256668.22200.12465110124579155432@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: michael.roth@amd.com
Date: Tue, 16 Mar 2021 20:42:47 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNzAzMjIxNy4xNDYw
Njg0LTEtbWljaGFlbC5yb3RoQGFtZC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMxNzAzMjIxNy4x
NDYwNjg0LTEtbWljaGFlbC5yb3RoQGFtZC5jb20KU3ViamVjdDogW1BVTEwgZm9yLTYuMCAwLzZd
IHFlbXUtZ2EgcGF0Y2ggcXVldWUgZm9yIHNvZnQtZnJlZXplCgo9PT0gVEVTVCBTQ1JJUFQgQkVH
SU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhp
c3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVT
VCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRi
ZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQog
LSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzA0MTIzOTUxLjE2MzQxMS0xLWpvZWxA
am1zLmlkLmF1IC0+IHBhdGNoZXcvMjAyMTAzMDQxMjM5NTEuMTYzNDExLTEtam9lbEBqbXMuaWQu
YXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMxNzAzMjIxNy4xNDYwNjg0LTEt
bWljaGFlbC5yb3RoQGFtZC5jb20gLT4gcGF0Y2hldy8yMDIxMDMxNzAzMjIxNy4xNDYwNjg0LTEt
bWljaGFlbC5yb3RoQGFtZC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3Mzdh
MmIwIHFnYTogcmV0dXJuIGEgbW9yZSBleHBsaWNpdCBlcnJvciBvbiB3aHkgYSBjb21tYW5kIGlz
IGRpc2FibGVkCjBiZjg4NjQgcWdhOiBTd2l0Y2ggYW5kIGNhc2Ugc2hvdWxkIGJlIGF0IHRoZSBz
YW1lIGluZGVudAo1OWYxNTIzIHFnYTogT3BlbiBicmFjZSAneycgZm9sbG93aW5nIHN0cnVjdCBn
byBvbiB0aGUgc2FtZQo5YTY1Y2EyIHFnYTogRGVsZXRlIHJlZHVuZGFudCBzcGFjZXMKZjQ1YTJj
MSBxZ2E6IEFkZCBzcGFjZXMgYXJvdW5kIG9wZXJhdG9yCjBhMGVhYjEgcWdhOiBDb3JyZWN0IGxv
b3AgY291bnQgaW4gcW1wX2d1ZXN0X2dldF92Y3B1cygpCgo9PT0gT1VUUFVUIEJFR0lOID09PQox
LzYgQ2hlY2tpbmcgY29tbWl0IDBhMGVhYjE2MTBmNiAocWdhOiBDb3JyZWN0IGxvb3AgY291bnQg
aW4gcW1wX2d1ZXN0X2dldF92Y3B1cygpKQoyLzYgQ2hlY2tpbmcgY29tbWl0IGY0NWEyYzFmNWJj
NyAocWdhOiBBZGQgc3BhY2VzIGFyb3VuZCBvcGVyYXRvcikKMy82IENoZWNraW5nIGNvbW1pdCA5
YTY1Y2EyNzgzZjAgKHFnYTogRGVsZXRlIHJlZHVuZGFudCBzcGFjZXMpCkVSUk9SOiBzcGFjZXMg
cmVxdWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6V3hWKQojMzQ6IEZJTEU6IHFnYS9jb21tYW5k
cy13aW4zMi5jOjIxNzc6CisgICAgdHlwZWRlZiBOVFNUQVRVUyhXSU5BUEkgKnJ0bF9nZXRfdmVy
c2lvbl90KSgKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgp0b3RhbDogMSBlcnJvcnMs
IDAgd2FybmluZ3MsIDE2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvNiBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgoKNC82IENoZWNraW5nIGNvbW1pdCA1OWYxNTIzNDlhYzAgKHFnYTogT3BlbiBi
cmFjZSAneycgZm9sbG93aW5nIHN0cnVjdCBnbyBvbiB0aGUgc2FtZSkKNS82IENoZWNraW5nIGNv
bW1pdCAwYmY4ODY0MWFlMzcgKHFnYTogU3dpdGNoIGFuZCBjYXNlIHNob3VsZCBiZSBhdCB0aGUg
c2FtZSBpbmRlbnQpCjYvNiBDaGVja2luZyBjb21taXQgNzM3YTJiMGU3OGQwIChxZ2E6IHJldHVy
biBhIG1vcmUgZXhwbGljaXQgZXJyb3Igb24gd2h5IGEgY29tbWFuZCBpcyBkaXNhYmxlZCkKPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMTcw
MzIyMTcuMTQ2MDY4NC0xLW1pY2hhZWwucm90aEBhbWQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

