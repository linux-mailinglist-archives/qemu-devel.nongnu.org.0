Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9F3609D6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:53:49 +0200 (CEST)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1VE-0000AL-EI
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lX1Tb-0007Ik-KO; Thu, 15 Apr 2021 08:52:07 -0400
Resent-Date: Thu, 15 Apr 2021 08:52:07 -0400
Resent-Message-Id: <E1lX1Tb-0007Ik-KO@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lX1TY-0002x1-Uo; Thu, 15 Apr 2021 08:52:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618491108; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=E2tveTTdjXUqSpyUc5eQVZFeo1GhSK0sLMioIHRv0f9axMyfgVPw95diQs94YFnhlx6OntrJWW4i6GONIqo682ldbdr6RZGa4VmhapfI00uGVU5Kdtv0TCKAt5o29ka1Nxyy1lB0/o+SNYmo31KoksgwiQm4LMojW65HxZo3D8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618491108;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=G3evihUPngUNM8pRHuMasiaSps84GbF4HfOmgWHVQ5U=; 
 b=dVrpFXIK5OZqBYwDNynIaQsrLAqlu/JNDRL27Sqb3nbOMC5J8Ludm8Bk/WM8qOFdNzdT362kolDHnlT/lL4Y6UZa6fh0xxUGY51g/2PLt+b/lauLzjmJuss8wL+CngnvVQDBzkrzaR1aaIsLdyEH6zapvfUIefi2JDRP+U1aZYU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618491105581120.3290389281891;
 Thu, 15 Apr 2021 05:51:45 -0700 (PDT)
In-Reply-To: <20210415124307.428203-1-pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] file-posix: fix refresh_limits for SCSI devices
Message-ID: <161849110447.10689.413393062428361511@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Thu, 15 Apr 2021 05:51:45 -0700 (PDT)
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
Cc: fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxNTEyNDMwNy40Mjgy
MDMtMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MTUxMjQzMDcuNDI4
MjAzLTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC8zXSBmaWxlLXBvc2l4
OiBmaXggcmVmcmVzaF9saW1pdHMgZm9yIFNDU0kgZGV2aWNlcwoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDQxNTEyNDMwNy40MjgyMDMtMS1wYm9u
emluaUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA0MTUxMjQzMDcuNDI4MjAzLTEtcGJvbnpp
bmlAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjM3ZmViMjUgZmls
ZS1wb3NpeDogZml4IG1heF9pb3YgZm9yIC9kZXYvc2cgZGV2aWNlcwplZWMwNTIxIGZpbGUtcG9z
aXg6IHRyeSBCTEtTRUNUR0VUIG9uIGJsb2NrIGRldmljZXMgdG9vLCBkbyBub3Qgcm91bmQgdG8g
cG93ZXIgb2YgMgpjNDRiYzM4IHNjc2ktZ2VuZXJpYzogcGFzcyBtYXhfc2VnbWVudHMgdmlhIG1h
eF9pb3YgZmllbGQgaW4gQmxvY2tMaW1pdHMKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMyBDaGVj
a2luZyBjb21taXQgYzQ0YmMzODZiYTIwIChzY3NpLWdlbmVyaWM6IHBhc3MgbWF4X3NlZ21lbnRz
IHZpYSBtYXhfaW92IGZpZWxkIGluIEJsb2NrTGltaXRzKQpXQVJOSU5HOiBsaW5lIG92ZXIgODAg
Y2hhcmFjdGVycwojNTE6IEZJTEU6IGh3L3Njc2kvc2NzaS1nZW5lcmljLmM6MTg2OgorICAgICAg
ICAgICAgbWF4X3RyYW5zZmVyID0gTUlOX05PTl9aRVJPKG1heF90cmFuc2ZlciwgbWF4X2lvdiAq
IHFlbXVfcmVhbF9ob3N0X3BhZ2Vfc2l6ZSkKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywg
MjMgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS8zIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCjIv
MyBDaGVja2luZyBjb21taXQgZWVjMDUyMTQyMTU0IChmaWxlLXBvc2l4OiB0cnkgQkxLU0VDVEdF
VCBvbiBibG9jayBkZXZpY2VzIHRvbywgZG8gbm90IHJvdW5kIHRvIHBvd2VyIG9mIDIpCjMvMyBD
aGVja2luZyBjb21taXQgMzdmZWIyNTliYmM0IChmaWxlLXBvc2l4OiBmaXggbWF4X2lvdiBmb3Ig
L2Rldi9zZyBkZXZpY2VzKQpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0
b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDE3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvMyBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1h
bmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA0MTUxMjQzMDcuNDI4MjAzLTEtcGJvbnppbmlAcmVk
aGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVy
YXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxl
YXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

