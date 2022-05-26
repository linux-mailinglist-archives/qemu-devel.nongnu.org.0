Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9049B5353BB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 21:03:45 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuIls-0003qM-73
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 15:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuIjF-0002X9-6l
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:01:01 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuIjC-0008OI-HV
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:01:00 -0400
Received: by mail-wm1-x330.google.com with SMTP id z17so1490477wmf.1
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 12:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Za1W8Z73LYJQMLq+DoV9xFchiuaB+gEh8w/v5DMmpF0=;
 b=BSmBDpK12emCGIESA/EOpAl6vty5vJhOCP/WP1fBTlQDnAwmWla5fOniROv65PFpCD
 Rn18mQLwt7PdvtG4xyvb5LXAk/Wa6V+cJrAhSjwEJjF3CcRS+KnpZMaVKxpjynlJwiJp
 QZGHYkhvkK0qK4UGWJwuPABh/jlbBKo1crYSyl1b41GZ3ndqw+v409gREckKZOtRg0EJ
 JLC37RadFc7G02Z2vwyT2jL5esocOHj0t/Ybu4N9t7yNIghe5BCDlUaEQezUtd5aRFMW
 SjXwysbFRUHVYpcbTYvgBOcSWY22TIvM5qfDso89i8bKx0VQ2tcI1a1OD/cqO/OBKX/0
 Z0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Za1W8Z73LYJQMLq+DoV9xFchiuaB+gEh8w/v5DMmpF0=;
 b=4KsfKEW0V8G4AB4N7oi8XeRgrGlBM96jlNnbYLxyEwHFZphRASwd2nM3egrX6h64tY
 67MN2b+56gbzw9l6Y9fu8K01dI8qEST6EAOcxA2wUKrjf/iud0YPeGZft+ZSDih5T8er
 xNujozLSAGs0wfRX+BfUzOjRUkDsjVtytRed0DG/j8lz2ObZP3rbEtPwjJcCtIFhghN4
 od4P0U7ju06QXWZIId1FeXrkmsxho0cs6Y9CgGuit7ozH3NYGXat3X5XLBRk/DhPd91P
 GaFnmLc3XKw6JaKn4AvB3uUYPmR3R/fM3X+8JJp5W5fBXo6Lh0edlKAqgwHAULIaJwra
 QeeA==
X-Gm-Message-State: AOAM531DfS3ZjqyXwx+GcLasJIhsZJTQG7bOq7pj3UDs242+nKQGB2r+
 GCYT5p9kpW/cD3L9nOxm8jNMIJnNUn12Zg==
X-Google-Smtp-Source: ABdhPJz1eOtxmqqYnfgNJxY1DzVYVq8cNhvv5Emkw/trqRafw4F5p/0F9lW8tEZ8UBPCVeQj0qCxsA==
X-Received: by 2002:a7b:c346:0:b0:397:626d:d2c4 with SMTP id
 l6-20020a7bc346000000b00397626dd2c4mr3568656wmj.172.1653591655783; 
 Thu, 26 May 2022 12:00:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a1ccc0a000000b0039763d41a48sm2507476wmb.25.2022.05.26.12.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 12:00:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 0/2] gdbstub: don't crash if no gdb attached and gdb syscall
 attempted
Date: Thu, 26 May 2022 20:00:51 +0100
Message-Id: <20220526190053.521505-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

This patchset fixes a couple of bugs reported by
Liviu Ionescu related to semihosting syscall handling.

Firstly, if the user sets up the gdbstub but doesn't connect a gdb
(ie passes '-s' but not '-S'), and we try to use gdb for semihosting
syscalls (either because the user explicitly set target=gdb or else
via autodetection) then we currently segfault.  This patch adjusts
the behaviour so that "gdbstub initialized but no gdb attached to a
vCPU" is treated the same way we already treat "gdbstub not
initialized".

Secondly, we weren't handling commandlines where
--semihosting-config appears multiple times: these ought to be
merged together but instead we were effectively ignoring
all but the last one.

thanks
-- PMM

Peter Maydell (2):
  gdbstub: Don't use GDB syscalls if no GDB is attached
  semihosting/config: Merge --semihosting-config option groups

 gdbstub.c            | 14 +++++++++++---
 semihosting/config.c |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.25.1


