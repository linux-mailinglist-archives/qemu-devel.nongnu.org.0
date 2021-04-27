Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957736BE13
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:59:25 +0200 (CEST)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEse-0006Ps-OZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbErQ-0005zH-Ux
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:58:08 -0400
Resent-Date: Mon, 26 Apr 2021 23:58:08 -0400
Resent-Message-Id: <E1lbErQ-0005zH-Ux@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lbErK-0007nX-4Y
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:58:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619495870; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TyIXs0Og9asdPK2aRfmVWvUbgvWNAOZWli6D7TY4Ds6M/ugxp1inda/LAsiwkA1sPioDOPHx8HBNFoJUNsGwerjmuGq7w5WT99IVMNv9MXWlx5/y0Z1ogHin8MEkkVIpDuKBfcwcN2VVksv/7gei0SfEr3brLYrct+y0aesnII8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619495870;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5SFHyhVaXtyEPg13pLbpXiGkpsdD8vx+w7myZz0GH8M=; 
 b=GTjBzn8qt5hH2gLzLmVxShzm2hzSixjy2lubGbWhww1cu9ecViu8OMA4EmjGH9LbxeZuVpdcDM6aoDuiu8x6gXO8QG3GStnq/h9UR/+7+6icXXYtS3bgKeQ6D8tnyYa9qTEi7pem5oCM1l4W7JTTAzOuvQQkTzDIzSjuQNE7HLI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619495867568410.79944489496313;
 Mon, 26 Apr 2021 20:57:47 -0700 (PDT)
In-Reply-To: <20210427033951.29805-1-lulu@redhat.com>
Subject: Re: [PATCH v6 0/9] vhost-vdpa: add support for configure interrupt
Message-ID: <161949586633.17047.9280525117083214872@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lulu@redhat.com
Date: Mon, 26 Apr 2021 20:57:47 -0700 (PDT)
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyNzAzMzk1MS4yOTgw
NS0xLWx1bHVAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNDI3MDMzOTUxLjI5ODA1LTEt
bHVsdUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCB2NiAwLzldIHZob3N0LXZkcGE6IGFkZCBz
dXBwb3J0IGZvciBjb25maWd1cmUgaW50ZXJydXB0Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFn
IHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNDI0MTYyMjI5LjMzMTIxMTYtMS1mNGJ1Z0BhbXNh
dC5vcmcgLT4gcGF0Y2hldy8yMDIxMDQyNDE2MjIyOS4zMzEyMTE2LTEtZjRidWdAYW1zYXQub3Jn
CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA0MjcwMzM5NTEuMjk4MDUtMS1sdWx1
QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDQyNzAzMzk1MS4yOTgwNS0xLWx1bHVAcmVkaGF0
LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjc1YjVmMTkgdmlydGlvLW5ldDog
YWRkIHBlZXJfZGVsZXRlZCBjaGVjayBpbiB2aXJ0aW9fbmV0X2hhbmRsZV9yeAplNmMyYTJkIHZp
cnRpbzogZGVjb3VwbGUgdmlydHF1ZXVlIGZyb20gc2V0IG5vdGlmaWVyIGZkIGhhbmRsZXIKZDdl
MzI0MyB2aXJ0aW8tcGNpOiBhZGQgc3VwcG9ydCBmb3IgY29uZmlndXJlIGludGVycnVwdAo1NTk0
NmM1IHZpcnRpby1tbWlvOiBhZGQgc3VwcG9ydCBmb3IgY29uZmlndXJlIGludGVycnVwdAowZThl
YTgxIHZob3N0OmFkZCBzdXBwb3J0IGZvciBjb25maWd1cmUgaW50ZXJydXB0CjY2NWUxMWQgdmhv
c3QtdmRwYTogYWRkIHN1cHBvcnQgZm9yIGNvbmZpZyBpbnRlcnJ1cHQgY2FsbCBiYWNrCmU4M2Y3
OTMgdmhvc3Q6IGFkZCBuZXcgY2FsbCBiYWNrIGZ1bmN0aW9uIGZvciBjb25maWcgaW50ZXJydXB0
CjNjZTA4MjEgdmlydGlvLXBjaTpkZWNvdXBsZSB2aXJ0cXVldWUgZnJvbSBpbnRlcnJ1cHQgc2V0
dGluZyBwcm9jZXNzCmQ0ZGViZTggaHc6IEFkZCBjaGVjayBmb3IgcXVldWUgbnVtYmVyCgo9PT0g
T1VUUFVUIEJFR0lOID09PQoxLzkgQ2hlY2tpbmcgY29tbWl0IGQ0ZGViZTgxOGUyMSAoaHc6IEFk
ZCBjaGVjayBmb3IgcXVldWUgbnVtYmVyKQoyLzkgQ2hlY2tpbmcgY29tbWl0IDNjZTA4MjE4MGNj
YSAodmlydGlvLXBjaTpkZWNvdXBsZSB2aXJ0cXVldWUgZnJvbSBpbnRlcnJ1cHQgc2V0dGluZyBw
cm9jZXNzKQozLzkgQ2hlY2tpbmcgY29tbWl0IGU4M2Y3OTM4NTQyZCAodmhvc3Q6IGFkZCBuZXcg
Y2FsbCBiYWNrIGZ1bmN0aW9uIGZvciBjb25maWcgaW50ZXJydXB0KQo0LzkgQ2hlY2tpbmcgY29t
bWl0IDY2NWUxMWQzYzk4ZiAodmhvc3QtdmRwYTogYWRkIHN1cHBvcnQgZm9yIGNvbmZpZyBpbnRl
cnJ1cHQgY2FsbCBiYWNrKQo1LzkgQ2hlY2tpbmcgY29tbWl0IDBlOGVhODFjZjVhMCAodmhvc3Q6
YWRkIHN1cHBvcnQgZm9yIGNvbmZpZ3VyZSBpbnRlcnJ1cHQpCjYvOSBDaGVja2luZyBjb21taXQg
NTU5NDZjNTVlZTExICh2aXJ0aW8tbW1pbzogYWRkIHN1cHBvcnQgZm9yIGNvbmZpZ3VyZSBpbnRl
cnJ1cHQpCjcvOSBDaGVja2luZyBjb21taXQgZDdlMzI0M2Y4MmVjICh2aXJ0aW8tcGNpOiBhZGQg
c3VwcG9ydCBmb3IgY29uZmlndXJlIGludGVycnVwdCkKRVJST1I6IE1pc3NpbmcgU2lnbmVkLW9m
Zi1ieTogbGluZShzKQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyNjYgbGluZXMgY2hl
Y2tlZAoKUGF0Y2ggNy85IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo4LzkgQ2hlY2tpbmcg
Y29tbWl0IGU2YzJhMmQzNmJjZSAodmlydGlvOiBkZWNvdXBsZSB2aXJ0cXVldWUgZnJvbSBzZXQg
bm90aWZpZXIgZmQgaGFuZGxlcikKOS85IENoZWNraW5nIGNvbW1pdCA3NWI1ZjE5M2FjMzIgKHZp
cnRpby1uZXQ6IGFkZCBwZWVyX2RlbGV0ZWQgY2hlY2sgaW4gdmlydGlvX25ldF9oYW5kbGVfcngp
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEw
NDI3MDMzOTUxLjI5ODA1LTEtbHVsdUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==

