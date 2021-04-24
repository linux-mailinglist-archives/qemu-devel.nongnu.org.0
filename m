Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1736A37C
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 00:23:13 +0200 (CEST)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laQgC-0002pF-DH
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 18:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeD-00016F-FR; Sat, 24 Apr 2021 18:21:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeC-0005gU-0R; Sat, 24 Apr 2021 18:21:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id c4so13058422wrt.8;
 Sat, 24 Apr 2021 15:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zCT/SHnefV0/WewoQZfYQ3rl24KSltJDmq9hxULcAdA=;
 b=OcmagiUk4rf7IxKwQk9YEl9+o5cbpsz9aBuEdVIMeIHT54DLkRvxnuNyCcrnE+I3n4
 rfn0yXhiasbJ8bHgTHGDvFMOpKtZesPXV7+iwuAx75ZGsNggqqnq4qW8iV2iYZzNS4oU
 Cyv3h4Y1MKJp159B/0oSj6m3oD6F3XWTiowtivvVaNSMsu0S1emkRHt0JKJzXAlaHD1j
 +g7ylSJk1qk06HdG52AuZtaXe/ftZr/1vKpbjTL6WAhM9rVhBu6UPRU2TkGqxZaxVT+i
 TDCFe/X9ye3oKWVC2yOJEcWwTFeFiaI9sgWcBqpG2zONmAV0ctGvEzKTzHNA1TLdShb4
 uamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zCT/SHnefV0/WewoQZfYQ3rl24KSltJDmq9hxULcAdA=;
 b=fh1z2vQNlhc0Keo4mpoEcoS2tPMAwF8JQ2yI0jn8DFiBcg6lTmdwS5OvM4wyka1AFC
 CQe2pO1sWe8a+sLbG0yFIAt7O/RP5uxybXZLhYPqTpOTieHLgO6ldAyXAGUTA+t4mMhF
 jGGD6nFC/tFhwyfkpK1ItxIaFCFxN2OCOHc2LwHsW1wUXW8p07tSxuA7wG5LOTL/zCiv
 OyvdKkvqgBZK/2Abe+XYz4m/LRShKydsTYMEGMH5T/yNPBb+2liSO7U8w4Xa3YRxcmRJ
 61RwlW0FQB4wseI50FcdK3VRX3Y0kYzkHzPdJGYFv/63mANjCd4ZJfBduQYs+g39hUOw
 rRsw==
X-Gm-Message-State: AOAM530MSlAWCcf9MVAugS83pWhrJ7yjdL7l7a58STtri3Mlo5S6IgYD
 MT5CEvktkSD/Ewr4V+ZhMDiopAMftmbnGA==
X-Google-Smtp-Source: ABdhPJxCqbhFKmzf9bkzPSqGyJNeBGKfjajmfcINF5dGP7WQC66Wr8A8LuDykbVTQf0iArp7P9+QtA==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr13395325wrw.307.1619302865407; 
 Sat, 24 Apr 2021 15:21:05 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a142sm15116876wmd.7.2021.04.24.15.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:21:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
Date: Sun, 25 Apr 2021 00:20:55 +0200
Message-Id: <20210424222057.3434459-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
References: <20210424222057.3434459-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Intel XScale PXA chipsets provide a PCMCIA controller,
which expose a PCMCIA (IDE) bus. Express this dependency using
the Kconfig 'select' expression.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da7..b887f6a5b17 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -142,6 +142,7 @@ config PXA2XX
     select SD
     select SSI
     select USB_OHCI
+    select PCMCIA
 
 config GUMSTIX
     bool
-- 
2.26.3


