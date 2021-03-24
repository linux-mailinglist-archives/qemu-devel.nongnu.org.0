Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B53471B9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:39:18 +0100 (CET)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxAj-0008LB-Ty
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lOx8b-0007Y1-9W
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:37:05 -0400
Resent-Date: Wed, 24 Mar 2021 02:37:05 -0400
Resent-Message-Id: <E1lOx8b-0007Y1-9W@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lOx8V-0005tV-N5
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:37:05 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616567809; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bs0SHxYBZJSAfoyPX2s+Umwrlz9gmz/8iz/iykqfa0YFQqO4OTtClZGLWCw9J44iPKwJmc5feogZn+w16N4SfTcbMjPdGXiFqdRmeofnuQfxML4uib8OJ9ikGR/wwh47PY5fc/DF1fCq2d8xgPbm+a2PYR7dg4XantvD4OHxMPs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616567809;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LywRJ1iXofaYRW+LJoaBDI6ZW5nab0tlSjV0civvQfw=; 
 b=iTGec//TIEyF8SPDO+NvUZI3Mcs4/pm5k41SDNnhDcTr2b95RlakIVgAVQGKtUYpXzth0eZHZIIj/NAhNsARUhwEdABXUP1yEBYG0g+jYlgzmXxEOk3rGCyF+0E4hOJwdQ9/QpTfDJFvjwVKXfuYwc8sE6Y2m4nNJ8fmmgubpjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616567805295482.6371619596995;
 Tue, 23 Mar 2021 23:36:45 -0700 (PDT)
In-Reply-To: <1616567465-153141-1-git-send-email-robert.hu@linux.intel.com>
Subject: Re: [PATCH v2] i386/cpu_dump: support AVX512 ZMM regs dump
Message-ID: <161656780408.22034.8429207677468091029@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: robert.hu@linux.intel.com
Date: Tue, 23 Mar 2021 23:36:45 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, robert.hu@linux.intel.com,
 richard.henderson@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE2NTY3NDY1LTE1MzE0MS0x
LWdpdC1zZW5kLWVtYWlsLXJvYmVydC5odUBsaW51eC5pbnRlbC5jb20vCgoKCkhpLAoKVGhpcyBz
ZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1
dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAx
NjE2NTY3NDY1LTE1MzE0MS0xLWdpdC1zZW5kLWVtYWlsLXJvYmVydC5odUBsaW51eC5pbnRlbC5j
b20KU3ViamVjdDogW1BBVENIIHYyXSBpMzg2L2NwdV9kdW1wOiBzdXBwb3J0IEFWWDUxMiBaTU0g
cmVncyBkdW1wCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3
LzE2MTY1Njc0NjUtMTUzMTQxLTEtZ2l0LXNlbmQtZW1haWwtcm9iZXJ0Lmh1QGxpbnV4LmludGVs
LmNvbSAtPiBwYXRjaGV3LzE2MTY1Njc0NjUtMTUzMTQxLTEtZ2l0LXNlbmQtZW1haWwtcm9iZXJ0
Lmh1QGxpbnV4LmludGVsLmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzIz
MTU1MTMyLjIzODE5My0xLWY0YnVnQGFtc2F0Lm9yZyAtPiBwYXRjaGV3LzIwMjEwMzIzMTU1MTMy
LjIzODE5My0xLWY0YnVnQGFtc2F0Lm9yZwogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIw
MjEwMzIzMTY1MzA4LjE1MjQ0LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIw
MjEwMzIzMTY1MzA4LjE1MjQ0LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwogLSBbdGFnIHVwZGF0
ZV0gICAgICBwYXRjaGV3LzkxZDU5NzgzNTdmYjg3MDllZjYxZDIwMzA5ODRmNzE0Mjg0NzAzN2Qu
MTYxNjE0MTU1Ni5naXQuaHVhbmd5ODFAY2hpbmF0ZWxlY29tLmNuIC0+IHBhdGNoZXcvOTFkNTk3
ODM1N2ZiODcwOWVmNjFkMjAzMDk4NGY3MTQyODQ3MDM3ZC4xNjE2MTQxNTU2LmdpdC5odWFuZ3k4
MUBjaGluYXRlbGVjb20uY24KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozNDAyNGUy
IGkzODYvY3B1X2R1bXA6IHN1cHBvcnQgQVZYNTEyIFpNTSByZWdzIGR1bXAKCj09PSBPVVRQVVQg
QkVHSU4gPT09CkVSUk9SOiBlbHNlIHNob3VsZCBmb2xsb3cgY2xvc2UgYnJhY2UgJ30nCiM2NDog
RklMRTogdGFyZ2V0L2kzODYvY3B1LWR1bXAuYzo1MjA6CisgICAgICAgIH0KKyAgICAgICAgZWxz
ZSBpZiAoZW52LT54Y3IwICYgWEZFQVRVUkVfQVZYKSB7CgpFUlJPUjogZWxzZSBzaG91bGQgZm9s
bG93IGNsb3NlIGJyYWNlICd9JwojNzY6IEZJTEU6IHRhcmdldC9pMzg2L2NwdS1kdW1wLmM6NTMy
OgorICAgICAgICB9CisgICAgICAgIGVsc2UgeyAvKiBTU0UgYW5kIGJlbG93IGNhc2VzICovCgpF
UlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICd8JyAoY3R4OlZ4RSkKIzEwNjogRklM
RTogdGFyZ2V0L2kzODYvY3B1Lmg6MjU5OgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBY
RkVBVFVSRV9BVlg1MTJfWk1NX0hpMjU2fCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeCgp0b3RhbDogMyBlcnJvcnMsIDAgd2FybmluZ3Ms
IDgwIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCAzNDAyNGUyYjE4ZDIgKGkzODYvY3B1X2R1bXA6IHN1
cHBvcnQgQVZYNTEyIFpNTSByZWdzIGR1bXApIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzE2MTY1Njc0
NjUtMTUzMTQxLTEtZ2l0LXNlbmQtZW1haWwtcm9iZXJ0Lmh1QGxpbnV4LmludGVsLmNvbS90ZXN0
aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0
aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

