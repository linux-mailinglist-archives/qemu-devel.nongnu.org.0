Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A92D90C3
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 22:30:24 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koYwh-0006hC-Dv
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 16:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1koYfs-0005M9-KY
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:13:03 -0500
Resent-Date: Sun, 13 Dec 2020 16:13:00 -0500
Resent-Message-Id: <E1koYfs-0005M9-KY@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1koYfk-0006Fc-0z
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:12:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607893963; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IUHJXY3oiJl+jhLk5ouCKDOEZ3gcq4LYdl7h802BtiZZw42dKNulQ5yjHeSPW8Z5r6xGxMM+K5FcWJijDqPjUv4ngD9VRydelIxZWeQbzGlzGuhV5WW4X0S72dDbhz0T6z5uWyWlikB0aEZP9jjSwunDJ/SEdNOnLP0JasWsXAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607893963;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=3NyHItzQioCVnc9LXp0juy/TYpLKZUPwpvLJfhVpIlg=; 
 b=QL8a6ebzQY3C0ZKC3w7NLgr+SQc7wfXy+8NCaiJLeAW1891+t31EQms1TYpG43kGI4xXCu0gDrheSRBCEtDj5yeDkbjl2LZYERAmH92o8OyNioBRFg2tSYf3zTgZjOGHweRrUamsOiUiOHQ3rFsuc7UfvVKtLk7WNUvWc4XhpxQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607893960962754.7949658886491;
 Sun, 13 Dec 2020 13:12:40 -0800 (PST)
In-Reply-To: <20201213210455.299668-1-fontaine.fabrice@gmail.com>
Subject: Re: [PATCH] hw/usb/host-libusb.c: fix build with kernel < 5.0
Message-ID: <160789395962.28045.501180278491094109@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: fontaine.fabrice@gmail.com
Date: Sun, 13 Dec 2020 13:12:40 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fontaine.fabrice@gmail.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxMzIxMDQ1NS4yOTk2
NjgtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVt
cyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZv
cgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMjEzMjEw
NDU1LjI5OTY2OC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSF0g
aHcvdXNiL2hvc3QtbGlidXNiLmM6IGZpeCBidWlsZCB3aXRoIGtlcm5lbCA8IDUuMAoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1w
cm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTIxMzIxMDQ1NS4y
OTk2NjgtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzIwMjAxMjEzMjEw
NDU1LjI5OTY2OC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tClN3aXRjaGVkIHRvIGEgbmV3
IGJyYW5jaCAndGVzdCcKZjIwMDg1YiBody91c2IvaG9zdC1saWJ1c2IuYzogZml4IGJ1aWxkIHdp
dGgga2VybmVsIDwgNS4wCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogbGluZSBvdmVyIDkw
IGNoYXJhY3RlcnMKIzM1OiBGSUxFOiBody91c2IvaG9zdC1saWJ1c2IuYzo5NDQ6CisjaWYgTElC
VVNCX0FQSV9WRVJTSU9OID49IDB4MDEwMDAxMDcgJiYgZGVmaW5lZChDT05GSUdfTElOVVgpICYm
IGRlZmluZWQoVVNCREVWRlNfR0VUX1NQRUVEKQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdz
LCA4IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBmMjAwODViNThmOGQgKGh3L3VzYi9ob3N0LWxpYnVz
Yi5jOiBmaXggYnVpbGQgd2l0aCBrZXJuZWwgPCA1LjApIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxl
YXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyBy
ZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5F
UlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjAxMjEzMjEwNDU1LjI5OTY2OC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tL3Rlc3Rpbmcu
Y2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZl
ZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

