Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56D2AD5A3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:53:15 +0100 (CET)
Received: from localhost ([::1]:53944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSD4-0006WY-9h
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kcSBn-0005pG-I6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:51:55 -0500
Resent-Date: Tue, 10 Nov 2020 06:51:55 -0500
Resent-Message-Id: <E1kcSBn-0005pG-I6@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kcSBl-0000s6-0S
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:51:54 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605009105; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HODyIfve32tBgxaS+STvR/8aw5fHMbw4BrROteA75c5kEIkiXjUTgQ5fn5kSRYhEkYWBsaJIGYweI6SF04W8lX9grFMTc/K/Ga4Bn4Qk+mfelMAUtfw6TrKALp4nLmwDoe2RLHCE9SFI6mQ5DUiciLKf65OBb3uZKsYUHnTh3kk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605009105;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=K6fVBDYKP+YvwxmW5LIzwxC6LSZr2iEAEPhJILTcfUE=; 
 b=PnLrp9mBlgp5QGEc8Sh5FU3P7upHui4lNtL3Z9amo8JR9YXoa5x55HjR4HgF6Bh2X/CWxgC4GlnEbgHq8xmi6AH551TCFtPbSk/eNNbU3FXv7ujTHwN8i/ezD04qiLsMK9yfeT8+0wvuout/elboDNanGjeY1Vm3twovb8xAtj0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605009103623233.09675611727732;
 Tue, 10 Nov 2020 03:51:43 -0800 (PST)
Message-ID: <160500910264.14942.5761385348064535777@b92d57cec08d>
Subject: Re: [PULL 0/6] Misc fixes for QEMU 5.2-rc2
In-Reply-To: <20201110112909.1103518-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Tue, 10 Nov 2020 03:51:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 06:51:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExMDExMjkwOS4xMTAz
NTE4LTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAyMDExMTAxMTI5MDkuMTEwMzUxOC0xLXBib256
aW5pQHJlZGhhdC5jb20KU3ViamVjdDogW1BVTEwgMC82XSBNaXNjIGZpeGVzIGZvciBRRU1VIDUu
Mi1yYzIKVHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNo
CmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRy
dWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
VXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0
dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAg
ICBwYXRjaGV3LzIwMjAxMTEwMTEyOTA5LjExMDM1MTgtMS1wYm9uemluaUByZWRoYXQuY29tIC0+
IHBhdGNoZXcvMjAyMDExMTAxMTI5MDkuMTEwMzUxOC0xLXBib256aW5pQHJlZGhhdC5jb20KU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozNGIyMmNiIHB2cGFuaWM6IEFkdmVydGlzZSB0
aGUgUFZQQU5JQ19DUkFTSExPQURFRCBldmVudCBzdXBwb3J0CjU5NGYzZGQgcGh5c21lbTogaW1w
cm92ZSByYW0gc2l6ZSBlcnJvciBtZXNzYWdlcwozMzZlMTIyIE1ha2VmaWxlOiBObyBlY2hvaW5n
IGZvciAnbWFrZSBoZWxwIFY9MScKZWYwYWYzOCByZXBsYXk6IHJlbW92ZSBzb21lIGRlYWQgY29k
ZQpiYTdmOThkIGZpeCBtYWtlIGNsZWFuL2Rpc3RjbGVhbgozN2Q2ZjBiIG1lc29uOiBDbGFyaWZ5
IHRoZSBjb25mdXNpbmcgdmhvc3QtdXNlciB2cy4gdmhvc3Qta2VybmVsIG91dHB1dAoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KMS82IENoZWNraW5nIGNvbW1pdCAzN2Q2ZjBiMjM5NWIgKG1lc29uOiBD
bGFyaWZ5IHRoZSBjb25mdXNpbmcgdmhvc3QtdXNlciB2cy4gdmhvc3Qta2VybmVsIG91dHB1dCkK
Mi82IENoZWNraW5nIGNvbW1pdCBiYTdmOThkMDJiY2YgKGZpeCBtYWtlIGNsZWFuL2Rpc3RjbGVh
bikKMy82IENoZWNraW5nIGNvbW1pdCBlZjBhZjM4N2I3MGEgKHJlcGxheTogcmVtb3ZlIHNvbWUg
ZGVhZCBjb2RlKQo0LzYgQ2hlY2tpbmcgY29tbWl0IDMzNmUxMjI1MDUxNSAoTWFrZWZpbGU6IE5v
IGVjaG9pbmcgZm9yICdtYWtlIGhlbHAgVj0xJykKNS82IENoZWNraW5nIGNvbW1pdCA1OTRmM2Rk
MDkxMDEgKHBoeXNtZW06IGltcHJvdmUgcmFtIHNpemUgZXJyb3IgbWVzc2FnZXMpCjYvNiBDaGVj
a2luZyBjb21taXQgMzRiMjJjYjBkOTVlIChwdnBhbmljOiBBZHZlcnRpc2UgdGhlIFBWUEFOSUNf
Q1JBU0hMT0FERUQgZXZlbnQgc3VwcG9ydCkKRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJz
CiM1MzogRklMRTogaHcvbWlzYy9wdnBhbmljLmM6MTE3OgorICAgIERFRklORV9QUk9QX1VJTlQ4
KCJldmVudHMiLCBQVlBhbmljU3RhdGUsIGV2ZW50cywgUFZQQU5JQ19QQU5JQ0tFRCB8IFBWUEFO
SUNfQ1JBU0hMT0FERUQpLAoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyOSBsaW5lcyBj
aGVja2VkCgpQYXRjaCA2LzYgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMTEwMTEyOTA5LjEx
MDM1MTgtMS1wYm9uemluaUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNz
YWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6
Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2
ZWxAcmVkaGF0LmNvbQ==

