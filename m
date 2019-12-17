Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B31234D2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 19:29:34 +0100 (CET)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihHbA-0002SM-AN
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 13:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46010)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZI-00014D-MY
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:27:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZG-0003XI-Kf
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 13:27:36 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40352)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ihHZG-0003X4-F2; Tue, 17 Dec 2019 13:27:34 -0500
Received: by mail-wr1-x441.google.com with SMTP id c14so12407099wrn.7;
 Tue, 17 Dec 2019 10:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sWACAQsf60rInZdjnYNJIzYNJovtyKvCUnze/9ZfBDg=;
 b=cj4L/hfrqJ1dS8TQp6lUfRYWKHFhndilaAQXzyv04YBZe5enQgyzB6HZEmOrFQmGeQ
 Eg/0khdTe2ZlrfqPZksbu3OYIs3mAE4030q6rabkxsBiYqvmnVni0ccEncTgmMR/dJ8d
 RhWX6CBaAdjXyyHLoI+p4ShOCNtA0j3pB6kqcrEuftcSv7CRDFKb2WE5nNnrQFI+WBgG
 5mKeJ0tllZx98t87/RmyZPneN/uMO/Dwn3j7c55MviZQb7bzzRIgFIBUXg9G43OasMlf
 PfBJBNzboHCB1R77wlrF+XT4JD/7EyETnthW3uCRPYkkokb5Ue7gb3sHj48TfticjB+z
 vg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sWACAQsf60rInZdjnYNJIzYNJovtyKvCUnze/9ZfBDg=;
 b=uY0Tdyv6W876gz5wHs7w3KoVm10H04RqF2J6NA+JHzKMfF2FRGGjAvCc7Rx9Um5xpl
 VSfuyqxIoqBupDwfx3I1rydqgOyztflzra4VrMYSAZjr+yh5xOevy/l7lCiJlFzh+jIG
 UTOm1VQdnppiSRZkj55arlEDPV+OZR6HrB5fSMacZjkf1V30vwsQ4Tf74UszQ47RITI7
 M4Or3whgn6lqstqOIhCCNOpkCUo/jyhOJkZyn0Hk1LbZJ3JRdUuJHPZJeXg6wIZJmBwS
 IYpxpWxZIJULRHJWFVpW3Whl4lrE8siPq+N7hx+y8YkT/LL+b/DFpX/Y0vsTw+RWsj5F
 zrSA==
X-Gm-Message-State: APjAAAUSj4p61B4JpnsQaxat8ZqzFJW7inlHnYfgYdvggNkk6q/UlBPI
 5Eb9P1B8WrqF15r/pQ859vP3Tps3
X-Google-Smtp-Source: APXvYqwf8A894T4a5VQdrdHMhirdZXGVO1EmaZk0q3fDn66iJ1I3ycbS8qjdyh5PRD0Bq+edlC4tNQ==
X-Received: by 2002:a5d:6ac5:: with SMTP id u5mr2863265wrw.271.1576607252684; 
 Tue, 17 Dec 2019 10:27:32 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id u18sm26006975wrt.26.2019.12.17.10.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 10:27:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] tests/boot_linux_console: Add various OrangePi PC tests
Date: Tue, 17 Dec 2019 19:27:25 +0100
Message-Id: <20191217182730.943-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series collect the examples given by Niek on:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg665532.html

Based-on: <20191216233519.29030-1-nieklinnenbank@gmail.com>

Philippe Mathieu-Daudé (5):
  tests/boot_linux_console: Add a quick test for the OrangePi PC board
  tests/boot_linux_console: Add initrd test for the Orange Pi PC board
  tests/boot_linux_console: Add a SD card test for the OrangePi PC board
  !fixup "hw: arm: add Xunlong Orange Pi PC machine"
  tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi
    PC

 hw/arm/orangepi.c                      |   1 +
 tests/acceptance/boot_linux_console.py | 150 +++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

-- 
2.21.0


