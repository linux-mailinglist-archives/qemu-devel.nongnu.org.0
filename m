Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1822FC93A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 04:41:44 +0100 (CET)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l24NL-00049l-7c
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 22:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24Bk-0007OD-Oz
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:44 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35229)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24Bi-0007VL-Ty
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611113382; x=1642649382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1MJp3pq6MEGRZ8doaXxcOcXsplPkkRO5g+VjqTaSO1M=;
 b=eeoRRDZrO2b9TK+zGNIyX0KKrrkcGGq1qTAIuWk4ckSufHCZz+jfiwgd
 JLyG/F8TEq+ZgwzYEYhqeUoGuRQn4PeWT+K8LKs7N7mJxmQHAHQCufffb
 /gqxwt5/lP5Wi/iwsdMPHLu94jbqsod4ie//cRujkFXuLOqm1llLWN7ox w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Jan 2021 19:29:25 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 19 Jan 2021 19:29:25 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id C844028DD; Tue, 19 Jan 2021 21:29:24 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/35] Hexagon (target/hexagon) architecture types
Date: Tue, 19 Jan 2021 21:28:42 -0600
Message-Id: <1611113349-24906-10-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGVmaW5lIHR5cGVzIHVzZWQgaW4gZmlsZXMgaW1wb3J0ZWQgZnJvbSB0aGUgSGV4YWdvbiBhcmNo
aXRlY3R1cmUgbGlicmFyeQoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2hleF9hcmNoX3R5cGVzLmggfCAzOCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQvaGV4YWdvbi9oZXhfYXJj
aF90eXBlcy5oCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGV4X2FyY2hfdHlwZXMuaCBi
L3RhcmdldC9oZXhhZ29uL2hleF9hcmNoX3R5cGVzLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMC4uZDcyMWUxZgotLS0gL2Rldi9udWxsCisrKyBiL3RhcmdldC9oZXhhZ29uL2hl
eF9hcmNoX3R5cGVzLmgKQEAgLTAsMCArMSwzOCBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykgMjAx
OS0yMDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgor
ICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRoaXMgcHJv
Z3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAor
ICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlzIHByb2dy
YW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLworCisj
aWZuZGVmIEhFWEFHT05fQVJDSF9UWVBFU19ICisjZGVmaW5lIEhFWEFHT05fQVJDSF9UWVBFU19I
CisKKyNpbmNsdWRlICJxZW11L29zZGVwLmgiCisjaW5jbHVkZSAicWVtdS9pbnQxMjguaCIKKwor
LyoKKyAqIFRoZXNlIHR5cGVzIGFyZSB1c2VkIGJ5IHRoZSBjb2RlIGltcG9ydGVkIGZyb20gdGhl
IEhleGFnb24KKyAqIGFyY2hpdGVjdHVyZSBsaWJyYXJ5LgorICovCit0eXBlZGVmIHVpbnQ4X3Qg
ICAgIHNpemUxdV90OwordHlwZWRlZiBpbnQ4X3QgICAgICBzaXplMXNfdDsKK3R5cGVkZWYgdWlu
dDE2X3QgICAgc2l6ZTJ1X3Q7Cit0eXBlZGVmIGludDE2X3QgICAgIHNpemUyc190OwordHlwZWRl
ZiB1aW50MzJfdCAgICBzaXplNHVfdDsKK3R5cGVkZWYgaW50MzJfdCAgICAgc2l6ZTRzX3Q7Cit0
eXBlZGVmIHVpbnQ2NF90ICAgIHNpemU4dV90OwordHlwZWRlZiBpbnQ2NF90ICAgICBzaXplOHNf
dDsKK3R5cGVkZWYgSW50MTI4ICAgICAgc2l6ZTE2c190OworCisjZW5kaWYKLS0gCjIuNy40Cgo=

