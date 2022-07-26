Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51795581A39
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:21:59 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQ7u-00035N-B5
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oGQ4Z-0001VK-Pc
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:18:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27666)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oGQ4X-0001oK-AI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658863105; x=1690399105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YDc8d0/ulNFVdaGou5invAchKaj4Z92iBsLV/0D5HFU=;
 b=chz6F5PnXXLIGk9OXTAFRPNAn40MeQppWgn0m5+z/KJOIRNOp2bus6ns
 f+WrgBFgqOwRVeSYRuyp4Wq8Pp2wlc+sAKhtuK5cKSBXHyXTx52AN41hT
 ps6S2XBApnANW4iH+veIcjnTwqMl5hPTGtEDYMHrN0zUoGR6rN0IO4boF E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 26 Jul 2022 12:18:20 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP; 26 Jul 2022 12:18:19 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9C84650018F; Tue, 26 Jul 2022 12:17:59 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH] Hexagon (tests/tcg/hexagon) add compiler options to
 EXTRA_CFLAGS
Date: Tue, 26 Jul 2022 12:17:57 -0700
Message-Id: <20220726191757.30104-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGNyb3NzX2NjX2NmbGFnc19oZXhhZ29uIGluIGNvbmZpZ3VyZSBhcmUgbm90IGdldHRpbmcg
cGFzc2VkIHRvCnRoZSBIZXhhZ29uIGNyb3NzIGNvbXBpbGVyLiAgU2V0IEVYVFJBX0NGTEFHUyBp
bgp0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQuCgpTdWdnZXN0ZWQtYnk6IFJpY2hh
cmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGVzdHMvdGNnL2hl
eGFnb24vTWFrZWZpbGUudGFyZ2V0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgYi90ZXN0
cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQKaW5kZXggMjNiOTg3MDUzNC4uNjI3YmY1OGZl
NiAxMDA2NDQKLS0tIGEvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0CisrKyBiL3Rl
c3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldApAQCAtMjAsNiArMjAsNyBAQCBFWFRSQV9S
VU5TID0KIAogQ0ZMQUdTICs9IC1Xbm8taW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMgLVduby11
bmRlZmluZWQtaW50ZXJuYWwKIENGTEFHUyArPSAtZm5vLXVucm9sbC1sb29wcworRVhUUkFfQ0ZM
QUdTICs9IC1tdjY3IC1PMgogCiBIRVhfU1JDPSQoU1JDX1BBVEgpL3Rlc3RzL3RjZy9oZXhhZ29u
CiBWUEFUSCArPSAkKEhFWF9TUkMpCi0tIAoyLjE3LjEKCg==

