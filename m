Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E283A7233
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:44:46 +0200 (CEST)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsvK1-0003la-Vx
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvJL-000369-4Y
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:44:03 -0400
Resent-Date: Mon, 14 Jun 2021 18:44:03 -0400
Resent-Message-Id: <E1lsvJL-000369-4Y@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvJJ-0001gu-C4
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:44:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623710633; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WhJbEgtZN0Qkzulq4w9zsJwhTB4+rE2HMj8DFVzY0NogYg+SjuRCP1BtXu6x0ZbASwwJWNrlAIB3Ki15mVBuJqXyjnSKj8CeMeUByjn9MqCcna6L+/xNol9oWrx2IYPTQpk3SjudiGT4e2DrHewWurkJ0KcsWYf9FDbm/rdxDG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623710633;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=SpJ/dKfhZilrrE9SPFr1PxcO4GyqLBkm+Ww/UfbdaEY=; 
 b=j7nn2hljEIMHyByFSFx7szkiLWDsK4u58ZmW3ZvDE6E4GTMOiaRjPflb8INsiqRNH9nApUImR6wrT9bKHruHF/SEtpguI5SwgiI2F0rzOr0/2fdr3Vzo4BQDGdJFcEwPARbgfbJeLdQYDEEmG13SiRqqAwm1fHHoujkaqmFVJ7M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623710632204923.4020670590286;
 Mon, 14 Jun 2021 15:43:52 -0700 (PDT)
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
Subject: Re: [PULL 00/12] Net patches
Message-ID: <162371063116.2358.734731166141666920@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jasowang@redhat.com
Date: Mon, 14 Jun 2021 15:43:52 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxMTA2MDAyNC40Njc2
My0xLWphc293YW5nQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYxMTA2MDAyNC40Njc2
My0xLWphc293YW5nQHJlZGhhdC5jb20KU3ViamVjdDogW1BVTEwgMDAvMTJdIE5ldCBwYXRjaGVz
Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFz
ZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGlt
aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1h
aWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTlj
MjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9w
YXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNjE0
MjAwOTQwLjIwNTY3NzAtMS1waGlsbWRAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNjE0MjAw
OTQwLjIwNTY3NzAtMS1waGlsbWRAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRj
aGV3LzIwMjEwNjE0MjAyODQyLjU4MTY0MC0xLW1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnIC0+
IHBhdGNoZXcvMjAyMTA2MTQyMDI4NDIuNTgxNjQwLTEtbWF0aGlldS5wb2lyaWVyQGxpbmFyby5v
cmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
Y2hlY2twYXRjaC5wbDogbm8gcmV2aXNpb25zIHJldHVybmVkIGZvciByZXZsaXN0ICdiYXNlLi4n
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDI1NQoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MTA2MTEwNjAwMjQuNDY3NjMtMS1qYXNvd2FuZ0ByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

