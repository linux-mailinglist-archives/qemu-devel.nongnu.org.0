Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A736D994
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:28:47 +0200 (CEST)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblBG-0001JD-D9
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbl7k-0007Xv-28
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:25:08 -0400
Resent-Date: Wed, 28 Apr 2021 10:25:08 -0400
Resent-Message-Id: <E1lbl7k-0007Xv-28@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbl7g-0007uU-A0
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:25:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619619892; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bNCFMCbPHwskwiICpGa4Mz9589IeYGyY9Qw+dSee1X2gejQj1oqIh9w0+7Ww9vcnBpVO1IAm2Al/hVzianUJsJ3ZMwBG5YDssEDju8R8B84TrrIwAtF6kVoiWESWMjaXTg88GCpR6uKFix9uq8+tn+f8xA8u87XaDZxQCeChvbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619619892;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=fhZFGalZZLc21bvDEH++b/aZzuZE94IsBotTpo+IDqg=; 
 b=iVMf3bvkfdmwWDTCYRyjMc99kEQ5L8uWm1RJCms6RXuJdOlROcHvRZM6nJr928bo7SHc6gd91fxpH0EGhrR2UaxlevT6lsVRWbcVASeGyZX2c60uh5orR7vkEtDNs97jsdQD6+LwhIIW0gv3aICQ5yZDqPlHo1AHd2TcSNKCt7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619619888198711.7171870411476;
 Wed, 28 Apr 2021 07:24:48 -0700 (PDT)
In-Reply-To: <20b7f194-066f-c3bf-a830-deb1cde8f1be@adacore.com>
Subject: Re: [RFC] AVR watchdog
Message-ID: <161961988712.28712.4865215555453296540@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: konrad@adacore.com
Date: Wed, 28 Apr 2021 07:24:48 -0700 (PDT)
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
Cc: mrolnik@gmail.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMGI3ZjE5NC0wNjZmLWMzYmYt
YTgzMC1kZWIxY2RlOGYxYmVAYWRhY29yZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMg
dG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IK
bW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMGI3ZjE5NC0wNjZm
LWMzYmYtYTgzMC1kZWIxY2RlOGYxYmVAYWRhY29yZS5jb20KU3ViamVjdDogW1JGQ10gQVZSIHdh
dGNoZG9nCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFy
c2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVu
YW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5w
bCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4
Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHVi
LmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIw
YjdmMTk0LTA2NmYtYzNiZi1hODMwLWRlYjFjZGU4ZjFiZUBhZGFjb3JlLmNvbSAtPiBwYXRjaGV3
LzIwYjdmMTk0LTA2NmYtYzNiZi1hODMwLWRlYjFjZGU4ZjFiZUBhZGFjb3JlLmNvbQpTd2l0Y2hl
ZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjlkMjY3YzQgQVZSIHdhdGNoZG9nCgo9PT0gT1VUUFVU
IEJFR0lOID09PQpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDog
MSBlcnJvcnMsIDAgd2FybmluZ3MsIDE1IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA5ZDI2N2M0Y2U3
NzMgKEFWUiB3YXRjaGRvZykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBF
TkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBp
cyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjBiN2YxOTQtMDY2Zi1jM2Jm
LWE4MzAtZGViMWNkZThmMWJlQGFkYWNvcmUuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==

