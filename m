Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEF227AE24
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 14:49:33 +0200 (CEST)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMsay-0000Ar-GD
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 08:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMsP1-00049E-H1
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 08:37:11 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:39956)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMsOv-0005ea-Et
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 08:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1601296625; x=1632832625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yzPuA1zckzOGZeCh3ls/K7zNpvDshLxJZF735IqMXzw=;
 b=p/b93IqaRvytfaE/hglB4nwa1ljcHwc80+shmpS7fK/skQe2ffLOtxrZ
 xBaXbKOIb1RaPwad/8OTBo0QNooq7KIXk/HRpSTAMAEeYKgZcmNnYUwLi
 DuIOS7whjNCPrRUztxy+qkO8XjFdXXYOa8TCMyCS6KlRLeCkjCS5O4Xrj k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Sep 2020 05:36:52 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 28 Sep 2020 05:36:52 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0C69E18F7; Mon, 28 Sep 2020 07:36:52 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: tsimpson@quicinc.com
Subject: [RFC PATCH v4 09/29] Hexagon (target/hexagon) architecture types
Date: Mon, 28 Sep 2020 07:36:28 -0500
Message-Id: <1601296608-29390-10-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601296608-29390-1-git-send-email-tsimpson@quicinc.com>
References: <1601296608-29390-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 08:36:52
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.199,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGVmaW5lIHR5cGVzIHVzZWQgaW4gZmlsZXMgaW1wb3J0ZWQgZnJvbSB0aGUgSGV4YWdvbiBhcmNo
aXRlY3R1cmUgbGlicmFyeQoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2hleF9hcmNoX3R5cGVzLmggfCA0MyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0YXJnZXQvaGV4YWdvbi9oZXhf
YXJjaF90eXBlcy5oCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGV4X2FyY2hfdHlwZXMu
aCBiL3RhcmdldC9oZXhhZ29uL2hleF9hcmNoX3R5cGVzLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMC4uZDljMzA4YgotLS0gL2Rldi9udWxsCisrKyBiL3RhcmdldC9oZXhhZ29u
L2hleF9hcmNoX3R5cGVzLmgKQEAgLTAsMCArMSw0MyBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykg
MjAxOS0yMDIwIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBv
cgorICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRoaXMg
cHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVs
LAorICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVk
IHdhcnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElD
VUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlzIHBy
b2dyYW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLwor
CisjaWZuZGVmIEhFWEFHT05fQVJDSF9UWVBFU19ICisjZGVmaW5lIEhFWEFHT05fQVJDSF9UWVBF
U19ICisKKyNpbmNsdWRlICJxZW11L29zZGVwLmgiCisKKy8qCisgKiBUaGVzZSB0eXBlcyBhcmUg
dXNlZCBieSB0aGUgY29kZSBnZW5lcmF0ZWQgZnJvbSB0aGUgSGV4YWdvbgorICogYXJjaGl0ZWN0
dXJlIGxpYnJhcnkuCisgKi8KK3R5cGVkZWYgdWludDhfdCAgICAgc2l6ZTF1X3Q7Cit0eXBlZGVm
IGludDhfdCAgICAgIHNpemUxc190OwordHlwZWRlZiB1aW50MTZfdCAgICBzaXplMnVfdDsKK3R5
cGVkZWYgaW50MTZfdCAgICAgc2l6ZTJzX3Q7Cit0eXBlZGVmIHVpbnQzMl90ICAgIHNpemU0dV90
OwordHlwZWRlZiBpbnQzMl90ICAgICBzaXplNHNfdDsKK3R5cGVkZWYgdWludDY0X3QgICAgc2l6
ZTh1X3Q7Cit0eXBlZGVmIGludDY0X3QgICAgIHNpemU4c190OwordHlwZWRlZiB1aW50NjRfdCAg
ICBwYWRkcl90OwordHlwZWRlZiB1aW50MzJfdCAgICB2YWRkcl90OworCit0eXBlZGVmIHN0cnVj
dCB7CisgICAgaW50NjRfdCBoaTsKKyAgICB1aW50NjRfdCBsbzsKK30gc2l6ZTE2c190OworCisj
ZW5kaWYKLS0gCjIuNy40Cgo=

