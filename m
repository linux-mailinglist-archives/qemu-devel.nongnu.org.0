Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45112B6629
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:02:24 +0100 (CET)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1Yt-0007IO-CN
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kf1XZ-0006aJ-Bz
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:01:01 -0500
Resent-Date: Tue, 17 Nov 2020 09:01:01 -0500
Resent-Message-Id: <E1kf1XZ-0006aJ-Bz@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kf1XS-0006F0-Uq
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:01:01 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605621648; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kvAps1NVKWT/je2D0PubhG7ZbxkctdClT7akzAJEHy1bffxT5YBMt6kHuLihEjtgfp4bMhk2ZhBEj1uBhh6o42wfU3yNQkfdezQsTKB/hTtXdSFUy4S/cevE7mmO0Zh2iA9wapWE2RHUu8S/4kSBF9O/Tv5hbbSqHPoNdR8aSh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605621648;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=z/7GE+3v2ihCATYAg1a6e3huVDhf/T1ThB0Kq6qcO9k=; 
 b=C9BVOppysTM5PhmcKatIvLXZTtzwGbSGTnaai3iUxrO04iJS86ucQMQBK+UDqJEJB32oKiTcBfXcryCuaNNh1XXdSBDplNka+s0j/heR3p3EMdNLPl05AO8Yuqq9ZYj6yABnXMijL7u0nBxmiZUyU5tYYzsB4cnHVcMWe8GO90Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 160562164506991.1766689123441;
 Tue, 17 Nov 2020 06:00:45 -0800 (PST)
Subject: Re: [PULL 0/9] target-arm queue
Message-ID: <160562164406.30774.1586995276042477844@d9ec01ea6314>
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Tue, 17 Nov 2020 06:00:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 09:00:52
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExNzEzNDgzNC4zMTcz
MS0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMjAyMDExMTcxMzQ4MzQuMzE3MzEtMS1wZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmcKVHlwZTogc2VyaWVzClN1YmplY3Q6IFtQVUxMIDAvOV0gdGFy
Z2V0LWFybSBxdWV1ZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQg
cmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNr
cGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0
aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0
Y2hldy8yMDIwMTExNzEzNDgzNC4zMTczMS0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMjAxMTE3MTM0ODM0LjMxNzMxLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnClN3
aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYmViYmZhOCB0bXAxMDU6IENvcnJlY3QgaGFu
ZGxpbmcgb2YgdGVtcGVyYXR1cmUgbGltaXQgY2hlY2tzCjdkYmUyMjggaHcvbWlzYy90bXAxMDU6
IHJlc2V0IHRoZSBUX2xvdyBhbmQgVF9IaWdoIHJlZ2lzdGVycwo0NmQ1ZTJmIGNvbmZpZ3VyZTog
TWFrZSAiZG9lcyBsaWJnaW8gd29yayIgdGVzdCBwdWxsIGluIHNvbWUgYWN0dWFsIGZ1bmN0aW9u
cwo0ZjU2YjVjIHV0aWwvY3V0aWxzOiBGaXggQ292ZXJpdHkgYXJyYXkgb3ZlcnJ1biBpbiBmcmVx
X3RvX3N0cigpCjFlZDQ2OGEgcmVnaXN0ZXI6IFJlbW92ZSB1bm5lY2Vzc2FyeSBOVUxMIGNoZWNr
CjcxMjExNzAgdGFyZ2V0L29wZW5yaXNjOiBSZW1vdmUgZGVhZCBjb2RlIGF0dGVtcHRpbmcgdG8g
Y2hlY2sgImlzIHRpbWVyIGRpc2FibGVkIgoxMDUwNjgzIGh3L2lucHV0L3BzMi5jOiBSZW1vdmUg
cmVtbmFudHMgb2YgcHJpbnRmIGRlYnVnCmM0ODU2MmEgZXh5bm9zOiBGaXggYmFkIHByaW50ZiBm
b3JtYXQgc3BlY2lmaWVycwphNTYwYTU3IGh3L2FybS92aXJ0OiBBUk1fVklSVCBtdXN0IHNlbGVj
dCBBUk1fR0lDCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzkgQ2hlY2tpbmcgY29tbWl0IGE1NjBh
NTdiYjgzZiAoaHcvYXJtL3ZpcnQ6IEFSTV9WSVJUIG11c3Qgc2VsZWN0IEFSTV9HSUMpCjIvOSBD
aGVja2luZyBjb21taXQgYzQ4NTYyYTkwNjgxIChleHlub3M6IEZpeCBiYWQgcHJpbnRmIGZvcm1h
dCBzcGVjaWZpZXJzKQozLzkgQ2hlY2tpbmcgY29tbWl0IDEwNTA2ODMyNWNkZiAoaHcvaW5wdXQv
cHMyLmM6IFJlbW92ZSByZW1uYW50cyBvZiBwcmludGYgZGVidWcpCjQvOSBDaGVja2luZyBjb21t
aXQgNzEyMTE3MDM3M2RmICh0YXJnZXQvb3BlbnJpc2M6IFJlbW92ZSBkZWFkIGNvZGUgYXR0ZW1w
dGluZyB0byBjaGVjayAiaXMgdGltZXIgZGlzYWJsZWQiKQo1LzkgQ2hlY2tpbmcgY29tbWl0IDFl
ZDQ2OGFmNjA5MCAocmVnaXN0ZXI6IFJlbW92ZSB1bm5lY2Vzc2FyeSBOVUxMIGNoZWNrKQo2Lzkg
Q2hlY2tpbmcgY29tbWl0IDRmNTZiNWNhMGYwNCAodXRpbC9jdXRpbHM6IEZpeCBDb3Zlcml0eSBh
cnJheSBvdmVycnVuIGluIGZyZXFfdG9fc3RyKCkpCjcvOSBDaGVja2luZyBjb21taXQgNDZkNWUy
ZjM3MTMwIChjb25maWd1cmU6IE1ha2UgImRvZXMgbGliZ2lvIHdvcmsiIHRlc3QgcHVsbCBpbiBz
b21lIGFjdHVhbCBmdW5jdGlvbnMpCjgvOSBDaGVja2luZyBjb21taXQgN2RiZTIyOGJhYTAxICho
dy9taXNjL3RtcDEwNTogcmVzZXQgdGhlIFRfbG93IGFuZCBUX0hpZ2ggcmVnaXN0ZXJzKQo5Lzkg
Q2hlY2tpbmcgY29tbWl0IGJlYmJmYTg3NGE4YSAodG1wMTA1OiBDb3JyZWN0IGhhbmRsaW5nIG9m
IHRlbXBlcmF0dXJlIGxpbWl0IGNoZWNrcykKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQg
dGhhdCAnKicgKGN0eDpWeFYpCiMxMjI6IEZJTEU6IGh3L21pc2MvdG1wMTA1LmM6MjYzOgorICAg
IC5zdWJzZWN0aW9ucyA9IChjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24qW10pIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDEgZXJyb3JzLCAw
IHdhcm5pbmdzLCAxMDggbGluZXMgY2hlY2tlZAoKUGF0Y2ggOS85IGhhcyBzdHlsZSBwcm9ibGVt
cywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0
aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJ
TlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcv
bG9ncy8yMDIwMTExNzEzNDgzNC4zMTczMS0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy90ZXN0
aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0
aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

