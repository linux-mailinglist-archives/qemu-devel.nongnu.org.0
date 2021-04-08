Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F976357A03
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 04:03:09 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUK0i-0005A4-1s
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 22:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJvt-0008Am-7b
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:10 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:35626)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJvk-0005zF-Ne
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617847080; x=1649383080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C6aPgyv0HI8Qqyqx7C1C+01qGuDywdCVFbp7ibehpDs=;
 b=VuivE6uYW18+uFmpbhmgxfGEzLmklZj7zD4CA51US7M2gput49ejLFG7
 HBFpGPnTysM99Usaq8YCCICGAW8lkxIxvdlgsI+MM0rGM9UrdLkeE0dn/
 n4Ao4ha9ROjy0Sbzt7B66NGpBA0kc88PPDsOjxO3ZzokebYj2JfgQMQn8 c=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Apr 2021 18:57:56 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 07 Apr 2021 18:57:55 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id C575D1755; Wed,  7 Apr 2021 20:57:54 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/26] Hexagon (target/hexagon) change type of
 softfloat_roundingmodes
Date: Wed,  7 Apr 2021 20:57:30 -0500
Message-Id: <1617847067-9867-10-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 699e2cf..bb51f19 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -95,7 +95,7 @@ int32_t conv_round(int32_t a, int n)
 
 /* Floating Point Stuff */
 
-static const int softfloat_roundingmodes[] = {
+static const FloatRoundMode softfloat_roundingmodes[] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_down,
-- 
2.7.4


