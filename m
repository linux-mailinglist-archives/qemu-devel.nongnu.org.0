Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6260CF19
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 16:34:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKum-0005zm-U5; Tue, 25 Oct 2022 10:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1onKuj-0005ee-AR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:28:22 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1onKuh-0004LI-NL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 10:28:21 -0400
Received: by mail-ej1-x630.google.com with SMTP id d26so12882274eje.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wYKTuID7HKH/TCeA0Rqh1TOZpVL/LMea7cgoZ2fkTWA=;
 b=Y475V0NWTgWWDkki/j1ztHaLb5S2FGeMKSq33oyo6Cmwy9R0zfAgbQPeGYn7Gjh9kZ
 nfUeHRz977mSU4rFv0PRBlBYvo7smH/Wz9LYUBZKg7+apUtbwhDrn/KjFCgkIhrpW6v4
 IrkTVTbCmstxMzfXHnVN10+VqRWSuOu2eTVKHBqxq+95bL3TlrNZrHJcF4lwjKWMesmv
 SD0G9RXYzx7LVF3d/AR/HYcx/vGUPEW9o2SOUr6urjtwAo7X7QmDc7nyFHFJSDuTIIG7
 6lvAVMZKlkstnMIR3dOfa6q+ldDff513np1zlq6gN/rxspzRCNWq6xwvA8Qj4qljTLX1
 vEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYKTuID7HKH/TCeA0Rqh1TOZpVL/LMea7cgoZ2fkTWA=;
 b=2NcPv+2nLj7OU7vPTAx8PaCAeKg42zA3kBN9mkSHme1MY3Nm02GrqfHguD2k2TNFxl
 EfjFpVPnX2fCbb3wqNq8McnoEoQXDjZZ/e5LBLLE0kQO4q1LhseM4pKTSFFD4c7CBM9j
 NM91/u75/8K136VRNwT6UrBZFDa9gqafcZlH/zdjShokZESDJ8h95r0SdglBt4j4I5g4
 QBv5VeZsnKYr6+Rimz2y76pd7JfMrYfNGgCzHt6VJCO+w94MoPM+hw5IW8Rs2Lysj8vS
 V3ApkAB0lpPqj6XQzQQvL7oXL1E7RCzCo4dgmrMUcYnkAnrKYZSivQ2myfH4hbEYbHLK
 DFRA==
X-Gm-Message-State: ACrzQf0YJUFgTsM2XEp1Pt9OLJrEfnCgd/JTJGVyoeuLccdzqGcEbdy9
 vw7kNE9Zjc36twgYIxl84Za8bw6qIjcI5OAxPiE=
X-Google-Smtp-Source: AMsMyM5pYHnkBHaFCTeUaQRe9khUxSmGFJ5tgfRglK3NUOtjdMSPjMiC1ieKy9KmqHN3oxYJOW4qMg==
X-Received: by 2002:a17:907:2672:b0:780:8bb5:25a3 with SMTP id
 ci18-20020a170907267200b007808bb525a3mr32472532ejc.281.1666708097780; 
 Tue, 25 Oct 2022 07:28:17 -0700 (PDT)
Received: from localhost.localdomain ([202.21.109.40])
 by smtp.gmail.com with ESMTPSA id
 v7-20020aa7cd47000000b0044bfdbd8a33sm1746220edw.88.2022.10.25.07.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 07:28:17 -0700 (PDT)
From: Amarjargal Gundjalam <amarjargal16@gmail.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, thuth@redhat.com,
 vr_qemu@t-online.de, Amarjargal Gundjalam <amarjargal16@gmail.com>
Subject: [PATCH v4 0/4] ui:hw: fix tab indentation
Date: Tue, 25 Oct 2022 22:28:07 +0800
Message-Id: <cover.1666707782.git.amarjargal16@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=amarjargal16@gmail.com; helo=mail-ej1-x630.google.com
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

V4 fixes the issues addressed by Volker.

Amarjargal Gundjalam (4):
  ui: fix tab indentation
  hw/audio: fix tab indentation
  hw/display: fix tab indentation
  hw/usb: fix tab indentation

 hw/audio/fmopl.c             | 1664 +++---
 hw/audio/fmopl.h             |  138 +-
 hw/audio/intel-hda-defs.h    |  990 ++--
 hw/audio/wm8750.c            |  270 +-
 hw/display/blizzard.c        |  352 +-
 hw/display/cirrus_vga.c      | 1606 +++---
 hw/display/omap_dss.c        |  598 +--
 hw/display/pxa2xx_lcd.c      |  196 +-
 hw/display/vga_regs.h        |    6 +-
 hw/display/xenfb.c           |  260 +-
 hw/usb/dev-hub.c             |   82 +-
 hw/usb/dev-network.c         |  286 +-
 hw/usb/dev-wacom.c           |    4 +-
 hw/usb/hcd-musb.c            |  328 +-
 hw/usb/quirks-pl2303-ids.h   |  180 +-
 include/hw/usb.h             |  100 +-
 include/hw/usb/dwc2-regs.h   | 1608 +++---
 ui/vgafont.h                 | 9214 +++++++++++++++++-----------------
 ui/vnc-enc-zywrle-template.c |   20 +-
 ui/vnc-enc-zywrle.h          |   16 +-
 ui/vnc_keysym.h              |    2 +-
 21 files changed, 8960 insertions(+), 8960 deletions(-)

-- 
2.25.1


