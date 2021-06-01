Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FA4397D01
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:24:42 +0200 (CEST)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loDkX-0003TA-Lg
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDfu-0003oE-Pt
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:54 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:25587)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1loDfs-00068D-R8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1622589592; x=1654125592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rv5DBS1Musmf13fPECtlUJXKVvSBh0Y++ngJBgfyDeA=;
 b=oqK0ZP+aYgyw4SE0FEm0bZTxpVOyZNZm6CVE4upmC4LAMyR/h12PeAI4
 nchA8DKHvGK55gRI456xFK5xV7Ub2AMjRLxg4dgWpsywJXqIzx+ZDJCD2
 6DedmK3fIw4sFRAUZ52HChUcaI1MJTudjD61ClRPItqEMmh2tKO2WVjnx k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Jun 2021 16:19:46 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 01 Jun 2021 16:19:46 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 4EC89F03; Tue,  1 Jun 2021 18:19:46 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] Hexagon (target/hexagon) remove unused TCG variables
Date: Tue,  1 Jun 2021 18:19:44 -0500
Message-Id: <1622589584-22571-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
References: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgIDYgLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi90
cmFuc2xhdGUuYyB8IDExICsrLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCBiZDE4Y2IxLi41ZGJhYmUwIDEwMDY0
NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJnZXQvaGV4YWdvbi9nZW5w
dHIuYwpAQCAtMTIxLDEwICsxMjEsNyBAQCBzdGF0aWMgdm9pZCBnZW5fbG9nX3JlZ193cml0ZV9w
YWlyKGludCBybnVtLCBUQ0d2X2k2NCB2YWwpCiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fbG9n
X3ByZWRfd3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIGludCBwbnVtLCBUQ0d2IHZhbCkKIHsKLSAg
ICBUQ0d2IHplcm8gPSB0Y2dfY29uc3RfdGwoMCk7CiAgICAgVENHdiBiYXNlX3ZhbCA9IHRjZ190
ZW1wX25ldygpOwotICAgIFRDR3YgYW5kX3ZhbCA9IHRjZ190ZW1wX25ldygpOwotICAgIFRDR3Yg
cHJlZF93cml0dGVuID0gdGNnX3RlbXBfbmV3KCk7CiAKICAgICB0Y2dfZ2VuX2FuZGlfdGwoYmFz
ZV92YWwsIHZhbCwgMHhmZik7CiAKQEAgLTE0MywxMCArMTQwLDcgQEAgc3RhdGljIGlubGluZSB2
b2lkIGdlbl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0sIFRDR3Yg
dmFsKQogICAgIH0KICAgICB0Y2dfZ2VuX29yaV90bChoZXhfcHJlZF93cml0dGVuLCBoZXhfcHJl
ZF93cml0dGVuLCAxIDw8IHBudW0pOwogCi0gICAgdGNnX3RlbXBfZnJlZSh6ZXJvKTsKICAgICB0
Y2dfdGVtcF9mcmVlKGJhc2VfdmFsKTsKLSAgICB0Y2dfdGVtcF9mcmVlKGFuZF92YWwpOwotICAg
IHRjZ190ZW1wX2ZyZWUocHJlZF93cml0dGVuKTsKIH0KIAogc3RhdGljIGlubGluZSB2b2lkIGdl
bl9yZWFkX3AzXzAoVENHdiBjb250cm9sX3JlZykKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29u
L3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKaW5kZXggOWEzNzY0NC4u
YjIzZDM2YSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKKysrIGIvdGFy
Z2V0L2hleGFnb24vdHJhbnNsYXRlLmMKQEAgLTI3Myw3ICsyNzMsNiBAQCBzdGF0aWMgdm9pZCBn
ZW5fcmVnX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCkKIAogc3RhdGljIHZvaWQgZ2VuX3ByZWRf
d3JpdGVzKERpc2FzQ29udGV4dCAqY3R4LCBQYWNrZXQgKnBrdCkKIHsKLSAgICBUQ0d2IHplcm8s
IGNvbnRyb2xfcmVnLCBwdmFsOwogICAgIGludCBpOwogCiAgICAgLyogRWFybHkgZXhpdCBpZiB0
aGUgbG9nIGlzIGVtcHR5ICovCkBAIC0yODEsMTAgKzI4MCw2IEBAIHN0YXRpYyB2b2lkIGdlbl9w
cmVkX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCwgUGFja2V0ICpwa3QpCiAgICAgICAgIHJldHVy
bjsKICAgICB9CiAKLSAgICB6ZXJvID0gdGNnX2NvbnN0X3RsKDApOwotICAgIGNvbnRyb2xfcmVn
ID0gdGNnX3RlbXBfbmV3KCk7Ci0gICAgcHZhbCA9IHRjZ190ZW1wX25ldygpOwotCiAgICAgLyoK
ICAgICAgKiBPbmx5IGVuZGxvb3AgaW5zdHJ1Y3Rpb25zIHdpbGwgY29uZGl0aW9uYWxseQogICAg
ICAqIHdyaXRlIGEgcHJlZGljYXRlLiAgSWYgdGhlcmUgYXJlIG5vIGVuZGxvb3AKQEAgLTI5Miw2
ICsyODcsNyBAQCBzdGF0aWMgdm9pZCBnZW5fcHJlZF93cml0ZXMoRGlzYXNDb250ZXh0ICpjdHgs
IFBhY2tldCAqcGt0KQogICAgICAqIHdyaXRlIG9mIHRoZSBwcmVkaWNhdGVzLgogICAgICAqLwog
ICAgIGlmIChwa3QtPnBrdF9oYXNfZW5kbG9vcCkgeworICAgICAgICBUQ0d2IHplcm8gPSB0Y2df
Y29uc3RfdGwoMCk7CiAgICAgICAgIFRDR3YgcHJlZF93cml0dGVuID0gdGNnX3RlbXBfbmV3KCk7
CiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjdHgtPnByZWdfbG9nX2lkeDsgaSsrKSB7CiAgICAg
ICAgICAgICBpbnQgcHJlZF9udW0gPSBjdHgtPnByZWdfbG9nW2ldOwpAQCAtMzAyLDYgKzI5OCw3
IEBAIHN0YXRpYyB2b2lkIGdlbl9wcmVkX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCwgUGFja2V0
ICpwa3QpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGV4X25ld19wcmVkX3ZhbHVl
W3ByZWRfbnVtXSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZXhfcHJlZFtwcmVk
X251bV0pOwogICAgICAgICB9CisgICAgICAgIHRjZ190ZW1wX2ZyZWUoemVybyk7CiAgICAgICAg
IHRjZ190ZW1wX2ZyZWUocHJlZF93cml0dGVuKTsKICAgICB9IGVsc2UgewogICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgY3R4LT5wcmVnX2xvZ19pZHg7IGkrKykgewpAQCAtMzE0LDEwICszMTEsNiBA
QCBzdGF0aWMgdm9pZCBnZW5fcHJlZF93cml0ZXMoRGlzYXNDb250ZXh0ICpjdHgsIFBhY2tldCAq
cGt0KQogICAgICAgICAgICAgfQogICAgICAgICB9CiAgICAgfQotCi0gICAgdGNnX3RlbXBfZnJl
ZSh6ZXJvKTsKLSAgICB0Y2dfdGVtcF9mcmVlKGNvbnRyb2xfcmVnKTsKLSAgICB0Y2dfdGVtcF9m
cmVlKHB2YWwpOwogfQogCiBzdGF0aWMgdm9pZCBnZW5fY2hlY2tfc3RvcmVfd2lkdGgoRGlzYXND
b250ZXh0ICpjdHgsIGludCBzbG90X251bSkKLS0gCjIuNy40Cgo=

