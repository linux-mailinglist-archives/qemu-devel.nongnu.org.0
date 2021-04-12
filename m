Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E0335C446
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:43:57 +0200 (CEST)
Received: from localhost ([::1]:35586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVu2u-0005tV-DT
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lVu1w-0005QU-3w
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:42:56 -0400
Resent-Date: Mon, 12 Apr 2021 06:42:56 -0400
Resent-Message-Id: <E1lVu1w-0005QU-3w@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lVu1t-0006kV-Lv
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:42:55 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618224169; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=b4MfV8NlOcNXxifZG/AQp/SREO8zSDOUIhL36KbM3OX62DT5R9V9T0xwpByeWFjEbQ5xCK/nExrU0VvE7vLESKEtsh7ULBoQPaSqcgscj2qYWVk/2RKyWwYsEJEcGnsCIe/1RFkFuVutnlTf3TQPMO86bSuEeSsknFcZdCCaZuc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618224169;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=S+hppHDMWNRTtLm3bvUZcxATl/432pkdDYbWJj2I54A=; 
 b=WCf/6it71t25L98kJq2RZe+L1PNv0FFrn3NBfe1iDJdAqpCh4HyumNSPwGRhjpiQfPPm2HFVu6k0GxhImbLUCu8WF2o7FzeFo41QEuSZ3CaD5YeOWUvyDSQ92Zc3qyT8js1tCTnFG4mkGz+Ajzod7dlrL8T4juPokyTfP1oSdVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618224167394775.3628874518171;
 Mon, 12 Apr 2021 03:42:47 -0700 (PDT)
In-Reply-To: <20210412103152.28433-1-peter.maydell@linaro.org>
Subject: Re: [PULL 0/5] target-arm queue
Message-ID: <161822416648.28616.8361442726755622046@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Mon, 12 Apr 2021 03:42:47 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxMjEwMzE1Mi4yODQz
My0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNDEyMTAzMTUy
LjI4NDMzLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnClN1YmplY3Q6IFtQVUxMIDAvNV0gdGFy
Z2V0LWFybSBxdWV1ZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQg
cmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNr
cGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0
aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0
Y2hldy8yMDIxMDQxMjEwMzE1Mi4yODQzMy0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMjEwNDEyMTAzMTUyLjI4NDMzLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnClN3
aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYjU0ZGVkMiBleGVjOiBGaXggb3ZlcmxhcCBv
ZiBQQUdFX0FOT04gYW5kIFBBR0VfVEFSR0VUXzEKNWY3ZDllNyB0YXJnZXQvYXJtOiBDaGVjayBQ
QUdFX1dSSVRFX09SRyBmb3IgTVRFIHdyaXRlYWJpbGl0eQphM2ZiMTBlIGFjY2VsL3RjZzogUHJl
c2VydmUgUEFHRV9BTk9OIHdoZW4gY2hhbmdpbmcgcGFnZSBwZXJtaXNzaW9ucwo0MzVjZWViIGh3
L2FybS9zbW11djM6IEVtdWxhdGUgQ0ZHSV9TVEVfUkFOR0UgZm9yIGFuIGFsaWduZWQgcmFuZ2Ug
b2YgU3RyZWFtSURzCjIxMTkwZjMgaHcvYXJtL3ZpcnQtYWNwaS1idWlsZDogRml4IEdTSVYgdmFs
dWVzIG9mIHRoZSB7R0VSUiwgU3luY30gaW50ZXJydXB0cwoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
MS81IENoZWNraW5nIGNvbW1pdCAyMTE5MGYzMWQ0MjAgKGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6
IEZpeCBHU0lWIHZhbHVlcyBvZiB0aGUge0dFUlIsIFN5bmN9IGludGVycnVwdHMpCjIvNSBDaGVj
a2luZyBjb21taXQgNDM1Y2VlYjBjODlhIChody9hcm0vc21tdXYzOiBFbXVsYXRlIENGR0lfU1RF
X1JBTkdFIGZvciBhbiBhbGlnbmVkIHJhbmdlIG9mIFN0cmVhbUlEcykKMy81IENoZWNraW5nIGNv
bW1pdCBhM2ZiMTBlYzBkMjMgKGFjY2VsL3RjZzogUHJlc2VydmUgUEFHRV9BTk9OIHdoZW4gY2hh
bmdpbmcgcGFnZSBwZXJtaXNzaW9ucykKVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFsdWUgJGFjcGlf
dGVzdGV4cGVjdGVkIGluIHN0cmluZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBsaW5l
IDE1MjkuCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJ
TlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzY5OiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCkVSUk9S
OiAiZm9vICogYmFyIiBzaG91bGQgYmUgImZvbyAqYmFyIgojMTI2OiBGSUxFOiB0ZXN0cy90Y2cv
YWFyY2g2NC9tdGUuaDo1MToKK3N0YXRpYyB2b2lkICogYWxsb2NfbXRlX21lbShzaXplX3Qgc2l6
ZSkgX19hdHRyaWJ1dGVfXygodW51c2VkKSk7CgpFUlJPUjogImZvbyAqIGJhciIgc2hvdWxkIGJl
ICJmb28gKmJhciIKIzEyNzogRklMRTogdGVzdHMvdGNnL2FhcmNoNjQvbXRlLmg6NTI6CitzdGF0
aWMgdm9pZCAqIGFsbG9jX210ZV9tZW0oc2l6ZV90IHNpemUpCgp0b3RhbDogMiBlcnJvcnMsIDEg
d2FybmluZ3MsIDg0IGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvNSBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKNC81IENoZWNraW5nIGNvbW1pdCA1ZjdkOWU3MmRjMWIgKHRhcmdldC9hcm06IENo
ZWNrIFBBR0VfV1JJVEVfT1JHIGZvciBNVEUgd3JpdGVhYmlsaXR5KQpXQVJOSU5HOiBsaW5lIG92
ZXIgODAgY2hhcmFjdGVycwojMzA6IEZJTEU6IHRhcmdldC9hcm0vbXRlX2hlbHBlci5jOjg2Ogor
ICAgIGlmICghKGZsYWdzICYgKHB0cl9hY2Nlc3MgPT0gTU1VX0RBVEFfU1RPUkUgPyBQQUdFX1dS
SVRFX09SRyA6IFBBR0VfUkVBRCkpKSB7Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDgg
bGluZXMgY2hlY2tlZAoKUGF0Y2ggNC81IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmll
dy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhl
bSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCjUvNSBD
aGVja2luZyBjb21taXQgYjU0ZGVkMmFiOWZiIChleGVjOiBGaXggb3ZlcmxhcCBvZiBQQUdFX0FO
T04gYW5kIFBBR0VfVEFSR0VUXzEpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4
aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9w
YXRjaGV3Lm9yZy9sb2dzLzIwMjEwNDEyMTAzMTUyLjI4NDMzLTEtcGV0ZXIubWF5ZGVsbEBsaW5h
cm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVh
c2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

