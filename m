Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06845246CB2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 18:25:48 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7hxD-0006gJ-2e
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 12:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k7hqs-0002BO-CE
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:19:14 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k7hqo-00054S-Sn
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:19:13 -0400
Received: by mail-wm1-x344.google.com with SMTP id x5so13719280wmi.2
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plE1VE6Cmptms9y5uKWN77PnVRXUiPTsg+WX4/otZwM=;
 b=S/fUm4niNwm42hXAIu/ctYgC2siXAP0ERNysPpmmTHq/uN5pRKo0HHzHlj1Sb/9UyS
 UyALFrPMtpKiRZQSOLytUnlYPeImxbhhVlKvmT5ATNBIDA79TJAK+x2Ggdg083nvIizO
 b/FLIY1jrmFJ/eXhfBVbcnu2zB4yPhy6d87nPPOH5qqKlcb5g7g7tjJHUL8LBok6Pxoq
 zIjVpuaR5ThCk73EkwYGmnjwHLrGJTkCidYkDyVcCF/V1i38gENV1+CYmxGtoNjaqzSc
 sq2cFRp9VBlnVOnvffWIj36TpWKzWEQAvX6fevfZ/iGToFsev7tpyBJdpTVc7OKcX+SD
 OlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=plE1VE6Cmptms9y5uKWN77PnVRXUiPTsg+WX4/otZwM=;
 b=hRdvGMdibBkpG8DF0DwA83dDBr3mCYo29g0DuFXyf6JoTq43+SGfREsqSkN+/CssN5
 J0j5/bd/r6asFxW3MgojwT19+9wKQD+COX+3p8vlag5rrdpDutA7ukaPUe4j3gfm/2VB
 XEYYMvcIPWdDrfbDh+oNHfW21soN9QMTYJ71gYIt2snZMdoxVxSu++2UOzTWCMVydQqF
 YiUyDe7bsV//VFi8QciFASg2T2zmHh8mQR15yc27nrzU55ANR9x7D6sldWlKjIvR4CTv
 CT5fbMKXn+SpkSQpEqdKc9BifjFWmdAII3ZBOgvP+dZNWnaLU2UeGzs4/+B5JEPwtVWV
 mWtA==
X-Gm-Message-State: AOAM531dVzuYNKLAj9vQ8ayqa7lVgqZbSHYAUhVtvg9jd8PhlSc3snHA
 r6OEUpvWSs4BB8LDhz71SdxApUhpotc=
X-Google-Smtp-Source: ABdhPJy8CIGcObH5pKqTSR0lD00fA/l8Gwv/eJT9H+1kH0XYOtDGB9KdhS6n9elwCSgoZoRK7FvO/A==
X-Received: by 2002:a1c:7705:: with SMTP id t5mr15878280wmi.112.1597681148617; 
 Mon, 17 Aug 2020 09:19:08 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id r3sm29535472wro.1.2020.08.17.09.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 09:19:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH 8/9] memory: Allow memory region to display its subregions
 own descriptions
Date: Mon, 17 Aug 2020 18:18:52 +0200
Message-Id: <20200817161853.593247-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817161853.593247-1-f4bug@amsat.org>
References: <20200817161853.593247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a MemoryRegion has subregion linked (but NOT mapped), these
subregions won't be displayed in the 'info mtree' HMP command.

Add the possibility to display such subregion descriptions.
It will result useful for the Interleaver memory device.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Any clever idea?
---
 include/exec/memory.h |  6 ++++++
 softmmu/memory.c      | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 307e527835..8bcacfc79e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -404,6 +404,12 @@ struct MemoryRegion {
     const char *name;
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
+    /*
+     * If a memory region has subregions linked, it can use this
+     * handler to return an array of string, each string holding
+     * the subregion description.
+     */
+    GStrv (*subregions_description)(const MemoryRegion *mr);
 };
 
 struct IOMMUMemoryRegion {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 8139da1a58..f8e27edbe2 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2967,6 +2967,28 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
                 mtree_print_mr_owner(mr);
             }
             qemu_printf("\n");
+
+            if (mr->subregions_description) {
+                GStrv s = mr->subregions_description(mr);
+                for (int j = 0; s[j]; j++) {
+                    for (i = 0; i < level; i++) {
+                        qemu_printf(MTREE_INDENT);
+                    }
+                    qemu_printf(TARGET_FMT_plx "-" TARGET_FMT_plx
+                                " (prio %d, %s%s): %s%s",
+                                cur_start, cur_end,
+                                mr->priority,
+                                mr->nonvolatile ? "nv-" : "",
+                                memory_region_type((MemoryRegion *)mr),
+                                s[j],
+                                mr->enabled ? "" : " [disabled]");
+                    if (owner) {
+                        mtree_print_mr_owner(mr);
+                    }
+                    qemu_printf("\n");
+                }
+                g_strfreev(s);
+            }
         }
     }
 
-- 
2.26.2


