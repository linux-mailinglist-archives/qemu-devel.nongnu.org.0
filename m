Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577533A71D9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:20:49 +0200 (CEST)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsuwq-0003M9-4m
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuvN-0002U9-1G
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:19:17 -0400
Resent-Date: Mon, 14 Jun 2021 18:19:17 -0400
Resent-Message-Id: <E1lsuvN-0002U9-1G@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuvK-0001l9-Rd
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:19:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623709148; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FYB8gUW4kYpBH/StOWkdJMOiuH+RH6FbTkv5FAKsPNC+mSu6VOgB8JXL/wIDySvNSuvETQfgCgINz7abhEKGa6NiI+1lW4MfWNHPGs1rdmXxg96ET6Z6S+iy4kFwzWHSMtUSrZfAB51m2fkfkk5OHtmiAO/K9DsgYUZ3qNa0MtM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623709148;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=sft/g2XxQLYMziMgfJjPpVUGEpbObjaHM/KHN9aMp1A=; 
 b=S8Z1HT7a9qoXUJ9wbPn0mShVdcE1j2eAsjSaNlL+iV/RngHsBJGGsVpvkzcom0xTms1qjNC9PH9hz/rXFh0f/FOc/b51R2d1wNuVkcqs8R+WkfK2rdfzCHSuck8iS7FBVbEGq7z2lzjaJ+G9i8awEVYTIcq6T1wZhX5Jzqb5UQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623709146236199.17302183333288;
 Mon, 14 Jun 2021 15:19:06 -0700 (PDT)
In-Reply-To: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
Subject: Re: tb_flush() calls causing long Windows XP boot times
Message-ID: <162370914525.2358.9012013646396658700@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: programmingkidx@gmail.com
Date: Mon, 14 Jun 2021 15:19:06 -0700 (PDT)
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9CQ0I4NzczQi1GQzU0LTRDMjUt
OUI2MC05MkMyNjMxNjVEMzhAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogQkNCODc3M0ItRkM1NC00
QzI1LTlCNjAtOTJDMjYzMTY1RDM4QGdtYWlsLmNvbQpTdWJqZWN0OiB0Yl9mbHVzaCgpIGNhbGxz
IGNhdXNpbmcgbG9uZyBXaW5kb3dzIFhQIGJvb3QgdGltZXMKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA2MTAyMTM5MDYuMTMxMzQ0MC0xLWVibGFr
ZUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA2MTAyMTM5MDYuMTMxMzQ0MC0xLWVibGFrZUBy
ZWRoYXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA2MTQwODM4MDAuMTE2
NjE2Ni0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDYxNDA4
MzgwMC4xMTY2MTY2LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTd2l0Y2hlZCB0byBh
IG5ldyBicmFuY2ggJ3Rlc3QnCjBjNDg3ODQgdGJfZmx1c2goKSBjYWxscyBjYXVzaW5nIGxvbmcg
V2luZG93cyBYUCBib290IHRpbWVzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogTWlzc2lu
ZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDgg
bGluZXMgY2hlY2tlZAoKQ29tbWl0IDBjNDg3ODRkZjdjNCAodGJfZmx1c2goKSBjYWxscyBjYXVz
aW5nIGxvbmcgV2luZG93cyBYUCBib290IHRpbWVzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFz
ZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVw
b3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJT
Lgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy9CQ0I4
NzczQi1GQzU0LTRDMjUtOUI2MC05MkMyNjMxNjVEMzhAZ21haWwuY29tL3Rlc3RpbmcuY2hlY2tw
YXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

