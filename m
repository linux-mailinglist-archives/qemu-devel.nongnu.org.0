Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9F36C8A0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:29:33 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPeW-0004w1-Q8
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbPd4-0004DH-W0
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:28:02 -0400
Resent-Date: Tue, 27 Apr 2021 11:28:02 -0400
Resent-Message-Id: <E1lbPd4-0004DH-W0@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbPd0-0000di-GX
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:28:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619537270; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ym1pCZ3Y01uVyETKqW9pCx+1Y9qJu8GRD5l2hxjf9Zxk8BtPHdRQZvFHob553SrABIJGjteNWnFfVqsI5tm+rGxxPZV07SLord6TfCKio0EG/Otj3cwOkG+H8VCqIwqK8jyjJNhaPC0iwf+vJC8hKhiehJKR5z03mzF2ludcjU0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619537270;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=pwncBLItrrACrsslsa2hh9gUdI/SeFU8ZUFE0P17vA0=; 
 b=gmiSOJHDnTz47HdzKcoVsTFd2JbXqcQSyCQRjqu33fwUMUKAXyY17FFrgVVKHxZxuuasVUGv68pOoIGSmVZz0CQ9S714SBe2vnJTWbLmAdbexS/xvEZk44WlKOwwbafQS59AP4CxzvJ3KKhez/tmf0gBSNYgMJ1RDF0bozhWGrM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619537268070917.6956770937272;
 Tue, 27 Apr 2021 08:27:48 -0700 (PDT)
In-Reply-To: <20210427150824.638359-1-kraxel@redhat.com>
Subject: Re: [PATCH v2 0/8] edid: windows fixes
Message-ID: <161953726707.28712.10691022702932706790@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Tue, 27 Apr 2021 08:27:48 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyNzE1MDgyNC42Mzgz
NTktMS1rcmF4ZWxAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNDI3MTUwODI0LjYzODM1
OS0xLWtyYXhlbEByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCB2MiAwLzhdIGVkaWQ6IHdpbmRv
d3MgZml4ZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1w
YXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAz
YzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcv
MjAyMTA0MjcxNTA4MjQuNjM4MzU5LTEta3JheGVsQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIx
MDQyNzE1MDgyNC42MzgzNTktMS1rcmF4ZWxAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBi
cmFuY2ggJ3Rlc3QnCmIzMWExYjUgZWRpZDogYWRkIHN1cHBvcnQgZm9yIERpc3BsYXlJRCBleHRl
bnNpb24gKDVrIHJlc29sdXRpb24pCmUzOTk3NzkgZWRpZDogYWxsb3cgYXJiaXRyYXJ5LWxlbmd0
aCBjaGVja3N1bXMKOTQ5MWQzOSBlZGlkOiBtb3ZlIHRpbWluZyBnZW5lcmF0aW9uIGludG8gYSBz
ZXBhcmF0ZSBmdW5jdGlvbgphZTU4MGU5IGVkaWQ6IE1ha2UgcmVmcmVzaCByYXRlIGNvbmZpZ3Vy
YWJsZQoyNDFmNDFiIGVkaWQ6IHVzZSBkdGEgZXh0ZW5zaW9uIGJsb2NrIGRlc2NyaXB0b3JzCmJl
ZmU5NDQgZWRpZDogbW92ZSB4dHJhMyBkZXNjcmlwdG9yCmUwMzEyMjUgZWRpZDogZWRpZF9kZXNj
X25leHQKZmQxNDA0NiBxZW11LWVkaWQ6IHVzZSBxZW11X2VkaWRfc2l6ZSgpCgo9PT0gT1VUUFVU
IEJFR0lOID09PQoxLzggQ2hlY2tpbmcgY29tbWl0IGZkMTQwNDZjYTA3YiAocWVtdS1lZGlkOiB1
c2UgcWVtdV9lZGlkX3NpemUoKSkKMi84IENoZWNraW5nIGNvbW1pdCBlMDMxMjI1ZDU1OGYgKGVk
aWQ6IGVkaWRfZGVzY19uZXh0KQozLzggQ2hlY2tpbmcgY29tbWl0IGJlZmU5NDQ1MWQxMSAoZWRp
ZDogbW92ZSB4dHJhMyBkZXNjcmlwdG9yKQo0LzggQ2hlY2tpbmcgY29tbWl0IDI0MWY0MWJmZTc3
MiAoZWRpZDogdXNlIGR0YSBleHRlbnNpb24gYmxvY2sgZGVzY3JpcHRvcnMpCjUvOCBDaGVja2lu
ZyBjb21taXQgYWU1ODBlOWIyZDMzIChlZGlkOiBNYWtlIHJlZnJlc2ggcmF0ZSBjb25maWd1cmFi
bGUpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzMzogRklMRTogaHcvZGlzcGxh
eS9lZGlkLWdlbmVyYXRlLmM6MjM5OgorICAgIHVpbnQ2NF90IGNsb2NrICA9ICh1aW50NjRfdCly
ZWZyZXNoX3JhdGUgKiAoeHJlcyArIHhibGFuaykgKiAoeXJlcyArIHlibGFuayk7CgpFUlJPUjog
TWFjcm9zIHdpdGggY29tcGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2VkIGluIHBhcmVudGhl
c2lzCiM3ODogRklMRTogaW5jbHVkZS9ody9kaXNwbGF5L2VkaWQuaDoyNToKKyNkZWZpbmUgREVG
SU5FX0VESURfUFJPUEVSVElFUyhfc3RhdGUsIF9lZGlkX2luZm8pICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInhyZXMiLCBfc3RhdGUsIF9lZGlkX2lu
Zm8ucHJlZngsIDApLCAgICAgICAgICAgICAgIFwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInly
ZXMiLCBfc3RhdGUsIF9lZGlkX2luZm8ucHJlZnksIDApLCAgICAgICAgICAgICAgIFwKKyAgICBE
RUZJTkVfUFJPUF9VSU5UMzIoInhtYXgiLCBfc3RhdGUsIF9lZGlkX2luZm8ubWF4eCwgMCksICAg
ICAgICAgICAgICAgIFwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInltYXgiLCBfc3RhdGUsIF9l
ZGlkX2luZm8ubWF4eSwgMCksICAgICAgICAgICAgICAgIFwKKyAgICBERUZJTkVfUFJPUF9VSU5U
MzIoInJlZnJlc2hfcmF0ZSIsIF9zdGF0ZSwgX2VkaWRfaW5mby5yZWZyZXNoX3JhdGUsIDApCgp0
b3RhbDogMSBlcnJvcnMsIDEgd2FybmluZ3MsIDU3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDUvOCBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKNi84IENoZWNraW5nIGNvbW1pdCA5NDkxZDM5NDRi
OTggKGVkaWQ6IG1vdmUgdGltaW5nIGdlbmVyYXRpb24gaW50byBhIHNlcGFyYXRlIGZ1bmN0aW9u
KQo3LzggQ2hlY2tpbmcgY29tbWl0IGUzOTk3NzkxNWZiYiAoZWRpZDogYWxsb3cgYXJiaXRyYXJ5
LWxlbmd0aCBjaGVja3N1bXMpCjgvOCBDaGVja2luZyBjb21taXQgYjMxYTFiNTYxOGFkIChlZGlk
OiBhZGQgc3VwcG9ydCBmb3IgRGlzcGxheUlEIGV4dGVuc2lvbiAoNWsgcmVzb2x1dGlvbikpCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNDI3
MTUwODI0LjYzODM1OS0xLWtyYXhlbEByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==

