Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51B42DC3CD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:14:30 +0100 (CET)
Received: from localhost ([::1]:52992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZRd-0003YW-WC
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZMx-0007ym-TX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpZMw-0004ej-8H
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608134977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBTtdJa574Gz+I23wi2vOTukC40N79vjaWr4nXtBTFQ=;
 b=DbENpSxijNfzK7gL/4SX5DcGEGhjkk3+myD9MqDaRnRdi1UFJowLsAJJJFr9Q965UqLlq/
 ObQRjWYJ26tokJ47myXt5sXa6sbnZgP3ArAAeQMB0H+WCzLyr/0K8Z+PMjmAvLw/fhJz7d
 XFiTa0IyvfL9oAZvQB7UNxZpXK/hbZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-w8IGefgJOgS6SWm52QHEqQ-1; Wed, 16 Dec 2020 11:09:35 -0500
X-MC-Unique: w8IGefgJOgS6SWm52QHEqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67FCA107ACFE;
 Wed, 16 Dec 2020 16:09:34 +0000 (UTC)
Received: from localhost (ovpn-115-151.ams2.redhat.com [10.36.115.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E681D18227;
 Wed, 16 Dec 2020 16:09:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] trace: fix simpletrace doc mismerge
Date: Wed, 16 Dec 2020 16:09:21 +0000
Message-Id: <20201216160923.722894-2-stefanha@redhat.com>
In-Reply-To: <20201216160923.722894-1-stefanha@redhat.com>
References: <20201216160923.722894-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
ICgidHJhY2U6IGRvY3VtZW50IGZ0cmFjZSBiYWNrZW5kIikKUmV2aWV3ZWQtYnk6IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGRvY3MvZGV2ZWwvdHJhY2luZy50eHQg
fCAzNCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9kZXZl
bC90cmFjaW5nLnR4dCBiL2RvY3MvZGV2ZWwvdHJhY2luZy50eHQKaW5kZXggZDIxNjA2NTViNC4u
YmY2MTdiYTk3NiAxMDA2NDQKLS0tIGEvZG9jcy9kZXZlbC90cmFjaW5nLnR4dAorKysgYi9kb2Nz
L2RldmVsL3RyYWNpbmcudHh0CkBAIC0yMTgsNiArMjE4LDIzIEBAIHNvdXJjZSB0cmVlLiAgSXQg
bWF5IG5vdCBiZSBhcyBwb3dlcmZ1bCBhcyBwbGF0Zm9ybS1zcGVjaWZpYyBvciB0aGlyZC1wYXJ0
eQogdHJhY2UgYmFja2VuZHMgYnV0IGl0IGlzIHBvcnRhYmxlLiAgVGhpcyBpcyB0aGUgcmVjb21t
ZW5kZWQgdHJhY2UgYmFja2VuZAogdW5sZXNzIHlvdSBoYXZlIHNwZWNpZmljIG5lZWRzIGZvciBt
b3JlIGFkdmFuY2VkIGJhY2tlbmRzLgogCis9PT09IE1vbml0b3IgY29tbWFuZHMgPT09PQorCisq
IHRyYWNlLWZpbGUgb258b2ZmfGZsdXNofHNldCA8cGF0aD4KKyAgRW5hYmxlL2Rpc2FibGUvZmx1
c2ggdGhlIHRyYWNlIGZpbGUgb3Igc2V0IHRoZSB0cmFjZSBmaWxlIG5hbWUuCisKKz09PT0gQW5h
bHl6aW5nIHRyYWNlIGZpbGVzID09PT0KKworVGhlICJzaW1wbGUiIGJhY2tlbmQgcHJvZHVjZXMg
YmluYXJ5IHRyYWNlIGZpbGVzIHRoYXQgY2FuIGJlIGZvcm1hdHRlZCB3aXRoIHRoZQorc2ltcGxl
dHJhY2UucHkgc2NyaXB0LiAgVGhlIHNjcmlwdCB0YWtlcyB0aGUgInRyYWNlLWV2ZW50cy1hbGwi
IGZpbGUgYW5kIHRoZQorYmluYXJ5IHRyYWNlOgorCisgICAgLi9zY3JpcHRzL3NpbXBsZXRyYWNl
LnB5IHRyYWNlLWV2ZW50cy1hbGwgdHJhY2UtMTIzNDUKKworWW91IG11c3QgZW5zdXJlIHRoYXQg
dGhlIHNhbWUgInRyYWNlLWV2ZW50cy1hbGwiIGZpbGUgd2FzIHVzZWQgdG8gYnVpbGQgUUVNVSwK
K290aGVyd2lzZSB0cmFjZSBldmVudCBkZWNsYXJhdGlvbnMgbWF5IGhhdmUgY2hhbmdlZCBhbmQg
b3V0cHV0IHdpbGwgbm90IGJlCitjb25zaXN0ZW50LgorCiA9PT0gRnRyYWNlID09PQogCiBUaGUg
ImZ0cmFjZSIgYmFja2VuZCB3cml0ZXMgdHJhY2UgZGF0YSB0byBmdHJhY2UgbWFya2VyLiBUaGlz
IGVmZmVjdGl2ZWx5CkBAIC0yNDYsMjMgKzI2Myw2IEBAIE5PVEU6IHN5c2xvZyBtYXkgc3F1YXNo
IGR1cGxpY2F0ZSBjb25zZWN1dGl2ZSB0cmFjZSBldmVudHMgYW5kIGFwcGx5IHJhdGUKIAogUmVz
dHJpY3Rpb246ICJzeXNsb2ciIGJhY2tlbmQgaXMgcmVzdHJpY3RlZCB0byBQT1NJWCBjb21wbGlh
bnQgT1MuCiAKLT09PT0gTW9uaXRvciBjb21tYW5kcyA9PT09Ci0KLSogdHJhY2UtZmlsZSBvbnxv
ZmZ8Zmx1c2h8c2V0IDxwYXRoPgotICBFbmFibGUvZGlzYWJsZS9mbHVzaCB0aGUgdHJhY2UgZmls
ZSBvciBzZXQgdGhlIHRyYWNlIGZpbGUgbmFtZS4KLQotPT09PSBBbmFseXppbmcgdHJhY2UgZmls
ZXMgPT09PQotCi1UaGUgInNpbXBsZSIgYmFja2VuZCBwcm9kdWNlcyBiaW5hcnkgdHJhY2UgZmls
ZXMgdGhhdCBjYW4gYmUgZm9ybWF0dGVkIHdpdGggdGhlCi1zaW1wbGV0cmFjZS5weSBzY3JpcHQu
ICBUaGUgc2NyaXB0IHRha2VzIHRoZSAidHJhY2UtZXZlbnRzLWFsbCIgZmlsZSBhbmQgdGhlCi1i
aW5hcnkgdHJhY2U6Ci0KLSAgICAuL3NjcmlwdHMvc2ltcGxldHJhY2UucHkgdHJhY2UtZXZlbnRz
LWFsbCB0cmFjZS0xMjM0NQotCi1Zb3UgbXVzdCBlbnN1cmUgdGhhdCB0aGUgc2FtZSAidHJhY2Ut
ZXZlbnRzLWFsbCIgZmlsZSB3YXMgdXNlZCB0byBidWlsZCBRRU1VLAotb3RoZXJ3aXNlIHRyYWNl
IGV2ZW50IGRlY2xhcmF0aW9ucyBtYXkgaGF2ZSBjaGFuZ2VkIGFuZCBvdXRwdXQgd2lsbCBub3Qg
YmUKLWNvbnNpc3RlbnQuCi0KID09PSBMVFRuZyBVc2Vyc3BhY2UgVHJhY2VyID09PQogCiBUaGUg
InVzdCIgYmFja2VuZCB1c2VzIHRoZSBMVFRuZyBVc2Vyc3BhY2UgVHJhY2VyIGxpYnJhcnkuICBU
aGVyZSBhcmUgbm8KLS0gCjIuMjkuMgoK


