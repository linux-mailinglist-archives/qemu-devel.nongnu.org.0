Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B3941769F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:10:56 +0200 (CEST)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTluh-0000L0-99
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTllu-00047J-HU
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:01:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTllr-00008O-Ud
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:01:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so27720441wrc.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 07:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e5wLdXLsthCGG6B0sBkuxsybxkvBeSBzsqQnqP/bpEs=;
 b=mj/7tr8BkuI2EWSzeLfm02f76vg+nca4KCsSVyhaI3J2I1FS0/zdXyz3Cp0Rt8BIcv
 YREHyEYO/earDXEjMPIoEkl1VMNzeCUPkYHcSRqOKpnzGdjAuumAH2r4fdas5TelGVx0
 ZYIuDfbdUBNDR1cJe+BB7ibmXP/woM1edE2atn3pDjGazoq9ny5v8DBkIP1M6dXXD9dk
 T+qtAkAT/l+Vvos1yxpo/OiAx5xsp086+9tDHZpV0De02G2icEM2fmJTXxoewUg2DJnB
 aqdY+NKxNU1wRRRssSRiTa73j1H/4jm2Eh9/0l/UtUoDDOuC53w06dLChpTjIfJZyZlm
 E5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e5wLdXLsthCGG6B0sBkuxsybxkvBeSBzsqQnqP/bpEs=;
 b=McN9frjv3H9c/KOuiE+KBA506jPBlGeHvw6Xem9MBSjHQP9m8AVRVCp+AKp8EnFv+A
 oPwNgVZHLM2757RTIQwkOidqvvtlJXSR583MiV//ejkanht8t0NIabOoSDl+39+QXhu+
 Hw/SkJO8shfhuY8A8C2SIpj9ebTxX+vbJWL7kCfD5DG7fQBJwld1AHAZPD0fq45gG6v1
 SXVYtgx3N1d+ISngTzgwuPjYcUt9RGPnUAYnJl/mHh1ympKdLVkzA6pYu9TYIrfKn26U
 6lWgTaZQAZV4gqlHAE7CQyG4TdZIeARbSeHZjhiOJ9OhzOafwr275SM5fAn59J5H3nFg
 4Cyw==
X-Gm-Message-State: AOAM531vLG5MriRK+cFJ/Z504F/YqJV78O6WrBBsXESbdxvEBUMVIvFT
 p1CtifeOHj0Ko861sc1bNtFqtL1XYLkpBw==
X-Google-Smtp-Source: ABdhPJy/gJLL8tHuEgT/mNAzoP0w6yvt3qtgWcaApooLBiZ/Li44WjTZbyJ/OX9Q4kiz3mLdF+i3gA==
X-Received: by 2002:a5d:648b:: with SMTP id o11mr11504772wri.315.1632492106656; 
 Fri, 24 Sep 2021 07:01:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y64sm9292673wmc.38.2021.09.24.07.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 07:01:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qapi: Document the units for the offset argument to
 RTC_CHANGE
Date: Fri, 24 Sep 2021 15:01:42 +0100
Message-Id: <20210924140142.31398-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924140142.31398-1-peter.maydell@linaro.org>
References: <20210924140142.31398-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RTC_CHANGE event's offset argument is in units of seconds;
document this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qapi/misc.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index ce7edd3f7bf..10b4eee16b3 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -529,8 +529,8 @@
 #
 # Emitted when the guest changes the RTC time.
 #
-# @offset: offset between base RTC clock (as specified by -rtc base), and
-#          new RTC clock value
+# @offset: offset in seconds between base RTC clock (as specified
+#          by -rtc base), and new RTC clock value
 #
 # Note: This event is rate-limited.
 #
-- 
2.20.1


