Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2717C3A9D6E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:20:26 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWP2-0007En-1O
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltWNj-000638-9S
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:19:04 -0400
Resent-Date: Wed, 16 Jun 2021 10:19:03 -0400
Resent-Message-Id: <E1ltWNj-000638-9S@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltWNg-0005BN-Na
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:19:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623853130; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mlXi+tbeh19wKfcC/F0B4X9e8J0pH/g6GkoLmg7392j9WoV/D8eKULYKhXmKJ3j6K/D62RvnGt0cfPb6QbAXa4rIhOnuunuSis77j0DrtfvbwqVImpYB0Kzsus/cZIP0tIQ4Ov9Tcv6YGkC7Uw3P6KGAtre3bf+BsV7/TG6CYEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623853130;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=H3uw1boeuI1kzCbb780Wzgcu72HTI5Pz8b9rVfyewDQ=; 
 b=aBmi7jpJzBAghz0gW+1sC6YDsmuIpZhSkuqA07s70r6Alw+quk7wTNHKmsUI5PNvqbpVkpkJjGFUhF7D0mXrZZNpfNo8DE0dU/igoZlXReod0hIm15xYrpu2jRKIAyGhW6QXT/eqMIirtcPhnzcIPTrNkngit//QEb96tdepmoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623853127603423.33515282117537;
 Wed, 16 Jun 2021 07:18:47 -0700 (PDT)
In-Reply-To: <20210616141411.53892-1-akihiko.odaki@gmail.com>
Subject: Re: [PATCH] audio: Fix format specifications of debug logs
Message-ID: <162385312641.30657.10448005662362206685@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: akihiko.odaki@gmail.com
Date: Wed, 16 Jun 2021 07:18:47 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org, akihiko.odaki@gmail.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxNjE0MTQxMS41Mzg5
Mi0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MTYxNDE0MTEu
NTM4OTItMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIGF1ZGlvOiBG
aXggZm9ybWF0IHNwZWNpZmljYXRpb25zIG9mIGRlYnVnIGxvZ3MKCj09PSBURVNUIFNDUklQVCBC
RUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4
aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1s
b2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0g
aGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBU
RVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0
NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11
CiAgIDFlYTA2YWIuLjFkZDI1OWEgIG1hc3RlciAgICAgLT4gbWFzdGVyCiAtIFt0YWcgdXBkYXRl
XSAgICAgIHBhdGNoZXcvMjAyMTA2MDkxNTU1NTEuNDQ0MzctMS1tcmVpdHpAcmVkaGF0LmNvbSAt
PiBwYXRjaGV3LzIwMjEwNjA5MTU1NTUxLjQ0NDM3LTEtbXJlaXR6QHJlZGhhdC5jb20KIC0gW3Rh
ZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDYxMDEzMzUzOC42MDgzOTAtMS1wYm9uemluaUBy
ZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA2MTAxMzM1MzguNjA4MzkwLTEtcGJvbnppbmlAcmVk
aGF0LmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNjE0MTQ0MjQ1LjE3NjYw
LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwNjE0MTQ0MjQ1LjE3NjYw
LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIw
MjEwNjE1MTc1NTIzLjQzOTgzMC0xLXBldGVyeEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA2
MTUxNzU1MjMuNDM5ODMwLTEtcGV0ZXJ4QHJlZGhhdC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAg
cGF0Y2hldy8yMDIxMDYxNjAxMTIwOS4xNDQ2MDQ1LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZyAtPiBwYXRjaGV3LzIwMjEwNjE2MDExMjA5LjE0NDYwNDUtMS1yaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA2MTYxNDE0MTEu
NTM4OTItMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzIwMjEwNjE2MTQxNDEx
LjUzODkyLTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNo
ICd0ZXN0JwphNWFlYWFlIGF1ZGlvOiBGaXggZm9ybWF0IHNwZWNpZmljYXRpb25zIG9mIGRlYnVn
IGxvZ3MKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJldHdl
ZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3BlbiBwYXJlbnRoZXNpcyAnKCcKIzIyOiBGSUxFOiBhdWRp
by9hdWRpby5jOjcwNzoKKyAgICAgICAgZG9sb2cgKCIlcyBpcyBmdWxsICV6dVxuIiwgc3ctPm5h
bWUsIGxpdmUpOwoKRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1l
IGFuZCBvcGVuIHBhcmVudGhlc2lzICcoJwojNDA6IEZJTEU6IGF1ZGlvL2F1ZGlvLmM6MTAyNDoK
KyAgICBkb2xvZyAoIiVzOiBnZXRfZnJlZSBsaXZlICV6dSBkZWFkICV6dSByZXQgJSIgUFJJZDY0
ICJcbiIsCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDI0IGxpbmVzIGNoZWNrZWQKCkNv
bW1pdCBhNWFlYWFlOGJjYzEgKGF1ZGlvOiBGaXggZm9ybWF0IHNwZWNpZmljYXRpb25zIG9mIGRl
YnVnIGxvZ3MpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0
aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRh
aW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoK
VGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxh
YmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNjE2MTQxNDExLjUzODkyLTEtYWtp
aGlrby5vZGFraUBnbWFpbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

