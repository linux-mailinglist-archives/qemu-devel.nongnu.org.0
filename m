Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB5282C79
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Oct 2020 20:22:10 +0200 (CEST)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kP8e9-0004Fk-2X
	for lists+qemu-devel@lfdr.de; Sun, 04 Oct 2020 14:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kP8Nr-0002lj-1H
 for qemu-devel@nongnu.org; Sun, 04 Oct 2020 14:05:19 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kP8Np-0008Nz-BR
 for qemu-devel@nongnu.org; Sun, 04 Oct 2020 14:05:18 -0400
Received: by mail-wr1-x441.google.com with SMTP id x14so7074160wrl.12
 for <qemu-devel@nongnu.org>; Sun, 04 Oct 2020 11:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9OS4piSvemeoKDeGmvndJFJ70sjoMM7Z5emZ5RNq14=;
 b=RXV4Np+KeqsIh8XBC8aAt5uYSus7rr9LKSDAkInPmqh49uFWPcVxKHJDIowOFDvtzy
 Ql73U5H6Sd/Sy7RvRWjbB6B+ioZa1VBpY96gE4xNA6RSv+jwpCElqyeS9zQVnMUs0rDX
 0UoVup/Kcy4i/g5ASISt+6ybisnOLSR/33O8DunrZ8LHweEAhqRD68XxNwCcc0/jPSlc
 xiLW2HNecLIFXynXrQnQZvLDt08+S/mgZcoj08SBJMora8h7qpzlEu3rISlPFSVdzOk7
 t0Ennq0DkpBCU5lStjM8cJ5Wojuwi50aHS4cdNzl2s8UdMqv+QhDgkNpFbeJESmzzvtM
 htjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T9OS4piSvemeoKDeGmvndJFJ70sjoMM7Z5emZ5RNq14=;
 b=eLEp2Lr8E2oN6G0vJliOSFqZVbSwXtGhx4xfEckaGfWKgt5HSHT/hd82lStSe29ZEa
 Im52WBcGOK7P1ZQJbVHaQrmV/0jNdPbnayZk4cQ8I3Dd5Z+ZYcHub9P17DiBzuarFURe
 nWrYRwFxTavmbMy2U0phh+uflgXNl737wZk9SiQSNvt5jTr7DIP5a9e16WeOAFdTTXDp
 Ioy5lrEmGfYsEZdQywQaeipv7On7XXT5z4roZIxCuODHq2j6wxPsf60XoEcKsTmR0P/j
 VO8jCd+q6X4/+fwwgyIh2/Pqhaq1Jsc4aa/Ycj0LsfJadqsC7UefZFWeWFAC0smNMUI+
 T55w==
X-Gm-Message-State: AOAM531Tih4XAdp6xKr0aFkr+yz6JUcswoeusvK5RvB4p6GV+AZoF4PR
 nV8AXKniUm5v3wNgykWJSjDDB4YrRQCocg==
X-Google-Smtp-Source: ABdhPJzV5Ryb/BMkLCxZcttmMgkvfW4rnWU3DAn9B4sIRCuBsb4f2QitqeDptJRTEckklikcYCdYEQ==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr7656910wrv.185.1601834715724; 
 Sun, 04 Oct 2020 11:05:15 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id j10sm9593202wrn.2.2020.10.04.11.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 11:05:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 21/21] contrib/gitdm: Add ZTE to the domain map
Date: Sun,  4 Oct 2020 20:04:43 +0200
Message-Id: <20201004180443.2035359-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004180443.2035359-1-f4bug@amsat.org>
References: <20201004180443.2035359-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Peng Hao <peng.hao2@zte.com.cn>,
 Wang Yong <wang.yong155@zte.com.cn>, Wang Guang <wang.guang55@zte.com.cn>,
 Yun Liu <liu.yunh@zte.com.cn>, Li Ping <li.ping288@zte.com.cn>,
 Liu Yi <liu.yi24@zte.com.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiang Biao <jiang.biao2@zte.com.cn>, ZhiPeng Lu <lu.zhipeng@zte.com.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wang Yechao <wang.yechao255@zte.com.cn>,
 Liao Pingfang <liao.pingfang@zte.com.cn>, Jiyun Fan <fan.jiyun@zte.com.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a number of contributors from this domain,
add its own entry to the gitdm domain map.

Cc: Jiang Biao <jiang.biao2@zte.com.cn>
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>
Cc: Li Ping <li.ping288@zte.com.cn>
Cc: Peng Hao <peng.hao2@zte.com.cn>
Cc: Wang Guang <wang.guang55@zte.com.cn>
Cc: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: Wang Yong <wang.yong155@zte.com.cn>
Cc: Yi Wang <wang.yi59@zte.com.cn>
Cc: Yun Liu <liu.yunh@zte.com.cn>
Cc: ZhiPeng Lu <lu.zhipeng@zte.com.cn>
Cc: Jiyun Fan <fan.jiyun@zte.com.cn>
Cc: Liu Yi <liu.yi24@zte.com.cn>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
One Reviewed-by/Ack-by from someone from this domain
should be sufficient to get this patch merged.
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 4e6bf16e4e..8781e4ba87 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -43,3 +43,4 @@ windriver.com   Wind River
 xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
+zte.com.cn      ZTE
-- 
2.26.2


