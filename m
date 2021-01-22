Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3BC300B05
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:22:03 +0100 (CET)
Received: from localhost ([::1]:39466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l314M-0001lG-RV
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311Q-0007Uq-GO
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311O-0006qC-KU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q7so5941738wre.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duAUI/SoLZVx4nJfugSKpgmaGQ90w6pEpn1tczboaE8=;
 b=K9oVPQ2t03HXdGtpKB5/0nL7kp2j6QFHRqPEaBJfeUMIvLouTAJmiBvCizVlYJncm0
 YS7jPzBxeLgik10dgPU3oKTwFUgqKaba5Z3xhnNrIYEsZzYkdot+cmc3j7gsdFSUHQHi
 T3GCpMVykUgwO63Wsc2XulbnIe+BOnqsow4+iPg5TRJnXCwpFkQdSQQArPdH5cNyH210
 kw63MyYL3lADZqR2jsBChMNAbnNNoadORCXEYjFRLAvsaKGA5bCzdcO+z52lxfmEsmIk
 jbkY758qizkIQsQWpOmwnnbf1f7uVIb5DcckEKgxiZz5Ci1F7jRs4KKZAJpzlMBBvmF2
 q9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duAUI/SoLZVx4nJfugSKpgmaGQ90w6pEpn1tczboaE8=;
 b=bYwL+Hf6UEhbjBSDY7EktISMU83cmocdMA2xaze2KVn+7TT02WVAWMk2GNxji+qb3r
 MA6cXk1A0VE/GoTcZL5+fAFvosd8tS6hcva8YPfloNujfTSVOba4ytbS2HUTQ5Ny4KFw
 GJ5CrFUUGJIb15JV+K2Ma2zocHhDoOdB4Dxyn1FrRuJkwg+jMblkPWwuoThSn8Enjoj5
 bvsaJBujayyb2PF7ib25qK/9mf824PolgBlV+yWREA3LFvVJ4daxFQ9+zvdHM34YDugf
 Z8wmPGESc7GrLIzTUdaCu/7SyCf6NHCXzWnVv+We71j1E9A9e+lJBKkVEFulbQMbkmVa
 vfPw==
X-Gm-Message-State: AOAM530p4sMCN/TBANlrss3B7c1EgAe3VPGHOZ/8NmO7mhYs1p3mygV9
 jhyiq/fYqUjhclIBX0bH+o7GaA==
X-Google-Smtp-Source: ABdhPJxecmEbPiTJJTsVSWsNmM+3IINzmS5OmnhE4/I7NrIGhcWk53bqwp5G3a+yHEA3Veq9sA949Q==
X-Received: by 2002:adf:9261:: with SMTP id 88mr3991304wrj.227.1611339536366; 
 Fri, 22 Jan 2021 10:18:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a130sm11901601wmf.4.2021.01.22.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3FC71FF7E;
 Fri, 22 Jan 2021 18:18:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 0/8] testing/next (docker, binfmt, gdb version)
Date: Fri, 22 Jan 2021 18:18:46 +0000
Message-Id: <20210122181854.23105-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The testing updates keep on rolling. This expands on the last version
by adding some more handling of weird gdb version numbers and bumping
the minimum requirement again.

The following need review:

 - configure: bump the minimum gdb version for check-tcg to 9.1
 - configure: make version_ge more tolerant of shady version input
 - tests/docker: add a docker-exec-copy-test
 - tests/docker: alias docker-help target for consistency
 - tests/docker: preserve original name when copying libs

Alex Bennée (6):
  tests/docker: make _copy_with_mkdir accept missing files
  tests/docker: preserve original name when copying libs
  tests/docker: alias docker-help target for consistency
  tests/docker: add a docker-exec-copy-test
  configure: make version_ge more tolerant of shady version input
  configure: bump the minimum gdb version for check-tcg to 9.1

Philippe Mathieu-Daudé (2):
  tests/docker: Fix _get_so_libs() for docker-binfmt-image
  tests/docker: Fix typo in help message

 configure                             |  6 +++---
 tests/docker/Makefile.include         | 26 +++++++++++++++++++++++---
 tests/docker/docker.py                | 23 +++++++++++++++++------
 tests/docker/dockerfiles/empty.docker |  8 ++++++++
 4 files changed, 51 insertions(+), 12 deletions(-)
 create mode 100644 tests/docker/dockerfiles/empty.docker

-- 
2.20.1


