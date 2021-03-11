Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230A33706E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:48:32 +0100 (CET)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIrn-00044w-7x
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lKIpU-0002EL-Fo
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:46:09 -0500
Resent-Date: Thu, 11 Mar 2021 05:46:08 -0500
Resent-Message-Id: <E1lKIpU-0002EL-Fo@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lKIpP-0005DK-9k
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:46:07 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615459552; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l9RN97YgKctWef6l1qnYAt/ng2RrxMIcDmGMN9gDBVliURLOGNC4U4iwR1z1iqUxEngrblhCTTtRgFiAViDYIlgQJ7Z2KniDW1N2khe+K0FYdOtRQ/sImGDLLmiDwAgudFqFOa1gYyefvslY+v173didAFq/Vh9ZOaOD+9lhByk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615459552;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LdYazlbd3auGwAkgwptnGNXnSDcHneNJrmXyEw5PiuA=; 
 b=KFTA3tNOX7JXn2mnCt7oA9usJjabx61tolHNhbi9I0BTzLsMW+yyQn0WPlxPLZI1LnwnP8R2ftvXMZptdZUeTtR3eRJxvTTCHZkJ9ZaIoCU0/tBmXgb8eFBsgUCCgrrIqtCH56OWhiLKfw2PVHVFnbiNjAe+giGXsaY8z3zH/6Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615459548359149.14282760632568;
 Thu, 11 Mar 2021 02:45:48 -0800 (PST)
In-Reply-To: <20210311103250.532191-1-pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/7] vhost: replace master/slave with more accurate
 wording
Message-ID: <161545954710.16483.11416369004249468061@f3770d8ad632>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Thu, 11 Mar 2021 02:45:48 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxMTEwMzI1MC41MzIx
OTEtMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTExMDMyNTAuNTMy
MTkxLTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjIgMC83XSB2aG9zdDog
cmVwbGFjZSBtYXN0ZXIvc2xhdmUgd2l0aCBtb3JlIGFjY3VyYXRlIHdvcmRpbmcKCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9u
dWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5h
bGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2
NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJv
amVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMTExMDMyNTAuNTMy
MTkxLTEtcGJvbnppbmlAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMzExMTAzMjUwLjUzMjE5
MS0xLXBib256aW5pQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3
NDM1MTJhIGxpYnZob3N0LXVzZXI6IHJlbmFtZSBzdHJ1Y3QgVnVEZXYgZmllbGRzIGZyb20gInNs
YXZlIiB0byAiYmFja2VuZCIKZDQxYTIyNiBsaWJ2aG9zdC11c2VyOiByZW5hbWUgbWVzc2FnZSBu
YW1lcyBmcm9tICJTTEFWRSIgdG8gIkJBQ0tFTkQiCjUwNTMzYTYgdmhvc3QtdXNlcjogcmVuYW1l
IG1lc3NhZ2UgbmFtZXMgZnJvbSAiU0xBVkUiIHRvICJCQUNLRU5EIgowOTFjMjkzIGRvY3M6IHZo
b3N0LXVzZXI6IHJlbmFtZSBtZXNzYWdlIG5hbWVzIGZyb20gIlNMQVZFIiB0byAiQkFDS0VORCIK
NTIyZTA0NCBkb2NzOiB2aG9zdC11c2VyOiByZXBsYWNlIG1hc3Rlci9zbGF2ZSB3aXRoIGZyb250
ZW5kL2JhY2tlbmQKYTMxYzY3OCBkb2NzOiB2aG9zdC11c2VyOiByZXdyaXRlIHNlY3Rpb24gb24g
cmluZyBzdGF0ZSBtYWNoaW5lCjg2NWQyZmIgZG9jczogdmhvc3QtdXNlcjogY2xlYW4gdXAgcmVx
dWVzdC9yZXBseSBkZXNjcmlwdGlvbgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS83IENoZWNraW5n
IGNvbW1pdCA4NjVkMmZiNWM3NWYgKGRvY3M6IHZob3N0LXVzZXI6IGNsZWFuIHVwIHJlcXVlc3Qv
cmVwbHkgZGVzY3JpcHRpb24pCjIvNyBDaGVja2luZyBjb21taXQgYTMxYzY3ODAyN2EyIChkb2Nz
OiB2aG9zdC11c2VyOiByZXdyaXRlIHNlY3Rpb24gb24gcmluZyBzdGF0ZSBtYWNoaW5lKQozLzcg
Q2hlY2tpbmcgY29tbWl0IDUyMmUwNDRjMzk3NyAoZG9jczogdmhvc3QtdXNlcjogcmVwbGFjZSBt
YXN0ZXIvc2xhdmUgd2l0aCBmcm9udGVuZC9iYWNrZW5kKQo0LzcgQ2hlY2tpbmcgY29tbWl0IDA5
MWMyOTNkMzI2MCAoZG9jczogdmhvc3QtdXNlcjogcmVuYW1lIG1lc3NhZ2UgbmFtZXMgZnJvbSAi
U0xBVkUiIHRvICJCQUNLRU5EIikKNS83IENoZWNraW5nIGNvbW1pdCA1MDUzM2E2MGRjY2UgKHZo
b3N0LXVzZXI6IHJlbmFtZSBtZXNzYWdlIG5hbWVzIGZyb20gIlNMQVZFIiB0byAiQkFDS0VORCIp
CldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM5NjogRklMRTogaHcvdmlydGlvL3Zo
b3N0LXVzZXIuYzoxMzM2OgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgVmhvc3RVc2VyVnJpbmdBcmVhICphcmVhLAoKRVJST1I6IHNwYWNl
IHByb2hpYml0ZWQgYmVmb3JlIHRoYXQgJzonIChjdHg6V3hFKQojMTU0OiBGSUxFOiBody92aXJ0
aW8vdmhvc3QtdXNlci5jOjE0NjY6CisgICAgY2FzZSBWSE9TVF9VU0VSX0JBQ0tFTkRfQ09ORklH
X0NIQU5HRV9NU0cgOgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF4KCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgMjUzIGxpbmVzIGNoZWNrZWQKClBh
dGNoIDUvNyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKNi83IENoZWNraW5nIGNvbW1pdCBk
NDFhMjI2MjUzNDUgKGxpYnZob3N0LXVzZXI6IHJlbmFtZSBtZXNzYWdlIG5hbWVzIGZyb20gIlNM
QVZFIiB0byAiQkFDS0VORCIpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMxNjg6
IEZJTEU6IHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5oOjEzNDoKKyAg
ICBWSE9TVF9VU0VSX1NMQVZFX1ZSSU5HX0hPU1RfTk9USUZJRVJfTVNHID0gVkhPU1RfVVNFUl9C
QUNLRU5EX1ZSSU5HX0hPU1RfTk9USUZJRVJfTVNHLAoKV0FSTklORzogbGluZSBvdmVyIDgwIGNo
YXJhY3RlcnMKIzE3OTogRklMRTogc3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11
c2VyLmg6MzEzOgorICAgICAqIHNpemUuIFRoZSBiYWNrZW5kIGNvdWxkIGdldCBpdCBmcm9tIHF1
ZXVlIHNpemUgZmllbGQgb2YgVmhvc3RVc2VySW5mbGlnaHQuICovCgpXQVJOSU5HOiBCbG9jayBj
b21tZW50cyB1c2UgYSB0cmFpbGluZyAqLyBvbiBhIHNlcGFyYXRlIGxpbmUKIzE3OTogRklMRTog
c3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmg6MzEzOgorICAgICAqIHNp
emUuIFRoZSBiYWNrZW5kIGNvdWxkIGdldCBpdCBmcm9tIHF1ZXVlIHNpemUgZmllbGQgb2YgVmhv
c3RVc2VySW5mbGlnaHQuICovCgp0b3RhbDogMCBlcnJvcnMsIDMgd2FybmluZ3MsIDE0NSBsaW5l
cyBjaGVja2VkCgpQYXRjaCA2LzcgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAg
SWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRv
IHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KNy83IENoZWNr
aW5nIGNvbW1pdCA3NDM1MTJhMjBjODMgKGxpYnZob3N0LXVzZXI6IHJlbmFtZSBzdHJ1Y3QgVnVE
ZXYgZmllbGRzIGZyb20gInNsYXZlIiB0byAiYmFja2VuZCIpCj09PSBPVVRQVVQgRU5EID09PQoK
VGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxh
YmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMzExMTAzMjUwLjUzMjE5MS0xLXBi
b256aW5pQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

