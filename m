Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393833C86A1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:07:01 +0200 (CEST)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gTU-0001yR-8I
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNa-0007CV-16
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNY-0007VI-AH
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id t5so3580821wrw.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DuryBtZsGIpH+0YGBnwUe0xZi9F+YMWFw6SViL1REe0=;
 b=VynwIIa5ZUGYdHqWJG2iyWY17zq7ytpSsQSoZ2p7zZgosDcEqDqh3tcrrMge0mU5M2
 WdUyDlzceBxwUO74ZjFWOlaSNjNonUmICS1XIEzKKXixRfhb/VJx4WfTZcdxih3UgiHX
 iZ/kMY8YpgJ4n4SVARS7oVyQh2qinq/IdIqsyhKbjnjCJJlYPOMo/yG+Gw2c6RJVcl6k
 eGt09hoXOThH3rHOmgHLxQjpuR2TmeU6/Wxf38KJUU8nZk21SETNX6KLUSEZiBIkywr3
 UxTS7Owu3ewsQ5HG5NNVemg2oAjE121YnF9bbRwAmM+bS+Dk647GHTCd6CAy5cKaT/BK
 F80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DuryBtZsGIpH+0YGBnwUe0xZi9F+YMWFw6SViL1REe0=;
 b=ZCveyLWOWGFvsSOEL8CgATml0aTcCn8arEjFXRcHJmG4Vr9GJ/8N1vvI/hf9c6/zMT
 bldgJKHBNcQS03rOYyfeW0EVGkX/WCSXqaaEavwA33JrCBA1hYXaLatqnbDFF1TXiRDj
 vSg0jr3OyPLPToXmAYFiLL0LnuFgG9jpbC1fQhJpHWHfs+sMvSHYW9+5xu08DocQwh2o
 B/8HgzFeeZHM2+Cwz56sTdkh4E2k/dLY81Lnowotu9D0JugZBsQLdS4dduaLqa5Sa9tI
 FgHxyByKt3MRTJs3CpwtkKegL53w+ZwKQre4NSmYBqcOxouPgcj2HUUsWOZ3HCrjGeGc
 cGPA==
X-Gm-Message-State: AOAM532Z8qvEWIzRlOT7RdhggTrAku9dL3n2bwwm8FXXsXNPUxQD9UmP
 N9oo7YJXKzII5wXuyYtygmG9eA==
X-Google-Smtp-Source: ABdhPJzjpU37S1C/0axHSdyCCoqVkj72H7EWZZYGKt9ILwoDay5ohyXAmAFUU/h7wQ84a947FDUvBQ==
X-Received: by 2002:adf:f305:: with SMTP id i5mr13622221wro.122.1626274850939; 
 Wed, 14 Jul 2021 08:00:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p11sm2756104wro.78.2021.07.14.08.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 569141FF92;
 Wed, 14 Jul 2021 16:00:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 06/44] meson: fix condition for io_uring stubs
Date: Wed, 14 Jul 2021 15:59:58 +0100
Message-Id: <20210714150036.21060-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

CONFIG_LINUX_IO_URING is not included in config-host.mak and therefore is
not usable in "when" clauses.  Check the availability of the library,
which matches the condition for the non-stubbed version block/io_uring.c.

At this point, the difference between libraries that have config-host.mak
entries and those that do not is quite confusing.  The remaining ~dozen
should be converted in 6.2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210712151810.508249-1-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/stubs/meson.build b/stubs/meson.build
index 2e79ff9f4d..d3fa8646b3 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -15,7 +15,9 @@ stub_ss.add(files('fdset.c'))
 stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
-stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
+if linux_io_uring.found()
+  stub_ss.add(files('io_uring.c'))
+endif
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
-- 
2.20.1


