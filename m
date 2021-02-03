Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8061930E530
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:54:02 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Q65-0006Cg-0l
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7PyR-00029b-Bz
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:46:07 -0500
Resent-Date: Wed, 03 Feb 2021 16:46:07 -0500
Resent-Message-Id: <E1l7PyR-00029b-Bz@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7PyJ-0003My-3r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:46:06 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612388747; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=O2PBl3fiVG1hsAUUm19p6oQDLaXVwUT3F+9vv8mkvwrBt81iSN+VQikOT4qo/x0ACsUxBcc6JQz6jqALJCht8rfykXKFxZAjrd5brij1YpCaVMv4Yj3AnYRE0WQSYvizryEUBhonlXz/BALS0UZguTRXpXJSp9zjkwNQ5AUTKbg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612388747;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=dDmIEZ8YcDn9g8jHBQLFKfVdL4BRdhbR4tH0qYAFWg8=; 
 b=lVoJn8ycbk1ICHyIhOmQPRvPuUw03glpUUYMv8XxoI0MABEfEEnZbITr2QPLDjfGF6X8eR453FjJeAc7khhwgUpTXawbQPO2/2RZhAPNvqhh5Nthbj+N+rTB4wKQ8EYiekUNo6TwMfPTrs1Fy+4SyS6sK5IHNqijU5Z5oXm3efc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612388745308714.0036033988347;
 Wed, 3 Feb 2021 13:45:45 -0800 (PST)
In-Reply-To: <20210203213729.1940893-1-dje@google.com>
Subject: Re: [PATCH v2 0/2] Add support for ipv6 host forwarding
Message-ID: <161238874416.9611.14306635661237033343@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Wed, 3 Feb 2021 13:45:45 -0800 (PST)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwMzIxMzcyOS4xOTQw
ODkzLTEtZGplQGdvb2dsZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIwMzIxMzcyOS4xOTQwODkz
LTEtZGplQGdvb2dsZS5jb20KU3ViamVjdDogW1BBVENIIHYyIDAvMl0gQWRkIHN1cHBvcnQgZm9y
IGlwdjYgaG9zdCBmb3J3YXJkaW5nCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAg
ICAgICBwYXRjaGV3LzIwMjEwMjAzMjEzNzI5LjE5NDA4OTMtMS1kamVAZ29vZ2xlLmNvbSAtPiBw
YXRjaGV3LzIwMjEwMjAzMjEzNzI5LjE5NDA4OTMtMS1kamVAZ29vZ2xlLmNvbQpTd2l0Y2hlZCB0
byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjc5Y2QzYjEgbmV0OiBBZGQgLWlwdjYtaG9zdGZ3ZCBvcHRp
b24sIGlwdjZfaG9zdGZ3ZF9hZGQvcmVtb3ZlIGNvbW1hbmRzCjc1MGMwZGYgbmV0L3NsaXJwLmM6
IFJlZmFjdG9yIGFkZHJlc3MgcGFyc2luZwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8yIENoZWNr
aW5nIGNvbW1pdCA3NTBjMGRmZDVlNzggKG5ldC9zbGlycC5jOiBSZWZhY3RvciBhZGRyZXNzIHBh
cnNpbmcpCkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRvdGFsOiAxIGVy
cm9ycywgMCB3YXJuaW5ncywgMjY2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMiBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgoKMi8yIENoZWNraW5nIGNvbW1pdCA3OWNkM2IxMDljMjUgKG5ldDog
QWRkIC1pcHY2LWhvc3Rmd2Qgb3B0aW9uLCBpcHY2X2hvc3Rmd2RfYWRkL3JlbW92ZSBjb21tYW5k
cykKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MTAyMDMyMTM3MjkuMTk0MDg5My0xLWRqZUBnb29nbGUuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

