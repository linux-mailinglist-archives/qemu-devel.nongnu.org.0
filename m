Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581D3AE024
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 22:05:06 +0200 (CEST)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv3gm-0004TH-Uo
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 16:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lv3fk-0003W8-7O; Sun, 20 Jun 2021 16:04:00 -0400
Resent-Date: Sun, 20 Jun 2021 16:04:00 -0400
Resent-Message-Id: <E1lv3fk-0003W8-7O@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lv3fe-0001RW-Rt; Sun, 20 Jun 2021 16:03:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624219427; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XaikGgG0zh3Xxji/L1/APAR7HX4LspxDnaEzm9T+Sli18E+XbXaHjtu23G1gkabXo/x6otZ9SJK3JSJ8TN80kHHMiVBZLb/8ohaMuhBO0Ke5DF7Q39G4pmMg0xpxyqoRUYYM3UTdxRhRdPlbLeh7VFzduFZGw6MmtvPMNXAbYPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624219427;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=8rHa/e5avVPUUTTPF3kpkeW69LKSMGHpkErhU/4yMjU=; 
 b=Z+QYr6VHu5tPtxRjqfF43EOScBlSJxFctY80LBAHp+iAVSHNjVN/41CIyUtwYMiaoPL1gqFyrWV84MMnJc9GLPHEBBp6hfZFClsXCrsIW+IGupAekhFKvXGptq1xjVo13IA0akmAGE0uNPZxnahrkoozO5FDm1b6RRkH/9bYjFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624219426506651.7536930444809;
 Sun, 20 Jun 2021 13:03:46 -0700 (PDT)
In-Reply-To: <20210620180410.10837-1-email@aabouzied.com>
Subject: Re: [PATCH] ppc: Replace TAB indentations with spaces
Message-ID: <162421942562.25106.4824053144639680588@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: email@aabouzied.com
Date: Sun, 20 Jun 2021 13:03:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, email@aabouzied.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMDE4MDQxMC4xMDgz
Ny0xLWVtYWlsQGFhYm91emllZC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYyMDE4MDQxMC4xMDgz
Ny0xLWVtYWlsQGFhYm91emllZC5jb20KU3ViamVjdDogW1BBVENIXSBwcGM6IFJlcGxhY2UgVEFC
IGluZGVudGF0aW9ucyB3aXRoIHNwYWNlcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVu
YW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVO
RCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQK
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWdd
ICAgICAgICAgcGF0Y2hldy8yMDIxMDYyMDE4MDQxMC4xMDgzNy0xLWVtYWlsQGFhYm91emllZC5j
b20gLT4gcGF0Y2hldy8yMDIxMDYyMDE4MDQxMC4xMDgzNy0xLWVtYWlsQGFhYm91emllZC5jb20K
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozMDQ0NzEwIHBwYzogUmVwbGFjZSBUQUIg
aW5kZW50YXRpb25zIHdpdGggc3BhY2VzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogc3Bh
Y2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICcqJyAoY3R4OlZ4VikKIzI3OTogRklMRTogaHcvcHBj
L3NwYXByLmM6OTI0OgorICAgICAgICAgICAgICBtcy0+c21wLm1heF9jcHVzICogc2l6ZW9mKHVp
bnQ2NF90KSoyICsgc2l6ZW9mKHVpbnQ2NF90KSkpOwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywg
Mjg3IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCAzMDQ0NzEwMmM1NjYgKHBwYzogUmVwbGFjZSBUQUIg
aW5kZW50YXRpb25zIHdpdGggc3BhY2VzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0g
T1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1
bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDYyMDE4
MDQxMC4xMDgzNy0xLWVtYWlsQGFhYm91emllZC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t

