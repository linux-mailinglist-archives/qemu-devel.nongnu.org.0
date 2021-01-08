Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B68D2EEC96
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:41:46 +0100 (CET)
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjar-0006wo-0f
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjOp-0006c0-7B
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:29:19 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:28203)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjOm-00059h-7d
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610080156; x=1641616156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uglsZ3eiI/MMkCcfScADMxe/ATBlY3PIwVJOHPBy3ws=;
 b=ipNgeQQef7S6QlZAJX3WDByGeSbwTMxxp90pYY/l5PgsjKzPgcUaKNqK
 kA6HwrbgOTI2fzXgnzWiwv9ferDEqrckJbmrxQL4iSdtMy4ALbn+7aIdP
 Zo4dwFU168kCw/UB1/RBm8Q4FYZV81RX+ptW3MsdZOWg++t//9XszWpVk U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Jan 2021 20:29:13 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 07 Jan 2021 20:29:12 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 7349CDDE; Thu,  7 Jan 2021 22:29:12 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/35] Hexagon (target/hexagon) architecture types
Date: Thu,  7 Jan 2021 22:28:40 -0600
Message-Id: <1610080146-14968-10-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 laurent@vivier.eu, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGVmaW5lIHR5cGVzIHVzZWQgaW4gZmlsZXMgaW1wb3J0ZWQgZnJvbSB0aGUgSGV4YWdvbiBhcmNo
aXRlY3R1cmUgbGlicmFyeQoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2hleF9hcmNoX3R5cGVzLmggfCAzOCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQvaGV4YWdvbi9oZXhfYXJj
aF90eXBlcy5oCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGV4X2FyY2hfdHlwZXMuaCBi
L3RhcmdldC9oZXhhZ29uL2hleF9hcmNoX3R5cGVzLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMC4uNTdkYzg0NgotLS0gL2Rldi9udWxsCisrKyBiL3RhcmdldC9oZXhhZ29uL2hl
eF9hcmNoX3R5cGVzLmgKQEAgLTAsMCArMSwzOCBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykgMjAx
OS0yMDIwIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2
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

