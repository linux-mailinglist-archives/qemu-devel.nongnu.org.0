Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1221660803C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:50:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxSc-0006Do-1b; Fri, 21 Oct 2022 15:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1olvMc-00040X-TF
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:59:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1olvMb-0001dL-Cn
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:59:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id a3so6073560wrt.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/OO5iR0ZGIXSf4g7oVCcPeBb0G6b/uVNbLfDPUHtpPY=;
 b=GX1FFU7xMio1WITBQe7j5hDmq5XV6yM38TAhxJK/o0GgKGD6yYSbL0j5KbJ9UX+rex
 SyTD4x7OXnL1t3ArH0j0vV9Z6HKzQpRU4SfRq1dBqqTcXKluwOoPvLW+iphy3OJKux2+
 LYagRQiO26Esq2vR/DsfpB1Xh+aMFj5BNufMToZdgB6kmpo+JOLEbjpNlMRlIcr5XYI5
 E6bnBZMG6Fdb/YE0Z9uVwTJIRhfVBxk+UlJkxuF4WKYXSwSKwt1FRAQhXp3SGvCPNVAt
 zx+JDaBUXTdhUM+vVaZ74BtdLLqf+qeKRE+e+6wsr6QnB4Rp1oREgo7761Y/KzRO22cu
 qCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/OO5iR0ZGIXSf4g7oVCcPeBb0G6b/uVNbLfDPUHtpPY=;
 b=AEfuKUHclf6aNsXtR8bQkm8G1yHz/01P5DglE9Tzxp1gtW0NGXpN+ycvyj104/j1Sq
 P9PAVBAKxfMyL5x7aL4KXLbYQtSwZy+hCpmh7wEGlPxhz5hNv+ZnEquC2grcGKE0BGye
 1hR8chDAkI6y74h/nSXo8iThYQnpUBipQ77qpAA2DIZttsaJtCHdog1ybRDlPe/MrCPu
 W8GQXlQc/JGSZCfEmmgvZb+ZWVlej0ztBLw4f3i0KWvPAmdi60Gayh8CHrdu4KJ8VjZc
 Ox6t4b3neKLyNMDzN8gCtf3F3qruoalIs5L20G9zPA0r9moYbAHN20nIV6ViOBZbfQzk
 CGUg==
X-Gm-Message-State: ACrzQf0KtasBI8bw8fVHsMMSvXMATNVYUU4hja7aFVwkQDCt3LHuGq0o
 ZqzMHcCGt6r0DwUcb1ox9RZWpUijvYcolt38
X-Google-Smtp-Source: AMsMyM48XB/xqZrXZfgjEkjTRwOTnqBzF8SnABDFlwYZLXO4ndvp8UVpVqOYY9wN/uynVT516KQstA==
X-Received: by 2002:a05:6000:184e:b0:22e:4612:496d with SMTP id
 c14-20020a056000184e00b0022e4612496dmr13187334wri.91.1666371555212; 
 Fri, 21 Oct 2022 09:59:15 -0700 (PDT)
Received: from localhost.localdomain ([202.21.109.40])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003b4cba4ef71sm94903wmo.41.2022.10.21.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:59:14 -0700 (PDT)
From: Amarjargal Gundjalam <amarjargal16@gmail.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, thuth@redhat.com,
 Amarjargal Gundjalam <amarjargal16@gmail.com>
Subject: [PATCH v3 0/4] ui:hw: fix tab indentation
Date: Sat, 22 Oct 2022 00:59:04 +0800
Message-Id: <cover.1666371095.git.amarjargal16@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=amarjargal16@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

V3 addresses the comments put forward by Thomas. V2 actually already addressed the comments by Daniel, but I forgot to update the patch description add his R-b which are all added in this version.

Amarjargal Gundjalam (4):
  ui: fix tab indentation
  hw/audio: fix tab indentation
  hw/display: fix tab indentation
  hw/usb: fix tab indentation

 hw/audio/fmopl.c             | 1664 +++---
 hw/audio/fmopl.h             |  138 +-
 hw/audio/intel-hda-defs.h    | 1008 ++--
 hw/audio/wm8750.c            |  270 +-
 hw/display/blizzard.c        |  352 +-
 hw/display/cirrus_vga.c      | 1602 +++---
 hw/display/omap_dss.c        |  598 +--
 hw/display/omap_lcdc.c       |   24 +-
 hw/display/pxa2xx_lcd.c      |  196 +-
 hw/display/tc6393xb.c        |   74 +-
 hw/display/vga.c             |    6 +-
 hw/display/vga_regs.h        |    6 +-
 hw/display/xenfb.c           |  260 +-
 hw/usb/dev-hub.c             |   86 +-
 hw/usb/dev-network.c         |  286 +-
 hw/usb/dev-wacom.c           |    4 +-
 hw/usb/hcd-musb.c            |  328 +-
 hw/usb/quirks-pl2303-ids.h   |  180 +-
 include/hw/usb.h             |  118 +-
 include/hw/usb/dwc2-regs.h   | 1628 +++---
 ui/vgafont.h                 | 9214 +++++++++++++++++-----------------
 ui/vnc-enc-zywrle-template.c |   20 +-
 ui/vnc-enc-zywrle.h          |   16 +-
 ui/vnc_keysym.h              |    2 +-
 24 files changed, 9040 insertions(+), 9040 deletions(-)

-- 
2.25.1


