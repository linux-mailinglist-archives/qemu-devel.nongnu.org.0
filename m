Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A3430FD0F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:41:43 +0100 (CET)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kVa-0002wI-1R
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7kFd-0004SN-J2; Thu, 04 Feb 2021 14:25:17 -0500
Resent-Date: Thu, 04 Feb 2021 14:25:13 -0500
Resent-Message-Id: <E1l7kFd-0004SN-J2@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7kFa-0008Mc-1d; Thu, 04 Feb 2021 14:25:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612466691; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cYCJO9MmQL7EU4uy/kWY9csxctytOxEdIO8Oi0kuIzuX1r1HAAmSHezjtUxqVwjgdSlOnCg7WFf500GF+tUpbv2h0aMR5swSFijcgIww0xqK5vJhSxPiFCpxkorkFW8IEreq3z1XO8ZwqBBipUIxdUIfFmHVEEwEevHu+rbGxWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612466691;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=/rATe4C0o+lzbjv1iRjExdllaLVtB8Vgmp3pzugvmmQ=; 
 b=EIPSyT3966RpJYgOk1j4HO27hYnz8sE0e6xOrf0Y1JuXQqMNMLk8YVd8Wapzcg/wgExtS+QcFvx81obqjSHxCEpKFA5Hxi/rEI2YPAzQpkLsE+ypyyfvvrtdwrdv4/dWIKYrMPgteqdPrbVT/48PTitY3BVnOltrX9S+1HWPExY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612466689300688.612024442736;
 Thu, 4 Feb 2021 11:24:49 -0800 (PST)
In-Reply-To: <20210204183439.546918-1-dgilbert@redhat.com>
Subject: Re: [PULL 0/5] virtiofs queue: Security fix
Message-ID: <161246668791.30579.7760426288477164722@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: dgilbert@redhat.com
Date: Thu, 4 Feb 2021 11:24:49 -0800 (PST)
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
Cc: virtio-fs@redhat.com, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 stefanha@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwNDE4MzQzOS41NDY5
MTgtMS1kZ2lsYmVydEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMDQxODM0MzkuNTQ2
OTE4LTEtZGdpbGJlcnRAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUFVMTCAwLzVdIHZpcnRpb2ZzIHF1
ZXVlOiBTZWN1cml0eSBmaXgKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gK
Z2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpV
cGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0
cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAg
IHBhdGNoZXcvMjAyMTAyMDQxODM0MzkuNTQ2OTE4LTEtZGdpbGJlcnRAcmVkaGF0LmNvbSAtPiBw
YXRjaGV3LzIwMjEwMjA0MTgzNDM5LjU0NjkxOC0xLWRnaWxiZXJ0QHJlZGhhdC5jb20KU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpjYzU4YTBjIHZpcnRpb2ZzZDogQWRkIHJlc3RhcnRf
c3lzY2FsbCB0byB0aGUgc2VjY29tcCB3aGl0ZWxpc3QKYmM4ODFlZCB2aXJ0aW9mc2Q6IEFkZCBf
bGxzZWVrIHRvIHRoZSBzZWNjb21wIHdoaXRlbGlzdAo0NDliMzBmIHZpcnRpb2ZzZDogcHJldmVu
dCBvcGVuaW5nIG9mIHNwZWNpYWwgZmlsZXMgKENWRS0yMDIwLTM1NTE3KQo1ZGExMmZlIHZpcnRp
b2ZzZDogb3B0aW9uYWxseSByZXR1cm4gaW5vZGUgcG9pbnRlciBmcm9tIGxvX2RvX2xvb2t1cCgp
CjM2OTAzODcgdmlydGlvZnNkOiBleHRyYWN0IGxvX2RvX29wZW4oKSBmcm9tIGxvX29wZW4oKQoK
PT09IE9VVFBVVCBCRUdJTiA9PT0KMS81IENoZWNraW5nIGNvbW1pdCAzNjkwMzg3YTNiYzIgKHZp
cnRpb2ZzZDogZXh0cmFjdCBsb19kb19vcGVuKCkgZnJvbSBsb19vcGVuKCkpCkVSUk9SOiByZXR1
cm4gb2YgYW4gZXJybm8gc2hvdWxkIHR5cGljYWxseSBiZSAtdmUgKHJldHVybiAtRU5PTUVNKQoj
NzI6IEZJTEU6IHRvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jOjE2NzQ6CisgICAgICAg
IHJldHVybiBFTk9NRU07Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDExNCBsaW5lcyBj
aGVja2VkCgpQYXRjaCAxLzUgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjIvNSBDaGVja2lu
ZyBjb21taXQgNWRhMTJmZTYxZjUwICh2aXJ0aW9mc2Q6IG9wdGlvbmFsbHkgcmV0dXJuIGlub2Rl
IHBvaW50ZXIgZnJvbSBsb19kb19sb29rdXAoKSkKMy81IENoZWNraW5nIGNvbW1pdCA0NDliMzBm
Y2M3YmUgKHZpcnRpb2ZzZDogcHJldmVudCBvcGVuaW5nIG9mIHNwZWNpYWwgZmlsZXMgKENWRS0y
MDIwLTM1NTE3KSkKNC81IENoZWNraW5nIGNvbW1pdCBiYzg4MWVkNTRlZTggKHZpcnRpb2ZzZDog
QWRkIF9sbHNlZWsgdG8gdGhlIHNlY2NvbXAgd2hpdGVsaXN0KQo1LzUgQ2hlY2tpbmcgY29tbWl0
IGNjNThhMGM3ZjFhMCAodmlydGlvZnNkOiBBZGQgcmVzdGFydF9zeXNjYWxsIHRvIHRoZSBzZWNj
b21wIHdoaXRlbGlzdCkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdp
dGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvMjAyMTAyMDQxODM0MzkuNTQ2OTE4LTEtZGdpbGJlcnRAcmVkaGF0LmNvbS90ZXN0
aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0
aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

