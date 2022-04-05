Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B94F2976
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:33:14 +0200 (CEST)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfYn-0005ic-5h
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbfT0-0003Fz-BX
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:27:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbfSs-0002vb-1S
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:27:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id m30so18387251wrb.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dz30QEHiaIRKHWeN5/JAelYnK8ow2vAt+1f613IbjZM=;
 b=PVzB6BZfFa8613mz0doyxUvRrVJRE2aBuxaKOW5I2UNa7g2i7YR1l3UxIka8LmSDUp
 WLvoTFElHKA+yTAyzVK4OIfjJ18OcLfMTLilXovk9S4IYohjPG06EYUt39VHQSupuZgW
 nAjCU6cf9bYyp56wVZZAyOs5sCc7L3msPcdTvydfjQzw0PJEOBDwZBqe/TzPLPCcSXuJ
 vMYgyI5xOMwNme2xRi95snIjDjOZ08EUBqdIP7j2K+vjD7MJpM2PZMJ2qxnFNjybt8ci
 ldb32niXZuLOw6ZDP/zufU9TAjedCnaidtrxlI4dBksMCxzzmj3SmFIEDLqdzuU1qOtJ
 ioNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dz30QEHiaIRKHWeN5/JAelYnK8ow2vAt+1f613IbjZM=;
 b=T6lqyf4RA/wW8/I1DZP6xQeKk7vyzRw1w9Qcrrvgrt2jpWhIZpaDKf5fJy6FCt/SMS
 A6YyLMqNu6TwugQBY/4rKT0B1JLNoBrnLBwZysk3kMj2425xTOK9eYUiW6yz1OFZ090v
 pGV3QBuF3rgKdho4+jCq9FAnSCGyTm8l59I1a4spEabal/uHZJJO1hwtlFJqjTnNsqBN
 jyLnRZQE6xe/FeNYQnqldqtA74seJspyP9Ld0lMZmjwxmpE7GoGhJP+5SLs04AwXWDqs
 8qGXBdD428ee8JBCf9WNCyaQeTqddGx/UmcG9zK3L9NY66UIP/PaSXQwdMecsgblmDu6
 YwMg==
X-Gm-Message-State: AOAM530B7MVcQ4qfORchF7ijiQOF7IY8p2hA7SogVNYK6hgz3oQVrRk8
 +iYkqyQyJhoEuat3mdU7geKNU+0At6dOCw==
X-Google-Smtp-Source: ABdhPJxX/hJ+dhH+Ziebn7py6ie8tm4vMxsuFsg3R2hOfFZ1fdzZ2IIdKFmqphH21UGD/SS7ZZyooQ==
X-Received: by 2002:a5d:4288:0:b0:206:b7b:db7a with SMTP id
 k8-20020a5d4288000000b002060b7bdb7amr1963598wrq.28.1649150815401; 
 Tue, 05 Apr 2022 02:26:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm13467159wrz.29.2022.04.05.02.26.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 02:26:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] target-arm queue
Date: Tue,  5 Apr 2022 10:26:49 +0100
Message-Id: <20220405092651.725041-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Couple of trivial fixes for rc3...

The following changes since commit 20661b75ea6093f5e59079d00a778a972d6732c5:

  Merge tag 'pull-ppc-20220404' of https://github.com/legoater/qemu into staging (2022-04-04 15:48:55 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220405

for you to fetch changes up to 80b952bb694a90f7e530d407b01066894e64a443:

  docs/system/devices/can.rst: correct links to CTU CAN FD IP core documentation. (2022-04-05 09:29:28 +0100)

----------------------------------------------------------------
target-arm queue:
 * docs/system/devices/can.rst: correct links to CTU CAN FD IP core documentation.
 * xlnx-bbram: hw/nvram: Fix uninitialized Error *

----------------------------------------------------------------
Pavel Pisa (1):
      docs/system/devices/can.rst: correct links to CTU CAN FD IP core documentation.

Tong Ho (1):
      xlnx-bbram: hw/nvram: Fix uninitialized Error *

 docs/system/devices/can.rst | 6 +++---
 hw/nvram/xlnx-bbram.c       | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

