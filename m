Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F990581ED
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 13:56:00 +0200 (CEST)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgT0Q-0008SU-PM
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 07:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hgSy7-0006xe-Vv
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:53:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hgSy6-00011a-Vh
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:53:35 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45335)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hgSy6-00010Q-Ma
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 07:53:34 -0400
Received: by mail-wr1-x444.google.com with SMTP id f9so2185267wre.12
 for <qemu-devel@nongnu.org>; Thu, 27 Jun 2019 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z2NGFB1ThkY/TPLi/6lwcDMKRfzHH+1IoMvEHkrY49Y=;
 b=ZGWRdkBLUFrQxaLPfMVTR7xqA+d76YsM/yUpTiZyBD5xXk1X1Zu5JvCQiahuJcFrWA
 sQh5BXpjo8RD6J4ts+gwkEkklfE6T+A3eOygjxn0V9PVHAUt0Y/2Gjp2ZbQWwur5/pol
 PvH93P4f+8haFWXv6Ae9QvXXAaENdFdL3LXhMTBD19E2n/o3fr0fMTVJFnfk2cLxkZxD
 PULtzACotOGlZ1NKwD2vBvJFLEU7jCf9LYwD+dhB7InnJsJVi7viW3Iwhq+2JB/pcK/4
 tI7/VJD+fqGth58Dwj/RpQplq7riK3J6K1ZSlTf2uTuIwUGXT1+9I9N/kQ0nXLfN2blF
 Ormw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z2NGFB1ThkY/TPLi/6lwcDMKRfzHH+1IoMvEHkrY49Y=;
 b=oPBd/6Fpzsgow78xh0ZAlDiWo8CP3ZhHewslVq4vzWFy4LwIEKC0/yY/WROMPYQ/6X
 dY1JzgD9Y2nL5Wfj3YeIYrTyf00F8rpFV4VAH5YrAAvRzBEGuupH/Asa0QPKdJ7cdFmf
 WJhrKCSjmqID50dvv6ZuJ5aRQAKR1F6RuNBzbsbF6SgsX2hoLUWPePy6jHkh78aYFJGU
 uDr5ynGip3xhSL1H4oJYyJrSTp5MxnH3n2aEvftGeu2TI5vh1SoHH4h+rgJb7grOk6E6
 SBjBOBytUOPcWStcD9IfyUpHkBU4lF3sM7Cq1r2WAO8U+Io5m5mVq5X9Xiyth2LEg/5R
 /slw==
X-Gm-Message-State: APjAAAXhnk+hw7XObo1Yssnl83TwxNq6nCWhCpi7uBgPxXd0bLAr+Okn
 186PlfXP+SYnVie00/ooVVA/Hd8j
X-Google-Smtp-Source: APXvYqwXXD6S9QhqcuRFcTljIg3rnhGT5h0pmCRDXFd7mSJUwAttKaGNdHWPxFDKmUbSvUnED7MVqQ==
X-Received: by 2002:adf:dd8c:: with SMTP id x12mr2839463wrl.212.1561636413339; 
 Thu, 27 Jun 2019 04:53:33 -0700 (PDT)
Received: from x1.local (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id o126sm6196408wmo.1.2019.06.27.04.53.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 04:53:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 13:53:28 +0200
Message-Id: <20190627115331.2373-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 0/3] tests/acceptance: Add tests for the Leon3
 board
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quick tests worth to avoid regressions, idea from
https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04177.html
"Maintainers, please tell us how to boot your machines"

Regards,

Phil.

Philippe Mathieu-Daudé (3):
  tests/acceptance: Add test that boots the HelenOS microkernel on Leon3
  tests/acceptance: Add test that boots Linux up to BusyBox on Leon3
  .travis.yml: Let the avocado job run the Leon3 test

 .travis.yml                             |  2 +-
 MAINTAINERS                             |  1 +
 tests/acceptance/machine_sparc_leon3.py | 89 +++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 tests/acceptance/machine_sparc_leon3.py

-- 
2.19.1


