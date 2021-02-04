Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932EE30F843
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:43:32 +0100 (CET)
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hj9-0003jL-Cr
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7hId-0007fn-Rc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:16:09 -0500
Resent-Date: Thu, 04 Feb 2021 11:16:07 -0500
Resent-Message-Id: <E1l7hId-0007fn-Rc@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7hIZ-0001sJ-41
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:16:07 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612455348; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BxCcvdrJpQq5P/G/L1Fjvqs9BxD8mHqGsfosTfIqfretW8b5HWebYGrRcN3WGjZWKA6ECiO7rjLw17Dt3uh38e7HMz0ZJxNqfHNMASr1s+4bopVWl3rCG/xwLyKnE8N+G46HDEHjyoj63hJgefVym4yIickTeMsM+Tlmpk1Ui0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612455348;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=znOADW66RBwV2wFVq4tt8zTbMmcvE1lJ6I7DPqkasGY=; 
 b=VtdOipnD28BieBfu68LnfeN1ycEjnttOBfYCk9jaQuhOYgao/sHUClrATZbHEK+e1tQnWgBBQTGIy6sXECFJgS4hkQrjC+XgExxn1cSf18RI/X81hs7rj7kJ0PQ2hwfxFJZC0nn8aeD25pGFvXrbjZdkIy5hH3qhC0Z8D5r1MW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612455345754679.938990592573;
 Thu, 4 Feb 2021 08:15:45 -0800 (PST)
In-Reply-To: <20210204150208.367837-1-stefanha@redhat.com>
Subject: Re: [PATCH v5 0/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <161245534386.30579.2853899336444305293@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: stefanha@redhat.com
Date: Thu, 4 Feb 2021 08:15:45 -0800 (PST)
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
Cc: mszeredi@redhat.com, berrange@redhat.com, slp@redhat.com,
 qemu-devel@nongnu.org, ppandit@redhat.com, virtio-fs@redhat.com,
 groug@kaod.org, alex@alxu.ca, dgilbert@redhat.com, stefanha@redhat.com,
 lersek@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwNDE1MDIwOC4zNjc4
MzctMS1zdGVmYW5oYUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMDQxNTAyMDguMzY3
ODM3LTEtc3RlZmFuaGFAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjUgMC8zXSB2aXJ0aW9m
c2Q6IHByZXZlbnQgb3BlbmluZyBvZiBzcGVjaWFsIGZpbGVzIChDVkUtMjAyMC0zNTUxNykKCj09
PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4g
L2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJh
Y2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZm
ODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNo
ZXctcHJvamVjdC9xZW11CiAgIGRiNzU0ZjguLjFiYTA4OWYgIG1hc3RlciAgICAgLT4gbWFzdGVy
CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAyMDQwMTQ1MDkuODgyODIxLTEtcmlj
aGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwMjA0MDE0NTA5Ljg4Mjgy
MS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0
Y2hldy8yMDIxMDIwNDEyNDgzNC43NzQ0MDEtMS1iZXJyYW5nZUByZWRoYXQuY29tIC0+IHBhdGNo
ZXcvMjAyMTAyMDQxMjQ4MzQuNzc0NDAxLTEtYmVycmFuZ2VAcmVkaGF0LmNvbQogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjEwMjA0MTUwMjA4LjM2NzgzNy0xLXN0ZWZhbmhhQHJlZGhh
dC5jb20gLT4gcGF0Y2hldy8yMDIxMDIwNDE1MDIwOC4zNjc4MzctMS1zdGVmYW5oYUByZWRoYXQu
Y29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAyMDQxNTM5MjUuMjAzMDYwNi0x
LUphc29uQHp4MmM0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMjA0MTUzOTI1LjIwMzA2MDYtMS1KYXNv
bkB6eDJjNC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpiNWJiODAzIHZpcnRp
b2ZzZDogcHJldmVudCBvcGVuaW5nIG9mIHNwZWNpYWwgZmlsZXMgKENWRS0yMDIwLTM1NTE3KQow
ZDg4YTc5IHZpcnRpb2ZzZDogb3B0aW9uYWxseSByZXR1cm4gaW5vZGUgcG9pbnRlciBmcm9tIGxv
X2RvX2xvb2t1cCgpCmJlNmFhMjMgdmlydGlvZnNkOiBleHRyYWN0IGxvX2RvX29wZW4oKSBmcm9t
IGxvX29wZW4oKQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8zIENoZWNraW5nIGNvbW1pdCBiZTZh
YTIzMTk4NzUgKHZpcnRpb2ZzZDogZXh0cmFjdCBsb19kb19vcGVuKCkgZnJvbSBsb19vcGVuKCkp
CkVSUk9SOiByZXR1cm4gb2YgYW4gZXJybm8gc2hvdWxkIHR5cGljYWxseSBiZSAtdmUgKHJldHVy
biAtRU5PTUVNKQojNzA6IEZJTEU6IHRvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jOjE2
NzQ6CisgICAgICAgIHJldHVybiBFTk9NRU07Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3Ms
IDExNCBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
CjIvMyBDaGVja2luZyBjb21taXQgMGQ4OGE3OTI1YTgzICh2aXJ0aW9mc2Q6IG9wdGlvbmFsbHkg
cmV0dXJuIGlub2RlIHBvaW50ZXIgZnJvbSBsb19kb19sb29rdXAoKSkKMy8zIENoZWNraW5nIGNv
bW1pdCBiNWJiODAzOWViM2MgKHZpcnRpb2ZzZDogcHJldmVudCBvcGVuaW5nIG9mIHNwZWNpYWwg
ZmlsZXMgKENWRS0yMDIwLTM1NTE3KSkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQg
ZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDov
L3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAyMDQxNTAyMDguMzY3ODM3LTEtc3RlZmFuaGFAcmVkaGF0
LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

