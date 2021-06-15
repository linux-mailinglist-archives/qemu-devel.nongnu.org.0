Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744D53A870D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:03:28 +0200 (CEST)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCTH-00081X-4W
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltCO9-0000zY-Hd
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:09 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltCO3-00013a-P0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:09 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so46592wma.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=neQfUHRP5udgJtpUuMrl8QxEv+eMlbyPb5+IwoTc2GQ=;
 b=X28HKTqYDA3EBErdpSIISIIrnSxZdHe+KsPGKvlbuD6qWE9mrRjNoLRjihZ6Vxa6Rs
 t9XDkO9gpfNRR0b2jrme2FdAXBHwdRc22pSHb9tbIUTukmgv40a7Q6olkGei0rOghadm
 MVVd9lO0tB/IVWrpQtvSZSVbiBAH4q00VcdJijyDRb6jswaM17Loo59Kzb0XoMGqk/Q2
 vd/shbo6lBzsDAyVwhAhLIj2tzw510UR8f5mb7VsZrqiIeLiWZZnq4r4VwmWfjHX92lW
 KsIStHGmLizWndrLY1GdRuCx23O7uwpRyJksNikQ+9myZ3IxstwsmrZSbjwq0P9lK277
 +sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=neQfUHRP5udgJtpUuMrl8QxEv+eMlbyPb5+IwoTc2GQ=;
 b=nqGKyYf5ojtdP/SVXdsq1UMYQa+CrYraYCfLhls3VnOnSDbmjXbE6dEvbAUXj4rnim
 kTyXr3n9m1KRCXQkuBnZxyDbgNdEoHqxx4xnDYMYydtXq1xNkHTM9X5V+oLKVPR8zgT2
 53Yo0uxE74dNIRhD4cpHAAJPkebkRNEimEyyZxIgKDVyWymG4yQpEo59lbjEet9CxqFv
 lHYwLXysaPt0ZJrTtalfJ35XoUfxhIuDU7VTgsrS53G5CyBHoC+b3SUQqbbOhDsYRAfi
 /w0FbG4yEfLF4WfueWxMHnfTQ0NK0MszjKZsKRY235TKLay/siEDHCktztzuOx/AUkL9
 SUHg==
X-Gm-Message-State: AOAM533viCzl8m/7xzbESG00MxwNMQuJ8wWCFvmrU9Ax5SEYfXE9pNLl
 5jmMTORxGhS8ScY9nwsEmXZtmQ==
X-Google-Smtp-Source: ABdhPJxe3hdKwvrf1jG/DlcO6TDdj3qk8ZJSsVb4WIYf8yb8Uzn1hayIrBXbtdSVA1Npf+YluUmgTw==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr4477392wme.103.1623776282043; 
 Tue, 15 Jun 2021 09:58:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e17sm21300308wre.79.2021.06.15.09.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:58:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DB071FF7E;
 Tue, 15 Jun 2021 17:58:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 0/2] semihosting/next (SYS_HEAPINFO)
Date: Tue, 15 Jun 2021 17:57:58 +0100
Message-Id: <20210615165800.23265-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Hopefully the 3rd time is a charm for this series. I've removed all
the review and tested tags as it is a full rewrite. The code is
hopefully generic and doesn't have to play tricks with guest registers
to work out where RAM is.

Please review.

Alex Bennée (2):
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

 include/hw/loader.h                 |  10 +++
 hw/core/loader.c                    |  19 ++++
 semihosting/arm-compat-semi.c       | 131 +++++++++++++++-------------
 tests/tcg/aarch64/system/semiheap.c |  74 ++++++++++++++++
 4 files changed, 173 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

-- 
2.20.1


