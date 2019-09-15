Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21611B322B
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 23:23:27 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9bzR-0005Wh-G2
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 17:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9bvy-0003Dj-LL
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 17:19:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9bvx-0000jO-Cv
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 17:19:50 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36870)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9bvu-0000gc-D8; Sun, 15 Sep 2019 17:19:46 -0400
Received: by mail-wm1-x342.google.com with SMTP id r195so7975220wme.2;
 Sun, 15 Sep 2019 14:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hTXJrm1b3k4MYnF6jN6drCCwkf4yEHKb3sFfuxnruGQ=;
 b=E48gNggc2/jfz/a2gM3FabDdp/piRdP1AwgyZOAoex5NHJZWA2k0HmvqzzOiqFosBF
 u+N/2IYSX89Ae6j2kc4GIxTm37jmz90IZq+EU7udYbp/h7FjDkfTnYyCVWpqPVv1d3s2
 z5jQvAj9+SR0wcZbHYcwM5osYOOUsGD0bFH0ai/8dnRcv+aL5MDZyqpYSwklHYCQEYKw
 /tFGipsNlSa+iHfRw8vHZwwdvTQkWw6CmwEyKm/Nq+/ZK/d79TfPJjB4xOOh2QJpKcsz
 w1k23c2Bj3r6nBiiiFLY8yDoZ0OWIiahTh9WyGBpL5R09GMLN150LYoL44EV86mRbsxA
 CMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hTXJrm1b3k4MYnF6jN6drCCwkf4yEHKb3sFfuxnruGQ=;
 b=LZaf0tuuoSFYcTLQa7PwO+J+8+HARU6J9tbV5oC+fi+giyhuvToXO4/kvQw7QxoBTf
 R0lYRUxQoBLkKXQFLHiUv8nY/QaLxm0+xqWPom60GSv1Jh68ff1mm+sBl3azB2a9Qfj0
 9MEmkXdkrySOpL9qWSQIdAVtIGZC5VvprvCqj9rOZSfny+hOBJG9jWJoUIiRaDamCyDE
 EHYvGsUHi2umsJcjqWrIoIcz3D9cFynqep0Ek7NmX0gCaBz2ddWcRjoUhBPBLMc73eUr
 WWXGRxKsDRpLnkquJ96Y838lHHwsJtePmR+3Cs8hjoLAd10ANJ/xXEe58L1xxFsofAWk
 Jv2A==
X-Gm-Message-State: APjAAAXR6IMZLepjoWQiWMkzscJP48jmpiyAP2SOzyogzk5rVQZBI8MM
 6OZp8MbNCovV4aa1LlKVe3zoTJh0
X-Google-Smtp-Source: APXvYqzXpb5Ujs8CVlDADJ9Tm9zfG6JynAXSLccCcdzej3S0ntRQTGuRQ7lYpQvWdBPYBbGZy6+XDQ==
X-Received: by 2002:a1c:4945:: with SMTP id w66mr6087535wma.40.1568582384182; 
 Sun, 15 Sep 2019 14:19:44 -0700 (PDT)
Received: from localhost.localdomain (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id s1sm50271021wrg.80.2019.09.15.14.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 14:19:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 23:19:34 +0200
Message-Id: <20190915211940.30427-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH v2 0/6] tests/acceptance: Add tests for the
 PReP/40p machine
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quick tests worth to avoid regressions with the 40p machine.
idea from the "Maintainers, please tell us how to boot your machines"
thread:
https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04177.html

v2: Split Travis job, added Hervé R-b tag
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg05896.html

Regards,

Phil.

Philippe Mathieu-Daudé (6):
  tests/acceptance: Add test that runs NetBSD 4.0 installer on PRep/40p
  tests/acceptance: Test Open Firmware on the PReP/40p
  tests/acceptance: Test OpenBIOS on the PReP/40p
  tests/acceptance: Test Sandalfoot initrd on the PReP/40p
  .travis.yml: Let the avocado job run the 40p tests
  .travis.yml: Split enterprise vs. hobbyist acceptance test job

 .travis.yml                      |  18 +++-
 MAINTAINERS                      |   1 +
 tests/acceptance/ppc_prep_40p.py | 150 +++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+), 2 deletions(-)
 create mode 100644 tests/acceptance/ppc_prep_40p.py

-- 
2.20.1


