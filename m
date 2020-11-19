Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206AC2B97F0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:29:16 +0100 (CET)
Received: from localhost ([::1]:40904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmo7-0002Xt-06
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kfmn4-0001hs-QL
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:28:10 -0500
Resent-Date: Thu, 19 Nov 2020 11:28:10 -0500
Resent-Message-Id: <E1kfmn4-0001hs-QL@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kfmn1-0001ct-Nr
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:28:10 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605803265; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mCv0wimN1g5474K49byCVinhtsifXfWy0R6fLKP+FBLYKSIaazDAxKzhy7AGV2EuciEny/qDiXkKDN/mC/0sFDVwD+vQYurko92DQ5Y4DNOIqWHeew+ZcQ2V1yr5OB/N+9FQw602eIwULPZ5TC9u3W5agQifSzvR2h03oO/RIV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605803265;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=sariHGkbxIMc8Wp6rHdUbSbY8UPQoRLmk/U8YPT1dos=; 
 b=Z8tYUyTiI6R6bVjOCZbKNX0F7caJwgSn2HLcUl5fWj7o82Lx8kn0ay+Hy1XC8wUWSIPdUVCWM/4EygaFDhrNPG2O8KXN+52M+j5zAkdiiYLGWIShglcPmPYcZKklhPyfKWlzzolgt6QIZ9wwt9p4HYV+lUWEEmP75jK6WFzutpQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605803262930343.74668537315563;
 Thu, 19 Nov 2020 08:27:42 -0800 (PST)
In-Reply-To: <20201119161710.1985083-1-f4bug@amsat.org>
Subject: Re: [PATCH 0/4] linux-user: Support o32 ABI with 64-bit MIPS CPUs
Message-ID: <160580326145.22491.2502271629293095924@ba092462a7f3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Thu, 19 Nov 2020 08:27:42 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 11:28:04
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
Cc: f4bug@amsat.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 aurelien@aurel32.net, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExOTE2MTcxMC4xOTg1
MDgzLTEtZjRidWdAYW1zYXQub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDExMTkxNjE3MTAuMTk4NTA4
My0xLWY0YnVnQGFtc2F0Lm9yZwpTdWJqZWN0OiBbUEFUQ0ggMC80XSBsaW51eC11c2VyOiBTdXBw
b3J0IG8zMiBBQkkgd2l0aCA2NC1iaXQgTUlQUyBDUFVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4g
PT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3Rv
Z3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4
ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBb
bmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMTE5MTYxNzEwLjE5ODUwODMtMS1mNGJ1Z0Bh
bXNhdC5vcmcgLT4gcGF0Y2hldy8yMDIwMTExOTE2MTcxMC4xOTg1MDgzLTEtZjRidWdAYW1zYXQu
b3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYTU4ZTU2MSBSRkMgcWVtdS1iaW5m
bXQtY29uZi5zaDogQWRkIE1JUFM2NCBvMzIgQUJJCmRkMTkxOGIgZGVmYXVsdC1jb25maWdzOiBT
dXBwb3J0IG8zMiBBQkkgd2l0aCA2NC1iaXQgTUlQUyBDUFVzCjg5YjYwNzggbGludXgtdXNlci9t
aXBzNjQ6IFN1cHBvcnQgbzMyIEFCSSBzeXNjYWxscwo1ZWFjYzNlIGxpbnV4LXVzZXIvbWlwczY0
OiBSZXN0b3JlIHNldHVwX2ZyYW1lKCkgZm9yIG8zMiBBQkkKCj09PSBPVVRQVVQgQkVHSU4gPT09
CjEvNCBDaGVja2luZyBjb21taXQgNWVhY2MzZTBmY2I4IChsaW51eC11c2VyL21pcHM2NDogUmVz
dG9yZSBzZXR1cF9mcmFtZSgpIGZvciBvMzIgQUJJKQoyLzQgQ2hlY2tpbmcgY29tbWl0IDg5YjYw
NzhkNjc5OCAobGludXgtdXNlci9taXBzNjQ6IFN1cHBvcnQgbzMyIEFCSSBzeXNjYWxscykKMy80
IENoZWNraW5nIGNvbW1pdCBkZDE5MThiZGRhNTEgKGRlZmF1bHQtY29uZmlnczogU3VwcG9ydCBv
MzIgQUJJIHdpdGggNjQtYml0IE1JUFMgQ1BVcykKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRl
bGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMjI6IApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxNiBsaW5lcyBj
aGVja2VkCgpQYXRjaCAzLzQgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KNC80IENoZWNraW5n
IGNvbW1pdCBhNThlNTYxMGIyZTcgKFJGQyBxZW11LWJpbmZtdC1jb25mLnNoOiBBZGQgTUlQUzY0
IG8zMiBBQkkpCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMjE6IEZJTEU6IHNjcmlw
dHMvcWVtdS1iaW5mbXQtY29uZi5zaDo3MToKK21pcHM2NG8zMmVsX21hZ2ljPSdceDdmRUxGXHgw
MVx4MDFceDAxXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMlx4MDBceDA4
XHgwMCcKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMjI6IEZJTEU6IHNjcmlwdHMv
cWVtdS1iaW5mbXQtY29uZi5zaDo3MjoKK21pcHM2NG8zMmVsX21hc2s9J1x4ZmZceGZmXHhmZlx4
ZmZceGZmXHhmZlx4ZmZceDAwXHhmZlx4ZmZceGZmXHhmZlx4ZmZceGZmXHhmZlx4ZmZceGZlXHhm
Zlx4ZmZceGZmJwoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMCBsaW5lcyBjaGVja2Vk
CgpQYXRjaCA0LzQgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09
PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZh
aWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMTE5MTYxNzEwLjE5ODUwODMt
MS1mNGJ1Z0BhbXNhdC5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

