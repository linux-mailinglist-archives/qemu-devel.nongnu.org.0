Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3876C31891F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:15:15 +0100 (CET)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9wI-0002hw-AM
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lA9uf-0001jV-3p
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:13:33 -0500
Resent-Date: Thu, 11 Feb 2021 06:13:33 -0500
Resent-Message-Id: <E1lA9uf-0001jV-3p@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lA9uc-0005uX-WD
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:13:32 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613041959; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lOcdflYKOh5/AxlUpRfnVVKhOp7FgBElK457qbJgZ0urjLoJ0x1o51C5e+Ql9gAsQaT6/5cYHn5ptI2JydGrNvKBDOSsZwBSGpeaOfKJAmUBXTaLIFzW1vD+rq6w/C5RxzkJbmjOXCF6TGMpyfu2Ddm3vlPbfG4rJIvPQtZJRsU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613041959;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=weq0ld2vu4me5tIoJLkq6FSaqR5bLh8jn9FBBTaZCBk=; 
 b=FPdhnL7bUC32UenY4DZkte8KXBV/x8XQZkaCg2PrzkKPsEs3vAefUBqoVvzx4iTKmAnBNWEIUhgWA0/q0ydaN1Z+zFKEyVSmHnxxA8uZZxASqb+7xNMii3RkCirECgLCPwputO5+PjtGwXWmWOEsAN0bo05VJHMnMHKB5vpaWLc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613041955072341.14061219446285;
 Thu, 11 Feb 2021 03:12:35 -0800 (PST)
In-Reply-To: <20210209153757.1653598-1-eperezma@redhat.com>
Subject: Re: [RFC v2 0/7] vDPA shadow virtqueue - notifications forwarding
Message-ID: <161304195285.26113.11294707353453126957@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eperezma@redhat.com
Date: Thu, 11 Feb 2021 03:12:35 -0800 (PST)
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
Cc: parav@mellanox.com, quintela@redhat.com, jasowang@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, sgarzare@redhat.com,
 hanand@xilinx.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 eli@mellanox.com, virtualization@lists.linux-foundation.org, ml@napatech.com,
 jim.harford@broadcom.com, rob.miller@broadcom.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwOTE1Mzc1Ny4xNjUz
NTk4LTEtZXBlcmV6bWFAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMjA5MTUzNzU3LjE2
NTM1OTgtMS1lcGVyZXptYUByZWRoYXQuY29tClN1YmplY3Q6IFtSRkMgdjIgMC83XSB2RFBBIHNo
YWRvdyB2aXJ0cXVldWUgLSBub3RpZmljYXRpb25zIGZvcndhcmRpbmcKCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8
IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0
aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09
PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVm
N2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9x
ZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMTYxMjg2ODA4NS03MjgwOS0xLWdpdC1z
ZW5kLWVtYWlsLWJtZW5nLmNuQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzE2MTI4NjgwODUtNzI4MDkt
MS1naXQtc2VuZC1lbWFpbC1ibWVuZy5jbkBnbWFpbC5jb20KICogW25ldyB0YWddICAgICAgICAg
cGF0Y2hldy8xNjEyOTUwODc5LTQ5MDIzLTEtZ2l0LXNlbmQtZW1haWwtYm1lbmcuY25AZ21haWwu
Y29tIC0+IHBhdGNoZXcvMTYxMjk1MDg3OS00OTAyMy0xLWdpdC1zZW5kLWVtYWlsLWJtZW5nLmNu
QGdtYWlsLmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzE2MTI5NTYxNDEtNjM3MTIt
MS1naXQtc2VuZC1lbWFpbC1ibWVuZy5jbkBnbWFpbC5jb20gLT4gcGF0Y2hldy8xNjEyOTU2MTQx
LTYzNzEyLTEtZ2l0LXNlbmQtZW1haWwtYm1lbmcuY25AZ21haWwuY29tClN3aXRjaGVkIHRvIGEg
bmV3IGJyYW5jaCAndGVzdCcKMGMwZjRmMCB2aG9zdDogUm91dGUgaG9zdC0+Z3Vlc3Qgbm90aWZp
Y2F0aW9uIHRocm91Z2ggc2hhZG93IHZpcnRxdWV1ZQphZDFhMGIxIHZob3N0OiBSb3V0ZSBndWVz
dC0+aG9zdCBub3RpZmljYXRpb24gdGhyb3VnaCBzaGFkb3cgdmlydHF1ZXVlCmFiZmU2YWUgdmhv
c3Q6IEFkZCB4LXZob3N0LWVuYWJsZS1zaGFkb3ctdnEgcW1wCmIzYjc1NDQgdmhvc3Q6IEFkZCBW
aG9zdFNoYWRvd1ZpcnRxdWV1ZQpjYzRlNDgxIHZob3N0OiBTYXZlIG1hc2tlZF9ub3RpZmllciBz
dGF0ZQo1MjM3OTgyIHZpcnRpbzogQWRkIHZpcnRpb19xdWV1ZV9ob3N0X25vdGlmaWVyX3N0YXR1
cwpmZDk0NmQ5IHZob3N0OiBEZWxldGUgdHJhaWxpbmcgZG90IGluIGVycnByX3NldGcgYXJndW1l
bnQKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvNyBDaGVja2luZyBjb21taXQgZmQ5NDZkOWE1NzZj
ICh2aG9zdDogRGVsZXRlIHRyYWlsaW5nIGRvdCBpbiBlcnJwcl9zZXRnIGFyZ3VtZW50KQpFUlJP
UjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDggbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS83IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCgoyLzcgQ2hlY2tpbmcgY29tbWl0IDUyMzc5ODIwOWM2YSAodmlydGlvOiBBZGQgdmlydGlv
X3F1ZXVlX2hvc3Rfbm90aWZpZXJfc3RhdHVzKQozLzcgQ2hlY2tpbmcgY29tbWl0IGNjNGU0ODE1
NWNmYSAodmhvc3Q6IFNhdmUgbWFza2VkX25vdGlmaWVyIHN0YXRlKQo0LzcgQ2hlY2tpbmcgY29t
bWl0IGIzYjc1NDQ3NTYwYyAodmhvc3Q6IEFkZCBWaG9zdFNoYWRvd1ZpcnRxdWV1ZSkKV0FSTklO
RzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVk
IHVwZGF0aW5nPwojMzI6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAx
IHdhcm5pbmdzLCA5NSBsaW5lcyBjaGVja2VkCgpQYXRjaCA0LzcgaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KNS83IENoZWNraW5nIGNvbW1pdCBhYmZlNmFlODI4NDYgKHZob3N0OiBBZGQgeC12
aG9zdC1lbmFibGUtc2hhZG93LXZxIHFtcCkKNi83IENoZWNraW5nIGNvbW1pdCBhZDFhMGIxYzBi
MDUgKHZob3N0OiBSb3V0ZSBndWVzdC0+aG9zdCBub3RpZmljYXRpb24gdGhyb3VnaCBzaGFkb3cg
dmlydHF1ZXVlKQo3LzcgQ2hlY2tpbmcgY29tbWl0IDBjMGY0ZjA4YTFlZiAodmhvc3Q6IFJvdXRl
IGhvc3QtPmd1ZXN0IG5vdGlmaWNhdGlvbiB0aHJvdWdoIHNoYWRvdyB2aXJ0cXVldWUpCj09PSBP
VVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVs
bCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMjA5MTUz
NzU3LjE2NTM1OTgtMS1lcGVyZXptYUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==

