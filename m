Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D383A3ABBBB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:26:23 +0200 (CEST)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwic-0004oR-Tk
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltwhY-0003uj-9s
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:25:17 -0400
Resent-Date: Thu, 17 Jun 2021 14:25:16 -0400
Resent-Message-Id: <E1ltwhY-0003uj-9s@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltwhS-00017L-Dv
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:25:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623954294; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Igq753rWoCK6pAbh2dEUzH39dSkeuwEKkgvUO8WcFkiK38F97znTHIGQMmgOQQVQkNTLlYJ5Bu8l9IFL2lSnpO9SpG/54KX6DHoixLLD5yZYlutvwufu2VUeo19KrZWOzRgBB/QPVZTJan5VPdR6ZPhACD9Xx4lSqx2WhYhBYhE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623954294;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=E5zTHIotSkdeJGittuUPZOlmFZMJ12vWFH3a4e7nuE4=; 
 b=jNxtSLSf59shIEPap7ee4lY77b+8yXSpJiDr+Fgh7MYzX9NOC1NbfrB/xhn8/BB7RtqvYk4K5YLVTngJ+z6FOcMLgBOFrm57kzyxplNDo4MgQQIxkZP/FCoEmtkxaTpQ2P8Db560x3niUCrRh2UCqa3i7vc4rgwBxFmHZgxM9J8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623954288284849.5937190340799;
 Thu, 17 Jun 2021 11:24:48 -0700 (PDT)
In-Reply-To: <20210617181213.1177835-1-vgoyal@redhat.com>
Subject: Re: [PATCH v6 0/8] virtiofsd: Add support to enable/disable posix acls
Message-ID: <162395428716.2536.16283139617440086783@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vgoyal@redhat.com
Date: Thu, 17 Jun 2021 11:24:48 -0700 (PDT)
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, lhenriques@suse.de, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxNzE4MTIxMy4xMTc3
ODM1LTEtdmdveWFsQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYxNzE4MTIxMy4xMTc3
ODM1LTEtdmdveWFsQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIHY2IDAvOF0gdmlydGlvZnNk
OiBBZGQgc3VwcG9ydCB0byBlbmFibGUvZGlzYWJsZSBwb3NpeCBhY2xzCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8
fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3Jp
dGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9
PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRl
ZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3Qv
cWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNjE3MTgxMjEzLjExNzc4MzUt
MS12Z295YWxAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNjE3MTgxMjEzLjExNzc4MzUtMS12
Z295YWxAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmM4MTJjMzkg
dmlydGlvZnNkOiBBZGQgYW4gb3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIHBvc2l4IGFjbHMKNjJh
ZjAwZSB2aXJ0aW9mc2Q6IFN3aXRjaCBjcmVkcywgZHJvcCBGU0VUSUQgZm9yIHN5c3RlbS5wb3Np
eF9hY2xfYWNjZXNzIHhhdHRyCmU5M2M1M2QgdmlydGlvZnNkOiBBZGQgY2FwYWJpbGl0eSB0byBj
aGFuZ2UvcmVzdG9yZSB1bWFzawo1NTg4MDUzIHZpcnRpb2ZzZDogQWRkIHVtYXNrIHRvIHNlY2Nv
bSBhbGxvdyBsaXN0CmRjMjMzN2UgdmlydGlvZnNkOiBBZGQgc3VwcG9ydCBmb3IgZXh0ZW5kZWQg
c2V0eGF0dHIKNjVmYzcyMCB2aXJ0aW9mc2Q6IEZpeCB4YXR0ciBvcGVyYXRpb25zIG92ZXJ3cml0
aW5nIGVycm5vCjk2N2UyOGQgdmlydGlvZnNkOiBGaXggZnVzZSBzZXR4YXR0cigpIEFQSSBjaGFu
Z2UgaXNzdWUKNmMzZDA1MCBsaW51eC1oZWFkZXJzOiBVcGRhdGUgbGludXggaGVhZGVycyB0byA1
LjEzLjAtcmM2Cgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzggQ2hlY2tpbmcgY29tbWl0IDZjM2Qw
NTBiZDcwZiAobGludXgtaGVhZGVyczogVXBkYXRlIGxpbnV4IGhlYWRlcnMgdG8gNS4xMy4wLXJj
NikKMi84IENoZWNraW5nIGNvbW1pdCA5NjdlMjhkMmUyMmQgKHZpcnRpb2ZzZDogRml4IGZ1c2Ug
c2V0eGF0dHIoKSBBUEkgY2hhbmdlIGlzc3VlKQpFUlJPUjogYnJhY2VzIHt9IGFyZSBuZWNlc3Nh
cnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiM1MDogRklMRTogdG9vbHMvdmlydGlv
ZnNkL2Z1c2VfbG93bGV2ZWwuYzoxNDI0OgorICAgIGlmIChzZXR4YXR0cl9leHQpClsuLi5dCisg
ICAgZWxzZQpbLi4uXQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyNSBsaW5lcyBjaGVj
a2VkCgpQYXRjaCAyLzggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvOCBDaGVja2luZyBj
b21taXQgNjVmYzcyMGU0OWFjICh2aXJ0aW9mc2Q6IEZpeCB4YXR0ciBvcGVyYXRpb25zIG92ZXJ3
cml0aW5nIGVycm5vKQo0LzggQ2hlY2tpbmcgY29tbWl0IGRjMjMzN2U2NDNmYyAodmlydGlvZnNk
OiBBZGQgc3VwcG9ydCBmb3IgZXh0ZW5kZWQgc2V0eGF0dHIpCjUvOCBDaGVja2luZyBjb21taXQg
NTU4ODA1M2ZkNDBiICh2aXJ0aW9mc2Q6IEFkZCB1bWFzayB0byBzZWNjb20gYWxsb3cgbGlzdCkK
Ni84IENoZWNraW5nIGNvbW1pdCBlOTNjNTNkYWJkYjcgKHZpcnRpb2ZzZDogQWRkIGNhcGFiaWxp
dHkgdG8gY2hhbmdlL3Jlc3RvcmUgdW1hc2spCjcvOCBDaGVja2luZyBjb21taXQgNjJhZjAwZWQ3
NTllICh2aXJ0aW9mc2Q6IFN3aXRjaCBjcmVkcywgZHJvcCBGU0VUSUQgZm9yIHN5c3RlbS5wb3Np
eF9hY2xfYWNjZXNzIHhhdHRyKQpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29uZGl0
aW9uYWwgc3RhdGVtZW50cyAoNCwgNykKIzgzOiBGSUxFOiB0b29scy92aXJ0aW9mc2QvcGFzc3Ro
cm91Z2hfbGwuYzoxMjA4OgorICAgIGlmIChyZXQpIHsKKyAgICAgICBpZiAoX19jYXBfZHJvcHBl
ZCkgewoKRVJST1I6IHN1c3BlY3QgY29kZSBpbmRlbnQgZm9yIGNvbmRpdGlvbmFsIHN0YXRlbWVu
dHMgKDcsIDEwKQojODQ6IEZJTEU6IHRvb2xzL3ZpcnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jOjEy
MDk6CisgICAgICAgaWYgKF9fY2FwX2Ryb3BwZWQpIHsKKyAgICAgICAgICBpZiAoZ2Fpbl9lZmZl
Y3RpdmVfY2FwKGNhcF9uYW1lKSkgewoKRVJST1I6IHN1c3BlY3QgY29kZSBpbmRlbnQgZm9yIGNv
bmRpdGlvbmFsIHN0YXRlbWVudHMgKDEwLCAxNCkKIzg1OiBGSUxFOiB0b29scy92aXJ0aW9mc2Qv
cGFzc3Rocm91Z2hfbGwuYzoxMjEwOgorICAgICAgICAgIGlmIChnYWluX2VmZmVjdGl2ZV9jYXAo
Y2FwX25hbWUpKSB7CisgICAgICAgICAgICAgIGZ1c2VfbG9nKEZVU0VfTE9HX0VSUiwgIkZhaWxl
ZCB0byBnYWluIENBUF8lc1xuIiwgY2FwX25hbWUpOwoKRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVj
ZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojOTE6IEZJTEU6IHRvb2xzL3Zp
cnRpb2ZzZC9wYXNzdGhyb3VnaF9sbC5jOjEyMTY6CisgICAgaWYgKGNhcF9kcm9wcGVkKQpbLi4u
XQoKdG90YWw6IDQgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMDUgbGluZXMgY2hlY2tlZAoKUGF0Y2gg
Ny84IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBl
cnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwg
c2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo4LzggQ2hlY2tpbmcgY29tbWl0IGM4MTJj
MzkzZjM2YSAodmlydGlvZnNkOiBBZGQgYW4gb3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIHBvc2l4
IGFjbHMpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6
IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMjEwNjE3MTgxMjEzLjExNzc4MzUtMS12Z295YWxAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNr
cGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5
IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFj
ayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

