Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C114030E7CA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 00:47:01 +0100 (CET)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7RrQ-0002QY-AA
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 18:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7RqY-00020Q-Nx
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:46:07 -0500
Resent-Date: Wed, 03 Feb 2021 18:46:06 -0500
Resent-Message-Id: <E1l7RqY-00020Q-Nx@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7RqU-0005Qa-6t
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:46:06 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612395948; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LUB2s0rSvLTd6Mk6FoDd6CySEemwvJY3FkZlKt702j2Bk2C6Eq3Ab3JiT8BFFJ62MHNmHoONzFSbfcUY6xqykg1+B8UKK6RQhJxD0bTHYsY7ZILA/+RCNJLEVpPOdsHzNd3nkOmx6NgDkUwSYe64YTTgu0RLnSa05zTC79aEC1U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612395948;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=W7Y9qgyvjTqaTuvOxRwQuucl0FJOGAK/lOh+lbV8dWw=; 
 b=GfIMgDJ0kxKcHAMNKbNMFd2CEyXj5XcfcaeEjLJUhVOMcyOXJxgwjzhcwV7O8kTx3C6Mh8IWbNwNPPUgOu02/EIpylEDhmMpB+hYHXI/Hudcir6syjPwN6CXBq7EnK4ciCtXur+w//E04EIIYvvlP5i6S6DGc6otf46Y9zgb8IE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612395946516259.4772470618492;
 Wed, 3 Feb 2021 15:45:46 -0800 (PST)
In-Reply-To: <20210203233539.1990032-1-dje@google.com>
Subject: Re: [PATCH v3 0/3]
Message-ID: <161239594536.16627.16235566403963764935@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Wed, 3 Feb 2021 15:45:46 -0800 (PST)
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
Cc: samuel.thibault@ens-lyon.org, qemu-devel@nongnu.org, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwMzIzMzUzOS4xOTkw
MDMyLTEtZGplQGdvb2dsZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIwMzIzMzUzOS4xOTkwMDMy
LTEtZGplQGdvb2dsZS5jb20KU3ViamVjdDogW1BBVENIIHYzIDAvM10KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8
IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0
aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09
PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVm
N2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9x
ZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAyMDMyMTM3MjkuMTk0MDg5My0x
LWRqZUBnb29nbGUuY29tIC0+IHBhdGNoZXcvMjAyMTAyMDMyMTM3MjkuMTk0MDg5My0xLWRqZUBn
b29nbGUuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAyMDMyMzM1MzkuMTk5
MDAzMi0xLWRqZUBnb29nbGUuY29tIC0+IHBhdGNoZXcvMjAyMTAyMDMyMzM1MzkuMTk5MDAzMi0x
LWRqZUBnb29nbGUuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKOTk4ZGQxMiBu
ZXQ6IEFkZCAtaXB2Ni1ob3N0ZndkIG9wdGlvbiwgaXB2Nl9ob3N0ZndkX2FkZC9yZW1vdmUgY29t
bWFuZHMKZTZhNDVlNSBuZXQvc2xpcnAuYzogUmVmYWN0b3IgYWRkcmVzcyBwYXJzaW5nCjZmYWY5
YTkgc2xpcnA6IFBsYWNlaG9sZGVyIGZvciBsaWJzbGlycCBpcHY2IGhvc3Rmd2Qgc3VwcG9ydAoK
PT09IE9VVFBVVCBCRUdJTiA9PT0KMS8zIENoZWNraW5nIGNvbW1pdCA2ZmFmOWE5M2IxY2YgKHNs
aXJwOiBQbGFjZWhvbGRlciBmb3IgbGlic2xpcnAgaXB2NiBob3N0ZndkIHN1cHBvcnQpCkVSUk9S
OiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJu
aW5ncywgMiBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KCjIvMyBDaGVja2luZyBjb21taXQgZTZhNDVlNTA2ODlmIChuZXQvc2xpcnAuYzogUmVmYWN0
b3IgYWRkcmVzcyBwYXJzaW5nKQozLzMgQ2hlY2tpbmcgY29tbWl0IDk5OGRkMTJlNTFhYSAobmV0
OiBBZGQgLWlwdjYtaG9zdGZ3ZCBvcHRpb24sIGlwdjZfaG9zdGZ3ZF9hZGQvcmVtb3ZlIGNvbW1h
bmRzKQpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzE0NTogRklMRTogbmV0L3NsaXJw
LmM6NzQ4OgorICAgICAgICAqZXJybXNnID0gZ19zdHJkdXBfcHJpbnRmKCJNaXNzaW5nICVzIGFk
ZHJlc3Mgc2VwYXJhdG9yIGFmdGVyIElQdjYgYWRkcmVzcyIsIGtpbmQpOwoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCAyNTAgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy8zIGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQg
d2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDIxMDIwMzIzMzUzOS4xOTkwMDMyLTEtZGplQGdvb2dsZS5jb20vdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

