Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B037B104
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:50:07 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaGV-0004UU-1T
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgaFY-0003U9-0v
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:49:09 -0400
Resent-Date: Tue, 11 May 2021 17:49:08 -0400
Resent-Message-Id: <E1lgaFY-0003U9-0v@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgaFR-00043v-Fh
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:49:06 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620769728; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S/0kLHgMicIMqeWPGYruaBngCgTqFVWgpNTlDs+inD0q5prQlNi+vesXS38NYyywf1Q/dQK+kl6+51KTKuPsNciXB2Kqbij4I1wegBLoUHSmIhOaK1r9OZdwoxOeSLamPtNbfBNmA3uSq5fvbuC6Cfy7ojzvXpsgFE+OLazQiMw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620769728;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=hJkpVJp8Cmj6zDpptlTPk0yil34aAcW49NqqevGsfr8=; 
 b=Q7gfu2RJo33DF4i74BHXwFLCSrbybWL+zEA+Ufvr40celFb+1zfhVW8hhxLZ1jrbTjWEuXKa3ySHxBpoUI4aOpSc+KFpMyu57aYCXlx10rsTa6uadFwbJ99J+Pu3cSbw+x7Wz8G9lf/Bgvr7nx5q6xuCC7qUyDdkNpzOwaBqCtA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620769726832339.74278960882646;
 Tue, 11 May 2021 14:48:46 -0700 (PDT)
In-Reply-To: <20210511213736.281016-1-vgoyal@redhat.com>
Subject: Re: [PATCH 0/7] virtiofsd: Few cleanups in virtio_send_data_iov()
Message-ID: <162076972559.29161.8308372976372965130@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vgoyal@redhat.com
Date: Tue, 11 May 2021 14:48:46 -0700 (PDT)
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxMTIxMzczNi4yODEw
MTYtMS12Z295YWxAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTExMjEzNzM2LjI4MTAx
Ni0xLXZnb3lhbEByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCAwLzddIHZpcnRpb2ZzZDogRmV3
IGNsZWFudXBzIGluIHZpcnRpb19zZW5kX2RhdGFfaW92KCkKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAt
IFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA1MTExMzI2NDEuMTAyMjE2MS0xLWJlcnJh
bmdlQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDUxMTEzMjY0MS4xMDIyMTYxLTEtYmVycmFu
Z2VAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNTExMjEzNzM2
LjI4MTAxNi0xLXZnb3lhbEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA1MTEyMTM3MzYuMjgx
MDE2LTEtdmdveWFsQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwpi
NmNlZDllIHZpcnRpb2ZzZDogU2V0IHJlcS0+cmVwbHlfc2VudCByaWdodCBhZnRlciBzZW5kaW5n
IHJlcGx5CmM4NjZjYzIgdmlydGlvZnNkOiBDaGVjayBFT0YgYmVmb3JlIHNob3J0IHJlYWQKOGQ0
NWYwNyB2aXJ0aW9mc2Q6IFNpbXBsaWZ5IHNraXAgYnl0ZSBsb2dpYwpiN2FmYTE3IHZpcnRpb2Zz
ZDogZ2V0IHJpZCBvZiBpbl9zZ19sZWZ0IHZhcmlhYmxlCjM3YmE3NTUgdmlydGlvZnNkOiBVc2Ug
aW92X2Rpc2NhcmRfZnJvbnQoKSB0byBza2lwIGJ5dGVzCmY4N2ZiZDMgdmlydGlvZnNkOiBHZXQg
cmlkIG9mIHVucmVhY2hhYmxlIGNvZGUgaW4gcmVhZApjYzZmYjRhIHZpcnRpb2ZzZDogQ2hlY2sg
Zm9yIEVJTlRSIGluIHByZWFkdigpIGFuZCByZXRyeQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS83
IENoZWNraW5nIGNvbW1pdCBjYzZmYjRhOWNmOTkgKHZpcnRpb2ZzZDogQ2hlY2sgZm9yIEVJTlRS
IGluIHByZWFkdigpIGFuZCByZXRyeSkKMi83IENoZWNraW5nIGNvbW1pdCBmODdmYmQzNjRiY2Qg
KHZpcnRpb2ZzZDogR2V0IHJpZCBvZiB1bnJlYWNoYWJsZSBjb2RlIGluIHJlYWQpCjMvNyBDaGVj
a2luZyBjb21taXQgMzdiYTc1NWRmOTlkICh2aXJ0aW9mc2Q6IFVzZSBpb3ZfZGlzY2FyZF9mcm9u
dCgpIHRvIHNraXAgYnl0ZXMpCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRh
YnMKIzQ0OiBGSUxFOiB0b29scy92aXJ0aW9mc2QvZnVzZV92aXJ0aW8uYzo0MDA6CiteSSAgICBp
b3ZfZGlzY2FyZF9mcm9udCgmaW5fc2dfcHRyLCAmaW5fc2dfY3B5X2NvdW50LCBza2lwX3NpemUp
OyQKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjYgbGluZXMgY2hlY2tlZAoKUGF0Y2gg
My83IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBl
cnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwg
c2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo0LzcgQ2hlY2tpbmcgY29tbWl0IGI3YWZh
MTdhY2RjMiAodmlydGlvZnNkOiBnZXQgcmlkIG9mIGluX3NnX2xlZnQgdmFyaWFibGUpCjUvNyBD
aGVja2luZyBjb21taXQgOGQ0NWYwN2U5MTdkICh2aXJ0aW9mc2Q6IFNpbXBsaWZ5IHNraXAgYnl0
ZSBsb2dpYykKNi83IENoZWNraW5nIGNvbW1pdCBjODY2Y2MyMWQ5MWMgKHZpcnRpb2ZzZDogQ2hl
Y2sgRU9GIGJlZm9yZSBzaG9ydCByZWFkKQo3LzcgQ2hlY2tpbmcgY29tbWl0IGI2Y2VkOWU0OTU4
NyAodmlydGlvZnNkOiBTZXQgcmVxLT5yZXBseV9zZW50IHJpZ2h0IGFmdGVyIHNlbmRpbmcgcmVw
bHkpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjEwNTExMjEzNzM2LjI4MTAxNi0xLXZnb3lhbEByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRj
aC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0
Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

