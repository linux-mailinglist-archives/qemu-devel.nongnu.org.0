Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E88318D1E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:18:05 +0100 (CET)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACnD-0000MW-Vh
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkq-0006X5-BZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkb-000746-CQ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i9so5908545wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+gUJsjIf5/BD08y3x4kyL7rGJpanl7QzjUiozC10sMM=;
 b=W4yeQ0luQRlpuB87jBSfS/zxP1pXFBwsxB5UgyWDjRsbvBE01HKSK7pRdLp8WuI+4r
 2+YeupnlSTka5VSiKw5JBxcpdZmmbWLc6ovMmdExMonwCAR7WJGOVbFs9rVfNphfhTA6
 Qohi9hikH40kfDkzb7NKmcBDHztfBsfx2VAHqL7RFLXEGoVIQwRYeEudUyHtOvVUgUhc
 wYuL0krJT4PR9/uZrX6nErGOJnq5UnbASUJ6ArZi7dfKnzNcybYvYW5MSm9AuauKlKD4
 oYV77m1PoNbUeT6jqS79YEA8mlatE1tFER5ybSWv+CHaM+jBX7wSkm1L0ZzefL+vi4wR
 LiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+gUJsjIf5/BD08y3x4kyL7rGJpanl7QzjUiozC10sMM=;
 b=kXITddxJu7FTbwZicAbP2MROuYperV8Eecnh5e7UqbwPV0fT8nmAujBSssws2EniNr
 oA47GzndHXqsHpQWI9I50YO7ys+yMN0OOXTV108ZUUMdVcBkLAHXh6xWG+SNc3sBiZe2
 XHDAqecSErOJJcqiZkbeT4v+CAeE3Bp3HlImg1tNxvXGWlgTEInA/smQzjRlPqi99rLH
 gwJyKp5dnmfzJtb4JAhXSaaz2rNyGRysfxZSRPtdl6K0FhT6OOL/qq42V5aVxtS+3xNb
 IjpS0JreLRxFVHQJfphUawMWOzXdT5WvMAjNtQI2kyTPga+k3f9CERTdoIUZc95oKEZG
 z87g==
X-Gm-Message-State: AOAM530NXC5e4ipbToZWhoz/+9nd8dIVoN9AZiOHWkxXGQzD0nsBWCyB
 gLkQwugV864TpW+9KAZEbRCf4Q==
X-Google-Smtp-Source: ABdhPJwy8qxprctlLOn0gBzNUVh6sVuo1oBAQOyuNexMTKJPX6qp/Wz9jE9zQgVGUUkEfqICzwQD1w==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr5604066wmb.0.1613052917585; 
 Thu, 11 Feb 2021 06:15:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/9] hw/display/pl110, pxa2xx_lcd: Tidy up template headers
Date: Thu, 11 Feb 2021 14:15:06 +0000
Message-Id: <20210211141515.8755-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel, but some older display device
models still have the code to handle other depths.  This patchset
cleans up that dead code for the pl110 and pxa2xx_lcd devices.  For
the pxa2xx_lcd we can remove the template header entirely; the pl110
still uses it to handle the wide variety of guest pixel formats that
it has to support, but we can at least simplify it from a
doubly-nested set of inclusions to a single layer.

thanks
-- PMM

Peter Maydell (9):
  hw/display/pl110: Remove dead code for non-32-bpp surfaces
  hw/display/pl110: Pull included-once parts of template header into
    pl110.c
  hw/display/pl110: Remove use of BITS from pl110_template.h
  hw/display/pxa2xx_lcd: Remove dead code for non-32-bpp surfaces
  hw/display/pxa2xx_lcd: Remove dest_width state field
  hw/display/pxa2xx: Remove use of BITS in pxa2xx_template.h
  hw/display/pxa2xx: Apply brace-related coding style fixes to template
    header
  hw/display/pxa2xx: Apply whitespace-only coding style fixes to
    template header
  hw/display/pxa2xx: Inline template header

 hw/display/pl110_template.h  | 120 +-------
 hw/display/pxa2xx_template.h | 447 ------------------------------
 hw/display/pl110.c           | 123 ++++++---
 hw/display/pxa2xx_lcd.c      | 520 ++++++++++++++++++++++++++++++-----
 4 files changed, 542 insertions(+), 668 deletions(-)
 delete mode 100644 hw/display/pxa2xx_template.h

-- 
2.20.1


