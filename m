Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565826579D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 15:07:14 +0200 (CEST)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlYn3-0000JA-JX
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 09:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35255)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hlYls-00088p-Nm
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hlYlr-00035u-Ov
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:06:00 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36459)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hlYlr-00034G-FY
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:05:59 -0400
Received: by mail-wr1-x443.google.com with SMTP id n4so6244586wrs.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pMptNYx7j6lTFXnWKRgMhwTkAsBoGv6gfvDFvlHI1ec=;
 b=jOW1N5HuTFyICWIkjAm6uCFt8ceJ63UySq73+F5KcNO8U+NcYTizmCGfIj8wlLX4hw
 WOkQd3mWVfnym9ic+O83Y8RUlTWVaXkMkiQywLm6Wd8PY8wl1v3N/dsm5APo516zk2/m
 qdsrPt5jPNBHtKH9PPxCWt6zC14a3ZJmTl2GqGg9cEXnETKgHLsX4au19GcveL4HAP3x
 Ql43TW7l9R9sr2XZopGn2oO7/jwjFVdCtwrrEL7Jolm/c77xR64vOoxBNPvrb4iTKpIV
 iZ/rWhYWbFfR7K75mmeIMbQoXTzqde5ViwCae/1Huz8/gkjBz5nOuWViOPGWhKiKvpMe
 W/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pMptNYx7j6lTFXnWKRgMhwTkAsBoGv6gfvDFvlHI1ec=;
 b=HNN4umODUwAvs65ZguJHOzOmSgJn5Iqrd8ul+9k8q3a+f0Ie80FVAI2sFxCCutJhIW
 TDTBF2KqNqi96uGZtOuSYbu/iU3j+YHM064l+5hVEZKj5NHR7lzFzU2V6TOlD8ghiiW+
 pdrhYG66vdUL9X7bMVIxgcs40ARjC8DiXYS3hqGOY2/TUIOBi/nYRI/1cwkX1vu73z79
 kvFtZHOrLPj9Z4l7O6K/USa2gHauKyn9RvOUGGHWhJ83BUnbpJNgNq6K3r3K51JmJ/zG
 Q4FAL7uEQiHdqcr6RK5UfLwwHzOJ5fFHj5Yr2ljsKg2vox0UMUktG5LLyN/VTcHKjneT
 8klg==
X-Gm-Message-State: APjAAAUmNhTy01UeaD3rWGdhHPncyIbRaEQ/1wRmNH1vG00Hkbdx6BZK
 mBpFAXIT3xC9NO1lCsAC3lRCCy/E/X4=
X-Google-Smtp-Source: APXvYqyfmjdF8MQ/jEVMSDYSTlfDdnrOzqaZm6nU+fT1osbmHH3xdcmChw8xeJkQt3LmY0L9IkvHHw==
X-Received: by 2002:a5d:498f:: with SMTP id r15mr4945718wrq.353.1562850358048; 
 Thu, 11 Jul 2019 06:05:58 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id g17sm4137226wrm.7.2019.07.11.06.05.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 06:05:57 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21B181FF87;
 Thu, 11 Jul 2019 14:05:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 14:05:46 +0100
Message-Id: <20190711130546.18578-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH for 4.1?] includes: remove stale [smp|max]_cpus
 externs
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
 Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a5e0b3311 removed these in favour of querying machine
properties. Remove the extern declarations as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Like Xu <like.xu@linux.intel.com>
---
 include/sysemu/sysemu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 984c439ac9..e70edf7c1c 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -103,8 +103,6 @@ extern const char *keyboard_layout;
 extern int win2k_install_hack;
 extern int alt_grab;
 extern int ctrl_grab;
-extern int smp_cpus;
-extern unsigned int max_cpus;
 extern int cursor_hide;
 extern int graphic_rotate;
 extern int no_quit;
-- 
2.20.1


