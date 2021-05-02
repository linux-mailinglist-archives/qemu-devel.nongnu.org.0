Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99993370BDF
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:03:54 +0200 (CEST)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldChN-0007zx-OB
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ldCeh-0006jC-Pc; Sun, 02 May 2021 10:01:09 -0400
Resent-Date: Sun, 02 May 2021 10:01:07 -0400
Resent-Message-Id: <E1ldCeh-0006jC-Pc@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ldCeZ-0003ka-TS; Sun, 02 May 2021 10:01:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619964049; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dyjEew8P9hl1ZuHotNqeYzoAuR+ehD5gDCQN9G0eS9Jg0cnLla03nvqb7R4UL1syZHqREndPdOMrjVUw4CawSwxcijkbQbijLOjH74ut3IVfiQ/wA6akFAwU3XZeV4KHquWfKCtEHKS1WTb3+xQSH/s4AR5FTBDu+YTqJ24BGQk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619964049;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=GHAw8u9IlZk+zymeY2VVBmRTRdhAObuChBHXP+0ejxQ=; 
 b=lD0OhxHcWQDa0DSiER13zoAI57yfjOt4TQEIvivfmkCv+Bd54WXo8A+YM5yYlLqk8EMrx7g+VJ2Kaa3OFHadBpBo4dPPrqzIJ88bMmXJFg5OwGWWSgKuCWKiFfHcrpz35W6Tx/mTFRz+LQXYoqqc3HtJwgFTZR8i+kXNUZfjD7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619964047723835.0007704169178;
 Sun, 2 May 2021 07:00:47 -0700 (PDT)
In-Reply-To: <20210502073617.2978836-1-oro@il.ibm.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
Message-ID: <161996404633.653.12276678881299277830@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: oro@il.ibm.com
Date: Sun, 2 May 2021 07:00:47 -0700 (PDT)
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 to.my.trociny@gmail.com, oro@il.ibm.com, dannyh@il.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUwMjA3MzYxNy4yOTc4
ODM2LTEtb3JvQGlsLmlibS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDUwMjA3MzYxNy4yOTc4ODM2
LTEtb3JvQGlsLmlibS5jb20KU3ViamVjdDogW1BBVENIXSBibG9jay9yYmQ6IEFkZCBzdXBwb3J0
IGZvciByYmQgaW1hZ2UgZW5jcnlwdGlvbgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVu
YW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVO
RCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQK
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICAgOGY4NjBkMi4u
NTNjNTQzMyAgbWFzdGVyICAgICAtPiBtYXN0ZXIKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hl
dy8yMDIxMDUwMjA3MzYxNy4yOTc4ODM2LTEtb3JvQGlsLmlibS5jb20gLT4gcGF0Y2hldy8yMDIx
MDUwMjA3MzYxNy4yOTc4ODM2LTEtb3JvQGlsLmlibS5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwoxMWFmMWQ3IGJsb2NrL3JiZDogQWRkIHN1cHBvcnQgZm9yIHJiZCBpbWFnZSBl
bmNyeXB0aW9uCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogImZvbyoqIGJhciIgc2hvdWxk
IGJlICJmb28gKipiYXIiCiM1MTogRklMRTogYmxvY2svcmJkLmM6MzU1OgorICAgICAgICBjaGFy
KiogcGFzc3BocmFzZSwKCkVSUk9SOiAiZm9vKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiCiM5
NDogRklMRTogYmxvY2svcmJkLmM6Mzk4OgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFJiZEVuY3J5cHRpb25TcGVjKiBzcGVjLAoKdG90YWw6IDIgZXJyb3Jz
LCAwIHdhcm5pbmdzLCAzODUgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDExYWYxZDcwNGZiZSAoYmxv
Y2svcmJkOiBBZGQgc3VwcG9ydCBmb3IgcmJkIGltYWdlIGVuY3J5cHRpb24pIGhhcyBzdHlsZSBw
cm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNl
IHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0gg
aW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3
aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3
Lm9yZy9sb2dzLzIwMjEwNTAyMDczNjE3LjI5Nzg4MzYtMS1vcm9AaWwuaWJtLmNvbS90ZXN0aW5n
LmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNh
bGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBm
ZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

