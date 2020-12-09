Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5252D486C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:59:26 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3kL-000285-A4
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn3U8-0003Ht-U5
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn3U7-0007iP-72
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607535758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/g5nx6J5/aoMyEyiNOchwAtIaEZ2IQKL/yP+k4thMWw=;
 b=Q+6y2AwJ8mCsQlC2W1065h+6ERQ2BNbgpfpMNU3xzonZOU/8VbGJS87peArG7uEj0hItnC
 V5bHBTbbZ/Zi1T4deJQi1bOuM8h1aMXGBYXhwDtNe9n/AdSvp4EQW2LaGqx5iCTiimIiKb
 gubAlt+XLHAparunQd5m1cr3uAR+Gu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-LKPN8rJwPH-DxH9YwS0EOA-1; Wed, 09 Dec 2020 12:42:36 -0500
X-MC-Unique: LKPN8rJwPH-DxH9YwS0EOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118E110054FF;
 Wed,  9 Dec 2020 17:42:35 +0000 (UTC)
Received: from localhost (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A6885D6BA;
 Wed,  9 Dec 2020 17:42:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] trace: fix simpletrace doc mismerge
Date: Wed,  9 Dec 2020 17:42:23 +0000
Message-Id: <20201209174225.401337-2-stefanha@redhat.com>
In-Reply-To: <20201209174225.401337-1-stefanha@redhat.com>
References: <20201209174225.401337-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIHNpbXBsZXRyYWNlIGRvY3VtZW50YXRpb24gc2VjdGlvbiB3YXMgYWNjaWRlbnRhbGx5IHNw
bGl0IHdoZW4gdGhlCmZ0cmFjZSBzZWN0aW9uIHdhcyBpbnRyb2R1Y2VkLiBNb3ZlIHRoZSBzaW1w
bGV0cmFjZS1zcGVjaWZpYwpkb2N1bWVudGF0aW9uIGJhY2sgaW50byB0aGUgc2ltcGxldHJhY2Ug
c2VjdGlvbi4KCkZpeGVzOiBlNjRkZDVlZmIyYzZkNTIyYTNiYzlkMDk2Y2Q0OWE0ZTUzZjBhZTEw
ICgidHJhY2U6IGRvY3VtZW50IGZ0cmFjZSBiYWNrZW5kIikKU2lnbmVkLW9mZi1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGRvY3MvZGV2ZWwvdHJhY2luZy50
eHQgfCAzNCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9k
ZXZlbC90cmFjaW5nLnR4dCBiL2RvY3MvZGV2ZWwvdHJhY2luZy50eHQKaW5kZXggZDIxNjA2NTVi
NC4uYmY2MTdiYTk3NiAxMDA2NDQKLS0tIGEvZG9jcy9kZXZlbC90cmFjaW5nLnR4dAorKysgYi9k
b2NzL2RldmVsL3RyYWNpbmcudHh0CkBAIC0yMTgsNiArMjE4LDIzIEBAIHNvdXJjZSB0cmVlLiAg
SXQgbWF5IG5vdCBiZSBhcyBwb3dlcmZ1bCBhcyBwbGF0Zm9ybS1zcGVjaWZpYyBvciB0aGlyZC1w
YXJ0eQogdHJhY2UgYmFja2VuZHMgYnV0IGl0IGlzIHBvcnRhYmxlLiAgVGhpcyBpcyB0aGUgcmVj
b21tZW5kZWQgdHJhY2UgYmFja2VuZAogdW5sZXNzIHlvdSBoYXZlIHNwZWNpZmljIG5lZWRzIGZv
ciBtb3JlIGFkdmFuY2VkIGJhY2tlbmRzLgogCis9PT09IE1vbml0b3IgY29tbWFuZHMgPT09PQor
CisqIHRyYWNlLWZpbGUgb258b2ZmfGZsdXNofHNldCA8cGF0aD4KKyAgRW5hYmxlL2Rpc2FibGUv
Zmx1c2ggdGhlIHRyYWNlIGZpbGUgb3Igc2V0IHRoZSB0cmFjZSBmaWxlIG5hbWUuCisKKz09PT0g
QW5hbHl6aW5nIHRyYWNlIGZpbGVzID09PT0KKworVGhlICJzaW1wbGUiIGJhY2tlbmQgcHJvZHVj
ZXMgYmluYXJ5IHRyYWNlIGZpbGVzIHRoYXQgY2FuIGJlIGZvcm1hdHRlZCB3aXRoIHRoZQorc2lt
cGxldHJhY2UucHkgc2NyaXB0LiAgVGhlIHNjcmlwdCB0YWtlcyB0aGUgInRyYWNlLWV2ZW50cy1h
bGwiIGZpbGUgYW5kIHRoZQorYmluYXJ5IHRyYWNlOgorCisgICAgLi9zY3JpcHRzL3NpbXBsZXRy
YWNlLnB5IHRyYWNlLWV2ZW50cy1hbGwgdHJhY2UtMTIzNDUKKworWW91IG11c3QgZW5zdXJlIHRo
YXQgdGhlIHNhbWUgInRyYWNlLWV2ZW50cy1hbGwiIGZpbGUgd2FzIHVzZWQgdG8gYnVpbGQgUUVN
VSwKK290aGVyd2lzZSB0cmFjZSBldmVudCBkZWNsYXJhdGlvbnMgbWF5IGhhdmUgY2hhbmdlZCBh
bmQgb3V0cHV0IHdpbGwgbm90IGJlCitjb25zaXN0ZW50LgorCiA9PT0gRnRyYWNlID09PQogCiBU
aGUgImZ0cmFjZSIgYmFja2VuZCB3cml0ZXMgdHJhY2UgZGF0YSB0byBmdHJhY2UgbWFya2VyLiBU
aGlzIGVmZmVjdGl2ZWx5CkBAIC0yNDYsMjMgKzI2Myw2IEBAIE5PVEU6IHN5c2xvZyBtYXkgc3F1
YXNoIGR1cGxpY2F0ZSBjb25zZWN1dGl2ZSB0cmFjZSBldmVudHMgYW5kIGFwcGx5IHJhdGUKIAog
UmVzdHJpY3Rpb246ICJzeXNsb2ciIGJhY2tlbmQgaXMgcmVzdHJpY3RlZCB0byBQT1NJWCBjb21w
bGlhbnQgT1MuCiAKLT09PT0gTW9uaXRvciBjb21tYW5kcyA9PT09Ci0KLSogdHJhY2UtZmlsZSBv
bnxvZmZ8Zmx1c2h8c2V0IDxwYXRoPgotICBFbmFibGUvZGlzYWJsZS9mbHVzaCB0aGUgdHJhY2Ug
ZmlsZSBvciBzZXQgdGhlIHRyYWNlIGZpbGUgbmFtZS4KLQotPT09PSBBbmFseXppbmcgdHJhY2Ug
ZmlsZXMgPT09PQotCi1UaGUgInNpbXBsZSIgYmFja2VuZCBwcm9kdWNlcyBiaW5hcnkgdHJhY2Ug
ZmlsZXMgdGhhdCBjYW4gYmUgZm9ybWF0dGVkIHdpdGggdGhlCi1zaW1wbGV0cmFjZS5weSBzY3Jp
cHQuICBUaGUgc2NyaXB0IHRha2VzIHRoZSAidHJhY2UtZXZlbnRzLWFsbCIgZmlsZSBhbmQgdGhl
Ci1iaW5hcnkgdHJhY2U6Ci0KLSAgICAuL3NjcmlwdHMvc2ltcGxldHJhY2UucHkgdHJhY2UtZXZl
bnRzLWFsbCB0cmFjZS0xMjM0NQotCi1Zb3UgbXVzdCBlbnN1cmUgdGhhdCB0aGUgc2FtZSAidHJh
Y2UtZXZlbnRzLWFsbCIgZmlsZSB3YXMgdXNlZCB0byBidWlsZCBRRU1VLAotb3RoZXJ3aXNlIHRy
YWNlIGV2ZW50IGRlY2xhcmF0aW9ucyBtYXkgaGF2ZSBjaGFuZ2VkIGFuZCBvdXRwdXQgd2lsbCBu
b3QgYmUKLWNvbnNpc3RlbnQuCi0KID09PSBMVFRuZyBVc2Vyc3BhY2UgVHJhY2VyID09PQogCiBU
aGUgInVzdCIgYmFja2VuZCB1c2VzIHRoZSBMVFRuZyBVc2Vyc3BhY2UgVHJhY2VyIGxpYnJhcnku
ICBUaGVyZSBhcmUgbm8KLS0gCjIuMjguMAoK


