Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2057388FAA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:57:27 +0200 (CEST)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMhT-00018T-18
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljMXO-0000nU-MV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:47:03 -0400
Resent-Date: Wed, 19 May 2021 09:47:02 -0400
Resent-Message-Id: <E1ljMXO-0000nU-MV@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljMXK-0007Rg-OC
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:47:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621432015; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=A1R2WgM+9gBbEAXXs5DlqREWMW7Ign3z7+N9KpW46AJCxXjX5MjmasCQar8nqH1TBoJGbqLw2fufj9SqQcSeRVwoXrDt47IMYOjiEs4j5222r7NjxIoIHljk4K0JSAjquroFf4VsNt4m56HDta5Tm+5W4JogQhiT4d94nxXuf7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621432015;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=qcXAKtj5+3l0c47mi+Fb773NsVhZidkC5z07QnsGSX0=; 
 b=MvJ1ge459jkuBrx3VKqDUJTb0s2bf+Vdo6cLCZlOQtHHK6O8ntYRlo9AKB3jOK7H9Eg7iiF9mIoHzNySQun5nRPmgzhemS12VacLz90/tMCZ4CUuwUn4nO8kSuJiqpvTh1NCssOxJLOmRnnBHMbtYS7fKMo4yUEeqla7yv8zi2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621432010709249.35407230505416;
 Wed, 19 May 2021 06:46:50 -0700 (PDT)
In-Reply-To: <0799f0de89ad2482672b5d61d0de61e6eba782da.1621407918.git.alishir@routerhosting.com>
Subject: Re: [PATCH] doc: Add notes about -mon option mode=control argument.
Message-ID: <162143200981.17859.11883477836290083155@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org
Date: Wed, 19 May 2021 06:46:50 -0700 (PDT)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8wNzk5ZjBkZTg5YWQyNDgyNjcy
YjVkNjFkMGRlNjFlNmViYTc4MmRhLjE2MjE0MDc5MTguZ2l0LmFsaXNoaXJAcm91dGVyaG9zdGlu
Zy5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHls
ZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6
IHNlcmllcwpNZXNzYWdlLWlkOiAwNzk5ZjBkZTg5YWQyNDgyNjcyYjVkNjFkMGRlNjFlNmViYTc4
MmRhLjE2MjE0MDc5MTguZ2l0LmFsaXNoaXJAcm91dGVyaG9zdGluZy5jb20KU3ViamVjdDogW1BB
VENIXSBkb2M6IEFkZCBub3RlcyBhYm91dCAtbW9uIG9wdGlvbiBtb2RlPWNvbnRyb2wgYXJndW1l
bnQuCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2Ug
YmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1l
bGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAt
LW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1
YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5ldyBicmFu
Y2ggJ3Rlc3QnCjc3MzNlNDEgZG9jOiBBZGQgbm90ZXMgYWJvdXQgLW1vbiBvcHRpb24gbW9kZT1j
b250cm9sIGFyZ3VtZW50LgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IEF1dGhvciBlbWFp
bCBhZGRyZXNzIGlzIG1hbmdsZWQgYnkgdGhlIG1haWxpbmcgbGlzdAojMjogCkF1dGhvcjogQWxp
IFNoaXJ2YW5pIHZpYSA8cWVtdS1kZXZlbEBub25nbnUub3JnPgoKRVJST1I6IHRyYWlsaW5nIHdo
aXRlc3BhY2UKIzI1OiBGSUxFOiBxZW11LW9wdGlvbnMuaHg6Mzc5MDoKKyAgICBTZXR1cCBtb25p
dG9yIG9uIGNoYXJkZXYgbmFtZS4gYGBtb2RlPWNvbnRyb2xgYCBjb25maWd1cmVzICQKCkVSUk9S
OiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMyODogRklMRTogcWVtdS1vcHRpb25zLmh4OjM3OTM6Cisg
ICAgYGBwcmV0dHlgYCBpcyBvbmx5IHZhbGlkIHdoZW4gYGBtb2RlPWNvbnRyb2xgYCwgJAoKdG90
YWw6IDMgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMyBsaW5lcyBjaGVja2VkCgpDb21taXQgNzczM2U0
MTJhYjI4IChkb2M6IEFkZCBub3RlcyBhYm91dCAtbW9uIG9wdGlvbiBtb2RlPWNvbnRyb2wgYXJn
dW1lbnQuKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8wNzk5ZjBkZTg5YWQyNDgyNjcyYjVkNjFkMGRl
NjFlNmViYTc4MmRhLjE2MjE0MDc5MTguZ2l0LmFsaXNoaXJAcm91dGVyaG9zdGluZy5jb20vdGVz
dGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

