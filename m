Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211814EA327
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:46:21 +0200 (CEST)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYy7w-0000NL-0Q
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:46:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2D-0002S2-Ds
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:40:25 -0400
Received: from [2607:f8b0:4864:20::42e] (port=33739
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2B-0007pW-So
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:40:25 -0400
Received: by mail-pf1-x42e.google.com with SMTP id b13so12294253pfv.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s+6e9PZPx92xz1Up/E3rgkWnhD4TKMKcvkj+dd4TGqE=;
 b=K+Ozgl3Kwfpfi49k0abka4fPYhotUeyuj2JC6OLvaJ/eZCOixfuJJbs08kE0dXP8Q/
 xX4VW3wOsDWGWdoGpakyyMLTXbgumN5CKHqyuzLUmxyyQmpiPnzyzHkz/YU6l2dvy8CE
 rAwMTbg1nLd/DPZJd2sNowzE2wOky7QIvk22PM/+NAeSzFoBiktPyj3cyDRg9UtTzhho
 0z7VIeQVFCI17nY+6WOuV0J/ObklIaQvMuTdk/lOb7qfwNwkv0il33SIOlsbICHDzZNS
 J2nzRUuOkOJQD5h0Rohi7Sg/B3Omjbuq/OHFt8SajO9JzdcBKJmYb9Rgoa8zcyyR9Y1U
 pswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s+6e9PZPx92xz1Up/E3rgkWnhD4TKMKcvkj+dd4TGqE=;
 b=rJRM2SPRDADOa3LL6vpbe2E5Ho0M2RcKXkdkNceWdPqUjYJ2yNEfFsDyghT55EtPe+
 /VDBgfJ/VhIZmlCSHKeE8b4peOg1rrWlruHPNYEpnelQdnyxlmdZtyAKxdWdRsmMWIVy
 QI6RtF83neHUNxEU5UCqGky2Ql+TC8l7IX8eBoKi9CbHJ4JFr66lKqD9rndRFeaRvCcE
 BzGYFN0usB6lNdn4SxUqfyHfmyE9hjjooXykZUKxO6hYBXjki4w2r+sxfQhERzAWcs8w
 yfDbX1YWto2/X3lGuIdMiuPilCvv2jeEnmPFFEqrdmNdcX2t0buLChDYhSpVJs/z/k8U
 tXHQ==
X-Gm-Message-State: AOAM530DMxl47aJzzZj5j7hEQxmk1VDZ4aJlN4kuSwVqP/78w85rWouO
 BpTbZbuqTqaFuqjq+LO6AH4ONUOTXUk34w==
X-Google-Smtp-Source: ABdhPJx6o5/NaIQUWT/DAheCWNd6+Wp9SN3PRlpGSt3wZew4zrxcUkDb0uo6VwIsWP57XDpT3EjUNg==
X-Received: by 2002:a63:185c:0:b0:381:10:2843 with SMTP id
 28-20020a63185c000000b0038100102843mr11595165pgy.433.1648507221741; 
 Mon, 28 Mar 2022 15:40:21 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a637159000000b00381fda49d15sm15209228pgn.39.2022.03.28.15.40.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Mar 2022 15:40:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Darwin patches for 2022-03-29
Date: Tue, 29 Mar 2022 00:40:08 +0200
Message-Id: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 27fc9f365d6f60ff86c2e2be57289bb47a2be882:

  Merge tag 'pull-ppc-20220326' of https://github.com/legoater/qemu into staging (2022-03-28 10:16:33 +0100)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/darwin-20220329

for you to fetch changes up to a4fd374364d4e23e0861273aaf7ff2ebddd57a17:

  ui/console: Check console before emitting GL event (2022-03-29 00:19:37 +0200)

----------------------------------------------------------------
Darwin patches

- UI fixes

----------------------------------------------------------------

Akihiko Odaki (2):
  ui/cocoa: Respect left-command-key option
  ui/console: Check console before emitting GL event

Philippe Mathieu-Daudé (2):
  gitattributes: Cover Objective-C source files
  qemu/main-loop: Disable block backend global state assertion on Cocoa

 .gitattributes           |  1 +
 include/qemu/main-loop.h | 13 +++++++++++++
 ui/cocoa.m               |  3 ++-
 ui/console.c             | 21 +++++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.35.1


