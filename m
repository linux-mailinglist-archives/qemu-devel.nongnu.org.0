Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106932F371
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 20:06:32 +0100 (CET)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFmR-0001Yl-1t
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 14:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lIFix-00082H-1U; Fri, 05 Mar 2021 14:02:55 -0500
Resent-Date: Fri, 05 Mar 2021 14:02:55 -0500
Resent-Message-Id: <E1lIFix-00082H-1U@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lIFiu-0005eT-E2; Fri, 05 Mar 2021 14:02:54 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614970950; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IGJlhwkNh6Y5AjFpZmuIdaMn1etJmvsZ9KYueYbdyVWCLK5SPJZirGdsFkUxgnY0pRDK74cF/X9SRY4mSwtNyn3JY19Yh9We6uBJj5ldiT+mHdKhRmdB63hWd33mdGFWxMjOLmv/somFX63+cbzz058VyXCX/ofIaq6jBRNqQrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614970950;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=42quQYIzb/Egk9lLeL4+7KBGHMPQalO6NfhPAqQzR4g=; 
 b=Uph92pg2XPgrMwCeCtHiJ/3lA/wPrj380DYee7FyTd18UEuGcuiv314r7ylecU6KDQAVnWiKGMFZC3zKSVuWUSOYpYTBB+amWn2GHgWuoQ/BEFUDzQKgwPPUO9OIFn/7qizaSoCIPR8N4YglE4l/LvaS5sl3n82PO1f65RXpYLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614970850719133.2847356561682;
 Fri, 5 Mar 2021 11:00:50 -0800 (PST)
In-Reply-To: <20210305183857.3120188-1-wuhaotsh@google.com>
Subject: Re: [PATCH 0/4] hw/misc: Add NPCM7XX Tachometer Device
Message-ID: <161497084913.14855.6309011504141188246@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Fri, 5 Mar 2021 11:00:50 -0800 (PST)
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwNTE4Mzg1Ny4zMTIw
MTg4LTEtd3VoYW90c2hAZ29vZ2xlLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzA1MTgzODU3LjMx
MjAxODgtMS13dWhhb3RzaEBnb29nbGUuY29tClN1YmplY3Q6IFtQQVRDSCAwLzRdIGh3L21pc2M6
IEFkZCBOUENNN1hYIFRhY2hvbWV0ZXIgRGV2aWNlCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFn
IHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzAyMTc1NzQxLjEwNzk4NTEtMS1yaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTAzMDIxNzU3NDEuMTA3OTg1MS0xLXJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8y
MDIxMDMwNTE3MDA0NS44Njk0MzctMS1rYmFzdGlhbkBtYWlsLnVuaS1wYWRlcmJvcm4uZGUgLT4g
cGF0Y2hldy8yMDIxMDMwNTE3MDA0NS44Njk0MzctMS1rYmFzdGlhbkBtYWlsLnVuaS1wYWRlcmJv
cm4uZGUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMwNTE3MTUxNS4xMDM4LTEt
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTAzMDUxNzE1MTUuMTAzOC0x
LXBldGVyLm1heWRlbGxAbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIw
MjEwMzA1MTgzODU3LjMxMjAxODgtMS13dWhhb3RzaEBnb29nbGUuY29tIC0+IHBhdGNoZXcvMjAy
MTAzMDUxODM4NTcuMzEyMDE4OC0xLXd1aGFvdHNoQGdvb2dsZS5jb20KU3dpdGNoZWQgdG8gYSBu
ZXcgYnJhbmNoICd0ZXN0Jwo3YjE4MTAxIHRlc3RzL3F0ZXN0OiBUZXN0IFBXTSBmYW4gUlBNIHVz
aW5nIE1GVCBpbiBQV00gdGVzdAo1Mzc5OWU2IGh3L2FybTogQ29ubmVjdCBQV00gZmFucyBpbiBO
UENNN1hYIGJvYXJkcwo5MjI2YjZkIGh3L21pc2M6IEFkZCBOUENNN1hYIE1GVCBNb2R1bGUKNDAz
NzYyYSBody9taXNjOiBBZGQgR1BJT3MgZm9yIGR1dHkgaW4gTlBDTTd4eCBQV00KCj09PSBPVVRQ
VVQgQkVHSU4gPT09CjEvNCBDaGVja2luZyBjb21taXQgNDAzNzYyYTQ2YWU5IChody9taXNjOiBB
ZGQgR1BJT3MgZm9yIGR1dHkgaW4gTlBDTTd4eCBQV00pCkVSUk9SOiBBdXRob3IgZW1haWwgYWRk
cmVzcyBpcyBtYW5nbGVkIGJ5IHRoZSBtYWlsaW5nIGxpc3QKIzI6IApBdXRob3I6IEhhbyBXdSB2
aWEgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywg
MzggbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS80IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoy
LzQgQ2hlY2tpbmcgY29tbWl0IDkyMjZiNmQ0MThjYSAoaHcvbWlzYzogQWRkIE5QQ003WFggTUZU
IE1vZHVsZSkKVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFsdWUgJGFjcGlfdGVzdGV4cGVjdGVkIGlu
IHN0cmluZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBsaW5lIDE1MjkuCkVSUk9SOiBB
dXRob3IgZW1haWwgYWRkcmVzcyBpcyBtYW5nbGVkIGJ5IHRoZSBtYWlsaW5nIGxpc3QKIzI6IApB
dXRob3I6IEhhbyBXdSB2aWEgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4KCldBUk5JTkc6IGFkZGVk
LCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGlu
Zz8KIzE1MTogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMSBlcnJvcnMsIDEgd2Fybmlu
Z3MsIDczNSBsaW5lcyBjaGVja2VkCgpQYXRjaCAyLzQgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KCjMvNCBDaGVja2luZyBjb21taXQgNTM3OTllNjBjMTY2IChody9hcm06IENvbm5lY3QgUFdN
IGZhbnMgaW4gTlBDTTdYWCBib2FyZHMpCkVSUk9SOiBBdXRob3IgZW1haWwgYWRkcmVzcyBpcyBt
YW5nbGVkIGJ5IHRoZSBtYWlsaW5nIGxpc3QKIzI6IApBdXRob3I6IEhhbyBXdSB2aWEgPHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZz4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTY2IGxpbmVz
IGNoZWNrZWQKClBhdGNoIDMvNCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKNC80IENoZWNr
aW5nIGNvbW1pdCA3YjE4MTAxNzFkZTMgKHRlc3RzL3F0ZXN0OiBUZXN0IFBXTSBmYW4gUlBNIHVz
aW5nIE1GVCBpbiBQV00gdGVzdCkKRVJST1I6IEF1dGhvciBlbWFpbCBhZGRyZXNzIGlzIG1hbmds
ZWQgYnkgdGhlIG1haWxpbmcgbGlzdAojMjogCkF1dGhvcjogSGFvIFd1IHZpYSA8cWVtdS1kZXZl
bEBub25nbnUub3JnPgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyODcgbGluZXMgY2hl
Y2tlZAoKUGF0Y2ggNC80IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVO
RCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlz
IGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMwNTE4Mzg1Ny4zMTIw
MTg4LTEtd3VoYW90c2hAZ29vZ2xlLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2Fn
ZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8v
cGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVs
QHJlZGhhdC5jb20=

