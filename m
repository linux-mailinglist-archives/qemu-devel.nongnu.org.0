Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF222440A74
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:11:50 +0200 (CEST)
Received: from localhost ([::1]:41684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgrtV-00014q-SJ
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrob-0002Os-Ax
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:06:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgroZ-0004l3-Io
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:06:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k7so21543045wrd.13
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9JMH7LRynPEu+nggNANh02pmssKrZX/42kF9MqURv4=;
 b=cwdVDka3QEcXO4FM3/UdjuPcB/lsMwDfsAWGSPzmUhPK8a8s851NmKcLIOTxbgXsYQ
 fBtAOMR+Lm3MAvXU3H5TxBybgcsvPuU5DP/6msR5zRoMJt7+8pJ57upoGuYPkp5uSDyZ
 OgUDKG7peE9APMiBJWKPCGS3lyk3brSbl/a3H1JeEF65JVCIHvW3INyR0LyI+VV0kReL
 TZx8aqj5vXzTzzDCqZuwtjINEIQYMrHy8LuflplfXYQ0+e7wYV2hHSlDUJ99hnwS4SOR
 9lgG2947jR1DO/iAgWOqkd+XsBYqpXSJe1W0V3qHhCkBh0AXJI+hAVJjhOA8YyVTi7mx
 dkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A9JMH7LRynPEu+nggNANh02pmssKrZX/42kF9MqURv4=;
 b=DSZ+vhywnByHDdmv5oib/jsRrPchIFZH5bN2ANxvPlQrIsA+0A9g9zpekQUWfYtEDQ
 XMw9njAcoUUwDz7vvlQnwhIpbQhjYYVtclL3nWV76j6oTt0luhsmBa3YTPI0baOm4ElZ
 wzFDGKr/0TgvyV6GK0RgTNKZGPMpyaDQ7L6luDaMYMNooLFSVer5/BVbxAdvyn9dWAT2
 P/mg9yHqrf+1IsEFM0eLwFAYhgAZGVuHNAyI95K+wFD+SNxIsYbfbsDaEI6HOZAMZW2W
 1cfFTXYh/P8DuegRCpAPrfgZc2zyW2pmyNUb00PgzALV9UIbwE9R1ielad+GQCLCihgS
 rYGQ==
X-Gm-Message-State: AOAM533BPQoaEr+iWX/5vk/7wrY/hHHpIUdO+Kn4lkrzv63dOqlOkR+N
 KrlkYxynpZDWM4PtQTAQNjtKTluUStg=
X-Google-Smtp-Source: ABdhPJyci8fRjTovTlA2RlVpiNkTNV7fQul8s6+MHojiHfgbX3hLueFcmkryRlef2lZyE2zIC+Y00w==
X-Received: by 2002:adf:a2d4:: with SMTP id t20mr23591340wra.229.1635613601431; 
 Sat, 30 Oct 2021 10:06:41 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 w10sm8623649wrq.88.2021.10.30.10.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:06:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] hw/sh4: Coding style: Remove unnecessary casts
Date: Sat, 30 Oct 2021 19:05:50 +0200
Message-Id: <20211030170615.2636436-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <6cb1bcf24572ad8465c20b64fec81157f34bcbe9.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 68c109ecfd0..02eb865908d 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -233,7 +233,7 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
 {
     sh_timer_state *s;
 
-    s = (sh_timer_state *)g_malloc0(sizeof(sh_timer_state));
+    s = g_malloc0(sizeof(*s));
     s->freq = freq;
     s->feat = feat;
     s->tcor = 0xffffffff;
@@ -358,7 +358,7 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base,
     tmu012_state *s;
     int timer_feat = (feat & TMU012_FEAT_EXTCLK) ? TIMER_FEAT_EXTCLK : 0;
 
-    s = (tmu012_state *)g_malloc0(sizeof(tmu012_state));
+    s = g_malloc0(sizeof(*s));
     s->feat = feat;
     s->timer[0] = sh_timer_init(freq, timer_feat, ch0_irq);
     s->timer[1] = sh_timer_init(freq, timer_feat, ch1_irq);
-- 
2.31.1


