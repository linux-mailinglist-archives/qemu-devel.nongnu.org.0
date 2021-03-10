Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D8334844
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:47:52 +0100 (CET)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4oB-0001gZ-L1
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lK4mw-00011P-Fl
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:46:34 -0500
Resent-Date: Wed, 10 Mar 2021 14:46:34 -0500
Resent-Message-Id: <E1lK4mw-00011P-Fl@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lK4mu-0004Mr-02
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:46:33 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615405548; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Es+mQWsygBnzF+RpxeDwCPCoORbqkIFZXY/o3wo6uDAt9tFOaKM6auvK1+kmxTzu1qJ2kjpXzt+x+uEBhr+/+SbFLSSFCrB6TSk+0vpflFPG40XvQ1NvqB2NoqTZ7m69eSLsIPEhxZ38j5hVoQnZ5BO8CdWfQvQdzBN/mPALJ/w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615405548;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=FkSzSimE/4lROucnhb0FqsBH95YgTnd+Zk6zDJiot/A=; 
 b=WBUoDP2lr0ojrvmxJ4S708oP2R1KDna6PF/nTuqaePKtAX8a2TCIFeRA0Ldtz8CzUReP66KssKnNdR7fWUJAh1kHeWq5uS68L7WHL9kBBE0OIyJTRxcFp7lRdmOzbE1OqCr7ukGnrosY1ji6YSOnRvfUaMECxlRxotSB03quYcI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615405545963351.01229202496665;
 Wed, 10 Mar 2021 11:45:45 -0800 (PST)
In-Reply-To: <20210310192331.29284-1-alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 0/7] testing/next (hexagon 2, electric boogaloo)
Message-ID: <161540554436.3874.17047510716095401393@f3770d8ad632>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Wed, 10 Mar 2021 11:45:45 -0800 (PST)
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxMDE5MjMzMS4yOTI4
NC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMxMDE5MjMzMS4y
OTI4NC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3ViamVjdDogW1BBVENIICB2MSAwLzddIHRl
c3RpbmcvbmV4dCAoaGV4YWdvbiAyLCBlbGVjdHJpYyBib29nYWxvbykKCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8
IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0
aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09
PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVm
N2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9x
ZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAzMTAwMDI5MTcuODg3Ni0xLXJl
YmVjY2FAbnV2aWFpbmMuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTAwMDI5MTcuODg3Ni0xLXJlYmVj
Y2FAbnV2aWFpbmMuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMTAxOTIz
MzEuMjkyODQtMS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTAzMTAxOTIz
MzEuMjkyODQtMS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5j
aCAndGVzdCcKMTAzM2I4YyBnaXRsYWI6IGFkZCBidWlsZC11c2VyLWhleGFnb24gdGVzdAowYTM4
MTFiIHRlc3RzL3RjZzogVXNlIEhleGFnb24gRG9ja2VyIGltYWdlCmQ5OGE1YmQgZG9ja2VyOiBB
ZGQgSGV4YWdvbiBpbWFnZQoyYmJlNTllIHRlc3RzL2RvY2tlcjogYWRkICJmZXRjaCIgc3ViLWNv
bW1hbmQKNGUwMWUyMSB0ZXN0cy9kb2NrZXI6IGFsbG93ICJ1cGRhdGUiIHRvIGFkZCB0aGUgY3Vy
cmVudCB1c2VyCjA2ZDFlMjMgdGVzdHMvZG9ja2VyOiBtYWtlIGV4ZWN1dGFibGUgYW4gb3B0aW9u
YWwgYXJndW1lbnQgdG8gInVwZGF0ZSIKN2NiNDAwYSB0ZXN0cy9kb2NrZXI6IGZpeCBjb3B5aW5n
IG9mIGV4ZWN1dGFibGUgaW4gInVwZGF0ZSIKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvNyBDaGVj
a2luZyBjb21taXQgN2NiNDAwYTUyMWRiICh0ZXN0cy9kb2NrZXI6IGZpeCBjb3B5aW5nIG9mIGV4
ZWN1dGFibGUgaW4gInVwZGF0ZSIpCjIvNyBDaGVja2luZyBjb21taXQgMDZkMWUyM2M1MWIwICh0
ZXN0cy9kb2NrZXI6IG1ha2UgZXhlY3V0YWJsZSBhbiBvcHRpb25hbCBhcmd1bWVudCB0byAidXBk
YXRlIikKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzk5OiBGSUxFOiB0ZXN0cy9k
b2NrZXIvZG9ja2VyLnB5OjU2MjoKKyAgICAgICAgICAgICAgICAgICAgICAgICBwcmludCgiQ291
bGRuJ3QgYWRkICVzLyVzIHRvIGFyY2hpdmUiICUgKHNvX3BhdGgsIG5hbWUpKQoKdG90YWw6IDAg
ZXJyb3JzLCAxIHdhcm5pbmdzLCA3OSBsaW5lcyBjaGVja2VkCgpQYXRjaCAyLzcgaGFzIHN0eWxl
IHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFs
c2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRD
SCBpbiBNQUlOVEFJTkVSUy4KMy83IENoZWNraW5nIGNvbW1pdCA0ZTAxZTIxNTEyN2MgKHRlc3Rz
L2RvY2tlcjogYWxsb3cgInVwZGF0ZSIgdG8gYWRkIHRoZSBjdXJyZW50IHVzZXIpCjQvNyBDaGVj
a2luZyBjb21taXQgMmJiZTU5ZWQ2ODk0ICh0ZXN0cy9kb2NrZXI6IGFkZCAiZmV0Y2giIHN1Yi1j
b21tYW5kKQo1LzcgQ2hlY2tpbmcgY29tbWl0IGQ5OGE1YmQ5NWU3MCAoZG9ja2VyOiBBZGQgSGV4
YWdvbiBpbWFnZSkKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzIwMzogRklMRTog
dGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlci5kL2J1
aWxkLXRvb2xjaGFpbi5zaDo2MzoKKyAgICAtRENNQUtFX0FTTV9GTEFHUz0iLUcwIC1tbG9uZy1j
YWxscyAtZm5vLXBpYyAtLXRhcmdldD1oZXhhZ29uLXVua25vd24tbGludXgtbXVzbCAiIFwKCkVS
Uk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMjMwOiBGSUxFOiB0ZXN0cy9kb2NrZXIvZG9j
a2VyZmlsZXMvZGViaWFuLWhleGFnb24tY3Jvc3MuZG9ja2VyLmQvYnVpbGQtdG9vbGNoYWluLnNo
OjkwOgorICAgIENST1NTX0NGTEFHUz0iLUcwIC1PMCAtbXY2NSAtZm5vLWJ1aWx0aW4gLWZuby1y
b3VuZGluZy1tYXRoIC0tdGFyZ2V0PWhleGFnb24tdW5rbm93bi1saW51eC1tdXNsIiBcCgpFUlJP
UjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzI2NzogRklMRTogdGVzdHMvZG9ja2VyL2RvY2tl
cmZpbGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlci5kL2J1aWxkLXRvb2xjaGFpbi5zaDox
Mjc6CisgICAgQ0ZMQUdTPSItRzAgLU8wIC1tdjY1IC1mbm8tYnVpbHRpbiAtZm5vLXJvdW5kaW5n
LW1hdGggLS10YXJnZXQ9aGV4YWdvbi11bmtub3duLWxpbnV4LW11c2wiIFwKCnRvdGFsOiAyIGVy
cm9ycywgMSB3YXJuaW5ncywgMjIxIGxpbmVzIGNoZWNrZWQKClBhdGNoIDUvNyBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgoKNi83IENoZWNraW5nIGNvbW1pdCAwYTM4MTFiOGU0NTMgKHRlc3Rz
L3RjZzogVXNlIEhleGFnb24gRG9ja2VyIGltYWdlKQo3LzcgQ2hlY2tpbmcgY29tbWl0IDEwMzNi
OGNkZGUxZSAoZ2l0bGFiOiBhZGQgYnVpbGQtdXNlci1oZXhhZ29uIHRlc3QpCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMzEwMTkyMzMxLjI5
Mjg0LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=

