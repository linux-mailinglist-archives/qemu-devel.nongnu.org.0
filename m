Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB322DC95D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 00:03:11 +0100 (CET)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpfp7-0003FW-9T
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 18:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kpfnn-0002nS-SL
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 18:01:49 -0500
Resent-Date: Wed, 16 Dec 2020 18:01:47 -0500
Resent-Message-Id: <E1kpfnn-0002nS-SL@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kpfnl-0003e4-AC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 18:01:47 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1608159690; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DT4g7Sp8A4HmPnVGrRKK0jlbKCX+RFMhD6KXl6y7vpC24BOs/TniwcxOIOUgGYk239jfuq198qMGI5w1rzVJoGoK+oE7spgituUqrKm3AAvCBBWtf4a1wWlz5YGoz0Pn6s+u0yvkYmezpR7m9738/rrkxNml7sAWabQigH+jaRk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1608159690;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=fcJNIK/cN/WgrnHPBhFE4m4FHtePL8GVVNl4UaBIB/U=; 
 b=PwY98lWOun864sGB3TogG8cZdzQ3uEWdDTgkZDb6Coy6my5hjbUjseCqqNohvJBMl9kIHrvu6K9mikWE+7Nk6jxLklHVXL8z0yEVAsQmDfLDMSVM1mLnnwai5KUyIn1qzGFR8g2UhCe7/S5BXmbNo893Mu1KQGZKmirhSQxw+E8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1608159686612383.6298703998667;
 Wed, 16 Dec 2020 15:01:26 -0800 (PST)
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
Subject: Re: [PULL 00/12] Compile QEMU with -Wimplicit-fallthrough
Message-ID: <160815968521.31764.15770228187712660306@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Date: Wed, 16 Dec 2020 15:01:26 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxNjE3Mjk0OS41NzM4
MC0xLXRodXRoQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIwMTIxNjE3Mjk0OS41NzM4MC0x
LXRodXRoQHJlZGhhdC5jb20KU3ViamVjdDogW1BVTEwgMDAvMTJdIENvbXBpbGUgUUVNVSB3aXRo
IC1XaW1wbGljaXQtZmFsbHRocm91Z2gKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2Ny
aXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZy
b20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAg
ICAgICAgIHBhdGNoZXcvMjAyMDEyMTYxNzI5NDkuNTczODAtMS10aHV0aEByZWRoYXQuY29tIC0+
IHBhdGNoZXcvMjAyMDEyMTYxNzI5NDkuNTczODAtMS10aHV0aEByZWRoYXQuY29tClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKN2JlZGJjOCBjb25maWd1cmU6IENvbXBpbGUgd2l0aCAt
V2ltcGxpY2l0LWZhbGx0aHJvdWdoPTIKZTE0YmI5ZCB0ZXN0cy9mcDogRG8gbm90IGVtaXQgaW1w
bGljaXQtZmFsbHRocm91Z2ggd2FybmluZ3MgaW4gdGhlIHNvZnRmbG9hdCB0ZXN0cwplYmQzYzQ1
IHRjZy9vcHRpbWl6ZTogQWRkIGZhbGx0aHJvdWdoIGFubm90YXRpb25zCmNmZTU2NjIgdGFyZ2V0
L3NwYXJjL3dpbl9oZWxwZXI6IHNpbGVuY2UgdGhlIGNvbXBpbGVyIHdhcm5pbmdzCjhlZjkzMzUg
dGFyZ2V0L3NwYXJjL3RyYW5zbGF0ZTogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2FybmluZ3MKNDU4
OGJmOSBhY2NlbC90Y2cvdXNlci1leGVjOiBzaWxlbmNlIHRoZSBjb21waWxlciB3YXJuaW5ncwpi
ZTIxMDhlIGh3L2ludGMvYXJtX2dpY3YzX2t2bTogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2Fybmlu
Z3MKN2QwMzNkMCB0YXJnZXQvaTM4Njogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2FybmluZ3MgaW4g
Z2VuX3NoaWZ0ZF9ybV9UMQoyODRiMDBhIGh3L3RpbWVyL3JlbmVzYXNfdG1yOiBzaWxlbmNlIHRo
ZSBjb21waWxlciB3YXJuaW5ncwpjM2QyOTU3IGh3L3J0Yy90d2w5MjIzMDogU2lsZW5jZSB3YXJu
aW5ncyBhYm91dCBtaXNzaW5nIGZhbGx0aHJvdWdoIHN0YXRlbWVudHMKMWIxNjA5YyB0YXJnZXQv
dW5pY29yZTMyL3RyYW5zbGF0ZTogQWRkIG1pc3NpbmcgZmFsbHRocm91Z2ggYW5ub3RhdGlvbnMK
OTliYzBmMCBkaXNhcy9saWJ2aXhsOiBGaXggZmFsbC10aHJvdWdoIGFubm90YXRpb24gZm9yIEdD
QyA+PSA3Cgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzEyIENoZWNraW5nIGNvbW1pdCA5OWJjMGYw
ZTkyYjcgKGRpc2FzL2xpYnZpeGw6IEZpeCBmYWxsLXRocm91Z2ggYW5ub3RhdGlvbiBmb3IgR0ND
ID49IDcpCkVSUk9SOiBkbyBub3QgdXNlIEM5OSAvLyBjb21tZW50cwojNDk6IEZJTEU6IGRpc2Fz
L2xpYnZpeGwvdml4bC9nbG9iYWxzLmg6MTExOgorLy8gRmFsbHRocm91Z2ggYW5ub3RhdGlvbiBm
b3IgQ2xhbmcgYW5kIEMrKzExKDIwMTEwM0wpLgoKRVJST1I6IGRvIG5vdCB1c2UgQzk5IC8vIGNv
bW1lbnRzCiM1MjogRklMRTogZGlzYXMvbGlidml4bC92aXhsL2dsb2JhbHMuaDoxMTQ6CisvLyBG
YWxsdGhyb3VnaCBhbm5vdGF0aW9uIGZvciBHQ0MgPj0gNy4KCnRvdGFsOiAyIGVycm9ycywgMCB3
YXJuaW5ncywgMjQgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS8xMiBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKMi8xMiBDaGVja2luZyBjb21taXQgMWIxNjA5Yzc1NzNhICh0YXJnZXQvdW5pY29y
ZTMyL3RyYW5zbGF0ZTogQWRkIG1pc3NpbmcgZmFsbHRocm91Z2ggYW5ub3RhdGlvbnMpCjMvMTIg
Q2hlY2tpbmcgY29tbWl0IGMzZDI5NTczODNiOCAoaHcvcnRjL3R3bDkyMjMwOiBTaWxlbmNlIHdh
cm5pbmdzIGFib3V0IG1pc3NpbmcgZmFsbHRocm91Z2ggc3RhdGVtZW50cykKNC8xMiBDaGVja2lu
ZyBjb21taXQgMjg0YjAwYWVmNTY2IChody90aW1lci9yZW5lc2FzX3Rtcjogc2lsZW5jZSB0aGUg
Y29tcGlsZXIgd2FybmluZ3MpCjUvMTIgQ2hlY2tpbmcgY29tbWl0IDdkMDMzZDAyYjkwZCAodGFy
Z2V0L2kzODY6IHNpbGVuY2UgdGhlIGNvbXBpbGVyIHdhcm5pbmdzIGluIGdlbl9zaGlmdGRfcm1f
VDEpCjYvMTIgQ2hlY2tpbmcgY29tbWl0IGJlMjEwOGU2NDFjOSAoaHcvaW50Yy9hcm1fZ2ljdjNf
a3ZtOiBzaWxlbmNlIHRoZSBjb21waWxlciB3YXJuaW5ncykKNy8xMiBDaGVja2luZyBjb21taXQg
NDU4OGJmOTc0ODJiIChhY2NlbC90Y2cvdXNlci1leGVjOiBzaWxlbmNlIHRoZSBjb21waWxlciB3
YXJuaW5ncykKOC8xMiBDaGVja2luZyBjb21taXQgOGVmOTMzNWYyODM4ICh0YXJnZXQvc3BhcmMv
dHJhbnNsYXRlOiBzaWxlbmNlIHRoZSBjb21waWxlciB3YXJuaW5ncykKOS8xMiBDaGVja2luZyBj
b21taXQgY2ZlNTY2MjNlY2U4ICh0YXJnZXQvc3BhcmMvd2luX2hlbHBlcjogc2lsZW5jZSB0aGUg
Y29tcGlsZXIgd2FybmluZ3MpCjEwLzEyIENoZWNraW5nIGNvbW1pdCBlYmQzYzQ1ZmQwNTIgKHRj
Zy9vcHRpbWl6ZTogQWRkIGZhbGx0aHJvdWdoIGFubm90YXRpb25zKQpXQVJOSU5HOiBhcmNoaXRl
Y3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojMzU6IEZJTEU6IGluY2x1
ZGUvcWVtdS9jb21waWxlci5oOjIzMDoKKyNpZiBfX2hhc19hdHRyaWJ1dGUoZmFsbHRocm91Z2gp
Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDQzIGxpbmVzIGNoZWNrZWQKClBhdGNoIDEw
LzEyIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBl
cnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwg
c2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCjExLzEyIENoZWNraW5nIGNvbW1pdCBlMTRi
YjlkZGQ2ZjMgKHRlc3RzL2ZwOiBEbyBub3QgZW1pdCBpbXBsaWNpdC1mYWxsdGhyb3VnaCB3YXJu
aW5ncyBpbiB0aGUgc29mdGZsb2F0IHRlc3RzKQoxMi8xMiBDaGVja2luZyBjb21taXQgN2JlZGJj
ODNiY2ZhIChjb25maWd1cmU6IENvbXBpbGUgd2l0aCAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTIp
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAx
MjE2MTcyOTQ5LjU3MzgwLTEtdGh1dGhAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

