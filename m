Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61735DE0A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:50:02 +0200 (CEST)
Received: from localhost ([::1]:41492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHYP-0006Gs-Op
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWHXT-0005SS-Gx
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:49:03 -0400
Resent-Date: Tue, 13 Apr 2021 07:49:03 -0400
Resent-Message-Id: <E1lWHXT-0005SS-Gx@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWHXP-0002aB-5y
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:49:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618314528; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SCJuWTGeVg/tfFQgaqxNzHGzkigjTZ9/mS4VrDH6C2tJl6XsXnnYpPdIlEelL4u78LsrCDqg0d4Ffysn4W+MXxPtEwHJA6cubOCEa/sWqByS5z2aRAvo4RIQ9omRRZQqDAiO/EoMRmS7JJKFVrdHj/DARVmaBj2LX8sKd8+2DkI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618314528;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=BM7EQifwoRzIZWParKHMDMAmEYSYzRwmAbr0+dFLm7s=; 
 b=CW7/hrmW9Dg5QlcK8mCaZyDQVRGC8gjHfjvDZxG15lHOCBggYBdXRg5NExwfSBONEtRDP5ZlTtcQPvCgkf4lnmk27B1FlNUTylz5s2dpD2yHTZAHQjc6973zMEx4GKdwXVfvB+6PX/oKsu5XcJ6cYx9n4YMqJWb2LQbXlZvOFU4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618314525459258.4922201152983;
 Tue, 13 Apr 2021 04:48:45 -0700 (PDT)
In-Reply-To: <20210413113741.214867-1-pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] osdep: allow including qemu/osdep.h outside extern "C"
Message-ID: <161831452429.7886.443646829451800922@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Tue, 13 Apr 2021 04:48:45 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxMzExMzc0MS4yMTQ4
NjctMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MTMxMTM3NDEuMjE0
ODY3LTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC8yXSBvc2RlcDogYWxs
b3cgaW5jbHVkaW5nIHFlbXUvb3NkZXAuaCBvdXRzaWRlIGV4dGVybiAiQyIKCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxs
IHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MDgxOTU1MzQuNjQ3ODk1
LTEtYW50b25rdWNoaW5AeWFuZGV4LXRlYW0ucnUgLT4gcGF0Y2hldy8yMDIxMDQwODE5NTUzNC42
NDc4OTUtMS1hbnRvbmt1Y2hpbkB5YW5kZXgtdGVhbS5ydQogKiBbbmV3IHRhZ10gICAgICAgICBw
YXRjaGV3LzIwMjEwNDEzMTEzNzQxLjIxNDg2Ny0xLXBib256aW5pQHJlZGhhdC5jb20gLT4gcGF0
Y2hldy8yMDIxMDQxMzExMzc0MS4yMTQ4NjctMS1wYm9uemluaUByZWRoYXQuY29tClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKOTkyZmE1MiBvc2RlcDogcHJvdGVjdCBxZW11L29zZGVw
Lmggd2l0aCBleHRlcm4gIkMiCmJjMjMxMGYgb3NkZXA6IGluY2x1ZGUgZ2xpYi1jb21wYXQuaCBi
ZWZvcmUgb3RoZXIgUUVNVSBoZWFkZXJzCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzIgQ2hlY2tp
bmcgY29tbWl0IGJjMjMxMGY3MzFhNSAob3NkZXA6IGluY2x1ZGUgZ2xpYi1jb21wYXQuaCBiZWZv
cmUgb3RoZXIgUUVNVSBoZWFkZXJzKQoyLzIgQ2hlY2tpbmcgY29tbWl0IDk5MmZhNTJkYTQxMyAo
b3NkZXA6IHByb3RlY3QgcWVtdS9vc2RlcC5oIHdpdGggZXh0ZXJuICJDIikKV0FSTklORzogYXJj
aGl0ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2b2lkZWQKIzUxOiBGSUxFOiBp
bmNsdWRlL3FlbXUvY29tcGlsZXIuaDoxNDoKKyNpZmRlZiBfX2NwbHVzcGx1cwoKRVJST1I6IHN0
b3JhZ2UgY2xhc3Mgc2hvdWxkIGJlIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGRlY2xhcmF0aW9u
CiM1MjogRklMRTogaW5jbHVkZS9xZW11L2NvbXBpbGVyLmg6MTU6CisjZGVmaW5lIFFFTVVfRVhU
RVJOX0MgZXh0ZXJuICJDIgoKRVJST1I6IHN0b3JhZ2UgY2xhc3Mgc2hvdWxkIGJlIGF0IHRoZSBi
ZWdpbm5pbmcgb2YgdGhlIGRlY2xhcmF0aW9uCiM1NDogRklMRTogaW5jbHVkZS9xZW11L2NvbXBp
bGVyLmg6MTc6CisjZGVmaW5lIFFFTVVfRVhURVJOX0MgZXh0ZXJuCgpXQVJOSU5HOiBhcmNoaXRl
Y3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojNzc6IEZJTEU6IGluY2x1
ZGUvcWVtdS9vc2RlcC5oOjExNjoKKyNpZmRlZiBfX2NwbHVzcGx1cwoKV0FSTklORzogYXJjaGl0
ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2b2lkZWQKIzg4OiBGSUxFOiBpbmNs
dWRlL3FlbXUvb3NkZXAuaDo3MzA6CisjaWZkZWYgX19jcGx1c3BsdXMKCnRvdGFsOiAyIGVycm9y
cywgMyB3YXJuaW5ncywgNDcgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi8yIGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0
aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy8yMDIxMDQxMzExMzc0MS4yMTQ4NjctMS1wYm9uemluaUByZWRoYXQuY29tL3Rlc3Rp
bmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRp
Y2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3Vy
IGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

