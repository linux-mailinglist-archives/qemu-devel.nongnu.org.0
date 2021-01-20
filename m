Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC52FC8F2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 04:31:55 +0100 (CET)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l24Dp-0000Mb-KB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 22:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24BY-000767-HX
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:33 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35229)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24BV-0007VL-U0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611113369; x=1642649369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t4ONIu77Xf2h4tc+uKjtqSNMhrcy1lFEdiLfynA9EG0=;
 b=nUId7vMvsIBfBkSMWaLOyHoZvGTFzsgmQkhtrIKv5oeG2xNmU8F7J/y/
 mI8KG41XlaVBmsVw5exw8F9UuifZuiqhPpSCGkAMPR2TViGgiRGLsZGIE
 xzU+k99EzhqIf+p5Nl/oT7/fUC3EDtvjTJET5keEFqiRX2AK3wl1SKpY7 A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Jan 2021 19:29:24 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 19 Jan 2021 19:29:24 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id EC93228DD; Tue, 19 Jan 2021 21:29:23 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/35] Hexagon Update MAINTAINERS file
Date: Tue, 19 Jan 2021 21:28:34 -0600
Message-Id: <1611113349-24906-2-git-send-email-tsimpson@quicinc.com>
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

QWRkIFRheWxvciBTaW1wc29uIGFzIHRoZSBIZXhhZ29uIHRhcmdldCBtYWludGFpbmVyCgpTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2Vk
LWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0t
CiBNQUlOVEFJTkVSUyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAzMjE2Mzg3
Li5iMDdjZWI0IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAt
MTg3LDYgKzE4NywxNSBAQCBGOiBpbmNsdWRlL2h3L2NyaXMvCiBGOiB0ZXN0cy90Y2cvY3Jpcy8K
IEY6IGRpc2FzL2NyaXMuYwogCitIZXhhZ29uIFRDRyBDUFVzCitNOiBUYXlsb3IgU2ltcHNvbiA8
dHNpbXBzb25AcXVpY2luYy5jb20+CitTOiBTdXBwb3J0ZWQKK0Y6IHRhcmdldC9oZXhhZ29uLwor
RjogbGludXgtdXNlci9oZXhhZ29uLworRjogdGVzdHMvdGNnL2hleGFnb24vCitGOiBkaXNhcy9o
ZXhhZ29uLmMKK0Y6IGRlZmF1bHQtY29uZmlncy90YXJnZXRzL2hleGFnb24tbGludXgtdXNlci5t
YWsKKwogSFBQQSAoUEEtUklTQykgVENHIENQVXMKIE06IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgogUzogTWFpbnRhaW5lZAotLSAKMi43LjQKCg==

