Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9F2EEC99
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:43:04 +0100 (CET)
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjc7-0000Oz-LR
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjOn-0006Xh-M3
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:29:17 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:27789)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjOl-00058D-GY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610080155; x=1641616155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pIuMENVkXer5VWqZ6YCCseSEhptjp26eJIUDlklDgSE=;
 b=tTRh2dsDVhwrvkHzM8T+3DDoYprJ/ELFz88f8dKupvsmumC8g+czXfsj
 mMAtOyZrqhXAO8Cw3unZGk1DbFIhPcTCwshbTfCqvxjWpCZxMotzZ9Kib
 2sAE5MAWcMucnZhIQ8Rt+7ufNNvw7Ul7AXlhzVLlxSX/Re+aX6zpqY0Gq I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Jan 2021 20:29:12 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 07 Jan 2021 20:29:11 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 82540DDE; Thu,  7 Jan 2021 22:29:11 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/35] Hexagon Update MAINTAINERS file
Date: Thu,  7 Jan 2021 22:28:32 -0600
Message-Id: <1610080146-14968-2-git-send-email-tsimpson@quicinc.com>
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

QWRkIFRheWxvciBTaW1wc29uIGFzIHRoZSBIZXhhZ29uIHRhcmdldCBtYWludGFpbmVyCgpTaWdu
ZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2Vk
LWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0t
CiBNQUlOVEFJTkVSUyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDQyZmVkZjku
LmE4ODRhZDggMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0x
ODUsNiArMTg1LDE0IEBAIEY6IGluY2x1ZGUvaHcvY3Jpcy8KIEY6IHRlc3RzL3RjZy9jcmlzLwog
RjogZGlzYXMvY3Jpcy5jCiAKK0hleGFnb24gVENHIENQVXMKK006IFRheWxvciBTaW1wc29uIDx0
c2ltcHNvbkBxdWljaW5jLmNvbT4KK1M6IFN1cHBvcnRlZAorRjogdGFyZ2V0L2hleGFnb24vCitG
OiBsaW51eC11c2VyL2hleGFnb24vCitGOiBkaXNhcy9oZXhhZ29uLmMKK0Y6IGRlZmF1bHQtY29u
Zmlncy9oZXhhZ29uLWxpbnV4LXVzZXIubWFrCisKIEhQUEEgKFBBLVJJU0MpIFRDRyBDUFVzCiBN
OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KIFM6IE1h
aW50YWluZWQKLS0gCjIuNy40Cgo=

