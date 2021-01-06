Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78C2EC4DF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:28:31 +0100 (CET)
Received: from localhost ([::1]:43746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFPx-0001dc-Pt
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNv-0008Qu-LD
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:23 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNs-0005S4-2q
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id d26so3521245wrb.12
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 12:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/e9P+K1WJfNPefbji311lsrQRmqHi5WF/bUfHmgTN0=;
 b=lZvUrW7he/34rfKprNoufgHJGaWJQFcrK6c+QiU7srwY58PjllEBog2qyZLPbq0pYa
 rU1eXVL7/syXRWuXcJjuFIE/FcCmo8X8R56Y8IKr2zG+jxrt2/Ob3CrmrsVIhOFBMHe5
 KqXj2ckdKkgj18wHJkM2IbEwvL2sxifgKWoisSnnQifadm6L/EYlNAM7eTeuOasNKBaI
 zsTrmj+6Vy8YZR6UPOI2s33qWSfnHySZ8qq5HZZbxfn1aFRiT2bFZQ5+0mVN6LVpdzha
 h1OVbh4q+u9jg9aCvOhbYKgP33kGZTvtZ8jDP8WfWBx5fS/SH17HuMgZbMTutbRKl2EC
 Rbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/e9P+K1WJfNPefbji311lsrQRmqHi5WF/bUfHmgTN0=;
 b=nQnOlY9a40GRiiwfPSBrcOVexiHno2KqkGAqU85gL0GBM59pffL1oTgdxb4egcgW76
 Ocgpl3BqKRujiiqL+8XLz04VYeI5jopngbPi4hqhFLZGpW5cYVTPrv38beROgErPvFpo
 cIeR36aEilU/nChmFAJkxcW6uiI/4xZRF8ZGpt6VXbOrafAbrIBxCufKCeo3cn7PSqbR
 s7uQ1jRHFYP2JgUbATUZz7S+XAAoYztE/bCzb6iUMo7kuJx+p3Bm+1mG/PF91zJVekZr
 MHUPQM00UzyxluwhPprNDnIFrx5iFc30zkNm8VieTZSpKDTMeXzSEcyjCxRfhjJIxx6Z
 bIBg==
X-Gm-Message-State: AOAM5327f8t9GJ6V+aShjJ6XAihQISN88h37zVtR+tzczEWZU07nWvCl
 l6YlQX1eLlVnVlYP6ldANsF+pw==
X-Google-Smtp-Source: ABdhPJxGK46uJDunJrHYBoGOQQG6csXB5wJ4U/XUsvN8IqdgTYz9n51e+txEA+Yt7S7wdQT7T04nhw==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr5828654wrt.15.1609964778222;
 Wed, 06 Jan 2021 12:26:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm4462337wre.69.2021.01.06.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 12:26:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67D421FF7E;
 Wed,  6 Jan 2021 20:26:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v4 0/4] more testing fixes (all green now)
Date: Wed,  6 Jan 2021 20:26:12 +0000
Message-Id: <20210106202616.20004-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit aadac5b3d9fdce28030495f80fc76a4336e97328:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-01-06 15:55:29 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-060121-4

for you to fetch changes up to af229fc367021e361cebaf84acceb01f28922cc4:

  cirrus: don't run full qtest on macOS (2021-01-06 17:30:02 +0000)

----------------------------------------------------------------
Testing updates (back to green)

  - include ccache in Debian 10 docker image
  - iotests: drop 312 from auto group
  - bound reading of s390x framebuffer file
  - cirrus: drop non-x86 tests so we complete

----------------------------------------------------------------
Alex Bennée (2):
      tests/iotests: drop test 312 from auto group
      tests/acceptance: bound the size of readline in s390_ccw_virtio

Daniel P. Berrangé (1):
      cirrus: don't run full qtest on macOS

Philippe Mathieu-Daudé (1):
      tests/docker: Include 'ccache' in Debian base image

 .cirrus.yml                                 | 14 ++++++++++----
 tests/acceptance/machine_s390_ccw_virtio.py |  2 +-
 tests/docker/dockerfiles/debian10.docker    |  1 +
 tests/qemu-iotests/group                    |  2 +-
 4 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.20.1


