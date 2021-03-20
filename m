Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158DA34301E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 23:44:28 +0100 (CET)
Received: from localhost ([::1]:41598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNkKZ-00008J-5c
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 18:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lNkJ8-0007pC-Bo
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:42:58 -0400
Resent-Date: Sat, 20 Mar 2021 18:42:58 -0400
Resent-Message-Id: <E1lNkJ8-0007pC-Bo@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lNkJ5-0001Ua-Mu
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 18:42:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616280168; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DhTJ7XWZyora9K5MCDJ7eoYYB9yEKPkJJGKhFAr0SXH+VFdDdR7cy96rYDS4LIsJotgO53f1kjXpAilNoXun97beKY02yowgcI7G0BF/gw9zrvNhVFVoqyxr8KDsfE/yLaBrI6gNFAd/aGyMivVyqMOWHzYtkYqjdX1T2lRTIZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616280168;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=4gm8H787LagBjEAX+wc2TVJth2jVt/TVMRz7hKBQnIg=; 
 b=RDHXPge4vNPSx4YuID3+K9T7ha2MrJ7RCjINWezBrusm/MjDLkp1jZteIRm0VQfXGHfKvjX/1sLXUCDBeNDEcYovDwDaaMSDlF2sedglOSTTmTp7pyKoX/d/azYBH7DwKauFhKVQBhpTlvqmdKs7n8He57DVI+q/e2hmy2b/57Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616280166372180.5174354622593;
 Sat, 20 Mar 2021 15:42:46 -0700 (PDT)
In-Reply-To: <YFZ5YgPWLraY5v3o@os.inf.tu-dresden.de>
Subject: Re: Arm: VFP regression
Message-ID: <161628016524.8447.3932552863049857509@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: adam@l4re.org
Date: Sat, 20 Mar 2021 15:42:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9ZRlo1WWdQV0xyYVk1djNvQG9z
LmluZi50dS1kcmVzZGVuLmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogWUZaNVlnUFdMcmFZNXYzb0Bvcy5pbmYu
dHUtZHJlc2Rlbi5kZQpTdWJqZWN0OiBBcm06IFZGUCByZWdyZXNzaW9uCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8
fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3Jp
dGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9
PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRl
ZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3Qv
cWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3L1lGWjVZZ1BXTHJhWTV2M29Ab3MuaW5m
LnR1LWRyZXNkZW4uZGUgLT4gcGF0Y2hldy9ZRlo1WWdQV0xyYVk1djNvQG9zLmluZi50dS1kcmVz
ZGVuLmRlClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYTIwYjc1MCBBcm06IFZGUCBy
ZWdyZXNzaW9uCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogTWlzc2luZyBTaWduZWQtb2Zm
LWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDggbGluZXMgY2hlY2tl
ZAoKQ29tbWl0IGEyMGI3NTAyMjI4ZCAoQXJtOiBWRlAgcmVncmVzc2lvbikgaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdp
dGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvWUZaNVlnUFdMcmFZNXYzb0Bvcy5pbmYudHUtZHJlc2Rlbi5kZS90ZXN0aW5nLmNo
ZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5
IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

