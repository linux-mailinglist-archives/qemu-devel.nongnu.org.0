Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D9EDB314
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 19:14:32 +0200 (CEST)
Received: from localhost ([::1]:53996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL9M6-0007BU-Oi
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 13:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL918-00013m-Ln
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL917-0006Zs-De
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:52:50 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iL917-0006Zg-7J; Thu, 17 Oct 2019 12:52:49 -0400
Received: by mail-wr1-x442.google.com with SMTP id r5so3143144wrm.12;
 Thu, 17 Oct 2019 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xv5ma3FS58OhGRAd+W9B9dtZKrbBSuRfNK5B3T2kQ0M=;
 b=M9srLg2uDxdYIRA2CTxulQHwDS8UgGwsiL9ZeVkt43qkGkqppLoN+nAYxPiMdcwxfr
 XC//+yQ4Pkf6eUuEgR4rils0QRhgjGgWDuy/8bEykSiU6KJubVv5+mrDQjiNew8dC8+R
 4EZ0hlsdl9of2kVfVeeNDLXoTcke8w//aOTMi+NYkSSIJfIbaREvnvnaTlGLo77nHB0O
 /jonU/Nng6/G2Snanw3UjcgEIL40nhSFOt0CNdUwkAF4VPnvMOsvRz4GpJigU4I2OQCk
 iYmgxlRb3Y14wma1fpj7ZlgvtS6epInIsW8ythEe8Q8C1RMau9tCkRuZxp341HvIR4AF
 incQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Xv5ma3FS58OhGRAd+W9B9dtZKrbBSuRfNK5B3T2kQ0M=;
 b=VDBAgWBniZ8vqWzvsTQdwSLRi+Ol9mEeNtNrhk3yDuTKi+gpotlldu6qg9EKbnWtjE
 D9W1dv4Alu12zTW8s0GgdoHfl9CUjVUnKTioutaiWgCOEpWfgxh8jFPO1J3QnFD7pKZl
 Ky9LAbP70bB08mziIz11a5zuInrSkJRVDp9GwdC0zHUl9/X05FTrDxhMNLSrKIRmSPhK
 WxS8Z6i4e00fJ3J9NBYzW+VgqU5MJfCgiUDfuUCObv6snJUlPi/4ubyoCLCBS8ZYaI8q
 OhWA98nwSp+ZO9SbiikL+aDTNFNGtlbKzZaMh+nVcjeNa6YQ/NUbhsZANr50S3hZ1EG/
 Pn6A==
X-Gm-Message-State: APjAAAVpHoxQv58JXZcKbB/wnH2x5m53u1E+5DH4yBCscxtj3LB4s91D
 kImmO8h6rme5jlJ5fglPEl4dXExe7ZY=
X-Google-Smtp-Source: APXvYqx7SlI652zZRC26kjcK2bZ+Spimh/0HEo6yYA5C8Tnwx95yZShfoDpe3haYJX/QdPoEth+fZw==
X-Received: by 2002:adf:910d:: with SMTP id j13mr3935443wrj.128.1571331167393; 
 Thu, 17 Oct 2019 09:52:47 -0700 (PDT)
Received: from x1w.redhat.com (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id w22sm2557363wmc.16.2019.10.17.09.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 09:52:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] tests/acceptance: Add tests for the PReP/40p machine
Date: Thu, 17 Oct 2019 18:52:30 +0200
Message-Id: <20191017165239.30159-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 Aleksandar Rikalo <arikalo@wavecomp.com>, PhilMD <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: PhilMD <f4bug@amsat.org>

Quick tests worth to avoid regressions with the 40p machine.
idea from the "Maintainers, please tell us how to boot your machines"
thread:
https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04177.html

v3: addressed review comment from v2
v2: Split Travis job, added Hervé R-b tag
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg05896.html

Regards,

Phil.

Cleber Rosa (1):
  Acceptance tests: refactor wait_for_console_pattern

Philippe Mathieu-Daudé (8):
  tests/acceptance: Fixe wait_for_console_pattern() hangs
  tests/acceptance: Send <carriage return> on serial lines
  tests/acceptance: Refactor exec_command_and_wait_for_pattern()
  tests/acceptance: Add test that runs NetBSD 4.0 installer on PRep/40p
  tests/acceptance: Test Open Firmware on the PReP/40p
  tests/acceptance: Test OpenBIOS on the PReP/40p
  tests/acceptance: Test Sandalfoot initrd on the PReP/40p
  .travis.yml: Let the avocado job run the 40p tests

 .travis.yml                               |   2 +-
 MAINTAINERS                               |   1 +
 tests/acceptance/avocado_qemu/__init__.py |  46 ++++++++
 tests/acceptance/boot_linux_console.py    |  57 +++-------
 tests/acceptance/linux_ssh_mips_malta.py  |  18 +---
 tests/acceptance/ppc_prep_40p.py          | 126 ++++++++++++++++++++++
 6 files changed, 193 insertions(+), 57 deletions(-)
 create mode 100644 tests/acceptance/ppc_prep_40p.py

-- 
2.21.0


