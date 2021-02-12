Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E031A3FD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:47:09 +0100 (CET)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcX5-0001yD-P3
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAcT9-00009I-90; Fri, 12 Feb 2021 12:43:03 -0500
Resent-Date: Fri, 12 Feb 2021 12:43:03 -0500
Resent-Message-Id: <E1lAcT9-00009I-90@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAcT5-0008CU-TT; Fri, 12 Feb 2021 12:43:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613151769; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IM4IOJ4RA2pLD8y4Cnqm8rCVAqtxWq2HX5R3LAsFCxVL0gz2O9GIYnbCs6qeQAyWPIueBkwqDFQ5o8f8hAWqZtIt7b0CXcl2MeGvbGeMxDEp7jQEEkYKkWfseoAN4ezoZMigr5cLy46TpzXYp6Bh3B/6Ifq1RA1HgsFNdEXZ9eE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613151769;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=MVO7hgqHrPivakSpGro1eiRA9lWVSM1k6G8Bh8mnMqk=; 
 b=BO5UMTs8svI4Bgt8q7Qh5Zpq1kMCZAwF3z6z8x49ZzJVcL0GcPLNGgnwxhGn2fnuaydjQOhbUwNy0j6e+YgcCIt7pg7ynj2Lgt1487hHReXjzF4F3jC2gvjpV7DstluGdKVY7EmWmd6ovlhIkqdPy//zYBizUIFKKw+CV8kfqVg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613151766538376.9245079599558;
 Fri, 12 Feb 2021 09:42:46 -0800 (PST)
In-Reply-To: <cover.1613150869.git.pkrempa@redhat.com>
Subject: Re: [PATCH v3 0/3] migration: dirty-bitmap: Allow control of bitmap
 persistence
Message-ID: <161315176482.22250.150275269113103610@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pkrempa@redhat.com
Date: Fri, 12 Feb 2021 09:42:46 -0800 (PST)
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjEzMTUwODY5Lmdp
dC5wa3JlbXBhQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiBjb3Zlci4xNjEzMTUwODY5LmdpdC5w
a3JlbXBhQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIHYzIDAvM10gbWlncmF0aW9uOiBkaXJ0
eS1iaXRtYXA6IEFsbG93IGNvbnRyb2wgb2YgYml0bWFwIHBlcnNpc3RlbmNlCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVs
bCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxn
b3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2Uu
Lgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRk
MWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2pl
Y3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMjA1MTYzNzIwLjg4NzE5
Ny0xLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbSAtPiBwYXRjaGV3LzIwMjEwMjA1MTYzNzIwLjg4
NzE5Ny0xLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRj
aGV3L2NvdmVyLjE2MTMxNTA4NjkuZ2l0LnBrcmVtcGFAcmVkaGF0LmNvbSAtPiBwYXRjaGV3L2Nv
dmVyLjE2MTMxNTA4NjkuZ2l0LnBrcmVtcGFAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBi
cmFuY2ggJ3Rlc3QnCjQ5N2NkYTcgcWVtdS1pb3Rlc3RzOiAzMDA6IEFkZCB0ZXN0IGNhc2UgZm9y
IG1vZGlmeWluZyBwZXJzaXN0ZW5jZSBvZiBiaXRtYXAKYTU3NWE2ZSBtaWdyYXRpb246IGRpcnR5
LWJpdG1hcDogQWxsb3cgY29udHJvbCBvZiBiaXRtYXAgcGVyc2lzdGVuY2UKNTExOTVmYSBtaWdy
YXRpb246IGRpcnR5LWJpdG1hcDogQ29udmVydCBhbGlhcyBtYXAgaW5uZXIgbWVtYmVycyB0byBC
aXRtYXBNaWdyYXRpb25CaXRtYXBBbGlhcwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8zIENoZWNr
aW5nIGNvbW1pdCA1MTE5NWZhYmE0NDUgKG1pZ3JhdGlvbjogZGlydHktYml0bWFwOiBDb252ZXJ0
IGFsaWFzIG1hcCBpbm5lciBtZW1iZXJzIHRvIEJpdG1hcE1pZ3JhdGlvbkJpdG1hcEFsaWFzKQpF
UlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzM4OiBGSUxFOiBtaWdyYXRpb24vYmxvY2st
ZGlydHktYml0bWFwLmM6MjY5OgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoR0Rlc3Ryb3lOb3RpZnkpIHFhcGlfZnJlZV9CaXRtYXBNaWdyYXRpb25CaXRtYXBB
bGlhcyk7Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDg1IGxpbmVzIGNoZWNrZWQKClBh
dGNoIDEvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMi8zIENoZWNraW5nIGNvbW1pdCBh
NTc1YTZlMTY4MTAgKG1pZ3JhdGlvbjogZGlydHktYml0bWFwOiBBbGxvdyBjb250cm9sIG9mIGJp
dG1hcCBwZXJzaXN0ZW5jZSkKMy8zIENoZWNraW5nIGNvbW1pdCA0OTdjZGE3MmI0NGMgKHFlbXUt
aW90ZXN0czogMzAwOiBBZGQgdGVzdCBjYXNlIGZvciBtb2RpZnlpbmcgcGVyc2lzdGVuY2Ugb2Yg
Yml0bWFwKQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2Rl
OiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9n
cy9jb3Zlci4xNjEzMTUwODY5LmdpdC5wa3JlbXBhQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3Bh
dGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQ
YXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sg
dG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

