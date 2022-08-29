Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1315A5063
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 17:44:22 +0200 (CEST)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSgw1-0006lm-8k
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 11:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oSgt0-0002cV-Ff
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:41:14 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:52568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oSgsy-0004df-MK
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 11:41:14 -0400
Received: from dellino.fritz.box (host-95-235-60-93.retail.telecomitalia.it
 [95.235.60.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 26A3D6601EFA;
 Mon, 29 Aug 2022 16:41:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661787669;
 bh=XIi4qSO0RmH+GIApCIgGlWGW/G2VTXFcHQPJf/yKSiE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kKAZhokLzXe9YwKzDju0E1lc63O0zfmVJ4qCaE0VFOqZMe6oLpdiLfPmncDeQHAPN
 6TY5/LYpMdO3Mjm8FtnsGDqecrqrxElFgSMScR7WPKM9LqmKXq/tpq6eGGZzGz4FcK
 Kop3E9G63WItOQSvtgV/tZ4WAAdelQCc2HUepcdu5eqOODwWYpeEzuy05xges+LBOY
 PuUPyHcLynb2NpVANQuBth+nr9dDg5uorOJKUZvvOjuNVpqKIkCvJcy1nr5j8yaWeE
 Ol0YT4yWgDPHOlgHEWRsizDH+Hm+OF8ej3Z2hobHmMSNkRszF1fnlcGt5CGZYdQxPp
 D9mrFHWKh22oQ==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/5] Update version for v7.1.0-rc4 release
Date: Mon, 29 Aug 2022 17:40:54 +0200
Message-Id: <20220829154058.524413-2-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829154058.524413-1-antonio.caggiano@collabora.com>
References: <20220829154058.524413-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 VERSION | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/VERSION b/VERSION
index 1c944b9863..b8d5f3ebb6 100644
--- a/VERSION
+++ b/VERSION
@@ -1 +1 @@
-7.0.93
+7.0.94
-- 
2.34.1


