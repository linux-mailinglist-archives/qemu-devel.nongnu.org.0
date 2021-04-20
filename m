Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3B365D9E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:44:14 +0200 (CEST)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtTx-0002Gp-DB
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lYtSy-0001p5-3r
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:43:12 -0400
Resent-Date: Tue, 20 Apr 2021 12:43:12 -0400
Resent-Message-Id: <E1lYtSy-0001p5-3r@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lYtSt-0005o8-3a
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:43:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618936970; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V/doHG3zYzmfw0rB9JsjsdFa3dHh9gpEHHwN1wC/i1jLtJLq3s+Z3fZA1g8D+fYcEk2IqdV+Au3hVq5/VcIIPaxy1Kkn4+9BWs/GukLlE4JLU8RU1p2kYIbK0tT36YvXRQIdlA8+NpSswGnSUceO3QueWo05KpSIjLGjdebsfT8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618936970;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=g64ms/s92oFrl/0e6t/rSztV/MBdlY5EzwZTlmQfs48=; 
 b=lFj3f/DJaN2sqgV0rIrzIaZyc1H3MWusivCx4ZpRyi5k5hvy3oGDDJQL7yaQJ723bn3kJ/u+4dSZ2EAx2XV236BA9nCnVtIpXjnEzzprmdpj4LBXT3vV9bEgOoGp4l5I4I7XA73HXodE1FeOG3F/p/H7UdCI2+CsbxSc689Y6/o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618936968277268.9489368010212;
 Tue, 20 Apr 2021 09:42:48 -0700 (PDT)
In-Reply-To: <20210420161940.24306-1-valeriy.vdovin@virtuozzo.com>
Subject: Re: [PATCH v6] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <161893696658.26703.7219930353671192082@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: valeriy.vdovin@virtuozzo.com
Date: Tue, 20 Apr 2021 09:42:48 -0700 (PDT)
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
Cc: vsementsov@virtuozzo.com, ehabkost@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, valeriy.vdovin@virtuozzo.com,
 den@openvz.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyMDE2MTk0MC4yNDMw
Ni0xLXZhbGVyaXkudmRvdmluQHZpcnR1b3p6by5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDQyMDE2
MTk0MC4yNDMwNi0xLXZhbGVyaXkudmRvdmluQHZpcnR1b3p6by5jb20KU3ViamVjdDogW1BBVENI
IHY2XSBxYXBpOiBpbnRyb2R1Y2UgJ3F1ZXJ5LWNwdS1tb2RlbC1jcHVpZCcgYWN0aW9uCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3
LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNDIwMTYxOTQw
LjI0MzA2LTEtdmFsZXJpeS52ZG92aW5AdmlydHVvenpvLmNvbSAtPiBwYXRjaGV3LzIwMjEwNDIw
MTYxOTQwLjI0MzA2LTEtdmFsZXJpeS52ZG92aW5AdmlydHVvenpvLmNvbQpTd2l0Y2hlZCB0byBh
IG5ldyBicmFuY2ggJ3Rlc3QnCjllZTFmYjUgcWFwaTogaW50cm9kdWNlICdxdWVyeS1jcHUtbW9k
ZWwtY3B1aWQnIGFjdGlvbgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IHN1c3BlY3QgY29k
ZSBpbmRlbnQgZm9yIGNvbmRpdGlvbmFsIHN0YXRlbWVudHMgKDQsIDYpCiMzOTM6IEZJTEU6IHRh
cmdldC9pMzg2L2NwdS5jOjUyOTg6CisgICAgaWYgKCFtcyB8fCAhbXMtPnBvc3NpYmxlX2NwdXMp
IHsKKyAgICAgIGVycm9yX3NldGcoZXJycCwgIk5vdGhpbmcgdG8gcmVwb3J0Iik7Cgp0b3RhbDog
MSBlcnJvcnMsIDAgd2FybmluZ3MsIDQ3NiBsaW5lcyBjaGVja2VkCgpDb21taXQgOWVlMWZiNWEz
OTUzIChxYXBpOiBpbnRyb2R1Y2UgJ3F1ZXJ5LWNwdS1tb2RlbC1jcHVpZCcgYWN0aW9uKSBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBl
eGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDIxMDQyMDE2MTk0MC4yNDMwNi0xLXZhbGVyaXkudmRvdmluQHZp
cnR1b3p6by5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

