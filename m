Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD973B2EE2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:24:12 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwOOx-0003VY-8z
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lwOMy-0002PW-MD
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:22:08 -0400
Resent-Date: Thu, 24 Jun 2021 08:22:08 -0400
Resent-Message-Id: <E1lwOMy-0002PW-MD@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lwOMr-0002MV-Bf
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:22:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624537311; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QuFLi1j5V1lUvjXKfNGBPtpxj6EijqfDpt9AqtSlVyKfHkuZ8oyCrfg8EzIV38kzjMdqLdYbPORsWLl16AR6DTvNPx2U9XcKjx5QMGsEZVY/zEtqW1ur6XiXV91xhGO62Zwr4JFQFgEYCgWU9A5PxcOvyBrYIeaFFRFnmD10xw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624537311;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=JczHK+Ch3xqiSh8hgq5W/LDB3j5sg/TWJdRU/pRys2k=; 
 b=LFzBvCEBk8Cdle7I/hJZrxv38VK+fun3qnwP5LpqWFRcKVRi8+XlJILZKuDD4+9OjOinmy6UETcHzVIl8JupsYAYwUSGFLtwLVHedaXmsJluEScg+hsP6hyYr6AYTqggAzRLCKs6bK9hKqxoNX3r92NzFUe+imJaBfpxBEUt+L0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624537309019191.10552402796634;
 Thu, 24 Jun 2021 05:21:49 -0700 (PDT)
In-Reply-To: <20210624121639.2422367-1-kraxel@redhat.com>
Subject: Re: [PULL 0/2] Audio 20210624 patches
Message-ID: <162453730789.22511.17796439531441296066@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Thu, 24 Jun 2021 05:21:49 -0700 (PDT)
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org, alxndr@bu.edu,
 bsd@redhat.com, kraxel@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyNDEyMTYzOS4yNDIy
MzY3LTEta3JheGVsQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYyNDEyMTYzOS4yNDIy
MzY3LTEta3JheGVsQHJlZGhhdC5jb20KU3ViamVjdDogW1BVTEwgMC8yXSBBdWRpbyAyMDIxMDYy
NCBwYXRjaGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3
LzIwMjEwNjI0MTIxNjM5LjI0MjIzNjctMS1rcmF4ZWxAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIw
MjEwNjI0MTIxNjM5LjI0MjIzNjctMS1rcmF4ZWxAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5l
dyBicmFuY2ggJ3Rlc3QnCmIzOTcyMDUgaHcvYXVkaW8vc2IxNjogUmVzdHJpY3QgSS9PIHNhbXBs
aW5nIHJhdGUgcmFuZ2UgZm9yIGNvbW1hbmQgNDFoLzQyaAo4YjY2YmY0IGNvcmVhdWRpbzogTG9j
ayBvbmx5IHRoZSBidWZmZXIKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMiBDaGVja2luZyBjb21t
aXQgOGI2NmJmNDUxMjY5IChjb3JlYXVkaW86IExvY2sgb25seSB0aGUgYnVmZmVyKQpFUlJPUjog
c3BhY2UgcHJvaGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVz
aXMgJygnCiM2MTogRklMRTogYXVkaW8vY29yZWF1ZGlvLmM6MjQ1Ogorc3RhdGljIGludCBjb3Jl
YXVkaW9fYnVmX2xvY2sgKGNvcmVhdWRpb1ZvaWNlT3V0ICpjb3JlLCBjb25zdCBjaGFyICpmbl9u
YW1lKQoKRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBv
cGVuIHBhcmVudGhlc2lzICcoJwojNjY6IEZJTEU6IGF1ZGlvL2NvcmVhdWRpby5jOjI0OToKKyAg
ICBlcnIgPSBwdGhyZWFkX211dGV4X2xvY2sgKCZjb3JlLT5idWZfbXV0ZXgpOwoKRVJST1I6IHNw
YWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBhcmVudGhlc2lz
ICcoJwojNzU6IEZJTEU6IGF1ZGlvL2NvcmVhdWRpby5jOjI1ODoKK3N0YXRpYyBpbnQgY29yZWF1
ZGlvX2J1Zl91bmxvY2sgKGNvcmVhdWRpb1ZvaWNlT3V0ICpjb3JlLCBjb25zdCBjaGFyICpmbl9u
YW1lKQoKRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBv
cGVuIHBhcmVudGhlc2lzICcoJwojODA6IEZJTEU6IGF1ZGlvL2NvcmVhdWRpby5jOjI2MjoKKyAg
ICBlcnIgPSBwdGhyZWFkX211dGV4X3VubG9jayAoJmNvcmUtPmJ1Zl9tdXRleCk7CgpFUlJPUjog
c3BhY2UgcHJvaGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG9wZW4gcGFyZW50aGVz
aXMgJygnCiMxMTc6IEZJTEU6IGF1ZGlvL2NvcmVhdWRpby5jOjMxNDoKKyAgICBpZiAoY29yZWF1
ZGlvX2J1Zl9sb2NrIChjb3JlLCAiYXVkaW9EZXZpY2VJT1Byb2MiKSkgewoKRVJST1I6IHNwYWNl
IHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBhcmVudGhlc2lzICco
JwojMTI0OiBGSUxFOiBhdWRpby9jb3JlYXVkaW8uYzozMjA6CisgICAgICAgIGNvcmVhdWRpb19i
dWZfdW5sb2NrIChjb3JlLCAiYXVkaW9EZXZpY2VJT1Byb2Mob2xkIGRldmljZSkiKTsKCkVSUk9S
OiBzcGFjZSBwcm9oaWJpdGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3BlbiBwYXJlbnRo
ZXNpcyAnKCcKIzEzMzogRklMRTogYXVkaW8vY29yZWF1ZGlvLmM6MzMwOgorICAgICAgICBjb3Jl
YXVkaW9fYnVmX3VubG9jayAoY29yZSwgImF1ZGlvRGV2aWNlSU9Qcm9jKGVtcHR5KSIpOwoKRVJS
T1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBhcmVu
dGhlc2lzICcoJwojMTQyOiBGSUxFOiBhdWRpby9jb3JlYXVkaW8uYzozNTI6CisgICAgY29yZWF1
ZGlvX2J1Zl91bmxvY2sgKGNvcmUsICJhdWRpb0RldmljZUlPUHJvYyIpOwoKdG90YWw6IDggZXJy
b3JzLCAwIHdhcm5pbmdzLCAyMzcgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS8yIGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCgoyLzIgQ2hlY2tpbmcgY29tbWl0IGIzOTcyMDU2OWJmNiAoaHcvYXVk
aW8vc2IxNjogUmVzdHJpY3QgSS9PIHNhbXBsaW5nIHJhdGUgcmFuZ2UgZm9yIGNvbW1hbmQgNDFo
LzQyaCkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMTA2MjQxMjE2MzkuMjQyMjM2Ny0xLWtyYXhlbEByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2tw
YXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

