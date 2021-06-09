Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510033A16E3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:14:56 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqyys-0002jD-85
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lqyxz-0001iB-9r; Wed, 09 Jun 2021 10:13:59 -0400
Resent-Date: Wed, 09 Jun 2021 10:13:59 -0400
Resent-Message-Id: <E1lqyxz-0001iB-9r@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lqyxx-0000SV-6f; Wed, 09 Jun 2021 10:13:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623248025; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eZJnMFORU+JBd19sYLtvbF6OVzXneNFr3+aAqfZM7e9fEZSLCVbNASWRupnq0r/Ey3i14EkogNrgPkU77zDIBPC3ylOOZkX39HuFtesFq0CB/L/GUWD2RU+znRNeYcK3nyEw26jjhgaghn8o0TchjHbhPHIQYXp9QOCg4L97KO8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623248025;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=oXxRh62BdlXfCfduv0/2T3sWd2SIq+KAnKlc0vDsayA=; 
 b=YTy9GILQQ2tr4HTNf8HvtqcZKoYr47CAek3qwj5lagDSVGm4af0CwOyWEv4XkwdX6zeftxdS6SlkgClnQwl9hzOuUlDFdEdvtVuCJtg5iFwpGZjZ3raoG3xbZOF2mMqApUghKp5vRS74dyDr7FgLnsislYhF3nbBm3mPTrdwP7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623248022718339.1254916816755;
 Wed, 9 Jun 2021 07:13:42 -0700 (PDT)
In-Reply-To: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH 0/4] target/ppc: mmu cleanup
Message-ID: <162324802125.6796.13069344151769996834@d310de11c650>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lucas.araujo@eldorado.org.br
Date: Wed, 9 Jun 2021 07:13:42 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYwMjE5MjYwNC45MDg0
Ni0xLWx1Y2FzLmFyYXVqb0BlbGRvcmFkby5vcmcuYnIvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYwMjE5
MjYwNC45MDg0Ni0xLWx1Y2FzLmFyYXVqb0BlbGRvcmFkby5vcmcuYnIKU3ViamVjdDogW1JGQyBQ
QVRDSCAwLzRdIHRhcmdldC9wcGM6IG1tdSBjbGVhbnVwCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4g
PT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3Rv
Z3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4
ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBb
bmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNjA5MTQxMDEwLjEwNjY3NTAtMS1mNGJ1Z0Bh
bXNhdC5vcmcgLT4gcGF0Y2hldy8yMDIxMDYwOTE0MTAxMC4xMDY2NzUwLTEtZjRidWdAYW1zYXQu
b3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMTgzZDEyMCB0YXJnZXQvcHBjOiBN
b3ZlZCBoZWxwZXJzIHRvIG1tdV9oZWxwZXIuYwpjM2Q3N2NiIHRhcmdldC9wcGM6IG1vdmVkIHBw
Y19zdG9yZV9zZHIxIHRvIG1tdV9jb21tb24uYwo3Yzg0YzQyIHRhcmdldC9wcGM6IGRpdmlkZWQg
bW11X2hlbHBlci5jIGluIDIgZmlsZXMKOTBhMzhhZSB0YXJnZXQvcHBjOiBEb24ndCBjb21waWxl
IHBwY190bGJfaW52YWxpZF9hbGwgd2l0aG91dCBUQ0cKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEv
NCBDaGVja2luZyBjb21taXQgOTBhMzhhZTU2YzU5ICh0YXJnZXQvcHBjOiBEb24ndCBjb21waWxl
IHBwY190bGJfaW52YWxpZF9hbGwgd2l0aG91dCBUQ0cpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBj
aGFyYWN0ZXJzCiMzMDogRklMRTogdGFyZ2V0L3BwYy9jcHVfaW5pdC5jOjg5MTU6CisgICAgICAg
Y3B1X2Fib3J0KGVudl9jcHUoZW52KSwiUG93ZXJQQyBub3QgaW4gcmVhbCBtb2RlLCBpbnZhbGlk
IGluIHRoaXMgYnVpbGRcbiIpOwoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2Ug
dGFicwojMzA6IEZJTEU6IHRhcmdldC9wcGMvY3B1X2luaXQuYzo4OTE1OgorXkljcHVfYWJvcnQo
ZW52X2NwdShlbnYpLCJQb3dlclBDIG5vdCBpbiByZWFsIG1vZGUsIGludmFsaWQgaW4gdGhpcyBi
dWlsZFxuIik7JAoKRVJST1I6IHNwYWNlIHJlcXVpcmVkIGFmdGVyIHRoYXQgJywnIChjdHg6VnhW
KQojMzA6IEZJTEU6IHRhcmdldC9wcGMvY3B1X2luaXQuYzo4OTE1OgorICAgICAgIGNwdV9hYm9y
dChlbnZfY3B1KGVudiksIlBvd2VyUEMgbm90IGluIHJlYWwgbW9kZSwgaW52YWxpZCBpbiB0aGlz
IGJ1aWxkXG4iKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDIgZXJy
b3JzLCAxIHdhcm5pbmdzLCAzOSBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzQgaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KCjIvNCBDaGVja2luZyBjb21taXQgN2M4NGM0Mjc2OTM2ICh0YXJnZXQv
cHBjOiBkaXZpZGVkIG1tdV9oZWxwZXIuYyBpbiAyIGZpbGVzKQpXQVJOSU5HOiBhZGRlZCwgbW92
ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiMx
MjU6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3Rl
cnMKIzE1Mzg6IEZJTEU6IHRhcmdldC9wcGMvbW11X2NvbW1vbi5jOjE0MDk6CisgICAgICAgICAg
ICAgICAgICAgIGVudi0+c3ByW1NQUl9CT09LRV9FU1JdID0gbW11Ym9va2UyMDZfZXNyKG1tdV9p
ZHgsIE1NVV9EQVRBX0xPQUQpOwoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzE2
MjU6IEZJTEU6IHRhcmdldC9wcGMvbW11X2NvbW1vbi5jOjE0OTY6CisgICAgICAgICAgICAgICAg
ICAgIGJvb2tlMjA2X3VwZGF0ZV9tYXNfdGxiX21pc3MoZW52LCBhZGRyZXNzLCBhY2Nlc3NfdHlw
ZSwgbW11X2lkeCk7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMTYzMTogRklM
RTogdGFyZ2V0L3BwYy9tbXVfY29tbW9uLmM6MTUwMjoKKyAgICAgICAgICAgICAgICAgICAgZW52
LT5zcHJbU1BSX0JPT0tFX0VTUl0gPSBtbXVib29rZTIwNl9lc3IobW11X2lkeCwgYWNjZXNzX3R5
cGUpOwoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzE2NTU6IEZJTEU6IHRhcmdl
dC9wcGMvbW11X2NvbW1vbi5jOjE1MjY6CisgICAgICAgICAgICAgICAgICAgIGVudi0+c3ByW1NQ
Ul9CT09LRV9FU1JdID0gbW11Ym9va2UyMDZfZXNyKG1tdV9pZHgsIGFjY2Vzc190eXBlKTsKCnRv
dGFsOiAwIGVycm9ycywgNSB3YXJuaW5ncywgMzM1MSBsaW5lcyBjaGVja2VkCgpQYXRjaCAyLzQg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMy80IENoZWNraW5nIGNvbW1pdCBjM2Q3N2NiYzc2
MDYgKHRhcmdldC9wcGM6IG1vdmVkIHBwY19zdG9yZV9zZHIxIHRvIG1tdV9jb21tb24uYykKNC80
IENoZWNraW5nIGNvbW1pdCAxODNkMTIwYmQ3NDYgKHRhcmdldC9wcGM6IE1vdmVkIGhlbHBlcnMg
dG8gbW11X2hlbHBlci5jKQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQg
d2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDIxMDYwMjE5MjYwNC45MDg0Ni0xLWx1Y2FzLmFyYXVqb0BlbGRvcmFkby5v
cmcuYnIvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

