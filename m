Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985A337539
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:16:08 +0100 (CET)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKM6h-0001Xt-0n
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lKLnJ-0002Rn-C6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:56:05 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lKLnE-0003D1-Ux
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:56:05 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q5so1066970pgk.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rRdGEUKgmASfURQwxZuwunN+H2oaxj746Ox5GkMmKEs=;
 b=LW2PYr7qMhRNE5Mp8EBp5Tb+RXQRhJlSjmGJGKpxY/qky70KGtuJHngdBibXkOILNh
 rbo6mPDro5hRHPYLqTUCqUq0aeUlWBvVEP6/ur6DxHHHW6J5Chvwg+XDinK9YI5UUJY4
 sIjMztMygTLV0Mo2uywhqD7E1fHcpzWAkLLrhnFXE/JA1PmiTX9KUXgIabjEJo9aDRfT
 wMQnk3LnG+Y0kOj2u4NeXYLuIU6T0WtOYRVSdpngacJ+BHSWqHGLRkAAsnSsSkvBpi/l
 spqKprcoOQI7H5Q47/XuZCIEcTYHHLZ4cRaq5Xt3l9XWicMPryxssxlL1DMC1quQ5qrI
 93jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rRdGEUKgmASfURQwxZuwunN+H2oaxj746Ox5GkMmKEs=;
 b=TV6dkLe99+bmThqNRucZyvzfIs4qumdNjnJwskCpEsbA5GauskvwdXH23m4f7A4na+
 phGF47CqvhxKI+8Qltd487y1YSEKd7+/jIlW97OspuvuFDTej4huglKRnjOnHyvf6WBa
 fNgmmn2BkCTijfh/dYQALncUNx76IhU6tLZxXnU6kLq67p0P7nksDZi/bkpYLJTBL8aa
 crmSoBOzrfWQH9dyzseyCw1yfCBN89Pr2kC4t+xEER4AaVSGbgk7d5k6x6S1lpgDZd4z
 mOL3fF5395UOnXmy19zLvfo3logFBTKRolerjEDelccAebfsFXJV2wdX14BXDOpmN3P3
 VBRw==
X-Gm-Message-State: AOAM532Lv0kfDd+4rEUFDoK4VXbyNSG0CB/qXiK6tjRjXqfgcux6wpHo
 DkRKaPYo5LtIX/KQnAXXdyCXXvAcWL7MDw==
X-Google-Smtp-Source: ABdhPJzvIMgmTQy9679WHrBtcK7CbvxJ7d7zAksfECH9TQiP//MPiUoNshRUB7SLTydgg+pfhCwoDg==
X-Received: by 2002:a63:460e:: with SMTP id t14mr6035954pga.230.1615470958863; 
 Thu, 11 Mar 2021 05:55:58 -0800 (PST)
Received: from localhost.localdomain ([120.138.12.210])
 by smtp.gmail.com with ESMTPSA id a7sm2582392pfo.105.2021.03.11.05.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:55:58 -0800 (PST)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] AVR GPIO Emulation and Arduino D13 LED
Date: Thu, 11 Mar 2021 19:25:36 +0530
Message-Id: <20210311135539.10206-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pg1-x52a.google.com
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
Cc: S.E.Harris@kent.ac.uk, mrolnik@gmail.com, f4bug@amsat.org,
 G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The following series of the patches add a basic AVR GPIO emulation
to QEMU. The AVR GPIO emulation patch was originally written by
Heecheol Yang and was posted on the mailing list around 5 months ago.
I am re-publishing the patch with some bug fixes along with my own
patch, Adding the D13 onboard LED.

G S Niteesh Babu (2):
  hw/gpio/avr_gpio.c: add tracing for read and writes
  avr/arduino: Add D13 LED

Heecheol Yang (1):
  hw/avr: Add limited support for avr gpio registers

 hw/avr/Kconfig             |   2 +
 hw/avr/arduino.c           |  15 ++++
 hw/avr/atmega.c            |   7 +-
 hw/avr/atmega.h            |   2 +
 hw/gpio/Kconfig            |   3 +
 hw/gpio/avr_gpio.c         | 148 +++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build        |   1 +
 hw/gpio/trace-events       |   6 ++
 include/hw/gpio/avr_gpio.h |  53 +++++++++++++
 9 files changed, 235 insertions(+), 2 deletions(-)
 create mode 100644 hw/gpio/avr_gpio.c
 create mode 100644 include/hw/gpio/avr_gpio.h

-- 
2.17.1


