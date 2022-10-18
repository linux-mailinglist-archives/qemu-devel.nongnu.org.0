Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB9603190
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 19:28:33 +0200 (CEST)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okqOG-0001bk-6N
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 13:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okpPM-0002HG-Lr
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:25:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okpPJ-0000at-SB
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 12:25:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id bu30so24462961wrb.8
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Io9Qq01re/nBLLZmim27qy4nDPfvaeawm2hn8PDzI8g=;
 b=Mafzho2GAZepaKuW7G2NnZrrWR+e1XZdVZPt3K6WoXo1GQkTAPedCbvMwWer0kTqvs
 Iycti/Uxg6SQgREQ8737+2/WCVOK6lwBkD2K93tZ6jOyO1vsybTuGyRevwSlTp6c1Eid
 3FDGIts7qbK5jR/yfSsbJxXAjMGqDu+g9zJcE3wjJzolr52zlM+xuc8vGHAcZUIwsvV7
 ctLUCfS4vWdS01ywBsm6LqlgBYVXqF32sVRG8pbNV5/TPlLktXjJM8aBsvJSg0IgNT78
 sEKyececXxdchZ+BznPEBNku4fKy0dAk8qOWaPIVkaBg6jLOcNcA849h9a/bWFmJULHm
 sIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Io9Qq01re/nBLLZmim27qy4nDPfvaeawm2hn8PDzI8g=;
 b=SJBYs2oIPcPo3ZqQZcyF5fuCPskqdrYXEC4uAPyF0evU2MDoA3g6XX6Ww2YlaxlX+l
 E60SL85+7dffguMUOZHhStlHI+xtK4WbLUXw6oGimiN7YLKqfddgr9g6w4OWn/iTIgCE
 58y1YnU7UKuaV+8jVsHk3EvD0kUVSuXeBygmSjvvT/N87p7BwTP4WoOHkmDTgLMSmhpI
 /My00dnTI2vFBSqikIBKeTdcN75/V+8EDT1KqvptrRAh0BD0qzTcCmAGBCHoX+i2zER2
 aKSOHV/LIbHERI9EfKZC6jSiw2aIFA+nWI6C5YZk1Ezso4ryl56URpxfEwRm/+bwy8AK
 g08w==
X-Gm-Message-State: ACrzQf3yRV82njH4qgbOjblzJlOHIYZKtYw1clGLksgIUUdGCtJvdG2H
 RtoJfbdWuELqaTxxLKQO7LpOqZmOv0OL4iGGDiFRKQ==
X-Google-Smtp-Source: AMsMyM6N6JYUJpuMBiJv0coRilMhT+pC3tZFogLfuiMLSicpbNt2fOMZwDQenb1rS1njAKF65mOKGw==
X-Received: by 2002:a05:6000:1f88:b0:22e:3c57:943b with SMTP id
 bw8-20020a0560001f8800b0022e3c57943bmr2487158wrb.65.1666110330833; 
 Tue, 18 Oct 2022 09:25:30 -0700 (PDT)
Received: from localhost.localdomain ([202.21.109.48])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b003b4de550e34sm14250012wmq.40.2022.10.18.09.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:25:30 -0700 (PDT)
From: Amarjargal Gundjalam <amarjargal16@gmail.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	Amarjargal Gundjalam <amarjargal16@gmail.com>
Subject: [PATCH v2 0/4] ui:hw: fix tab indentation
Date: Wed, 19 Oct 2022 00:25:16 +0800
Message-Id: <cover.1666110191.git.amarjargal16@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=amarjargal16@gmail.com; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are still a lot of old files in the QEMU UI, graphics, audio and USB code 
base that use TABs for indentation instead of using 4 spaces in these files.
The TABs should be replaced with spaces, to make sure that we have a consistent
coding style with an indentation of 4 spaces everywhere.

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


