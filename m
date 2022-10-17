Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B27601650
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 20:31:41 +0200 (CEST)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okUtn-0001zm-Pv
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 14:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okUmW-000395-Ah
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 14:24:08 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amarjargal16@gmail.com>)
 id 1okUmU-00025J-PK
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 14:24:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so13326089wmr.2
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eWdWwdxxx/a96BFJ3f1zhZU3GwA2P4DR3a69bQKSNuI=;
 b=aROUS4VrXMJ62y5Vfls2nAUcjeIGhUnXHnemdGkRGQx9QT44yqfoa2OfxMjzBQaJD+
 gQF2nCk6GeL2qdsTEHVpGwqmZA1nikNwxmN4sQ+PRoaOGfnPA3IeWwl0OBxbaM1CVnJo
 mnNslRZLD4Oo7/XLiKA8IRhvMI2CvaxQlzUdQisnSHZ4Z7WOmNfSftJ9+xw3wGqdlF8m
 JQo468TEe7wifdrkLLSOrs9HsbRzQDlpw+ACtFy7GHqfz4Rl+gZ4AkmYWbMMVdci0/TQ
 svxXRLnxg4cu+4+ZFCEC9ogOTmgFO+OBS4a+OPBfBcys9ck4dACPtCO+fOgPBrTeLYAW
 U8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWdWwdxxx/a96BFJ3f1zhZU3GwA2P4DR3a69bQKSNuI=;
 b=4XrhM6e30Q55fbGuf8W7sKufRfrBr4RSSs6AbpgQOLVORHWnY1bfJeQsY/UEpFZiMu
 HlIWv8773nO9KKsAGTpy+ybv7dy6UdXufvttWCo60iG6jOod62PJpKLoClFAJoiS9m4E
 XNCzNd7Ec3ckW63JA6R4iOHtzxRmtw+D62KV2PU+OZYD92Jv9O+Idl59kxjGCX9YFStk
 lOKbJXslw5h+2ZvU+o5qXB6DA3mzIDF5SkclmnMvo/vyt2QHE+FnXlXoiEozTqQ3sv2/
 SZ0mudYqKODeXwBSbV2mlTTd+T4DRSNXX4fhLxq5JucpbKFoT04QWK6L+mdDJjEi1g6I
 Z5DQ==
X-Gm-Message-State: ACrzQf1KhRyyj77TNZgWYbZYYtwgV973y69AOqvUH3gBFPqxbmz2iv3M
 7/ul//KyiyX/kiPWij+bZJeiE9m38qFqk+wclKw=
X-Google-Smtp-Source: AMsMyM5sC235w0hNa7RWq9jX1mK1f8wbfdhzjzzeZR1qGX71sBcuYNCZezoLvupnzhSL0QroWQWu2Q==
X-Received: by 2002:a05:600c:4588:b0:3c6:f8b2:dd34 with SMTP id
 r8-20020a05600c458800b003c6f8b2dd34mr3645023wmo.178.1666031044789; 
 Mon, 17 Oct 2022 11:24:04 -0700 (PDT)
Received: from localhost.localdomain ([202.21.109.48])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0a4300b003b4fdbb6319sm17493047wmq.21.2022.10.17.11.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 11:24:04 -0700 (PDT)
From: amarjargal <amarjargal16@gmail.com>
To: qemu-devel@nongnu.org
Cc: sgarzare@redhat.com,
	amarjargal <amarjargal16@gmail.com>
Subject: [PATCH 0/4] ui:hw: fix tab indentation
Date: Tue, 18 Oct 2022 02:23:55 +0800
Message-Id: <cover.1666029821.git.amarjargal16@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=amarjargal16@gmail.com; helo=mail-wm1-x32d.google.com
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

There are still a lot of old files in the QEMU UI, graphics, audio and USB code base
that use TABs for indentation instead of using 4 spaces in these files.
The TABs should be replaced with spaces, to make sure that we have a consistent
coding style with an indentation of 4 spaces everywhere.

amarjargal (4):
  ui: fix tab indentation
  hw/audio: fix tab indentation into spaces
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


