Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B483B6244
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:44:41 +0200 (CEST)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsV6-00024Q-QH
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lxsTU-0000h0-OQ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:43:03 -0400
Resent-Date: Mon, 28 Jun 2021 10:43:00 -0400
Resent-Message-Id: <E1lxsTU-0000h0-OQ@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lxsTS-00059o-Db
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:43:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624891373; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xgtb/n8hW2S18yCpjjG5f8H2Ez2btf1d2SQDVuP/RzrTINo2TLae0FxiJQ6DnDbtk+CFlePeiNY4TyubCEnI1FfuM93nQwNgHkThY3Lij+cbyQ3rwWaZafPlYKFiAFgMpMAdNx/HKG7vX5Zq2C/4UF/lzMP3qoAFvyvSuTNyVVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624891373;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=X3OAuB3IW+w5nnPNibawW7JCAZVyK5HhqkYAtaxrA+I=; 
 b=OIVuo9JDn4AeC/0gpbSfcLcn+wQ7WyR2s/OGJoW6zwDnaFABXwrpqc2Ooau2v93w0bLspLFOX6dQ86l5QSSL3p2MwoqgGbGeqO9FmvWQeZFoHT0sqhY2vKT9v61+KRSASN5IVDGSjA19rQDaPAc1iiUGrzlrQOAo618T0aJtQN4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624891371120935.592901504753;
 Mon, 28 Jun 2021 07:42:51 -0700 (PDT)
In-Reply-To: <20210628143551.2870006-1-richard.henderson@linaro.org>
Subject: Re: [PULL 0/5] target/alpha patch queue
Message-ID: <162489137016.7989.16664528574107569290@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Mon, 28 Jun 2021 07:42:51 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyODE0MzU1MS4yODcw
MDA2LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNjI4
MTQzNTUxLjI4NzAwMDYtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN1YmplY3Q6IFtQ
VUxMIDAvNV0gdGFyZ2V0L2FscGhhIHBhdGNoIHF1ZXVlCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4g
PT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3Rv
Z3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4
ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBb
dGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNjI2MDYzNjMxLjI0MTE5MzgtMS1yaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA2MjYwNjM2MzEuMjQxMTkzOC0x
LXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hl
dy8yMDIxMDYyODE0MzU1MS4yODcwMDA2LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAt
PiBwYXRjaGV3LzIwMjEwNjI4MTQzNTUxLjI4NzAwMDYtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZWQ0MjU3ZCB0YXJnZXQvYWxw
aGE6IEhvbm9yIHRoZSBGRU4gYml0CjNhYzAyNWIgcGMtYmlvczogVXBkYXRlIHRoZSBwYWxjb2Rl
LWNsaXBwZXIgaW1hZ2UKN2UxZTM1MSBody9hbHBoYTogUHJvdmlkZSBhIFBDSS1JU0EgYnJpZGdl
IGRldmljZSBub2RlCjNlZWY4MzMgaHcvYWxwaGE6IFByb3ZpZGUgY29uc29sZSBpbmZvcm1hdGlv
biB0byB0aGUgUEFMY29kZSBhdCBzdGFydC11cAphOGM3MTI5IGh3L2FscGhhOiBTZXQgbWluaW11
bSBQQ0kgZGV2aWNlIElEIHRvIDEgdG8gbWF0Y2ggQ2xpcHBlciBJUlEgbWFwcGluZ3MKCj09PSBP
VVRQVVQgQkVHSU4gPT09CjEvNSBDaGVja2luZyBjb21taXQgYThjNzEyOTkwNzYzIChody9hbHBo
YTogU2V0IG1pbmltdW0gUENJIGRldmljZSBJRCB0byAxIHRvIG1hdGNoIENsaXBwZXIgSVJRIG1h
cHBpbmdzKQoyLzUgQ2hlY2tpbmcgY29tbWl0IDNlZWY4MzMxNGUxMCAoaHcvYWxwaGE6IFByb3Zp
ZGUgY29uc29sZSBpbmZvcm1hdGlvbiB0byB0aGUgUEFMY29kZSBhdCBzdGFydC11cCkKMy81IENo
ZWNraW5nIGNvbW1pdCA3ZTFlMzUxNTQ3ZWEgKGh3L2FscGhhOiBQcm92aWRlIGEgUENJLUlTQSBi
cmlkZ2UgZGV2aWNlIG5vZGUpCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJyon
IChjdHg6V3hWKQojNTQ6IEZJTEU6IGh3L2FscGhhL2FscGhhX3N5cy5oOjEzOgorUENJQnVzICp0
eXBob29uX2luaXQoTWVtb3J5UmVnaW9uICosIHFlbXVfaXJxICosIHFlbXVfaXJxICosIEFscGhh
Q1BVICpbNF0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAx
MjUgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy81IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo0
LzUgQ2hlY2tpbmcgY29tbWl0IDNhYzAyNWIxYWJiNyAocGMtYmlvczogVXBkYXRlIHRoZSBwYWxj
b2RlLWNsaXBwZXIgaW1hZ2UpCjUvNSBDaGVja2luZyBjb21taXQgZWQ0MjU3ZDg0MDg0ICh0YXJn
ZXQvYWxwaGE6IEhvbm9yIHRoZSBGRU4gYml0KQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDYyODE0MzU1MS4yODcwMDA2LTEtcmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

