Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA9B2F7043
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:57:04 +0100 (CET)
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0EMK-0004GH-2m
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l0EKN-0003Z5-Qc; Thu, 14 Jan 2021 20:55:03 -0500
Resent-Date: Thu, 14 Jan 2021 20:55:03 -0500
Resent-Message-Id: <E1l0EKN-0003Z5-Qc@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l0EKL-0002PU-EV; Thu, 14 Jan 2021 20:55:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610675687; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C45+1kBLhBlsgowCRn5Mde2rX2Q90TLCg7hTmFsy+PnE2CeGC17bR0g5lwr5xatBF2Xm/Ix6BgDBnGa3oLxoNVZOkzjtXS7HnLev1C6YXhfP5isXLNJ5HSowVjYmaQvb0z4etZ0MbG+cHY/N7s06QYRsXfM2qGC8Gedi4Z0XAcw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610675687;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=326YZzSn0bshP2Pmk5wCw6hR9MvzjvKvHgq6cqhY0NE=; 
 b=fsWbTIEeANGaEK1+kLAoA+2/MYrmE/lE+vnZL1R5CRtURZxvsjKHg9qSfS2NivSn7E4CeJfmDSB+drtz6RQy4IkOSxC9LzQsZQGYNeZrQIpngFn8L7X62UUvdluSp/a8Ej2K32BceTzCNpBn0AD0v/DQrqVo0rcZOFVGD3TK/NI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610675685452674.4957428190091;
 Thu, 14 Jan 2021 17:54:45 -0800 (PST)
In-Reply-To: <20210115012431.79533-1-zhanghan64@huawei.com>
Subject: Re: [PATCH v2 0/7]Fix some style problems in audio
Message-ID: <161067568385.26655.3608742083119578086@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhanghan64@huawei.com
Date: Thu, 14 Jan 2021 17:54:45 -0800 (PST)
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
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com,
 kraxel@redhat.com, zhanghan64@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDExNTAxMjQzMS43OTUz
My0xLXpoYW5naGFuNjRAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTE1MDEyNDMxLjc5
NTMzLTEtemhhbmdoYW42NEBodWF3ZWkuY29tClN1YmplY3Q6IFtQQVRDSCB2MiAwLzddRml4IHNv
bWUgc3R5bGUgcHJvYmxlbXMgaW4gYXVkaW8KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJl
bmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4v
c2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBF
TkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0
CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFn
XSAgICAgICAgIHBhdGNoZXcvMjAyMTAxMTUwMTI0MzEuNzk1MzMtMS16aGFuZ2hhbjY0QGh1YXdl
aS5jb20gLT4gcGF0Y2hldy8yMDIxMDExNTAxMjQzMS43OTUzMy0xLXpoYW5naGFuNjRAaHVhd2Vp
LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmFhOWZkNDEgYXVkaW86IHNwYWNl
IHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBwYXJlbnRoZXNpcycoJwpmMzZl
YmU5IGF1ZGlvOiBTdXNwZWN0IGNvZGUgaW5kZW50IGZvciBjb25kaXRpb25hbCBzdGF0ZW1lbnRz
CmE1MDQ4YjQgYXVkaW86IERvbid0IHVzZSAnJSMnIGluIGZvcm1hdCBzdHJpbmdzCjEzNmRmNWQg
YXVkaW86IEZpeCBsaW5lcyBvdmVyIDkwIGNoYXJhY3RlcnMKNWNmZWExNiBhdWRpbzogZm9vKiBi
YXIiIHNob3VsZCBiZSAiZm9vICpiYXIiLgowZjQzMjRmIGF1ZGlvOiBBZGQgc3BhY2VzIGFyb3Vu
ZCBvcGVyYXRvci9kZWxldGUgcmVkdW5kYW50IHNwYWNlcwo0YTliOTE2IGF1ZGlvOiBBZGQgYnJh
Y2VzIGZvciBzdGF0ZW1lbnRzL2ZpeCBicmFjZXMnIHBvc2l0aW9uCgo9PT0gT1VUUFVUIEJFR0lO
ID09PQoxLzcgQ2hlY2tpbmcgY29tbWl0IDRhOWI5MTYwZjNjOSAoYXVkaW86IEFkZCBicmFjZXMg
Zm9yIHN0YXRlbWVudHMvZml4IGJyYWNlcycgcG9zaXRpb24pCjIvNyBDaGVja2luZyBjb21taXQg
MGY0MzI0ZmY2MzMzIChhdWRpbzogQWRkIHNwYWNlcyBhcm91bmQgb3BlcmF0b3IvZGVsZXRlIHJl
ZHVuZGFudCBzcGFjZXMpCkVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJldHdlZW4gZnVuY3Rpb24g
bmFtZSBhbmQgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzIzOiBGSUxFOiBhdWRpby9hdWRpb190ZW1w
bGF0ZS5oOjIxMToKKyAgICAgICAgZ2x1ZSAoYXVkaW9fcGNtX2h3X2ZyZWVfcmVzb3VyY2VzXyAs
IFRZUEUpIChodyk7Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDMyIGxpbmVzIGNoZWNr
ZWQKClBhdGNoIDIvNyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkg
b2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1h
aW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy83IENoZWNraW5nIGNv
bW1pdCA1Y2ZlYTE2M2RkODcgKGF1ZGlvOiBmb28qIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIu
KQo0LzcgQ2hlY2tpbmcgY29tbWl0IDEzNmRmNWQ3Njc2MiAoYXVkaW86IEZpeCBsaW5lcyBvdmVy
IDkwIGNoYXJhY3RlcnMpCjUvNyBDaGVja2luZyBjb21taXQgYTUwNDhiNDM3ZGFkIChhdWRpbzog
RG9uJ3QgdXNlICclIycgaW4gZm9ybWF0IHN0cmluZ3MpCjYvNyBDaGVja2luZyBjb21taXQgZjM2
ZWJlOTc1NTlmIChhdWRpbzogU3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29uZGl0aW9uYWwgc3Rh
dGVtZW50cykKNy83IENoZWNraW5nIGNvbW1pdCBhYTlmZDQxOTQ3YjQgKGF1ZGlvOiBzcGFjZSBw
cm9oaWJpdGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgcGFyZW50aGVzaXMnKCcpCj09PSBP
VVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVs
bCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMTE1MDEy
NDMxLjc5NTMzLTEtemhhbmdoYW42NEBodWF3ZWkuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==

