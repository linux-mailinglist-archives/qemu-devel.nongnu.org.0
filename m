Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1510CF8D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 22:38:35 +0100 (CET)
Received: from localhost ([::1]:53411 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaRUe-0007jA-I1
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 16:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iaPpO-0005iD-4F
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 14:51:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iaPk4-0005JE-IX
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 14:46:25 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iaPjz-0004ws-J6
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 14:46:16 -0500
Received: by mail-wm1-x341.google.com with SMTP id n5so12783154wmc.0
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 11:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IRVTInMXYNny+d2XbwLly1VhzTFHSv6cJFpyW+0/F28=;
 b=l2diZEubO/l2iDjhioYjc/UeoY9rFoecLavT7xxOykKZK51+375s+E2s40lTP7Wya5
 4AQxwX2SwPz/qnIaM2W2SKk+mPomHLXHciZcLjpJoupjTRsdgr72StnS8Ie7C0eEPv20
 Z3c1dmqNVFFnexpaaXjhAMzO37B4B271twe30aPZ3xHbGozvDSWTfd5zfYvOaa/c6ndW
 hwdCkBLqmB+KBD7tQRTs9TdaIdm/xtNyX3ck3tzgK5/EaL0dYJ/Jti8L4LLPI4vf9EEh
 ilJ7kTuxN19EiOKyzW4kt/zqYoKvRa60kgUd9i2fy8KdqEXJRrW/LuGvL6nswT0OfEAo
 10kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IRVTInMXYNny+d2XbwLly1VhzTFHSv6cJFpyW+0/F28=;
 b=AE+jrf1ob04LLbNtyE0v0tc6arEmuxRgdbWElGknLEXQky+0us9MpTUMXn86t3NyKT
 Tq0K25YAYFDcdNvJK9m+5+VgVlKXEkxzNwhJxuVkOfmKCuIpVX91ND7HvEtH1TnxMdfE
 m4kLnE+SArETSoQkSqcNW8Z8fu3OwcVrE18fomrU/8//CUwspFQ/5OCxV+glKtp6FBtg
 7RSRPJ6Eem1Q6cKdiMrmZtVVkoDxA5eG2958FFD7G5fb3wJZLOmWH6q23Nlz1hruQSa2
 Y/VACWXVR+n+apOp3Pg8wnyFbXwJYE0mOaoBnzw0QFLBFFJxgefMK+0H4h7fHJR7eDXV
 +P5w==
X-Gm-Message-State: APjAAAVpVR9SNRCfFZe5eiZHooTVU3/+VmAM7yvA76Wq8/7bNQT24pBJ
 PDgt9tNrDSpJ10/ISBrs16EdWFP6+KE=
X-Google-Smtp-Source: APXvYqyhfPIBcnM363VhHv2ial+SFBJefdf1jLrnk0Tpr8YjRwulEBQeeKpsN3eshEYnbmRePt1tCQ==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr7634297wmc.54.1574970366842;
 Thu, 28 Nov 2019 11:46:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n188sm6496991wme.14.2019.11.28.11.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 11:46:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76EA31FF87;
 Thu, 28 Nov 2019 19:46:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/5] linux-user mmap debug cleanup
Date: Thu, 28 Nov 2019 19:45:58 +0000
Message-Id: <20191128194603.24818-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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

While debugging some wierd ELF loading bugs I realised our mmap debug
code could do with a little clean-up so I removed the DEBUG_MMAP in
favour of some tracepoints and extending the information that -d page
gives you.

Alex Bennée (5):
  linux-user: convert target_mprotect debug to tracepoint
  linux-user: convert target_mmap debug to tracepoint
  linux-user: add target_mmap_complete tracepoint
  linux-user: log page table changes under -d page
  linux-user: convert target_munmap debug to a tracepoint

 linux-user/mmap.c       | 82 ++++++++++++++++++++++-------------------
 linux-user/trace-events |  6 +++
 2 files changed, 50 insertions(+), 38 deletions(-)

-- 
2.20.1


