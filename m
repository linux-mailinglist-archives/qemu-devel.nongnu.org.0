Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391156452E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 12:29:51 +0200 (CEST)
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl9rC-0004iG-Dn
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 06:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41743)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hl9nl-0001JJ-0b
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:26:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hl9nj-0000ml-TN
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:26:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35480)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hl9nj-0000NK-Lc
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:26:15 -0400
Received: by mail-wm1-x32d.google.com with SMTP id l2so1697638wmg.0
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VIiWMVUAN41AdYBMVkPhNKSqMtaRTBycfFBcDt7jK8Y=;
 b=Rl6xISC/sc3IYfBpTwOhgi8qx4IvIS28pcGNKvL41AEeHtQWhsG31UvHPMxysvc4dW
 eHY+hlAYExLrIGZy5TvKWILJSvljur7YIWO3TnEMEVeQwOSjvncDEbYOIZxmqbQpxqnJ
 OViM6M+ZCWEwG0t8/jOL89ho7og8WXgA/jLC0pmJeDmpL+OBp7dHD3xo4CmTBCBvV3PS
 8ajI9aluSUlHnHGpH4n1ofvJj+oKWyA0SUF1VraN3RYYOFMOTeRUV8DvU4Jk2LEoUIse
 7+29CBtYCOj1XaPo1gJimzxLBpWKddPB8G0qmw+7yqdz8cL3ucJthPU9QZNfZnSLzhCR
 K6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VIiWMVUAN41AdYBMVkPhNKSqMtaRTBycfFBcDt7jK8Y=;
 b=BxwCqT8ZwUW9oYi8kdL+zxgPPJAhlz6G22oM4HCvZD+nPs5FJ2BTPzrN99WahlD/7d
 WJCNOEPibLkHDF3+nzhfkhqRoHNyZi9GCmjAtYKQnzkXcIfTWkeRy+qr6DQoWLk7Q8oe
 OrI0b3habeqmB7PQBv1gNxAAUgwX+f82ACU8KxdQE1l3+ED7nKJ49fPRxx8uCNOvdgm7
 ns3bIy0vwxfCchZ4zlLTVThLdrchYL1w5Jy11FZqEjkHx1S5V8gFqUk06IrtsHm2fBrg
 xFhXtIFeizz55Ic/Ssx4WXfyDpBsHGkHE/cxC/mXmZQDP8vXQgUnvn++LQnmtRIWM3aw
 QOyg==
X-Gm-Message-State: APjAAAXSmety2YvnHKJJtIQkJJ2zNe86hXR9SHnJWThHeRUgam/DI0wo
 492lbwgCHk0LwwPCVQND5ynZ4kxbJ4E=
X-Google-Smtp-Source: APXvYqz74cApzN7uZfwWU3bcMN8LFWPQnxr9ASp5wI21P93VBqHk1PEKHXEX9ERTt0sTFZl4CN5RBw==
X-Received: by 2002:a05:600c:2182:: with SMTP id
 e2mr4720103wme.104.1562754358961; 
 Wed, 10 Jul 2019 03:25:58 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id x20sm3307800wrg.10.2019.07.10.03.25.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 03:25:58 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B74911FF87;
 Wed, 10 Jul 2019 11:25:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Wed, 10 Jul 2019 11:25:53 +0100
Message-Id: <20190710102557.3107-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
Subject: [Qemu-devel] [PULL for 4.1 0/4] testing and gdbstub fixes
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6df2cdf44a82426f7a59dcb03f0dd2181ed7fdfa:

  Update version for v4.1.0-rc0 release (2019-07-09 17:21:53 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-gdbstub-100719-1

for you to fetch changes up to 94b2a62bb65b80760bcc59737bec908c9175abf4:

  gdbstub: revert to previous set_reg behaviour (2019-07-10 10:54:46 +0100)

----------------------------------------------------------------
Testing and gdbstub fixes:

  - fix diff-out pass in check-tcg
  - ensure generation of fprem reference
  - fix gdb set_reg fallback

----------------------------------------------------------------
Alex Bennée (4):
      tests/tcg: fix up test-i386-fprem.ref generation
      tests/tcg: fix diff-out pass to properly report failure
      gdbstub: add some notes to the header comment
      gdbstub: revert to previous set_reg behaviour

 gdbstub.c                      | 24 ++++++++++++++++++------
 tests/tcg/Makefile             |  6 +++++-
 tests/tcg/i386/Makefile.target |  4 ++--
 3 files changed, 25 insertions(+), 9 deletions(-)

-- 
2.20.1


