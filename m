Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A2440A62
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:10:04 +0200 (CEST)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgrrl-0006Vq-HP
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrof-0002T7-SO
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:06:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgroe-0004lZ-3K
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:06:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso4876320wmc.2
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hv219H3/xa6cZJrlE0ash2v5UniaRfGxdEqL81K/0UI=;
 b=XEiUjx4vWRCVazxlbqxKZsAe2BoknKa8DgHOB2EkcF74mme6u/yDfB7nAL2RlCzE2X
 1PEw6ZueWNwIuJ62GVrsidHORAoH/goeUf5bGysa2n0D+4thKpC5nLmg0L3ki6KBOK1V
 B5yLdWRUMrruGxAvoyBaXErVEpw56H+f+jPrq3fTrHI4j80Urpwl85kyV0IiS/oGep/j
 WlGgV0VWZAyqNoU58CHQAKAD1Mvzn4U5BoX2hvMZTHZKS2neZZwlIRQTZ6d5t9JwIOwG
 9dtJQAMWXZaW5i9CYQsZCOcNqMFA3WuzPR7rXQTA71ettdVd4dmqHA8Ks3QUk3tg7FF9
 KElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hv219H3/xa6cZJrlE0ash2v5UniaRfGxdEqL81K/0UI=;
 b=XV/RO6xmNLTVRlU8RKVGnKg7mCnGVchMB6+pouAH/xXmmUpqtHx+wQCp9VRqPnPBwO
 Pm6KR1JUpudBaRFoXz9VfHHctL6ulvfVuMRTLYPsWZdG9HEuRciiabY4EgHb16Gxkq6j
 Rq1jX0vd2HQ06BfNt1s5RJ+YPLDOrTBGB9kD0vRiWMlZJJ+qMZZr7y+xLUk1l3IOHnu4
 gw4KdkwQ95mPEr0c9AUgE7NhY8Y3oJOSWNRX2Jgmq7adwpgLmactjjFw4vhjblXf5oVb
 tNYgGI/9mSUCWIvXPuuG2UnDwuriTqYnvYXihYlAjDHhnGqOnwlRf2QEcXrSvY+Bhhmo
 RSAw==
X-Gm-Message-State: AOAM532V9B1d8m39het0sm/Kh/fuKhNtZJLpTr3o7uQt2ZG4nuqdUPcI
 Ov85aDLEbYzMBT8k3MzsKx6hpSPH9YM=
X-Google-Smtp-Source: ABdhPJzeSl0T05NwYgMlOy/lUmJm5XWht1xgjLOHMMqYrxBF9F9rH2AYhqAQMPPGmbGa4IMui6FzcQ==
X-Received: by 2002:a1c:9a96:: with SMTP id c144mr19775003wme.70.1635613606405; 
 Sat, 30 Oct 2021 10:06:46 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 n68sm11624907wmn.13.2021.10.30.10.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:06:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] hw/sh4: Fix typos in a comment
Date: Sat, 30 Oct 2021 19:05:51 +0200
Message-Id: <20211030170615.2636436-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <a84405db64ef81bff1a16526da290cc68f1444db.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 02eb865908d..cc7c1897a80 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -107,7 +107,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
         if (s->enabled) {
             /*
              * Pause the timer if it is running. This may cause some inaccuracy
-             * dure to rounding, but avoids a whole lot of other messyness
+             * due to rounding, but avoids a whole lot of other messiness
              */
             ptimer_stop(s->timer);
         }
-- 
2.31.1


