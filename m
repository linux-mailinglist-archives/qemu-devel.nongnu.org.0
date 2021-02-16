Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5731D30F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:47:39 +0100 (CET)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCA4B-0000Q3-0g
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCA2d-0008Fz-Bk
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:46:03 -0500
Resent-Date: Tue, 16 Feb 2021 18:46:03 -0500
Resent-Message-Id: <E1lCA2d-0008Fz-Bk@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCA2a-00032c-Pa
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:46:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613519149; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Vj0M70wqXRDYqSiAVGfEgD235WUeYr7QdfJc3q8ovWfUzPm9UUsRpcFCPDSG9B9cBCi8/OK+VO3LVRtJpMGYVlz6QC6hc4p6Lwg73XXhg4fGNQz5V4y4FJK4osSWcHezw2taOUm4WBpZqhz+81c1cwTYnDf60SYS0FZTvwvvFXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613519149;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=If1BdOFDN4oWVK5IFTiSfgICYRtNfp6JkrRtg3TUoy0=; 
 b=WkIm8J3Sp5lqvJ7RAHUqIGrP0XfVHy/aR0Wq05hdP0uI+7jlotb5w+PRGTjk5VN6U9/CsCv4EfObiXeDLgA1pH0VDwWTZCyAzC3xwARPVYSdCvdQP7q9+4DqtUtfpI6bC29Ff2CwayhrBXlT083ecSFWHpeKIDuD+QI/wgu+an8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613519146414750.8768058992334;
 Tue, 16 Feb 2021 15:45:46 -0800 (PST)
In-Reply-To: <20210216233611.33400-1-vgoyal@redhat.com>
Subject: Re: [PATCH 0/3] virtiofsd: Add options to enable/disable posix acl
Message-ID: <161351914495.372.17420007914971008741@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vgoyal@redhat.com
Date: Tue, 16 Feb 2021 15:45:46 -0800 (PST)
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
Cc: miklos@szeredi.hu, dgilbert@redhat.com, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, lhenriques@suse.de, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxNjIzMzYxMS4zMzQw
MC0xLXZnb3lhbEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMTYyMzM2MTEuMzM0MDAt
MS12Z295YWxAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC8zXSB2aXJ0aW9mc2Q6IEFkZCBv
cHRpb25zIHRvIGVuYWJsZS9kaXNhYmxlIHBvc2l4IGFjbAoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDIxNjIzMzYxMS4zMzQwMC0xLXZnb3lhbEBy
ZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMTYyMzM2MTEuMzM0MDAtMS12Z295YWxAcmVkaGF0
LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjU5OWMzNTcgdmlydGlvZnNkOiBD
aGFuZ2UgdW1hc2sgaWYgcG9zaXggYWNscyBhcmUgZW5hYmxlZAo1OTljYzE5IHZpcnRpb2ZzZDog
QWRkIHVtYXNrIHRvIHNlY2NvbSBhbGxvdyBsaXN0CjcyZWExODUgdmlydGlvZnNkOiBBZGQgYW4g
b3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIHBvc2l4IGFjbHMKCj09PSBPVVRQVVQgQkVHSU4gPT09
CjEvMyBDaGVja2luZyBjb21taXQgNzJlYTE4NWFjNzU0ICh2aXJ0aW9mc2Q6IEFkZCBhbiBvcHRp
b24gdG8gZW5hYmxlL2Rpc2FibGUgcG9zaXggYWNscykKV0FSTklORzogQmxvY2sgY29tbWVudHMg
c2hvdWxkIGFsaWduIHRoZSAqIG9uIGVhY2ggbGluZQojNTY6IEZJTEU6IHRvb2xzL3ZpcnRpb2Zz
ZC9wYXNzdGhyb3VnaF9sbC5jOjY0ODoKKyAgICAgICAgICogRWl0aGVyIHVzZXIgc3BlY2lmaWVk
IHRvIGRpc2FibGUgcG9zaXhfYWNsLCBvciBkaWQgbm90IHNwZWNpZnkKKyAgICAgICAgICAqIGFu
eXRoaW5nLiBJbiBib3RoIHRoZSBjYXNlcyBkbyBub3QgZW5hYmxlIHBvc2l4IGFjbC4KCldBUk5J
Tkc6IEJsb2NrIGNvbW1lbnRzIHNob3VsZCBhbGlnbiB0aGUgKiBvbiBlYWNoIGxpbmUKIzU3OiBG
SUxFOiB0b29scy92aXJ0aW9mc2QvcGFzc3Rocm91Z2hfbGwuYzo2NDk6CisgICAgICAgICAgKiBh
bnl0aGluZy4gSW4gYm90aCB0aGUgY2FzZXMgZG8gbm90IGVuYWJsZSBwb3NpeCBhY2wuCisgICAg
ICAgICAqLwoKdG90YWw6IDAgZXJyb3JzLCAyIHdhcm5pbmdzLCA0NSBsaW5lcyBjaGVja2VkCgpQ
YXRjaCAxLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRo
ZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFp
bmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMi8zIENoZWNraW5nIGNvbW1pdCA1
OTljYzE5ZmFmNTYgKHZpcnRpb2ZzZDogQWRkIHVtYXNrIHRvIHNlY2NvbSBhbGxvdyBsaXN0KQoz
LzMgQ2hlY2tpbmcgY29tbWl0IDU5OWMzNTc1ZWM4MyAodmlydGlvZnNkOiBDaGFuZ2UgdW1hc2sg
aWYgcG9zaXggYWNscyBhcmUgZW5hYmxlZCkKRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5
IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojOTU6IEZJTEU6IHRvb2xzL3ZpcnRpb2Zz
ZC9wYXNzdGhyb3VnaF9sbC5jOjEwNzI6CisgICAgaWYgKGNoYW5nZV91bWFzaykKWy4uLl0KCnRv
dGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgOTYgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMy8zIGhh
cyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMK
YXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNI
RUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFu
ZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIxNjIzMzYxMS4zMzQwMC0xLXZnb3lhbEByZWRoYXQu
Y29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

