Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36593AB4ED
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:38:13 +0200 (CEST)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltsDk-0001Lh-VX
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltsCq-0000ff-Re
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:37:16 -0400
Resent-Date: Thu, 17 Jun 2021 09:37:16 -0400
Resent-Message-Id: <E1ltsCq-0000ff-Re@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltsCo-0004G8-7E
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:37:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623937009; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Cv8l0G2dA1cqPkegEsZsFmOf8GcTGHzFdiY/JO4VbzSNpBpcIVmy4XaLQzAEziW9r1yg2ktS1EicLKw7pLC0n66eGhrzN/1eZ2GaFpcOQrcSmxE2wLfhslmmhGP6ExtdJQAwXmQKqbkA4WW0dAg2nFqeXV8LCsrY6CiKCnsWumE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623937009;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=rwtNAlXu+L50ezIHKHuGRuRpO9GdOfYHZCiFS5YRvhQ=; 
 b=i6v8OfZMPTagWCVWKkJgA6wAktu/MgsKy4YLSLi1EWtWTMfSy5eVCbcsSb8IhHCG0RsFr51jQRlsJdYoAVfGWbOKQRPCjCrvWO5qb37PT6xdYtAYKxwHShBrFnF7bwvEAKs2hNfI7LSvObpPV16FsHOESKFviOZNa6v8XOrxQo8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623937008260233.47634530267567;
 Thu, 17 Jun 2021 06:36:48 -0700 (PDT)
In-Reply-To: <cover.1623935540.git.huangy81@chinatelecom.cn>
Subject: Re: [PATCH v6 0/7] support dirtyrate at the granualrity of vcpu 
Message-ID: <162393700683.30552.6400325267661229759@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: huangy81@chinatelecom.cn
Date: Thu, 17 Jun 2021 06:36:48 -0700 (PDT)
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
Cc: ehabkost@redhat.com, quintela@redhat.com, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, peterx@redhat.com, dgilbert@redhat.com,
 zhengchuan@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjIzOTM1NTQwLmdp
dC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiBjb3Zlci4xNjIzOTM1NTQw
LmdpdC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24KU3ViamVjdDogW1BBVENIIHY2IDAvN10gc3Vw
cG9ydCBkaXJ0eXJhdGUgYXQgdGhlIGdyYW51YWxyaXR5IG9mIHZjcHUgCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8
fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3Jp
dGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9
PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRl
ZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3Qv
cWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3L2NvdmVyLjE2MjM5MzU1NDAuZ2l0Lmh1
YW5neTgxQGNoaW5hdGVsZWNvbS5jbiAtPiBwYXRjaGV3L2NvdmVyLjE2MjM5MzU1NDAuZ2l0Lmh1
YW5neTgxQGNoaW5hdGVsZWNvbS5jbgpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjUw
NWI4YzkgbWlncmF0aW9uL2RpcnR5cmF0ZTogaW1wbGVtZW50IGRpcnR5LXJpbmcgZGlydHlyYXRl
IGNhbGN1bGF0aW9uCmZjZDlhNDYgbWlncmF0aW9uL2RpcnR5cmF0ZTogbW92ZSBpbml0IHN0ZXAg
b2YgY2FsY3VsYXRpb24gdG8gbWFpbiB0aHJlYWQKMzdjZjlhMSBtaWdyYXRpb24vZGlydHlyYXRl
OiBhZGp1c3Qgb3JkZXIgb2YgcmVnaXN0ZXJpbmcgdGhyZWFkCjhiMzljOTAgbWlncmF0aW9uL2Rp
cnR5cmF0ZTogaW50cm9kdWNlIHN0cnVjdCBhbmQgYWRqdXN0IERpcnR5UmF0ZVN0YXQKOGYzNWE5
MjIgbWVtb3J5OiBtYWtlIGdsb2JhbF9kaXJ0eV90cmFja2luZyBhIGJpdG1hc2sKYmFmODJkNCBt
ZW1vcnk6IHJlbmFtZSBnbG9iYWxfZGlydHlfbG9nIHRvIGdsb2JhbF9kaXJ0eV90cmFja2luZwo4
YzkwNGFhIEtWTTogaW50cm9kdWNlIGRpcnR5X3BhZ2VzIGFuZCBrdm1fZGlydHlfcmluZ19lbmFi
bGVkCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzcgQ2hlY2tpbmcgY29tbWl0IDhjOTA0YWE0NzZk
NSAoS1ZNOiBpbnRyb2R1Y2UgZGlydHlfcGFnZXMgYW5kIGt2bV9kaXJ0eV9yaW5nX2VuYWJsZWQp
CjIvNyBDaGVja2luZyBjb21taXQgYmFmODJkNDgyZTQwIChtZW1vcnk6IHJlbmFtZSBnbG9iYWxf
ZGlydHlfbG9nIHRvIGdsb2JhbF9kaXJ0eV90cmFja2luZykKMy83IENoZWNraW5nIGNvbW1pdCA4
ZjM1YTkyMmVjYTkgKG1lbW9yeTogbWFrZSBnbG9iYWxfZGlydHlfdHJhY2tpbmcgYSBiaXRtYXNr
KQo0LzcgQ2hlY2tpbmcgY29tbWl0IDhiMzljOTBiM2ZmZSAobWlncmF0aW9uL2RpcnR5cmF0ZTog
aW50cm9kdWNlIHN0cnVjdCBhbmQgYWRqdXN0IERpcnR5UmF0ZVN0YXQpCjUvNyBDaGVja2luZyBj
b21taXQgMzdjZjlhMTM1OTVmIChtaWdyYXRpb24vZGlydHlyYXRlOiBhZGp1c3Qgb3JkZXIgb2Yg
cmVnaXN0ZXJpbmcgdGhyZWFkKQo2LzcgQ2hlY2tpbmcgY29tbWl0IGZjZDlhNDY5MDg0MiAobWln
cmF0aW9uL2RpcnR5cmF0ZTogbW92ZSBpbml0IHN0ZXAgb2YgY2FsY3VsYXRpb24gdG8gbWFpbiB0
aHJlYWQpCjcvNyBDaGVja2luZyBjb21taXQgNTA1YjhjOTlhNTU1IChtaWdyYXRpb24vZGlydHly
YXRlOiBpbXBsZW1lbnQgZGlydHktcmluZyBkaXJ0eXJhdGUgY2FsY3VsYXRpb24pCkVSUk9SOiB0
cmFpbGluZyB3aGl0ZXNwYWNlCiM4ODogRklMRTogbWlncmF0aW9uL2RpcnR5cmF0ZS5jOjkzOgor
ICQKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM5NDogRklMRTogbWlncmF0aW9u
L2RpcnR5cmF0ZS5jOjk5OgorICAgICAgICAgICAgLyogc2V0IHNhbXBsZV9wYWdlcyB3aXRoIDAg
dG8gaW5kaWNhdGUgcGFnZSBzYW1wbGluZyBpc24ndCBlbmFibGVkICovCgpFUlJPUjogdHJhaWxp
bmcgd2hpdGVzcGFjZQojMTA2OiBGSUxFOiBtaWdyYXRpb24vZGlydHlyYXRlLmM6MTExOgorICAg
JAoKRVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzMyNTogRklMRTogbWlncmF0aW9uL2RpcnR5
cmF0ZS5jOjY1ODoKKyAgICBxYXBpX2ZyZWVfRGlydHlSYXRlVmNwdUxpc3QoaW5mby0+dmNwdV9k
aXJ0eV9yYXRlKTsgJAoKdG90YWw6IDMgZXJyb3JzLCAxIHdhcm5pbmdzLCAzNTAgbGluZXMgY2hl
Y2tlZAoKUGF0Y2ggNy83IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVO
RCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlz
IGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy9jb3Zlci4xNjIzOTM1NTQwLmdp
dC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3Nh
Z2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczov
L3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZl
bEByZWRoYXQuY29t

