Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE9A38B393
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:48:40 +0200 (CEST)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkud-0001qe-K0
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljksB-00005n-4i; Thu, 20 May 2021 11:46:07 -0400
Resent-Date: Thu, 20 May 2021 11:46:07 -0400
Resent-Message-Id: <E1ljksB-00005n-4i@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljks6-0008SZ-SR; Thu, 20 May 2021 11:46:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621525552; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ePtzOlmapiV8JkixF8yhxC74cO0cP+IEnFtOVGshTTmaVXitdqGoQJa2QzCKmdpYLC3MqtPHyf4iJOACkyjPBYyYV1zqHgUUJ1sqvqSVJ+JQWoOmuhhIwK3FOSwmVf5krGAUVxRg9w5iGAgxRrBKhGiVZIKYKl8B9hG5NpyfchQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621525552;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=/OY1Zwthdk8Wy1s3tejRNkuwWfd5mmM/tL9V6LXcQ8k=; 
 b=JrGIcp0szmE8KGBlKQzaA2cG7cUNHfBcFHok52iuacXjFwv4zXhRST+e4SF7P3vbA8tthAv7+FfAYR1Pxp3KZwzUHQZT5I3cc/aA9cvREXWE8TfQXH7RjgQ8Kn3ajH6tIzRiYEchV+AyjJ2PBS58MJx0r+QkW6qGCvjwQwbx2jg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621525549294572.0422077754996;
 Thu, 20 May 2021 08:45:49 -0700 (PDT)
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
Subject: Re: [PATCH 0/9] target/arm: MVE preliminaries
Message-ID: <162152554825.4995.718077746100009057@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Thu, 20 May 2021 08:45:49 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUyMDE1Mjg0MC4yNDQ1
My0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTIwMTUyODQw
LjI0NDUzLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnClN1YmplY3Q6IFtQQVRDSCAwLzldIHRh
cmdldC9hcm06IE1WRSBwcmVsaW1pbmFyaWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQou
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4
NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjEwNTIwMTUyODQwLjI0NDUzLTEtcGV0ZXIubWF5ZGVsbEBs
aW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA1MjAxNTI4NDAuMjQ0NTMtMS1wZXRlci5tYXlkZWxs
QGxpbmFyby5vcmcKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDUyMDE1MzgzMS4x
MTg3My0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDUyMDE1MzgzMS4x
MTg3My0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0
ZXN0Jwo1NzE0YjI5IHRhcmdldC9hcm06IEFsbG93IGJvYXJkIG1vZGVscyB0byBzcGVjaWZ5IGlu
aXRpYWwgTlMgVlRPUgowYTkxYzRkIHRhcmdldC9hcm06IEVuYWJsZSBGUFNDUi5RQyBiaXQgZm9y
IE1WRQpkNDdkYTc4IHRhcmdldC9hcm06IE1ha2UgRlBTQ1IuTFRQU0laRSB3cml0YWJsZSBmb3Ig
TVZFCjZjNzIyOWEgdGFyZ2V0L2FybTogSW1wbGVtZW50IE0tcHJvZmlsZSBWUFIgcmVnaXN0ZXIK
NDdkYmVkMiB0YXJnZXQvYXJtOiBGaXggcmV0dXJuIHZhbHVlcyBpbiBmcF9zeXNyZWdfY2hlY2tz
KCkKNGIzNmE3MiB0YXJnZXQvYXJtOiBBZGQgTVZFIGNoZWNrIHRvIFZNT1ZfcmVnX3NwIGFuZCBW
TU9WX3JlZ19kcApkYmVmYWZkIHRhcmdldC9hcm06IE1vdmUgZnBzcC9mcGRwIGlzYXIgY2hlY2sg
aW50byBjYWxsZXJzIG9mIGRvX3ZmcF8yb3Bfc3AvZHAKNDkzYTg1OSB0YXJnZXQvYXJtOiBVcGRh
dGUgZmVhdHVyZSBjaGVja3MgZm9yIGluc25zIHdoaWNoIGFyZSAiTVZFIG9yIEZQIgo2MzNmYTBj
IHRhcmdldC9hcm06IEFkZCBpc2FyIGZlYXR1cmUgY2hlY2sgZnVuY3Rpb25zIGZvciBNVkUKCj09
PSBPVVRQVVQgQkVHSU4gPT09CjEvOSBDaGVja2luZyBjb21taXQgNjMzZmEwYzhkZTBiICh0YXJn
ZXQvYXJtOiBBZGQgaXNhciBmZWF0dXJlIGNoZWNrIGZ1bmN0aW9ucyBmb3IgTVZFKQoyLzkgQ2hl
Y2tpbmcgY29tbWl0IDQ5M2E4NTljMWQ3MiAodGFyZ2V0L2FybTogVXBkYXRlIGZlYXR1cmUgY2hl
Y2tzIGZvciBpbnNucyB3aGljaCBhcmUgIk1WRSBvciBGUCIpCjMvOSBDaGVja2luZyBjb21taXQg
ZGJlZmFmZGZlZmYzICh0YXJnZXQvYXJtOiBNb3ZlIGZwc3AvZnBkcCBpc2FyIGNoZWNrIGludG8g
Y2FsbGVycyBvZiBkb192ZnBfMm9wX3NwL2RwKQo0LzkgQ2hlY2tpbmcgY29tbWl0IDRiMzZhNzJi
NGZkNyAodGFyZ2V0L2FybTogQWRkIE1WRSBjaGVjayB0byBWTU9WX3JlZ19zcCBhbmQgVk1PVl9y
ZWdfZHApCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6V3hWKQoj
Mjg6IEZJTEU6IHRhcmdldC9hcm0vdHJhbnNsYXRlLXZmcC5jOjI4MjM6CisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGFyZ18jI0lOU04jI18jI1BSRUMgKmEpICAgXAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
CnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjEgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNC85
IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJv
cnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2Vl
CkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo1LzkgQ2hlY2tpbmcgY29tbWl0IDQ3ZGJlZDIy
Y2Y1YSAodGFyZ2V0L2FybTogRml4IHJldHVybiB2YWx1ZXMgaW4gZnBfc3lzcmVnX2NoZWNrcygp
KQo2LzkgQ2hlY2tpbmcgY29tbWl0IDZjNzIyOWFhYjQ0NSAodGFyZ2V0L2FybTogSW1wbGVtZW50
IE0tcHJvZmlsZSBWUFIgcmVnaXN0ZXIpCjcvOSBDaGVja2luZyBjb21taXQgZDQ3ZGE3ODQ1NmUw
ICh0YXJnZXQvYXJtOiBNYWtlIEZQU0NSLkxUUFNJWkUgd3JpdGFibGUgZm9yIE1WRSkKOC85IENo
ZWNraW5nIGNvbW1pdCAwYTkxYzRkZWIyODUgKHRhcmdldC9hcm06IEVuYWJsZSBGUFNDUi5RQyBi
aXQgZm9yIE1WRSkKOS85IENoZWNraW5nIGNvbW1pdCA1NzE0YjI5YTNiNmUgKHRhcmdldC9hcm06
IEFsbG93IGJvYXJkIG1vZGVscyB0byBzcGVjaWZ5IGluaXRpYWwgTlMgVlRPUikKV0FSTklORzog
bGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzU1OiBGSUxFOiBpbmNsdWRlL2h3L2FybS9hcm12N20u
aDo0OToKKyAqICsgUHJvcGVydHkgImluaXQtbnN2dG9yIjogbm9uLXNlY3VyZSBWVE9SIHJlc2V0
IHZhbHVlIChmb3J3YXJkZWQgdG8gQ1BVIG9iamVjdCkKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJu
aW5ncywgNjMgbGluZXMgY2hlY2tlZAoKUGF0Y2ggOS85IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjEwNTIwMTUyODQwLjI0NDUzLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

