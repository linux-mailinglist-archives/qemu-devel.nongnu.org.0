Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456C2D7C87
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:12:33 +0100 (CET)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knly4-0006bk-8H
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1knlsu-0002Gi-KF
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:07:12 -0500
Resent-Date: Fri, 11 Dec 2020 12:07:12 -0500
Resent-Message-Id: <E1knlsu-0002Gi-KF@lists.gnu.org>
Received: from sender4-of-o56.zoho.com ([136.143.188.56]:21611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1knlsr-0001az-Id
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:07:12 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607706410; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FTImHDBGaEaIYepQIyAPwTEHLZuxP+gCxQjQfVivBselFvaaZyAtnlNlg15aC31/OwkcmQXN6cbd4JCs5hd7SUnFV5ai3DkIWLTeV4sM4B5y7GGLRFYNHGW2EXIr52/AK3bH0ognibX8mW7CU+lM7BJODsG1kQ62apBYzDNH2J8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607706410;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ilSsWdBPL/8bS1/BM1fNAb2K04uUm6Dkmk0ZqcxzebU=; 
 b=OJUukMwArv5gAsCG5MaxH9RmdWyUOmrRna0jSR07bRD4g51dpfbHYdC5m5kSf+NBgGNe9t4HGB3GFiXtM+3mnezyZfy0+MRXjMWAWE+xWT7rGSwc+95ifq0+hJBNa/uTqtx1Z1a/xudpcSVN7HWSjNnVmixQiNNWhByrTTTpy68=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607706409258554.2499984279261;
 Fri, 11 Dec 2020 09:06:49 -0800 (PST)
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
Subject: Re: [PATCH 00/12] Compile QEMU with -Wimplicit-fallthrough
Message-ID: <160770640798.24901.16868706250624415505@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Date: Fri, 11 Dec 2020 09:06:49 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.56; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o56.zoho.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxMTE1MjQyNi4zNTA5
NjYtMS10aHV0aEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEyMTExNTI0MjYuMzUwOTY2
LTEtdGh1dGhAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMDAvMTJdIENvbXBpbGUgUUVNVSB3
aXRoIC1XaW1wbGljaXQtZmFsbHRocm91Z2gKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJl
bmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4v
c2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBF
TkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0
CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBk
YXRlXSAgICAgIHBhdGNoZXcvMjAyMDEyMDQyMjA3NTguMjg3OS0xLXZzZW1lbnRzb3ZAdmlydHVv
enpvLmNvbSAtPiBwYXRjaGV3LzIwMjAxMjA0MjIwNzU4LjI4NzktMS12c2VtZW50c292QHZpcnR1
b3p6by5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTIxMTE1MjQyNi4zNTA5
NjYtMS10aHV0aEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDEyMTExNTI0MjYuMzUwOTY2LTEt
dGh1dGhAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjJkYWY5ZTcg
Y29uZmlndXJlOiBDb21waWxlIHdpdGggLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0yCmJmNDczYWYg
dGVzdHMvZnA6IERvIG5vdCBlbWl0IGltcGxpY2l0LWZhbGx0aHJvdWdoIHdhcm5pbmdzIGluIHRo
ZSBzb2Z0ZmxvYXQgdGVzdHMKZTdiMjE2YiB0Y2cvb3B0aW1pemU6IEFkZCBmYWxsdGhyb3VnaCBh
bm5vdGF0aW9ucwpjMWQwMjMyIHRhcmdldC9zcGFyYy93aW5faGVscGVyOiBzaWxlbmNlIHRoZSBj
b21waWxlciB3YXJuaW5ncwpmYzE4MDkxIHRhcmdldC9zcGFyYy90cmFuc2xhdGU6IHNpbGVuY2Ug
dGhlIGNvbXBpbGVyIHdhcm5pbmdzCjk2MTBkNzUgYWNjZWwvdGNnL3VzZXItZXhlYzogc2lsZW5j
ZSB0aGUgY29tcGlsZXIgd2FybmluZ3MKNTgwYTJmYyBody9pbnRjL2FybV9naWN2M19rdm06IHNp
bGVuY2UgdGhlIGNvbXBpbGVyIHdhcm5pbmdzCjNmNGVlM2QgdGFyZ2V0L2kzODY6IHNpbGVuY2Ug
dGhlIGNvbXBpbGVyIHdhcm5pbmdzIGluIGdlbl9zaGlmdGRfcm1fVDEKMTM0M2U4YyBody90aW1l
ci9yZW5lc2FzX3Rtcjogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2FybmluZ3MKMTk4YmU0YyBody9y
dGMvdHdsOTIyMzA6IFNpbGVuY2Ugd2FybmluZ3MgYWJvdXQgbWlzc2luZyBmYWxsdGhyb3VnaCBz
dGF0ZW1lbnRzCjE3YzQ3M2EgdGFyZ2V0L3VuaWNvcmUzMi90cmFuc2xhdGU6IEFkZCBtaXNzaW5n
IGZhbGx0aHJvdWdoIGFubm90YXRpb25zCjY5N2IyODIgZGlzYXMvbGlidml4bDogRml4IGZhbGwt
dGhyb3VnaCBhbm5vdGF0aW9uIGZvciBHQ0MgPj0gNwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8x
MiBDaGVja2luZyBjb21taXQgNjk3YjI4MmM5YTE5IChkaXNhcy9saWJ2aXhsOiBGaXggZmFsbC10
aHJvdWdoIGFubm90YXRpb24gZm9yIEdDQyA+PSA3KQpFUlJPUjogZG8gbm90IHVzZSBDOTkgLy8g
Y29tbWVudHMKIzQ2OiBGSUxFOiBkaXNhcy9saWJ2aXhsL3ZpeGwvZ2xvYmFscy5oOjExMToKKy8v
IEZhbGx0aHJvdWdoIGFubm90YXRpb24gZm9yIENsYW5nIGFuZCBDKysxMSgyMDExMDNMKS4KCkVS
Uk9SOiBkbyBub3QgdXNlIEM5OSAvLyBjb21tZW50cwojNDk6IEZJTEU6IGRpc2FzL2xpYnZpeGwv
dml4bC9nbG9iYWxzLmg6MTE0OgorLy8gRmFsbHRocm91Z2ggYW5ub3RhdGlvbiBmb3IgR0NDID49
IDcuCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDI0IGxpbmVzIGNoZWNrZWQKClBhdGNo
IDEvMTIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjIvMTIgQ2hlY2tpbmcgY29tbWl0IDE3
YzQ3M2FmODlhMyAodGFyZ2V0L3VuaWNvcmUzMi90cmFuc2xhdGU6IEFkZCBtaXNzaW5nIGZhbGx0
aHJvdWdoIGFubm90YXRpb25zKQozLzEyIENoZWNraW5nIGNvbW1pdCAxOThiZTRjNGRkNzkgKGh3
L3J0Yy90d2w5MjIzMDogU2lsZW5jZSB3YXJuaW5ncyBhYm91dCBtaXNzaW5nIGZhbGx0aHJvdWdo
IHN0YXRlbWVudHMpCjQvMTIgQ2hlY2tpbmcgY29tbWl0IDEzNDNlOGMyNDQ1NyAoaHcvdGltZXIv
cmVuZXNhc190bXI6IHNpbGVuY2UgdGhlIGNvbXBpbGVyIHdhcm5pbmdzKQo1LzEyIENoZWNraW5n
IGNvbW1pdCAzZjRlZTNkZWNhNWEgKHRhcmdldC9pMzg2OiBzaWxlbmNlIHRoZSBjb21waWxlciB3
YXJuaW5ncyBpbiBnZW5fc2hpZnRkX3JtX1QxKQo2LzEyIENoZWNraW5nIGNvbW1pdCA1ODBhMmZj
NjMyZDUgKGh3L2ludGMvYXJtX2dpY3YzX2t2bTogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2Fybmlu
Z3MpCjcvMTIgQ2hlY2tpbmcgY29tbWl0IDk2MTBkNzU4OGI5YyAoYWNjZWwvdGNnL3VzZXItZXhl
Yzogc2lsZW5jZSB0aGUgY29tcGlsZXIgd2FybmluZ3MpCjgvMTIgQ2hlY2tpbmcgY29tbWl0IGZj
MTgwOTEzNDQxOCAodGFyZ2V0L3NwYXJjL3RyYW5zbGF0ZTogc2lsZW5jZSB0aGUgY29tcGlsZXIg
d2FybmluZ3MpCjkvMTIgQ2hlY2tpbmcgY29tbWl0IGMxZDAyMzJiNDE4NSAodGFyZ2V0L3NwYXJj
L3dpbl9oZWxwZXI6IHNpbGVuY2UgdGhlIGNvbXBpbGVyIHdhcm5pbmdzKQoxMC8xMiBDaGVja2lu
ZyBjb21taXQgZTdiMjE2YjMxYzRlICh0Y2cvb3B0aW1pemU6IEFkZCBmYWxsdGhyb3VnaCBhbm5v
dGF0aW9ucykKV0FSTklORzogYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJl
IGF2b2lkZWQKIzMyOiBGSUxFOiBpbmNsdWRlL3FlbXUvY29tcGlsZXIuaDoyNTE6CisjaWYgX19o
YXNfYXR0cmlidXRlKGZhbGx0aHJvdWdoKQoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCA0
MyBsaW5lcyBjaGVja2VkCgpQYXRjaCAxMC8xMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgox
MS8xMiBDaGVja2luZyBjb21taXQgYmY0NzNhZjUwM2Q1ICh0ZXN0cy9mcDogRG8gbm90IGVtaXQg
aW1wbGljaXQtZmFsbHRocm91Z2ggd2FybmluZ3MgaW4gdGhlIHNvZnRmbG9hdCB0ZXN0cykKMTIv
MTIgQ2hlY2tpbmcgY29tbWl0IDJkYWY5ZTc4Yjg4OSAoY29uZmlndXJlOiBDb21waWxlIHdpdGgg
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0yKQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFu
ZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMTIxMTE1MjQyNi4zNTA5NjYtMS10aHV0aEByZWRoYXQu
Y29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

