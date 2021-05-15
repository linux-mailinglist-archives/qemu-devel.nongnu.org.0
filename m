Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2038192A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:48:43 +0200 (CEST)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhueo-0006nu-Bd
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhucC-0003uM-Ua; Sat, 15 May 2021 09:46:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhucB-0002G3-Ee; Sat, 15 May 2021 09:46:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so516915wmk.0; 
 Sat, 15 May 2021 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LH42NgqF6XY/M1DMCD1cbnJKs0zZS+4B8S7rrNogafE=;
 b=jlr7zs0WJebCswFtTAzLYkzJm/NvIucFahJKAUvBy32Ji/bj5/swOqVZN1s6VLgbas
 WzmlPZFiLfZ6L/5i2Hs4hKlU2mspv9jm2ya1icFZmjbPJB1N/qoOdFsgGRvMtOP/Ojn7
 iNNWd/tBzJQj7Y6wWoj5fcxMxLdGxvGSbDH3PmwlLt3cdfrRDl/nBl7ECg+bHx7B8Zma
 eJQ8HadXggfvXxi3DAHNkVLZlAWjjKHgtOSfBMr6P2xZlkwMJJBoHIAu02npHNX+Tvj1
 r/O2bVQ7kWU36dTf6a3AcrP4lmnn09fv65f+xvJHlDvjnd7AcRgL5RcosT3bYIN8tgRI
 m5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LH42NgqF6XY/M1DMCD1cbnJKs0zZS+4B8S7rrNogafE=;
 b=J6iyE6+3p0m+6xiByI7gRTV4UXYN3enhLnIzQWY2yQv98eWWkt1kwFxgatXlpxkBck
 Vyl0lzLy2wM2gOJctxnCZK3/frg1XIRPE2iGOVumB/sqyXuMZ5SE5JWhtn4FhCYV2fZF
 hvvDPvdUfLdkvtUhXa5X+eWDYzHNH6DQSoYhZRv0spF5xabg12aerZyge7NRLUAq92ws
 dZoSES1G9wzTvYP9s5KW4xEWcFoJ7hqbsrDbXvRgPrxQUOUpTVN7gM1QM2VTVOF3BWET
 ZFUkPuCuyCq2D/BBqDmbp/Qbtn9LoWORBlvP9AKHjdHLadA51S2E8NyM9gmN0Rp4Y/4I
 0MQg==
X-Gm-Message-State: AOAM532nZw5X5ng2Yq4eGfS495Gf1xf4eChKcEXKCD8u9wduGrYV4t68
 dGEhfvbx7wSk6hdRLSwfgMnrzg8mDHEXjg==
X-Google-Smtp-Source: ABdhPJwvkGajfdxIQ26V5Xvlt4zwi2qpt29joGvE+FWEEcd4aIogkLwlxZbJG0xtOTw9/mEHnE6oNA==
X-Received: by 2002:a1c:a9ca:: with SMTP id
 s193mr24812285wme.132.1621086357396; 
 Sat, 15 May 2021 06:45:57 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z5sm9618316wrn.69.2021.05.15.06.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:45:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests/acceptance: Add tests for the Pegasos2 machine
Date: Sat, 15 May 2021 15:45:53 +0200
Message-Id: <20210515134555.307404-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests/acceptance: Ignore binary data sent on serial console=0D
  tests/acceptance: Add tests for the Pegasos2 machine=0D
=0D
 tests/acceptance/avocado_qemu/__init__.py |  7 +-=0D
 tests/acceptance/machine_ppc_pegasos.py   | 98 +++++++++++++++++++++++=0D
 2 files changed, 103 insertions(+), 2 deletions(-)=0D
 create mode 100644 tests/acceptance/machine_ppc_pegasos.py=0D
=0D
-- =0D
2.26.3=0D
=0D

