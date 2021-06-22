Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E93B0EBB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:30:25 +0200 (CEST)
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvn2O-0005z8-Po
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvn0k-0003Yu-QN; Tue, 22 Jun 2021 16:28:42 -0400
Resent-Date: Tue, 22 Jun 2021 16:28:42 -0400
Resent-Message-Id: <E1lvn0k-0003Yu-QN@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvn0i-0000r6-1F; Tue, 22 Jun 2021 16:28:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624393707; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hvSs9pAAjimC0CM7Bsczxax2ZWRzSv7m0FI8kQKT3FUuG1/pXNAaB1nYFcf+sGXQt9wRr8rpDIQsJ5VkDAXT/CW2GtwZrryOqPB4xSsxzUN1MJqW8BQICO2xXcA7kRr6EN9vWD2O6ox6KwRCINuq2VBgghAjy3eddIBxfH6Rt08=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624393707;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=KoDek6s+sHJCa0GqZhPZfJz5BkjxCdrOFOplpTW9iNY=; 
 b=fWvpMugFAME7g1iwM+K4ZcxA3oqNOdus2Olt1MI1uvfaGs/Jfs1+cqpGF8ZiJY3EJyNjjthKSKEjS+5zPxas/dEVWX4L2UXFpMBokRJD6hSL0o9Mf2KxzH6S1ygEnq27P0i1OgIjeoBSiLXKzhkLsRF1yh2odeGo9si+kSohFbA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624393704581753.6799784345674;
 Tue, 22 Jun 2021 13:28:24 -0700 (PDT)
In-Reply-To: <20210622201923.150205-1-borntraeger@de.ibm.com>
Subject: Re: [PATCH 0/1] Add features and cpu models
Message-ID: <162439370387.23370.6126847328132726072@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: borntraeger@de.ibm.com
Date: Tue, 22 Jun 2021 13:28:24 -0700 (PDT)
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMjIwMTkyMy4xNTAy
MDUtMS1ib3JudHJhZWdlckBkZS5pYm0uY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MjIyMDE5MjMu
MTUwMjA1LTEtYm9ybnRyYWVnZXJAZGUuaWJtLmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC8xXSBBZGQg
ZmVhdHVyZXMgYW5kIGNwdSBtb2RlbHMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2Ny
aXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3
aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYjcxYjJjNSBzMzkweC9jcHVtb2RlbDogYWRk
IDM5MzEgYW5kIDM5MzIKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBsaW5lIG92ZXIgOTAg
Y2hhcmFjdGVycwojMzU6IEZJTEU6IHRhcmdldC9zMzkweC9jcHVfZmVhdHVyZXNfZGVmLmguaW5j
OjExMzoKK0RFRl9GRUFUKFZFQ1RPUl9QQUNLRURfREVDSU1BTF9FTkgyLCAidnhwZGVoMiIsIFNU
RkwsIDE5MiwgIlZlY3Rvci1QYWNrZWQtRGVjaW1hbC1FbmhhbmNlbWVudCBmYWNpbGl0eSAyIikK
CldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzODogRklMRTogdGFyZ2V0L3MzOTB4
L2NwdV9mZWF0dXJlc19kZWYuaC5pbmM6MTE2OgorREVGX0ZFQVQoQUNUSVZJVFksICJhY3Rpdml0
eSIsIFNURkwsIDE5NiwgIlByb2Nlc3Nvci1BY3Rpdml0eS1JbnN0cnVtZW50YXRpb24gZmFjaWxp
dHkiKQoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzU5OiBGSUxFOiB0YXJnZXQv
czM5MHgvY3B1X21vZGVscy5jOjgxNzoKKyAgICAgICAgeyBTMzkwX0ZFQVRfVkVDVE9SX1BBQ0tF
RF9ERUNJTUFMX0VOSCwgUzM5MF9GRUFUX1ZFQ1RPUl9QQUNLRURfREVDSU1BTCB9LAoKV0FSTklO
RzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzYwOiBGSUxFOiB0YXJnZXQvczM5MHgvY3B1X21v
ZGVscy5jOjgxODoKKyAgICAgICAgeyBTMzkwX0ZFQVRfVkVDVE9SX1BBQ0tFRF9ERUNJTUFMX0VO
SDIsIFMzOTBfRkVBVF9WRUNUT1JfUEFDS0VEX0RFQ0lNQUxfRU5IIH0sCgp0b3RhbDogMSBlcnJv
cnMsIDMgd2FybmluZ3MsIDczIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBiNzFiMmM1MDU2YjcgKHMz
OTB4L2NwdW1vZGVsOiBhZGQgMzkzMSBhbmQgMzkzMikgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MTA2MjIyMDE5MjMuMTUwMjA1LTEtYm9ybnRyYWVnZXJAZGUuaWJtLmNvbS90ZXN0aW5nLmNoZWNr
cGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5
IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFj
ayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

