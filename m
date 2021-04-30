Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360053700D6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:57:13 +0200 (CEST)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYK8-0007EN-B8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcYIB-0006FM-I0; Fri, 30 Apr 2021 14:55:11 -0400
Resent-Date: Fri, 30 Apr 2021 14:55:11 -0400
Resent-Message-Id: <E1lcYIB-0006FM-I0@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lcYI9-00027c-0c; Fri, 30 Apr 2021 14:55:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619808888; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l1btT1C4ltGBKaBWFh6ZQZ034+EkzNcIYpsExwvTdHLQHhin0/QXfIZzf2bOK5/+GWR+aIXTZ1lg5veb2hsM6KRIhDXmylzF54LdbMHWZweclYDynsvaIxN4m3bASt95dOs0xBsB4eeNE5kSNTWjRNmrUUozsN72hrPnvFnnXVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619808888;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=eLUWtzx/RVPku1Ax+r+FFONGk8DJ3xDInudbs1nY3TI=; 
 b=Ql4YeR8UzWFKhdT4nahb7G6qrRc1qTf7U7f4HhY9qoYQTIEoHGUOMQrlAVNe5rp5O93rmXhFw521RwV1Jdm7Ca/jL9Y8LDdqNboBhPrnOLjxcTvrJYv3CBWHn7VWpqV6qsL278ZMLzyU3fTO+zm8d5jdqxHH/+C7uO+Gncm53as=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619808886888304.35090115790945;
 Fri, 30 Apr 2021 11:54:46 -0700 (PDT)
In-Reply-To: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG 
Message-ID: <161980888560.14179.9925556821023249084@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lucas.araujo@eldorado.org.br
Date: Fri, 30 Apr 2021 11:54:46 -0700 (PDT)
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 qemu-ppc@nongnu.org, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQzMDE4NDA0Ny44MTY1
My0xLWx1Y2FzLmFyYXVqb0BlbGRvcmFkby5vcmcuYnIvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDQzMDE4
NDA0Ny44MTY1My0xLWx1Y2FzLmFyYXVqb0BlbGRvcmFkby5vcmcuYnIKU3ViamVjdDogW1JGQyBQ
QVRDSCB2MiAwLzJdIGh3L3BwYzogY29kZSBtb3Rpb24gdG8gY29tcGlsZSB3aXRob3V0IFRDRyAK
Cj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNl
ID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1p
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFp
bGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMy
MWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3Bh
dGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA0MzAx
ODQwNDcuODE2NTMtMS1sdWNhcy5hcmF1am9AZWxkb3JhZG8ub3JnLmJyIC0+IHBhdGNoZXcvMjAy
MTA0MzAxODQwNDcuODE2NTMtMS1sdWNhcy5hcmF1am9AZWxkb3JhZG8ub3JnLmJyClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMWNkMjcxOCBody9wcGM6IE1vdmVkIFRDRyBjb2RlIHRv
IHNwYXByX2hjYWxsX3RjZwo5OWIwMjkyIHRhcmdldC9wcGM6IE1vdmVkIGZ1bmN0aW9ucyBvdXQg
b2YgbW11LWhhc2g2NAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCA5
OWIwMjkyNGM0ZWEgKHRhcmdldC9wcGM6IE1vdmVkIGZ1bmN0aW9ucyBvdXQgb2YgbW11LWhhc2g2
NCkKVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFsdWUgJGFjcGlfdGVzdGV4cGVjdGVkIGluIHN0cmlu
ZyBlcSBhdCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBsaW5lIDE1MjkuCldBUk5JTkc6IGFkZGVk
LCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGlu
Zz8KIzI0NTogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2Fybmlu
Z3MsIDIxNCBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KMi8yIENoZWNraW5nIGNvbW1pdCAxY2QyNzE4OWYyYWUgKGh3L3BwYzogTW92ZWQgVENHIGNv
ZGUgdG8gc3BhcHJfaGNhbGxfdGNnKQpVc2Ugb2YgdW5pbml0aWFsaXplZCB2YWx1ZSAkYWNwaV90
ZXN0ZXhwZWN0ZWQgaW4gc3RyaW5nIGVxIGF0IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIGxpbmUg
MTUyOS4KV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlO
VEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMzc4OiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCldBUk5J
Tkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIGxlYWRpbmcgLyogb24gYSBzZXBhcmF0ZSBsaW5lCiM0
NjI6IEZJTEU6IGh3L3BwYy9zcGFwcl9oY2FsbF90Y2cuYzo4MDoKKyAgICAgICAgLyogRklYTUU6
IFdoYXQgV0lNRyBjb21iaW5hdGlvbnMgY291bGQgYmUgc2Vuc2libGUgZm9yIElPPwoKV0FSTklO
RzogQmxvY2sgY29tbWVudHMgdXNlIGEgdHJhaWxpbmcgKi8gb24gYSBzZXBhcmF0ZSBsaW5lCiM0
NjM6IEZJTEU6IGh3L3BwYy9zcGFwcl9oY2FsbF90Y2cuYzo4MToKKyAgICAgICAgICogRm9yIG5v
dyB3ZSBhbGxvdyBXSU1HPTAxMHgsIGJ1dCBhcmUgdGhlcmUgb3RoZXJzPyAqLwoKRVJST1I6IHNw
YWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCiM2MDE6IEZJTEU6IGh3L3Bw
Yy9zcGFwcl9oY2FsbF90Y2cuYzoyMTk6CisgICAgICAgIHRhcmdldF91bG9uZyAqdHNoID0gJmFy
Z3NbaSoyXTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKRVJST1I6IHNw
YWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCiM2MDI6IEZJTEU6IGh3L3Bw
Yy9zcGFwcl9oY2FsbF90Y2cuYzoyMjA6CisgICAgICAgIHRhcmdldF91bG9uZyB0c2wgPSBhcmdz
W2kqMiArIDFdOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDIg
ZXJyb3JzLCAzIHdhcm5pbmdzLCA2NzMgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi8yIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0
ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0
Y2hldy5vcmcvbG9ncy8yMDIxMDQzMDE4NDA0Ny44MTY1My0xLWx1Y2FzLmFyYXVqb0BlbGRvcmFk
by5vcmcuYnIvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

