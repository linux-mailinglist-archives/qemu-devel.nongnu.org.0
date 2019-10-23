Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDEE1546
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 11:07:21 +0200 (CEST)
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNCbw-0001Jv-BP
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 05:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iNC7A-0007Qf-46
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iNC77-0005Qk-Fb
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:35:31 -0400
Resent-Date: Wed, 23 Oct 2019 04:35:31 -0400
Resent-Message-Id: <E1iNC77-0005Qk-Fb@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iNC77-0005PY-9I
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:35:29 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571819707; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HsC9qm5xOuw9gXqMDPQy7GSZle6dJBad9o7PgTNALEhepHgqkZVVwhTe5648sYWPK3y+e2ulz1OYMkWUgfLm5aomm86rddSjLdIf7OmWAX0KambQMYccxCqdbQD6n3zDzi/dSILJFTgC8JjbkSWXk/kElZwgCazWqf8IooTsPUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1571819707;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=r9rA+nkdvehgiOiZkK8Iv5KTAK1YtqUqfLbHqQ60d6o=; 
 b=Max9UwJ/3e18Wat9L01Xie8paeA/OCelCS3OsyKwwccGzyIFZ91GoBpXLrDHG/obNIMxJGdfmlJKfFeMdoCVFw+YUVRwuCqzOwuz4YceD+P/5olHyxfaiVc6ZLyJl0od0b7tZO2Y6jn3aJbK3EKKNlZjRT3st4AgZbiri/Sws4M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1571819704745962.9840229081416;
 Wed, 23 Oct 2019 01:35:04 -0700 (PDT)
In-Reply-To: <1571685097-15175-1-git-send-email-aleksandar.markovic@rt-rk.com>
Subject: Re: [PATCH v6 00/12] target/mips: Misc cleanups for September/October
 2019
Message-ID: <157181970379.16543.14190878082279212737@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: aleksandar.markovic@rt-rk.com
Date: Wed, 23 Oct 2019 01:35:04 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.54
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
Cc: aleksandar.rikalo@rt-rk.com, qemu-devel@nongnu.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTcxNjg1MDk3LTE1MTc1LTEt
Z2l0LXNlbmQtZW1haWwtYWxla3NhbmRhci5tYXJrb3ZpY0BydC1yay5jb20vCgoKCkhpLAoKVGhp
cyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91
dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtQQVRDSCB2NiAwMC8x
Ml0gdGFyZ2V0L21pcHM6IE1pc2MgY2xlYW51cHMgZm9yIFNlcHRlbWJlci9PY3RvYmVyIDIwMTkK
VHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDE1NzE2ODUwOTctMTUxNzUtMS1naXQtc2VuZC1lbWFp
bC1hbGVrc2FuZGFyLm1hcmtvdmljQHJ0LXJrLmNvbQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09
PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dy
YW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NS
SVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3
MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3Rh
ZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDE5MTAxODA5MjEzNi4yNjU4MS0xLWVyaWMuYXVnZXJA
cmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMTkxMDE4MDkyMTM2LjI2NTgxLTEtZXJpYy5hdWdlckBy
ZWRoYXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAxOTEwMjMwODI0MzEuMzA3
ODAtMS1wYm9uemluaUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAxOTEwMjMwODI0MzEuMzA3ODAt
MS1wYm9uemluaUByZWRoYXQuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvY292ZXIu
MTU3MDIwODc4MS5naXQubWFvemhvbmd5aUBjbXNzLmNoaW5hbW9iaWxlLmNvbSAtPiBwYXRjaGV3
L2NvdmVyLjE1NzAyMDg3ODEuZ2l0Lm1hb3pob25neWlAY21zcy5jaGluYW1vYmlsZS5jb20KU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkMDlmZWY1IHRhcmdldC9taXBzOiBtc2E6IFNw
bGl0IGhlbHBlcnMgZm9yIEFTVUJfPFN8VT4uPEJ8SHxXfEQ+CjMwYTYyMDIgdGFyZ2V0L21pcHM6
IG1zYTogU3BsaXQgaGVscGVycyBmb3IgSFNVQl88U3xVPi48SHxXfEQ+CjMwOGZjN2EgdGFyZ2V0
L21pcHM6IG1zYTogU3BsaXQgaGVscGVycyBmb3IgUENLPEVWfE9EPi48QnxIfFd8RD4KMzIyNDhi
MCB0YXJnZXQvbWlwczogbXNhOiBTcGxpdCBoZWxwZXJzIGZvciBTPExMfFJBfFJBUnxSTHxSTFI+
LjxCfEh8V3xEPgpkYWQ4MjhmIHRhcmdldC9taXBzOiBtc2E6IFNwbGl0IGhlbHBlcnMgZm9yIEhB
RERfPFN8VT4uPEh8V3xEPgpmMWM4YTU2IHRhcmdldC9taXBzOiBtc2E6IFNwbGl0IGhlbHBlcnMg
Zm9yIEFERDxfQXxTX0F8U19TfFNfVXxWPi48QnxIfFd8RD4KZjVmOTBiZiB0YXJnZXQvbWlwczog
bXNhOiBTcGxpdCBoZWxwZXJzIGZvciBJTFY8RVZ8T0R8THxSPi48QnxIfFd8RD4KY2UzNDhhZSB0
YXJnZXQvbWlwczogbXNhOiBTcGxpdCBoZWxwZXJzIGZvciA8TUFYfE1JTj5fPFN8VT4uPEJ8SHxX
fEQ+CjcwNGMxNzQgdGFyZ2V0L21pcHM6IG1zYTogU3BsaXQgaGVscGVycyBmb3IgPE1BWHxNSU4+
X0EuPEJ8SHxXfEQ+CjRmY2QwMTggTUFJTlRBSU5FUlM6IFVwZGF0ZSBtYWlsIGFkZHJlc3Mgb2Yg
QWxla3NhbmRhciBSaWthbG8KNzMxMWQwYSB0YXJnZXQvbWlwczogQ2xlYW4gdXAgb3BfaGVscGVy
LmMKYzQ2NGJjOSB0YXJnZXQvbWlwczogQ2xlYW4gdXAgaGVscGVyLmMKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvMTIgQ2hlY2tpbmcgY29tbWl0IGM0NjRiYzkxOTRiNyAodGFyZ2V0L21pcHM6IENs
ZWFuIHVwIGhlbHBlci5jKQoyLzEyIENoZWNraW5nIGNvbW1pdCA3MzExZDBhNjQ2ZWEgKHRhcmdl
dC9taXBzOiBDbGVhbiB1cCBvcF9oZWxwZXIuYykKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91
bmQgdGhhdCAnKicgKGN0eDpXeFYpCiMxMDU5OiBGSUxFOiB0YXJnZXQvbWlwcy9vcF9oZWxwZXIu
YzozODcxOgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsb2F0X3N0YXR1cyAq
c3RhdHVzKSAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDE2ODEgbGluZXMg
Y2hlY2tlZAoKUGF0Y2ggMi8xMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy8xMiBDaGVj
a2luZyBjb21taXQgNGZjZDAxOGNmMDE1IChNQUlOVEFJTkVSUzogVXBkYXRlIG1haWwgYWRkcmVz
cyBvZiBBbGVrc2FuZGFyIFJpa2FsbykKNC8xMiBDaGVja2luZyBjb21taXQgNzA0YzE3NGNjNDQ5
ICh0YXJnZXQvbWlwczogbXNhOiBTcGxpdCBoZWxwZXJzIGZvciA8TUFYfE1JTj5fQS48QnxIfFd8
RD4pCjUvMTIgQ2hlY2tpbmcgY29tbWl0IGNlMzQ4YWU3ZTg1YiAodGFyZ2V0L21pcHM6IG1zYTog
U3BsaXQgaGVscGVycyBmb3IgPE1BWHxNSU4+XzxTfFU+LjxCfEh8V3xEPikKNi8xMiBDaGVja2lu
ZyBjb21taXQgZjVmOTBiZjk0ZTA1ICh0YXJnZXQvbWlwczogbXNhOiBTcGxpdCBoZWxwZXJzIGZv
ciBJTFY8RVZ8T0R8THxSPi48QnxIfFd8RD4pCjcvMTIgQ2hlY2tpbmcgY29tbWl0IGYxYzhhNTY3
YTUyMyAodGFyZ2V0L21pcHM6IG1zYTogU3BsaXQgaGVscGVycyBmb3IgQUREPF9BfFNfQXxTX1N8
U19VfFY+LjxCfEh8V3xEPikKOC8xMiBDaGVja2luZyBjb21taXQgZGFkODI4ZjI4Y2M3ICh0YXJn
ZXQvbWlwczogbXNhOiBTcGxpdCBoZWxwZXJzIGZvciBIQUREXzxTfFU+LjxIfFd8RD4pCjkvMTIg
Q2hlY2tpbmcgY29tbWl0IDMyMjQ4YjBlNTE5NCAodGFyZ2V0L21pcHM6IG1zYTogU3BsaXQgaGVs
cGVycyBmb3IgUzxMTHxSQXxSQVJ8Ukx8UkxSPi48QnxIfFd8RD4pCjEwLzEyIENoZWNraW5nIGNv
bW1pdCAzMDhmYzdhZGYwMzMgKHRhcmdldC9taXBzOiBtc2E6IFNwbGl0IGhlbHBlcnMgZm9yIFBD
SzxFVnxPRD4uPEJ8SHxXfEQ+KQoxMS8xMiBDaGVja2luZyBjb21taXQgMzBhNjIwMjViNTYwICh0
YXJnZXQvbWlwczogbXNhOiBTcGxpdCBoZWxwZXJzIGZvciBIU1VCXzxTfFU+LjxIfFd8RD4pCjEy
LzEyIENoZWNraW5nIGNvbW1pdCBkMDlmZWY1MTVlNTggKHRhcmdldC9taXBzOiBtc2E6IFNwbGl0
IGhlbHBlcnMgZm9yIEFTVUJfPFN8VT4uPEJ8SHxXfEQ+KQo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8xNTcxNjg1MDk3LTE1MTc1LTEtZ2l0LXNlbmQt
ZW1haWwtYWxla3NhbmRhci5tYXJrb3ZpY0BydC1yay5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90
eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3
IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0
Y2hldy1kZXZlbEByZWRoYXQuY29t


