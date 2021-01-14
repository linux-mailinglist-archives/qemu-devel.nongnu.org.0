Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23A2F62BA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:10:24 +0100 (CET)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03KR-0003s7-Ls
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l03DM-0004lJ-Ii
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:04 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l03DF-0008Me-Kv
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:03:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id g10so4788284wmh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UeSsuxnmM5o6jX1Veue08smFWGGUlQy1nZgYNIs85RM=;
 b=s72oyY8FhImNXP9IQ4Dolx1I5nMEp2uXt2dx0iuASgDVde7FEkJwGFRuyi8xPx+quJ
 L5DTdjUnxErzp6LcB7hs52s/MjzevACxLtYGO6AWpWlnob5z50N6U4oRa3yoDQQh9e4L
 a4ch18adhf+mZGuwnV4m9WbIhzniE0zZGasXYhMK5SKIdf+iaMiK5aUcfD19Q2u4iZZ5
 hT442+yY3i5CaKRBlFQenDlHqJAVOOAxCwAKH20M89lXNp1/Nl03XtEr3bqV8M0907bm
 F6StW0B9dzSWTwNtBH77/5xLVLdfb/WYnd+xfTBW2BR8qI/rv+bkK5DFBWogohqAEjBc
 Xglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UeSsuxnmM5o6jX1Veue08smFWGGUlQy1nZgYNIs85RM=;
 b=ezaJYFMEL1p63wg/R0bGkgEfCiVpul5y2eHewi2f1fsGur1vqcjXKiYExK/zDV/qVC
 2Y8FBuUcOuwBJ51Gn3jew8wbeL8pPKeR+RYhnI8eTaHyg44GdvnYmKk0IfcsKd41hKr4
 3N70pEI24wb1LyzHe0hDnEFKAtGHOmn//I/64ILoIW+T/IXTXl5lMBBOuRGCm4lk4QcQ
 GQIR0JyvVUVfovMyhAeNMSB5m8t8wWWD1vpH9GAGr0XKfV2uQ6UwRcr/7dEY0D6PhBOi
 mcMg45ubZE2lRDllr593sCDpNAGpXeuPZfdlAi4Sb4gH3H6OuyL2PTAffPA5W0MpZcd5
 tNsA==
X-Gm-Message-State: AOAM531RV0qboKmdCkRboAhEL/lmw/XqMLqvdBO6BDdSfskPTwSGNlZZ
 hBsy3z9Sg1mp6NxJmoGFutbreDzIwKCeN4Ia
X-Google-Smtp-Source: ABdhPJytHLdjzuygdwJtNV7pfYoHvjRF4WPEgss1/+phkYj2gLalF41R6CYINEUkBDJlAHMH5KjgoQ==
X-Received: by 2002:a1c:6383:: with SMTP id x125mr4156592wmb.46.1610632975183; 
 Thu, 14 Jan 2021 06:02:55 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id h13sm10128002wrm.28.2021.01.14.06.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:02:54 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] ui/gtk: Update refresh rate on EGL as well
Date: Thu, 14 Jan 2021 15:01:51 +0100
Message-Id: <20210114140153.301473-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: r_qemu@t-online.de, philmd@redhat.com, kraxel@redhat.com,
 Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches regard the use-case of GPU-passthrough on QEMU for
 accelerated graphics.

Usually when people use GPU-passthrough on QEMU, they opt to have a
 physical seperate graphics card that gets passed through to QEMU
 using something called "PCIe passthrough". Since the display output
 is invisible to QEMU, the people who run these kinds of setups tend
 to view the display outputs by physically connecting a monitor to
 the "PCIe passthrough-ed" GPU in question.

However, on the Intel side of GPUs, there exists a technology that
 allows a user to pass through a "virtual GPU" using something called
 GVT-g.

Since virtual GPUs have no outputs, they rely soely on software trickery
 to get the image displayed on the host machine. In case of GVT-g it is
 done by DMA-ing the framebuffer to the GTK UIs display.

However, when using GTK outputs, there was a problem which caused the
 image to be updated at only 33Hz (or FPS). These issues were first
 discussed back in December 2019:
 https://lists.nongnu.org/archive/html/qemu-devel/2019-12/msg05514.html

There were a few other issues along the way, but those were fixed as well.

The focus of these patches is that when using GVT-g on QEMU, it must
 launch the GTK UI in OpenGL/EGL mode. This causes the code responsible
 for updating the refresh rate to never get executed. Which is why I added
 it to gtk-egl.c, to make sure updating the refresh rate works on EGL GTK
 UIs as well.

These patches were made in response to Volkers patches which dealt with
 cleaning up my previous code:
 https://www.mail-archive.com/qemu-devel@nongnu.org/msg766686.html
 and thus are meant to be merged after Volker's patches.

Hopefully, this commit message isn't too daunting ;)

EDIT: Sorry about the badly formatted patch emailss, still can't get
 a hand of how git send-email works.

Nikola Pavlica (2):
  ui/gtk: expose gd_monitor_update_interval
  ui/gtk: update monitor interval on egl displays

 include/ui/gtk.h | 1 +
 ui/gtk-egl.c     | 3 +++
 ui/gtk.c         | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.30.0


