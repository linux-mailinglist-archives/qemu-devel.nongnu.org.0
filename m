Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F231EDD5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:02:17 +0100 (CET)
Received: from localhost ([::1]:59210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnd2-0003Jf-4h
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCnYw-0008R4-6J
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:58:02 -0500
Resent-Date: Thu, 18 Feb 2021 12:58:02 -0500
Resent-Message-Id: <E1lCnYw-0008R4-6J@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCnYr-0005fl-F7
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:58:01 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613671071; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EbqwtgPb1JtBC2XFpWQ4zHR9W7Z/fMl7hBCo5Mg/2o5sQ0uPq2SqdtCSB4EhHfHTxBR2bZ/U+9Q5IkvP381/98NATkaplQ6nMkPbIyncb8jcPKM9JW8ja7SbnbLx7ucG9KPS/AXXZyHXUzVtIgV0pVSEA2kmMCpLrCVarL6+nUc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613671071;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=0TEPv41CCtKfIO0MP+ZueU+HIQzyK4hmq9xvjZo4hJU=; 
 b=Z9zWUB6702njIfoZQqag9M/9kp8yvojlV8qCyf2sMkyeUC+8r4uWfUXShokUU+D7dLyo6fEmLPymvivusD+6rvn2deAGruE+8gAXdk67BsKAKRgEIr9opJ/fTweNNlV490MyYAqecYmhN74QfRli8yWRQP73IaTgRhi/+F353Ww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613671068446183.89064844296206;
 Thu, 18 Feb 2021 09:57:48 -0800 (PST)
In-Reply-To: <20210218172313.2217440-1-thuth@redhat.com>
Subject: Re: [PATCH] meson: Re-enable the possibility to run "make check
 SPEED=slow"
Message-ID: <161367106726.24083.4857123962751418652@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Date: Thu, 18 Feb 2021 09:57:48 -0800 (PST)
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
Cc: pbonzini@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxODE3MjMxMy4yMjE3
NDQwLTEtdGh1dGhAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMjE4MTcyMzEzLjIyMTc0
NDAtMS10aHV0aEByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSF0gbWVzb246IFJlLWVuYWJsZSB0
aGUgcG9zc2liaWxpdHkgdG8gcnVuICJtYWtlIGNoZWNrIFNQRUVEPXNsb3ciCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVs
bCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxn
b3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2Uu
Lgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRk
MWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2pl
Y3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMjE4MTcyMzEzLjIyMTc0
NDAtMS10aHV0aEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMTgxNzIzMTMuMjIxNzQ0MC0x
LXRodXRoQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphYTY2N2Zj
IG1lc29uOiBSZS1lbmFibGUgdGhlIHBvc3NpYmlsaXR5IHRvIHJ1biAibWFrZSBjaGVjayBTUEVF
RD1zbG93IgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0
ZXJzCiMyNzogRklMRTogc2NyaXB0cy9tdGVzdDJtYWtlLnB5OjI0OgorLnRlc3QtaHVtYW4tdGFw
ID0gJDEgJChpZiAkNCwoY2QgJDQgJiYgJDIpLCQyKSAtbSAkKFNQRUVEKSA8IC9kZXYvbnVsbCB8
IC4vc2NyaXB0cy90YXAtZHJpdmVyLnBsIC0tdGVzdC1uYW1lPSIkMyIgJChpZiAkKFYpLCwtLXNo
b3ctZmFpbHVyZXMtb25seSkKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgOCBsaW5lcyBj
aGVja2VkCgpDb21taXQgYWE2NjdmY2NiYTA5IChtZXNvbjogUmUtZW5hYmxlIHRoZSBwb3NzaWJp
bGl0eSB0byBydW4gIm1ha2UgY2hlY2sgU1BFRUQ9c2xvdyIpIGhhcyBzdHlsZSBwcm9ibGVtcywg
cGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZl
cyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRB
SU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6
IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMjEwMjE4MTcyMzEzLjIyMTc0NDAtMS10aHV0aEByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2tw
YXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

