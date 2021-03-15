Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F333C60F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:49:31 +0100 (CET)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsHS-000236-Pv
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLs5O-0001zE-Vh
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:37:03 -0400
Resent-Date: Mon, 15 Mar 2021 14:37:02 -0400
Resent-Message-Id: <E1lLs5O-0001zE-Vh@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLs5M-0005fL-3G
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:37:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615833412; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l5z1ji5/JQWN3r/HFQbbwkL7ExbOZcQ+cSWGsUJB+7RhbfTI3OwsEol23EO3l+8+cCxOj7xmGnmFQPE3VLWBoG04PBugcIxlHZIPaCgh3NsBwD8FVr2PpDaJJ1s20B7ESlHlzl3ReDAcnTy7RbsgTsIrGY7U5SvojSuZlEDon4s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615833412;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=qvlQFqiaPiAP9FOSW578sdm82UySpMSsUriDMRODM3M=; 
 b=Fb9FiCZrQKYgtDi9PAG22lA/gYW6kbxqMJMi03APvknd4Gpwa15vppeX2YMvIJBAa+df+Ddh1UllS+6yuhIHuDp5Hxg/26ZRCWZ9NmVfKYaV2yRYnYqN4iV4zTt8YgQKy72LZnnQIlBfySyKEgGmORCxfMPbqJJU92GaVauGeEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615833409604510.8521619982529;
 Mon, 15 Mar 2021 11:36:49 -0700 (PDT)
In-Reply-To: <20210315180102.3008391-1-imammedo@redhat.com>
Subject: Re: [PATCH 0/6] pc: support user provided NIC naming/indexing
Message-ID: <161583340826.29026.17366591502722428122@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: imammedo@redhat.com
Date: Mon, 15 Mar 2021 11:36:49 -0700 (PDT)
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNTE4MDEwMi4zMDA4
MzkxLTEtaW1hbW1lZG9AcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzE1MTgwMTAyLjMw
MDgzOTEtMS1pbWFtbWVkb0ByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCAwLzZdIHBjOiBzdXBw
b3J0IHVzZXIgcHJvdmlkZWQgTklDIG5hbWluZy9pbmRleGluZwoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMxNTE4MDEwMi4zMDA4MzkxLTEtaW1h
bW1lZG9AcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMzE1MTgwMTAyLjMwMDgzOTEtMS1pbWFt
bWVkb0ByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYzA2OTJiNCB0
ZXN0czogYWNwaTogdXBkYXRlIGV4cGVjdGVkIGJsb2JzCjFhODQzZDkgcGNpOiBhY3BpOiBhZGQg
X0RTTSBtZXRob2QgdG8gUENJIGRldmljZXMKNmI1NTU4NiBhY3BpOiBhZGQgYW1sX3RvX2RlY2lt
YWxzdHJpbmcoKSBhbmQgYW1sX2NhbGw2KCkgaGVscGVycwo3Yjg4N2Y0IHBjaTogYWNwaTogZW5z
dXJlIHRoYXQgYWNwaS1pbmRleCBpcyB1bmlxdWUKNDA1NjI5MSBwY2k6IGludHJvZHVjZSBhcGNp
LWluZGV4IHByb3BlcnR5IGZvciBQQ0kgZGV2aWNlCjliZDNhMWIgdGVzdHM6IGFjcGk6IHRlbXBv
cmFyeSB3aGl0ZWxpc3QgRFNEVCBjaGFuZ2VzCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzYgQ2hl
Y2tpbmcgY29tbWl0IDliZDNhMWI5NGMwZiAodGVzdHM6IGFjcGk6IHRlbXBvcmFyeSB3aGl0ZWxp
c3QgRFNEVCBjaGFuZ2VzKQoyLzYgQ2hlY2tpbmcgY29tbWl0IDQwNTYyOTE1YWNkZSAocGNpOiBp
bnRyb2R1Y2UgYXBjaS1pbmRleCBwcm9wZXJ0eSBmb3IgUENJIGRldmljZSkKRVJST1I6IE1hY3Jv
cyB3aXRoIGNvbXBsZXggdmFsdWVzIHNob3VsZCBiZSBlbmNsb3NlZCBpbiBwYXJlbnRoZXNpcwoj
Mjg0OiBGSUxFOiBpbmNsdWRlL2h3L2FjcGkvcGNpaHAuaDo3NzoKKyNkZWZpbmUgVk1TVEFURV9Q
Q0lfSE9UUExVRyhwY2locCwgc3RhdGUsIHRlc3RfcGNpaHAsIHRlc3RfYWNwaV9pbmRleCkgXAog
ICAgICAgICBWTVNUQVRFX1VJTlQzMl9URVNUKHBjaWhwLmhvdHBsdWdfc2VsZWN0LCBzdGF0ZSwg
XAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3RfcGNpaHApLCBcCiAgICAgICAgIFZN
U1RBVEVfU1RSVUNUX0FSUkFZX1RFU1QocGNpaHAuYWNwaV9wY2locF9wY2lfc3RhdHVzLCBzdGF0
ZSwgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFDUElfUENJSFBfTUFYX0hP
VFBMVUdfQlVTLCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9wY2lo
cCwgMSwgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtc3RhdGVfYWNwaV9w
Y2locF9wY2lfc3RhdHVzLCBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQWNw
aVBjaUhwUGNpU3RhdHVzKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFjcGlQ
Y2lIcFBjaVN0YXR1cyksIFwKKyAgICAgICAgVk1TVEFURV9VSU5UMzJfVEVTVChwY2locC5hY3Bp
X2luZGV4LCBzdGF0ZSwgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3RfYWNwaV9p
bmRleCkKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTk3IGxpbmVzIGNoZWNrZWQKClBh
dGNoIDIvNiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy82IENoZWNraW5nIGNvbW1pdCA3
Yjg4N2Y0MjQxOWEgKHBjaTogYWNwaTogZW5zdXJlIHRoYXQgYWNwaS1pbmRleCBpcyB1bmlxdWUp
CjQvNiBDaGVja2luZyBjb21taXQgNmI1NTU4NjlhZDY2IChhY3BpOiBhZGQgYW1sX3RvX2RlY2lt
YWxzdHJpbmcoKSBhbmQgYW1sX2NhbGw2KCkgaGVscGVycykKV0FSTklORzogQmxvY2sgY29tbWVu
dHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUKIzI3OiBGSUxFOiBody9hY3Bp
L2FtbC1idWlsZC5jOjY0MDoKKyAgICBBbWwgKnZhciA9IGFtbF9vcGNvZGUoMHg5NyAvKiBUb0Rl
Y2ltYWxTdHJpbmdPcCAqLyk7CgpXQVJOSU5HOiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5n
IC8qIG9uIGEgc2VwYXJhdGUgbGluZQojMzI6IEZJTEU6IGh3L2FjcGkvYW1sLWJ1aWxkLmM6NjQ1
OgorICAgICAgICBidWlsZF9hcHBlbmRfYnl0ZSh2YXItPmJ1ZiwgMHgwMCAvKiBOdWxsTmFtZU9w
ICovKTsKCnRvdGFsOiAwIGVycm9ycywgMiB3YXJuaW5ncywgNTUgbGluZXMgY2hlY2tlZAoKUGF0
Y2ggNC82IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVz
ZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCjUvNiBDaGVja2luZyBjb21taXQgMWE4
NDNkOWRlNTVlIChwY2k6IGFjcGk6IGFkZCBfRFNNIG1ldGhvZCB0byBQQ0kgZGV2aWNlcykKV0FS
TklORzogQmxvY2sgY29tbWVudHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUK
IzEyNzogRklMRTogaHcvaTM4Ni9hY3BpLWJ1aWxkLmM6NTY4OgorICAgICAgICAgICAgICAgICAg
ICAgICAgMSAvKiBoYXZlIHN1cHBvcnRlZCBmdW5jdGlvbnMgKi8gfAoKdG90YWw6IDAgZXJyb3Jz
LCAxIHdhcm5pbmdzLCAxNDAgbGluZXMgY2hlY2tlZAoKUGF0Y2ggNS82IGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCjYvNiBDaGVja2luZyBjb21taXQgYzA2OTJiNGI3ZGYwICh0ZXN0czogYWNw
aTogdXBkYXRlIGV4cGVjdGVkIGJsb2JzKQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFu
ZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMxNTE4MDEwMi4zMDA4MzkxLTEtaW1hbW1lZG9AcmVk
aGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVy
YXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxl
YXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

