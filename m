Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AC4C5334
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 03:03:19 +0100 (CET)
Received: from localhost ([::1]:42224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNmQY-0004f9-Cd
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 21:03:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmMu-00026H-2j
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:32 -0500
Received: from [2607:f8b0:4864:20::530] (port=39889
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNmMs-00073L-5T
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 20:59:31 -0500
Received: by mail-pg1-x530.google.com with SMTP id 195so6180278pgc.6
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mqQzXdSixbLyiX2e1dk/oIE0tgTK7bNdsMgi8xkjY5c=;
 b=DVUOOSSa7UENrPgK8jJHkOoQvdpZS5kF02PskR0joHMqUmAiOUHQ6vOFNNidWAnfAy
 XED0h4njGbJecduYQZU++A3fop0tswgyDSHfjo9HategYikzcxHs8E2tbv0Wf6E+A5Ms
 7gegUlLEBHONixEq95K0wxNs6dz0XQlbzVBkgQ0bpm3ZpcVnXd40ZMjQAm357T1a5O0R
 8Tz+zV+dFIhY6ffrgqnDM7y7408HZrIP63KJmYGYj6IQs+yHmEn4aXOy6x0OHYMir4XC
 a6rMzkMI6Yf6lMHUY35r2gG7iLrvpRP16P+YFjIK/V7I97xL5csS4ExfxjqZV7IhSG4W
 lxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mqQzXdSixbLyiX2e1dk/oIE0tgTK7bNdsMgi8xkjY5c=;
 b=RalMlKOgQ6gAexuaReWlhWhiVUk7kXXriaH6QuJZYLxEgF1heXrhhF9G46of8ngnQS
 5TiNb9FeSBnO3SNfmfv7067aiuh/NNuM/7Os+w0X8x27EMkf+VEKL4OU14mJuPwZv1oE
 4Y6ick8f0K68Ir+SmSwN7ALeGDP/6/tZpXRh9VhGT2VL7Zu4g9l+4/sPnvUsqx+Dssvm
 fcTUT5I1ySoKyut2Si7YU3hHZgtIMIIeNlL0nFWzdfvrWqUw5nPRvs9Fg5xyPaVbGwC/
 aZ+wZjywIPHgCztk3SXUjk0OBGdqZRwjMMSntwWa8y5PUcONdWF3ehPADiUYJ04Ot7Mn
 8hvg==
X-Gm-Message-State: AOAM530TGHas8DivkzwRjMzpz6gvH/Dsn6AjrzngRYpna/WXK7Mzdn50
 S8xRl9sO2Hhfy+hipmuBDP72PpCPTVtaLQ==
X-Google-Smtp-Source: ABdhPJwMVTYkgI6MiupBnJXJQr1J7WyzlWS5pQtObVmyfOJIFPxE9FQZ3yFocpQ8KXL1u8OlFxPV+Q==
X-Received: by 2002:a63:1065:0:b0:376:30d7:781c with SMTP id
 37-20020a631065000000b0037630d7781cmr6036443pgq.35.1645840768039; 
 Fri, 25 Feb 2022 17:59:28 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a62b613000000b004e1b0df0713sm4255783pff.188.2022.02.25.17.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 17:59:27 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL v2 0/6] OpenRISC DTS Generation patches for 7.0
Date: Sat, 26 Feb 2022 10:59:18 +0900
Message-Id: <20220226015924.1293022-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4aa2e497a98bafe962e72997f67a369e4b52d9c1:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-next-pull-request' into staging (2022-02-23 09:25:05 +0000)

are available in the Git repository at:

  git://github.com/stffrdhrn/qemu.git tags/or1k-pull-request

for you to fetch changes up to 9576abf28280499a4497f39c2fae55bf97285e94:

  hw/openrisc/openrisc_sim: Add support for initrd loading (2022-02-26 10:39:36 +0900)

----------------------------------------------------------------
OpenRISC patches

 - Add automatic DTS generation to openrisc_sim

----------------------------------------------------------------

Since v1:
 - Added fdt file include into meson.build
 - I couldn't figure out how to run CI easily, so but I think this is the right
   fix.

Stafford Horne (6):
      hw/openrisc/openrisc_sim: Create machine state for or1ksim
      hw/openrisc/openrisc_sim: Parameterize initialization
      hw/openrisc/openrisc_sim: Use IRQ splitter when connecting UART
      hw/openrisc/openrisc_sim: Increase max_cpus to 4
      hw/openrisc/openrisc_sim: Add automatic device tree generation
      hw/openrisc/openrisc_sim: Add support for initrd loading

 configs/targets/or1k-softmmu.mak |   1 +
 hw/openrisc/meson.build          |   2 +-
 hw/openrisc/openrisc_sim.c       | 308 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 286 insertions(+), 25 deletions(-)

