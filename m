Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D4142089F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:44:56 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKWl-0008HC-Uw
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKDo-0000FD-Kx
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKDn-0007x7-22
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id r10so13108760wra.12
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lF/J2KAE2/fxqdlXVhjeEAjLVIkk2vpxr4OwSN227A4=;
 b=PgfbpNyXu6blmEgxIDsS72CsOP0LIiqy1uKwToDOsR9f8VEzbscx+cVKGC12H5cpdq
 2a8hKtOTmPC244IBCNJARnAjztYQZuLu2Lr23H9JE5Uk3tvUNM6Zjtq+gagRYhwRAh1I
 qHguSAPdEiwWVpfeqSjM9+V3CS5gZpafq2zaEuMto3CScNuK1WPrkySjbgfovBnwBoOW
 8YhYh9G05CgtFO4jJtpVMwoJTL7NDCehw+QhJ48G5X5ZmBCB8yeM2vlgU8LVu9x5Q5km
 CUHwR+xOzK8gY3y27DwuFfYgXSzIrGIM7aJK6FnincEc+yxF49/+C6FGFTNIXlbN8Ocx
 DiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lF/J2KAE2/fxqdlXVhjeEAjLVIkk2vpxr4OwSN227A4=;
 b=7JpblSBlPeuRnXdIWrK6cYIToa9wlR0rXYwlO9R3dJBvzuqqEgLVke/LEKoepPaJok
 aMEun9HkVELCLn3d+oxPEvPk3EOzPbJ6lbgG1UnJHMfW5VLxFlNYr7XajqyZ2wsDI/Kr
 4EN8rxArU7iqzq3BLrmZ89Dc95K/dFqGjsYSW6xAOxvXAFhLqyh60E7ou+35InseHi7c
 BHRd9nFKb11Ldp5F3nXM+3Be+mj/Ttnjiqqh/LgQWW3+Y7KyA/RauGjIJCHxEkjKa25o
 S5VGtUqApWCnjfY1ddEHqkjXuhwSCwz7RR8MBtwRkDpxsjzByOhsLQykunKeshMLu4lw
 yXdQ==
X-Gm-Message-State: AOAM531iKw4KbdDhf03YWgZ0BSFZCCM4HU9GmwIgxJsz5vK0MCDhZH6K
 9jQfPAIHiQnn6nwNFmAsdIssTv7kdjY=
X-Google-Smtp-Source: ABdhPJzw2zrzaY9wEOwbylUmcvgg6TZYpausiSUFLkEjAJpIsfkGj+1lhMutqcrl2inHpZmCNt/jdw==
X-Received: by 2002:adf:f302:: with SMTP id i2mr2883413wro.18.1633339517007;
 Mon, 04 Oct 2021 02:25:17 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i1sm14662475wrb.93.2021.10.04.02.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:25:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] MAINTAINERS: Sanitize 'MIPS TCG CPUs' section
Date: Mon,  4 Oct 2021 11:25:11 +0200
Message-Id: <20211004092515.3819836-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move various files unrelated to MIPS TCG frontend into=0D
new sections.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  MAINTAINERS: Add MIPS general architecture support entry=0D
  MAINTAINERS: Add entries to cover MIPS CPS / GIC hardware=0D
  MAINTAINERS: Split MIPS TCG frontend vs MIPS machines/hardware=0D
  MAINTAINERS: Agree to maintain nanoMIPS TCG frontend=0D
=0D
 MAINTAINERS | 45 ++++++++++++++++++++++++++++++---------------=0D
 1 file changed, 30 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

