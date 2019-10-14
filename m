Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8CFD67D6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 18:58:36 +0200 (CEST)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK3g3-0005AV-49
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 12:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2qo-0005Mv-DT
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:05:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2qn-0008Bp-DT
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:05:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2qn-0008BK-7K
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:05:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id v8so20394493wrt.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4mjoAx/4zPP86DcVuhlqzEK8KSu+aCR1EU6og0vmhNY=;
 b=hEef7XYPguojyZ9lprZhg9bmsF7khfOoYtn484WxWGJcCFEh24lc2WbsR7s/B2ErBk
 tF4LWGi/duBF5UC9c+BsYACZfvgfnadrvOxBEJjL7Vr/SB44w1xuIVHlW+0W9rCx0l72
 OR0dp6kUO2nZWaGtbeWNWalNtAaovEkEpCiYssLZudUuI52LqglPj23fM5EebNcjytcG
 aRgpIWz+9NO2oPzhmDV/sgTBs3mwvmjYc3TwgZ26OAXN0mjCeFIzExl4o9jRQZNLi5Hu
 uYsescebdYwtRxlZs/83dHFEHzcT3HcAQ1iCS+WkOxjklM1IteTtjNG/oiugmbF97ozY
 snAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4mjoAx/4zPP86DcVuhlqzEK8KSu+aCR1EU6og0vmhNY=;
 b=WaVu52hPMZEBzX/OQFgbP74cXo3K5fHHMzC6RMAyiX8zVfSJAfjIYGmfTnjXsbN/nP
 7IeeeBgPWfUztmlWN09iY4xS7y1UxiAa8sVljkXiIgbRmu9W4IUnwI50SqQMtBFzdBcR
 IxB2KU0kOIFUmiF25/9ZljudimJlJMJIOqSF25xogPpLfe8LiO641WZwBHk/6FtAXUvj
 SJo4dkTvqqXCakmQ9H7Z/G+Tc+oFtam+6BuYdJ0ASZ8rKVV+KrbgqqIpbaymKH6O+ARl
 gtZmFY2520n6EwZy97ItrbhNpn0XtAd+cMQMptf+8o13pFSE7sJg7IqjqroJLjhHXIGB
 4jdw==
X-Gm-Message-State: APjAAAWoFA6GKjXpxN6t+QgMdDeAQqT3VwS6YmyErHwscyksgh56hkxE
 t0vZtwua4nczQpgc0QkrpSSdzUOSnvbO4w==
X-Google-Smtp-Source: APXvYqxgqsEQYK7bskiiiKS43vocxbxzGqxygxyIMvrZiPvWPfEdL9WiGcUPj3Ng8o7AVoyixoheRQ==
X-Received: by 2002:a05:6000:18d:: with SMTP id
 p13mr3936796wrx.396.1571069135831; 
 Mon, 14 Oct 2019 09:05:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 5sm18029779wrk.86.2019.10.14.09.05.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 09:05:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 58/68] m25p80: Add support for w25q512jv
Date: Mon, 14 Oct 2019 17:03:54 +0100
Message-Id: <20191014160404.19553-59-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014160404.19553-1-peter.maydell@linaro.org>
References: <20191014160404.19553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-id: 20190925143248.10000-20-clg@kaod.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 47159de3a44..11ff5b9ad7b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -327,6 +327,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
 };
 
 typedef enum {
-- 
2.20.1


