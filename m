Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C43B7701
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:17:21 +0200 (CEST)
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHMO-000098-Pb
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lyHK4-0005sT-SR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:14:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:64090)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lyHK2-0001dl-81
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1624986894; x=1656522894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7rXWaOOXZpLpJQOJXiUNrlSMCVamlhW+D5+ICNQuJw=;
 b=UBdnRE47aSnEKeoRXqhemdHNO4mfpdvfumVvNPJCt1hyFZ3OgOihsXkH
 P9uOa2+s6PXoZuAumiEB8tPuZZmz3KTzGq/XY0fp2+PddGiZ1Cpkeql8E
 pk+HybdZdVvRsjiIAnrVJnUz16QnHj6rFC89LwQSydgkC8AQW+bKHhQ5h 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Jun 2021 10:14:51 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 29 Jun 2021 10:14:50 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 9FE69EE0; Tue, 29 Jun 2021 12:14:50 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 4/4] Hexagon (target/hexagon) remove unused TCG variables
Date: Tue, 29 Jun 2021 12:14:36 -0500
Message-Id: <1624986876-2264-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624986876-2264-1-git-send-email-tsimpson@quicinc.com>
References: <1624986876-2264-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+
Ck1lc3NhZ2UtSWQ6IDwxNjIyNTg5NTg0LTIyNTcxLTUtZ2l0LXNlbmQtZW1haWwtdHNpbXBzb25A
cXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgfCAgNiAtLS0tLS0K
IHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIHwgMTEgKystLS0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IGZiYTVl
YzYuLjczMzMyOTkgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3Rh
cmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC0xMTUsMTAgKzExNSw3IEBAIHN0YXRpYyB2b2lkIGdl
bl9sb2dfcmVnX3dyaXRlX3BhaXIoaW50IHJudW0sIFRDR3ZfaTY0IHZhbCkKIAogc3RhdGljIGlu
bGluZSB2b2lkIGdlbl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0s
IFRDR3YgdmFsKQogewotICAgIFRDR3YgemVybyA9IHRjZ19jb25zdF90bCgwKTsKICAgICBUQ0d2
IGJhc2VfdmFsID0gdGNnX3RlbXBfbmV3KCk7Ci0gICAgVENHdiBhbmRfdmFsID0gdGNnX3RlbXBf
bmV3KCk7Ci0gICAgVENHdiBwcmVkX3dyaXR0ZW4gPSB0Y2dfdGVtcF9uZXcoKTsKIAogICAgIHRj
Z19nZW5fYW5kaV90bChiYXNlX3ZhbCwgdmFsLCAweGZmKTsKIApAQCAtMTM3LDEwICsxMzQsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4
LCBpbnQgcG51bSwgVENHdiB2YWwpCiAgICAgfQogICAgIHRjZ19nZW5fb3JpX3RsKGhleF9wcmVk
X3dyaXR0ZW4sIGhleF9wcmVkX3dyaXR0ZW4sIDEgPDwgcG51bSk7CiAKLSAgICB0Y2dfdGVtcF9m
cmVlKHplcm8pOwogICAgIHRjZ190ZW1wX2ZyZWUoYmFzZV92YWwpOwotICAgIHRjZ190ZW1wX2Zy
ZWUoYW5kX3ZhbCk7Ci0gICAgdGNnX3RlbXBfZnJlZShwcmVkX3dyaXR0ZW4pOwogfQogCiBzdGF0
aWMgaW5saW5lIHZvaWQgZ2VuX3JlYWRfcDNfMChUQ0d2IGNvbnRyb2xfcmVnKQpkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUu
YwppbmRleCA5YTM3NjQ0Li5iMjNkMzZhIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFu
c2xhdGUuYworKysgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwpAQCAtMjczLDcgKzI3Myw2
IEBAIHN0YXRpYyB2b2lkIGdlbl9yZWdfd3JpdGVzKERpc2FzQ29udGV4dCAqY3R4KQogCiBzdGF0
aWMgdm9pZCBnZW5fcHJlZF93cml0ZXMoRGlzYXNDb250ZXh0ICpjdHgsIFBhY2tldCAqcGt0KQog
ewotICAgIFRDR3YgemVybywgY29udHJvbF9yZWcsIHB2YWw7CiAgICAgaW50IGk7CiAKICAgICAv
KiBFYXJseSBleGl0IGlmIHRoZSBsb2cgaXMgZW1wdHkgKi8KQEAgLTI4MSwxMCArMjgwLDYgQEAg
c3RhdGljIHZvaWQgZ2VuX3ByZWRfd3JpdGVzKERpc2FzQ29udGV4dCAqY3R4LCBQYWNrZXQgKnBr
dCkKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAotICAgIHplcm8gPSB0Y2dfY29uc3RfdGwoMCk7
Ci0gICAgY29udHJvbF9yZWcgPSB0Y2dfdGVtcF9uZXcoKTsKLSAgICBwdmFsID0gdGNnX3RlbXBf
bmV3KCk7Ci0KICAgICAvKgogICAgICAqIE9ubHkgZW5kbG9vcCBpbnN0cnVjdGlvbnMgd2lsbCBj
b25kaXRpb25hbGx5CiAgICAgICogd3JpdGUgYSBwcmVkaWNhdGUuICBJZiB0aGVyZSBhcmUgbm8g
ZW5kbG9vcApAQCAtMjkyLDYgKzI4Nyw3IEBAIHN0YXRpYyB2b2lkIGdlbl9wcmVkX3dyaXRlcyhE
aXNhc0NvbnRleHQgKmN0eCwgUGFja2V0ICpwa3QpCiAgICAgICogd3JpdGUgb2YgdGhlIHByZWRp
Y2F0ZXMuCiAgICAgICovCiAgICAgaWYgKHBrdC0+cGt0X2hhc19lbmRsb29wKSB7CisgICAgICAg
IFRDR3YgemVybyA9IHRjZ19jb25zdF90bCgwKTsKICAgICAgICAgVENHdiBwcmVkX3dyaXR0ZW4g
PSB0Y2dfdGVtcF9uZXcoKTsKICAgICAgICAgZm9yIChpID0gMDsgaSA8IGN0eC0+cHJlZ19sb2df
aWR4OyBpKyspIHsKICAgICAgICAgICAgIGludCBwcmVkX251bSA9IGN0eC0+cHJlZ19sb2dbaV07
CkBAIC0zMDIsNiArMjk4LDcgQEAgc3RhdGljIHZvaWQgZ2VuX3ByZWRfd3JpdGVzKERpc2FzQ29u
dGV4dCAqY3R4LCBQYWNrZXQgKnBrdCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
ZXhfbmV3X3ByZWRfdmFsdWVbcHJlZF9udW1dLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGhleF9wcmVkW3ByZWRfbnVtXSk7CiAgICAgICAgIH0KKyAgICAgICAgdGNnX3RlbXBfZnJl
ZSh6ZXJvKTsKICAgICAgICAgdGNnX3RlbXBfZnJlZShwcmVkX3dyaXR0ZW4pOwogICAgIH0gZWxz
ZSB7CiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjdHgtPnByZWdfbG9nX2lkeDsgaSsrKSB7CkBA
IC0zMTQsMTAgKzMxMSw2IEBAIHN0YXRpYyB2b2lkIGdlbl9wcmVkX3dyaXRlcyhEaXNhc0NvbnRl
eHQgKmN0eCwgUGFja2V0ICpwa3QpCiAgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9Ci0K
LSAgICB0Y2dfdGVtcF9mcmVlKHplcm8pOwotICAgIHRjZ190ZW1wX2ZyZWUoY29udHJvbF9yZWcp
OwotICAgIHRjZ190ZW1wX2ZyZWUocHZhbCk7CiB9CiAKIHN0YXRpYyB2b2lkIGdlbl9jaGVja19z
dG9yZV93aWR0aChEaXNhc0NvbnRleHQgKmN0eCwgaW50IHNsb3RfbnVtKQotLSAKMi43LjQKCg==

