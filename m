Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370E35DC45
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:13:20 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWG2p-0007VU-BE
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1M-000678-2s
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1K-0004k0-PI
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so12103631wrt.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSVA5lz0rvdv4X13phsk6dqNsxhbZZ3liG9zO1ECjZA=;
 b=L7QRcJB3oehdqfYtvSCnZrhLJdHm7Ivu/ad4m49/NHXh5b8rU5JwAZrcm7gTUix999
 7Ps7BXo4ah6TtHA7De4CE+A3Rzi50NRNVuh1hko6IBGr/dlfaVjTDLQH1QKWFOHRaVpF
 XMqsOAmQFnsQ9AvV7YhpHhSOlKrvULBJd4UKX77IIsCU9nUl4reuJgTAPoFQDvFJgJMx
 bpw6WpUj6kERCWOeJjSYzN9hrykbZPkxTiQ8IxanruxkZ6/sqkukF5/wmszXDV+H0EgO
 wm8uV5rQ1HsmGFywpCLm+EkJXUP4cDZudrnjstgAgL+ivNEzlzM+fap4uenDiB3654cF
 FMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BSVA5lz0rvdv4X13phsk6dqNsxhbZZ3liG9zO1ECjZA=;
 b=TYjvVxzBgANfSS1Eh+SrtA89XDW9UDPb2SvXJSsaBJuLrNqz+WC4xh1zd6opg4LBfF
 7MJEYypX5g4nDu0FJb0cz1Ei7OXGqiJW/EOmSVeZ+8lXxkee0Q8qpl2mKQCCj8cAh/hz
 s8w2HWGy9xBY5P62LXhNA140WDMlloPh3vHkRBh5ICewoRIA/KiAx7IAbbHtgg0VlXOB
 7XPpjwPehA5MzL0AKlUMxc1dqpyEYT4O9g2xo2HSpT2E/WHFMNlVC6rqPQndctzleV9C
 A98mEx8MiOmF7hs4E9NlKvOflWjh6PFBABs9g0qa+n2ekfdZiux+CT+0uED0WE/7poaT
 J2Sw==
X-Gm-Message-State: AOAM531mAsUEWllbBB2X5PlnIQa4QtwPU6rk2kjVUOCb+oKb+LUoXSeH
 GGleZNX2v54uaFmMpmRv0JE+pQ6Xhr0=
X-Google-Smtp-Source: ABdhPJxJSorTZf/PpQajR7gHmtaz2VDGNM7GQj+IE2PRzGWk6qyjZp7zRF3ip9IsLiJ1NFPBfbQPvw==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr19155899wrm.337.1618308703377; 
 Tue, 13 Apr 2021 03:11:43 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d2sm19337136wrs.10.2021.04.13.03.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 03:11:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
Date: Tue, 13 Apr 2021 12:11:29 +0200
Message-Id: <20210413101131.3480173-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210413101131.3480173-1-f4bug@amsat.org>
References: <20210413101131.3480173-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
requires APM to be selected.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Fixes: dd0ff8191ab ("isa: express SuperIO dependencies with Kconfig")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210302080531.913802-1-f4bug@amsat.org>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 2691eae2f0c..55e0003ce40 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -48,6 +48,7 @@ config VT82C686
     select SERIAL_ISA
     select FDC
     select USB_UHCI
+    select APM
 
 config SMC37C669
     bool
-- 
2.26.3


