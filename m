Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D74CEE96
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:41:56 +0100 (CET)
Received: from localhost ([::1]:39704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Vf-00071x-Kx
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:41:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0U3-0004vw-H3
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:40:16 -0500
Received: from [2a00:1450:4864:20::42d] (port=47101
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0U2-0002LY-2I
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:40:15 -0500
Received: by mail-wr1-x42d.google.com with SMTP id x15so20672225wru.13
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 15:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eAI8/2ctMv6Uy6e04eL1iszakmyr1Pr4fCiNYoaxsrI=;
 b=U4fG4rBDOX7I+3OHuAkjjpiE0sjgGb6eqvq+D+0rbTCG1rjW6miY/n4e3kA1xFGflL
 66eBzcI06pzpwvJWaP6WYTahS7QdzUcoItJj/7rdq3x6ohL8sejry06N8NVfhrm2ePM8
 0a2wm6SFrjlS/qXoLFvC2WXLS+OaEjOIaSNZRz9cv7vLmua/EG5CPPBcZ4LVyUX38MHn
 ua5zPOnPpFgd/QFjx0iRoSnUK5tBUin3LgZwjQPLcIZCRzF1YxJ+nP1u/VRPWAkTd2pe
 NIDRXS5whNeYPl0A65T79B3q7CzRHZ05AnxNSiJKnfndbKoJc6TD0J4urlVihsJL4Sh3
 8A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAI8/2ctMv6Uy6e04eL1iszakmyr1Pr4fCiNYoaxsrI=;
 b=gfopFqDDF2KWczo2e643aGjJNaEi3JUv0K1f5SC64AWga58zrpiDO+o+GRkIVKGSHc
 8cFbm4M5heHL8J5FWpjn8OF8QSll96Y/wUBNpqabtLETN/t97Y0XN38TcsyZpkoTHM4P
 KBQkbCXspt1k7tWavXeyuMB+NAG7CyFOJrwUKZBu3BojuEMcvcXrdvBbMWddn3RrOBLt
 0+HzW7def+TpRpoADub2cxNX7QkohY6gOyAIzMenn+EWRJ6rFPhiH6lwoQ55aVUllyQP
 f1OiEw7XQE0voVmTy7ulz6r1bDMoo5snpUPjz4gIc5V3/xjenykKKbGIdXrQT8eHn9pe
 jxsQ==
X-Gm-Message-State: AOAM5336Mo3ULA6iWHKszI1bv4eoFiRyp2x5sPqX6L1nSAKH3FOMH4Ko
 1bSsOr7GqiXV8RX189HjTwmSPCHHM6I=
X-Google-Smtp-Source: ABdhPJzPZG723IROwCraFuhvnx2NDgjWGTMbPob8xTTjsQ0kJ5Y9fvAWhJVznsTHVpv/x/sR5cHdRA==
X-Received: by 2002:adf:e104:0:b0:1f1:d891:5aa6 with SMTP id
 t4-20020adfe104000000b001f1d8915aa6mr6416467wrz.582.1646610012557; 
 Sun, 06 Mar 2022 15:40:12 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c34c300b003884e826642sm11309107wmq.12.2022.03.06.15.40.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:40:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user/elfload: Remove pointless CPUArchState cast
Date: Mon,  7 Mar 2022 00:40:03 +0100
Message-Id: <20220306234005.52511-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306234005.52511-1-philippe.mathieu.daude@gmail.com>
References: <20220306234005.52511-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

fill_thread_info() takes a pointer to const.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9628a38361..d3d1d9acae 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3972,7 +3972,7 @@ static int fill_note_info(struct elf_note_info *info,
         if (cpu == thread_cpu) {
             continue;
         }
-        fill_thread_info(info, (CPUArchState *)cpu->env_ptr);
+        fill_thread_info(info, cpu->env_ptr);
     }
     cpu_list_unlock();
 
-- 
2.34.1


