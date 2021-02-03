Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6730D924
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:48:24 +0100 (CET)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Gdz-0000dJ-Do
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7Gca-0000At-Vn
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:46:58 -0500
Resent-Date: Wed, 03 Feb 2021 06:46:56 -0500
Resent-Message-Id: <E1l7Gca-0000At-Vn@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7GcN-0002x7-D0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:46:50 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612352784; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SDiQKkY6ISM4MGIs4Lb9vS76MVsW9+cK3TOMu38HFtpdLqmzG9mc7Zl2TzTCHicAJM1e3Kxsj5dyrlAVGYET/Wnn4uBDaVqZKVvpLzKMkTnohsZTyTLTkYYkQoExKfNdlCX6BODSMB1NyAsOsPluRRx2b9SdcetEUT3LKVfcv+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612352784;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=a483EG+xoHr+ZjtzEnADtpfxIq/a9Rgikq5GLffrbYc=; 
 b=h6PZQcxsXVKAVpUaZUD5gICPYil2sMZBsK+pOJgpXMxRF6uK4VFgeZMBEJbLVe0xj4ZjoejfyhMcA0ZMkyRuotuwHH8G/NNXGD6ut262sZ0fPwGqUNOSdTZHkNLG6SJkiXN9tIDPeSaHoFlu3j0YhTUObaEfsb1HaSPuBUstASI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612352781644299.0461666378874;
 Wed, 3 Feb 2021 03:46:21 -0800 (PST)
In-Reply-To: <20210203113719.83633-1-stefanha@redhat.com>
Subject: Re: [PATCH v4 0/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <161235277962.8956.11104117114280995469@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: stefanha@redhat.com
Date: Wed, 3 Feb 2021 03:46:21 -0800 (PST)
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
Cc: mszeredi@redhat.com, berrange@redhat.com, slp@redhat.com, groug@kaod.org,
 qemu-devel@nongnu.org, virtio-fs@redhat.com, alex@alxu.ca, vgoyal@redhat.com,
 stefanha@redhat.com, ppandit@redhat.com, lersek@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwMzExMzcxOS44MzYz
My0xLXN0ZWZhbmhhQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIwMzExMzcxOS44MzYz
My0xLXN0ZWZhbmhhQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIHY0IDAvM10gdmlydGlvZnNk
OiBwcmV2ZW50IG9wZW5pbmcgb2Ygc3BlY2lhbCBmaWxlcyAoQ1ZFLTIwMjAtMzU1MTcpCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3Qn
CjllNDRmMGUgdmlydGlvZnNkOiBwcmV2ZW50IG9wZW5pbmcgb2Ygc3BlY2lhbCBmaWxlcyAoQ1ZF
LTIwMjAtMzU1MTcpCmUzZGRmYWUgdmlydGlvZnNkOiBvcHRpb25hbGx5IHJldHVybiBpbm9kZSBw
b2ludGVyIGZyb20gbG9fZG9fbG9va3VwKCkKYTZjNzNmZCB2aXJ0aW9mc2Q6IGV4dHJhY3QgbG9f
ZG9fb3BlbigpIGZyb20gbG9fb3BlbigpCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzMgQ2hlY2tp
bmcgY29tbWl0IGE2YzczZmQwYTYzMCAodmlydGlvZnNkOiBleHRyYWN0IGxvX2RvX29wZW4oKSBm
cm9tIGxvX29wZW4oKSkKRVJST1I6IHJldHVybiBvZiBhbiBlcnJubyBzaG91bGQgdHlwaWNhbGx5
IGJlIC12ZSAocmV0dXJuIC1FTk9NRU0pCiM3MDogRklMRTogdG9vbHMvdmlydGlvZnNkL3Bhc3N0
aHJvdWdoX2xsLmM6MTY3NDoKKyAgICAgICAgcmV0dXJuIEVOT01FTTsKCnRvdGFsOiAxIGVycm9y
cywgMCB3YXJuaW5ncywgMTE0IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMyBoYXMgc3R5bGUgcHJv
YmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBw
b3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGlu
IE1BSU5UQUlORVJTLgoKMi8zIENoZWNraW5nIGNvbW1pdCBlM2RkZmFlYmI5MGEgKHZpcnRpb2Zz
ZDogb3B0aW9uYWxseSByZXR1cm4gaW5vZGUgcG9pbnRlciBmcm9tIGxvX2RvX2xvb2t1cCgpKQoz
LzMgQ2hlY2tpbmcgY29tbWl0IDllNDRmMGUwYmUzYSAodmlydGlvZnNkOiBwcmV2ZW50IG9wZW5p
bmcgb2Ygc3BlY2lhbCBmaWxlcyAoQ1ZFLTIwMjAtMzU1MTcpKQo9PT0gT1VUUFVUIEVORCA9PT0K
ClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWls
YWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIwMzExMzcxOS44MzYzMy0xLXN0
ZWZhbmhhQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

