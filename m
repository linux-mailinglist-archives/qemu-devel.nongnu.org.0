Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCECAEF8E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 18:29:43 +0200 (CEST)
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7j1S-0006Bv-Da
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 12:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1i7izC-0004kk-Si
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 12:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1i7izB-0003MM-6F
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 12:27:22 -0400
Resent-Date: Tue, 10 Sep 2019 12:27:22 -0400
Resent-Message-Id: <E1i7izB-0003MM-6F@eggs.gnu.org>
Received: from sender4-of-o58.zoho.com ([136.143.188.58]:21846)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1i7izA-0003Lh-V4
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 12:27:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568131907; cv=none; d=zoho.com; s=zohoarc; 
 b=WTeTUSNaauabvmDYo/tVpszVI5Jbov0nP7O5l9VCBSgBhK58AlSG0sDTZC7Ddvom33DXuxzoiQaVfyLVTnxkVDLE0GZpldgJ64ApnPuFggOdCFCRNl/Cz+RF/gtCix2dHeveekNDrz4WRiUyE5XuU+ELtRzMcKJKjXmWYoFyfbs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568131907;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=WqzfyOiOlvAR9D4g3msTB3uPeRQQI+KgjRUqIJyVf7I=; 
 b=kCJX6dwPpKa+ObAiPFURDmPDcwirAAzGnIA1ZLcWFyS032rThvi1u7ScOefMpkSk5r+Y7BLqzrTNETfq1EdHZ3Cipf26YtlRMRgPdn06FjwyrsCSExYWlIloXFSSCVK3y0/atpPpeOo1j8nbqC1UtryjbLZHfD4GlFyQy9L4NxY=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1568131899687832.9717186304171;
 Tue, 10 Sep 2019 09:11:39 -0700 (PDT)
In-Reply-To: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
Message-ID: <156813189852.15929.16513196627287571049@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: maozhongyi@cmss.chinamobile.com
Date: Tue, 10 Sep 2019 09:11:39 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.58
Subject: Re: [Qemu-devel] [PATCH 0/3] some fix in tests/migration
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
Cc: tony.nguyen@bt.com, laurent@vivier.eu, qemu-devel@nongnu.org,
 maozhongyi@cmss.chinamobile.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkxMDEyMDkyNy4xNjY5
MjgzLTEtbWFvemhvbmd5aUBjbXNzLmNoaW5hbW9iaWxlLmNvbS8KCgoKSGksCgpUaGlzIHNlcmll
cyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJl
bG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSCAw
LzNdIHNvbWUgZml4IGluIHRlc3RzL21pZ3JhdGlvbgpNZXNzYWdlLWlkOiAyMDE5MDkxMDEyMDky
Ny4xNjY5MjgzLTEtbWFvemhvbmd5aUBjbXNzLmNoaW5hbW9iaWxlLmNvbQpUeXBlOiBzZXJpZXMK
Cj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNl
ID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1p
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFp
bGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMy
MWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKZTRjNWRlMiB0ZXN0cy9taWdyYXRpb27vvJpmaXggdW5yZWFjaGFibGUgcGF0aCBpbiBz
dHJlc3MgdGVzdAo5YTNiNzdmIHRlc3RzL21pZ3JhdGlvbjogZml4IGEgdHlwbyBpbiBjb21tZW50
CmIyNzdkNTYgdGVzdHMvbWlncmF0aW9uOiBtZW0gbGVhayBmaXgKCj09PSBPVVRQVVQgQkVHSU4g
PT09CjEvMyBDaGVja2luZyBjb21taXQgYjI3N2Q1NjkyNmI2ICh0ZXN0cy9taWdyYXRpb246IG1l
bSBsZWFrIGZpeCkKRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBv
ZiB0aGlzIHN0YXRlbWVudAojMjI6IEZJTEU6IHRlc3RzL21pZ3JhdGlvbi9zdHJlc3MuYzoxODQ6
CisgICAgICAgIGlmIChkYXRhKQpbLi4uXQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA4
IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMi8z
IENoZWNraW5nIGNvbW1pdCA5YTNiNzdmMTAwMTUgKHRlc3RzL21pZ3JhdGlvbjogZml4IGEgdHlw
byBpbiBjb21tZW50KQozLzMgQ2hlY2tpbmcgY29tbWl0IGU0YzVkZTI3NTliOCAodGVzdHMvbWln
cmF0aW9u77yaZml4IHVucmVhY2hhYmxlIHBhdGggaW4gc3RyZXNzIHRlc3QpCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwOTEwMTIwOTI3LjE2
NjkyODMtMS1tYW96aG9uZ3lpQGNtc3MuY2hpbmFtb2JpbGUuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


