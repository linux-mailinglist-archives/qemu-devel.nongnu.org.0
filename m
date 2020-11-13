Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678D2B1BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:41:21 +0100 (CET)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZKK-0005bb-1q
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kdZJ1-0004Xj-RZ
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:39:59 -0500
Resent-Date: Fri, 13 Nov 2020 08:39:59 -0500
Resent-Message-Id: <E1kdZJ1-0004Xj-RZ@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kdZIz-0001U9-4U
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:39:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605274783; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lf+smNPWwrrmBHHWd8n3/Slcq7+O2++K1lKI0I2FJ6k7sCfn5St2MHeCdf17t4gifL3MUw4hPOkV8jHXwFw0KIMYD8ua4GQ38HQZ+H2qU0mZafb2CqebkjKHYiAmHgBUg9uf9uN9iJdFGaURHdFGrTYtC1yZLogwHqEx+jX5sK0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605274783;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=tMaq2uVwJxLyKF1kY9opiimD1sQna+QKtxjWpTzyjRc=; 
 b=fOiDEDsZ4r96vjDw9rlRLb/peLjLMp9T7/adxqR0ASxxBpsqCSoOLA6GNhq4hKmlRFMFi8KtovfQgPJY4c1kTx/aJGdIlSdu7PMt5Z25AZkjEdeZPocu/8Aw9ROTzL96tsWtS8UrDImLDcThRNjBwwG2jiuyx56AcGlcL9rfxk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605274780971483.63256801563887;
 Fri, 13 Nov 2020 05:39:40 -0800 (PST)
Subject: Re: [PATCH] tests: add prefixes to the bare mkdtemp calls
Message-ID: <160527477921.299.1181611218451080054@d9ec01ea6314>
In-Reply-To: <20201113133424.8723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Fri, 13 Nov 2020 05:39:40 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 08:39:54
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
 alex.bennee@hackbox2.linaro.org, qemu-devel@nongnu.org, wainersm@redhat.com,
 philmd@redhat.com, jsnow@redhat.com, crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExMzEzMzQyNC44NzIz
LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAyMDExMTMxMzM0MjQuODcyMy0xLWFsZXguYmVu
bmVlQGxpbmFyby5vcmcKVHlwZTogc2VyaWVzClN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGFkZCBw
cmVmaXhlcyB0byB0aGUgYmFyZSBta2R0ZW1wIGNhbGxzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4g
PT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3Rv
Z3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4
ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBb
dGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjAxMTEzMDgyNjI2LjI3MjU4MTItMS1hcm1icnVA
cmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjAxMTEzMDgyNjI2LjI3MjU4MTItMS1hcm1icnVAcmVk
aGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMTEzMTMzNDI0Ljg3MjMt
MS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMDExMTMxMzM0MjQuODcyMy0x
LWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwow
YTZkMTFlIHRlc3RzOiBhZGQgcHJlZml4ZXMgdG8gdGhlIGJhcmUgbWtkdGVtcCBjYWxscwoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzIzOiBG
SUxFOiBweXRob24vcWVtdS9tYWNoaW5lLnB5OjMwNjoKKyAgICAgICAgc2VsZi5fdGVtcF9kaXIg
PSB0ZW1wZmlsZS5ta2R0ZW1wKHByZWZpeD0icWVtdS1tYWNoaW5lLSIsIGRpcj1zZWxmLl90ZXN0
X2RpcikKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMzY6IEZJTEU6IHRlc3RzL2Fj
Y2VwdGFuY2UvYXZvY2Fkb19xZW11L19faW5pdF9fLnB5OjE3NDoKKyAgICAgICAgdm0gPSBRRU1V
TWFjaGluZShzZWxmLnFlbXVfYmluLCBzb2NrX2Rpcj10ZW1wZmlsZS5ta2R0ZW1wKHByZWZpeD0i
YXZvY2Fkb19xZW11X3NvY2tfIikpCgp0b3RhbDogMSBlcnJvcnMsIDEgd2FybmluZ3MsIDE2IGxp
bmVzIGNoZWNrZWQKCkNvbW1pdCAwYTZkMTFlMDI4MjQgKHRlc3RzOiBhZGQgcHJlZml4ZXMgdG8g
dGhlIGJhcmUgbWtkdGVtcCBjYWxscykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3
LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVt
IHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9V
VFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxs
IGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDExMTMxMzM0
MjQuODcyMy0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t

