Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639668E16D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:47:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTvK-0002bu-Vj; Tue, 07 Feb 2023 14:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3eariYwgKCn4ywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1pPTv9-0002VO-3L
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:46:27 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3eariYwgKCn4ywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1pPTv7-0002fJ-Cm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:46:26 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 96-20020a17090a09e900b00230aa6151c8so4565295pjo.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1675799161;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nH4HQe+MV9tjbVXhRgWQajwGe2OH3uEMzVPFxvxzzdQ=;
 b=jKZLWiheMqP8eOX23yjuERmn6W5ub5WDYWFBf/BMOWF6PGKV/8OdIaZLYrbK8sBKNW
 ONHyNfM/K/KzqsFtDWAvNPRGUHUaVUECPDqLOB5qYBkDbcjTABHo0Tn1IgzCEQv+Ar75
 sOyM4Gxz9VZJjJfyxnndmk0bV0xkaI0lriNL6cQmJ5IGiAkBemAv4S3/M0pX8IwdNP35
 9rVMFR1U48PDJf0Mn6MINUawd+k7+RuRtq2gzSWWLTZh//nNLoxbIsBduhOnTk7TP3JY
 mx+GdYR2TGdvSt127i6aRWRLiDV9/g7fPr7SWs7BZSH32FIo36w9QxLm7Pry0BkdCtN5
 jgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675799161;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nH4HQe+MV9tjbVXhRgWQajwGe2OH3uEMzVPFxvxzzdQ=;
 b=3C/YKZylBiPOSq1CMDSxo9hCisbc+eTYLYXF1bbGRmZsht7YIlVVfX/k3ISW/o3kmF
 t2oOcllWH/ykPh+pULwYMOFeCDrKg915ZGxPT9WvzQ8tJ9dymg9r/WHLhai0n+AyDlo9
 cqoGDlBat6kXKRXQx0dJcI1nmIDX8TuHFMoA9q4fkSQf4Cam13DWGFZ1tkKrXCYGUMCJ
 o3MjDAZynNIwkFXxHGbUfx0Y6aec/5yjCGo8yIYYTWZW5ucHx/XoFpIlX4DAA01lu6Cc
 oKE28g/6IoWQqTw5jEIkeQjWPEJtswO2wOHP+4HJZhvrKuR/t6/RcTQIixvVibIW1Aia
 OUPA==
X-Gm-Message-State: AO0yUKVHLR66L7S9/t+FKnFSMNFnMRYevDMuywFx7ro1uyeBGOfjbtp6
 GFSSsTly1XgUMHfLTXltd3yEMczWhih+9Q==
X-Google-Smtp-Source: AK7set9RhE9+QuuzQExNwmFLCVEt+76Zk5tHy6ONtluMC8UGo4en5HcoKDI9gokboIqxLaumBx19O+6z+W3CrQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:d717:b0:199:60:b9ee with SMTP id
 w23-20020a170902d71700b001990060b9eemr1086224ply.18.1675799161720; Tue, 07
 Feb 2023 11:46:01 -0800 (PST)
Date: Tue,  7 Feb 2023 11:45:54 -0800
In-Reply-To: <20230207194556.3262708-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230207194556.3262708-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230207194556.3262708-2-wuhaotsh@google.com>
Subject: [PATCH v2 1/3] MAINTAINERS: Add myself to maintainers and remove
 Havard
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 Philippe Mathieu-Daude <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3eariYwgKCn4ywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Havard is no longer working on the Nuvoton systems for a while
and won't be able to do any work on it in the future. So I'll
take over maintaining the Nuvoton system from him.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa10ecaeb9..347936e41c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -799,8 +799,8 @@ F: include/hw/net/mv88w8618_eth.h
 F: docs/system/arm/musicpal.rst
 
 Nuvoton NPCM7xx
-M: Havard Skinnemoen <hskinnemoen@google.com>
 M: Tyrone Ting <kfting@nuvoton.com>
+M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
 F: hw/*/npcm7xx*
-- 
2.39.1.519.gcb327c4b5f-goog


