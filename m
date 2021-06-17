Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292E3ABE66
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 23:54:33 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltzy4-00075I-Hx
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 17:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ltzwR-00055Y-66
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:52:51 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:51073)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ltzwN-0006ey-LP
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1623966767; x=1655502767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4RUnVfTOA4mAKOa2UjGfDaIT+7bEuUcmOF2wLdp4GxI=;
 b=a/ElXBMybteDNatR6qYLSV4tfKJTpih94/Z6Fbci2G2ktRGgLJhN1h5e
 RDjkls1/3G8LzDHZFsd7Rly5nAzJPRWA4FL0XRFbXllndGSsEA3tSvo0G
 qbBz4za8bOrsKSBLKCtF1tFIciQ73cbbrDiev1z0jU9L5eX7H/hqZ0618 s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Jun 2021 14:52:44 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg03-sd.qualcomm.com with ESMTP; 17 Jun 2021 14:52:44 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D5E44FF9; Thu, 17 Jun 2021 16:52:43 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: tsimpson@quicinc.com
Subject: [PULL 4/4] Hexagon (target/hexagon) remove unused TCG variables
Date: Thu, 17 Jun 2021 16:52:35 -0500
Message-Id: <1623966755-30225-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623966755-30225-1-git-send-email-tsimpson@quicinc.com>
References: <1623966755-30225-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgfCAgNiAtLS0tLS0KIHRhcmdldC9oZXhh
Z29uL3RyYW5zbGF0ZS5jIHwgMTEgKystLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9n
ZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IGJkMThjYjEuLjVkYmFiZTAg
MTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29u
L2dlbnB0ci5jCkBAIC0xMjEsMTAgKzEyMSw3IEBAIHN0YXRpYyB2b2lkIGdlbl9sb2dfcmVnX3dy
aXRlX3BhaXIoaW50IHJudW0sIFRDR3ZfaTY0IHZhbCkKIAogc3RhdGljIGlubGluZSB2b2lkIGdl
bl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0sIFRDR3YgdmFsKQog
ewotICAgIFRDR3YgemVybyA9IHRjZ19jb25zdF90bCgwKTsKICAgICBUQ0d2IGJhc2VfdmFsID0g
dGNnX3RlbXBfbmV3KCk7Ci0gICAgVENHdiBhbmRfdmFsID0gdGNnX3RlbXBfbmV3KCk7Ci0gICAg
VENHdiBwcmVkX3dyaXR0ZW4gPSB0Y2dfdGVtcF9uZXcoKTsKIAogICAgIHRjZ19nZW5fYW5kaV90
bChiYXNlX3ZhbCwgdmFsLCAweGZmKTsKIApAQCAtMTQzLDEwICsxNDAsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgZ2VuX2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcG51bSwg
VENHdiB2YWwpCiAgICAgfQogICAgIHRjZ19nZW5fb3JpX3RsKGhleF9wcmVkX3dyaXR0ZW4sIGhl
eF9wcmVkX3dyaXR0ZW4sIDEgPDwgcG51bSk7CiAKLSAgICB0Y2dfdGVtcF9mcmVlKHplcm8pOwog
ICAgIHRjZ190ZW1wX2ZyZWUoYmFzZV92YWwpOwotICAgIHRjZ190ZW1wX2ZyZWUoYW5kX3ZhbCk7
Ci0gICAgdGNnX3RlbXBfZnJlZShwcmVkX3dyaXR0ZW4pOwogfQogCiBzdGF0aWMgaW5saW5lIHZv
aWQgZ2VuX3JlYWRfcDNfMChUQ0d2IGNvbnRyb2xfcmVnKQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vdHJhbnNsYXRlLmMgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwppbmRleCA5YTM3
NjQ0Li5iMjNkMzZhIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYworKysg
Yi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwpAQCAtMjczLDcgKzI3Myw2IEBAIHN0YXRpYyB2
b2lkIGdlbl9yZWdfd3JpdGVzKERpc2FzQ29udGV4dCAqY3R4KQogCiBzdGF0aWMgdm9pZCBnZW5f
cHJlZF93cml0ZXMoRGlzYXNDb250ZXh0ICpjdHgsIFBhY2tldCAqcGt0KQogewotICAgIFRDR3Yg
emVybywgY29udHJvbF9yZWcsIHB2YWw7CiAgICAgaW50IGk7CiAKICAgICAvKiBFYXJseSBleGl0
IGlmIHRoZSBsb2cgaXMgZW1wdHkgKi8KQEAgLTI4MSwxMCArMjgwLDYgQEAgc3RhdGljIHZvaWQg
Z2VuX3ByZWRfd3JpdGVzKERpc2FzQ29udGV4dCAqY3R4LCBQYWNrZXQgKnBrdCkKICAgICAgICAg
cmV0dXJuOwogICAgIH0KIAotICAgIHplcm8gPSB0Y2dfY29uc3RfdGwoMCk7Ci0gICAgY29udHJv
bF9yZWcgPSB0Y2dfdGVtcF9uZXcoKTsKLSAgICBwdmFsID0gdGNnX3RlbXBfbmV3KCk7Ci0KICAg
ICAvKgogICAgICAqIE9ubHkgZW5kbG9vcCBpbnN0cnVjdGlvbnMgd2lsbCBjb25kaXRpb25hbGx5
CiAgICAgICogd3JpdGUgYSBwcmVkaWNhdGUuICBJZiB0aGVyZSBhcmUgbm8gZW5kbG9vcApAQCAt
MjkyLDYgKzI4Nyw3IEBAIHN0YXRpYyB2b2lkIGdlbl9wcmVkX3dyaXRlcyhEaXNhc0NvbnRleHQg
KmN0eCwgUGFja2V0ICpwa3QpCiAgICAgICogd3JpdGUgb2YgdGhlIHByZWRpY2F0ZXMuCiAgICAg
ICovCiAgICAgaWYgKHBrdC0+cGt0X2hhc19lbmRsb29wKSB7CisgICAgICAgIFRDR3YgemVybyA9
IHRjZ19jb25zdF90bCgwKTsKICAgICAgICAgVENHdiBwcmVkX3dyaXR0ZW4gPSB0Y2dfdGVtcF9u
ZXcoKTsKICAgICAgICAgZm9yIChpID0gMDsgaSA8IGN0eC0+cHJlZ19sb2dfaWR4OyBpKyspIHsK
ICAgICAgICAgICAgIGludCBwcmVkX251bSA9IGN0eC0+cHJlZ19sb2dbaV07CkBAIC0zMDIsNiAr
Mjk4LDcgQEAgc3RhdGljIHZvaWQgZ2VuX3ByZWRfd3JpdGVzKERpc2FzQ29udGV4dCAqY3R4LCBQ
YWNrZXQgKnBrdCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZXhfbmV3X3ByZWRf
dmFsdWVbcHJlZF9udW1dLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhleF9wcmVk
W3ByZWRfbnVtXSk7CiAgICAgICAgIH0KKyAgICAgICAgdGNnX3RlbXBfZnJlZSh6ZXJvKTsKICAg
ICAgICAgdGNnX3RlbXBfZnJlZShwcmVkX3dyaXR0ZW4pOwogICAgIH0gZWxzZSB7CiAgICAgICAg
IGZvciAoaSA9IDA7IGkgPCBjdHgtPnByZWdfbG9nX2lkeDsgaSsrKSB7CkBAIC0zMTQsMTAgKzMx
MSw2IEBAIHN0YXRpYyB2b2lkIGdlbl9wcmVkX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCwgUGFj
a2V0ICpwa3QpCiAgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9Ci0KLSAgICB0Y2dfdGVt
cF9mcmVlKHplcm8pOwotICAgIHRjZ190ZW1wX2ZyZWUoY29udHJvbF9yZWcpOwotICAgIHRjZ190
ZW1wX2ZyZWUocHZhbCk7CiB9CiAKIHN0YXRpYyB2b2lkIGdlbl9jaGVja19zdG9yZV93aWR0aChE
aXNhc0NvbnRleHQgKmN0eCwgaW50IHNsb3RfbnVtKQotLSAKMi43LjQKCg==

