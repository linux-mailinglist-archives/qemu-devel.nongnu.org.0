Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA686099FE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:47:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omlGR-0001ED-2G
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 20:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1omWuH-0007CM-61
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 05:04:33 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1omWuF-0001Pm-CI
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 05:04:32 -0400
Received: by mail-lj1-x22a.google.com with SMTP id h8so9191345lja.11
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u0SrO5gHZIbFEGlPg6M5p2y/vlecvKKUpJszJjJ3l0g=;
 b=iEWnM5Yi5QdOI9dDnP5flP1bGBDRovm0UzmMuqrJrY7zT0fDF6mn0dhvabxFSHQaR/
 utnsKM5iyZTeVafhrqwpcJtzah2ZkDdH04ySQhjQHsI85o1nWIBO7tmZIu9n2PZ9DcF6
 AH+XJSX17PiIETGUs0Zjt014dyc66zD5xbd/u2TuEKe0Cd+DxdRbkBFTPW8NF/DsqpUT
 EETwsQ3oTHTbr1bnoAdbMELX4wZEg2w6QQwlojENP2Ij4uR4wiPEUXZtnJ0Meu2o1i5G
 wRSDd9JyVuyDlla1QA15PUYQwA1HZ0TGVF6kgDl6gM2z875UKNyBdUYE6VW/sGewKiVa
 7OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0SrO5gHZIbFEGlPg6M5p2y/vlecvKKUpJszJjJ3l0g=;
 b=i/wodzq1Mnk0XO1wIo2cG7WR1/7JPqbB0kcCMFLw00QLOTWyvPgBb4KjUbPHbrnORu
 r0+9wAzrEcQYAFTdj3nG8/yrUGA9FTG7JvDdYzPw4cSjA0gAgSvL3kuqsJLpmBXF3367
 1EgMFkmUXXzuWURKP6t7CfAfncGJG3TB2vktooGjJQ2Q6kWhv895iPVyuwoQzhuN3cYI
 +AgSpHxvmXn5gTtB5dJNoKlZLLBoO4k7iRbZWpL6jhZU5B8HzjqJFU9TEDzNfUQz2YtB
 1Z53JJvrOxmUjNjEZbuI2a55VYIAPLZPT1Jg1Y6eu3WzEnXPEBpBCq86YJnP/E/O53Cv
 6Xmw==
X-Gm-Message-State: ACrzQf3+/HFE9yxu/kKZjnVbhUtTOqT23g4VZTB+rnXUT6qqRmsT94FT
 BvUmKq9egOF3iUQJbxUwpxj1asxojJF3EA==
X-Google-Smtp-Source: AMsMyM5sMawFjLi2MIPs31laObXDD1qmqUsE/unHq45DBSepRWattW6Ueug2chkyZbqdcTiRrt8c4A==
X-Received: by 2002:a2e:99c4:0:b0:277:7a5:bf0a with SMTP id
 l4-20020a2e99c4000000b0027707a5bf0amr684825ljj.436.1666515868322; 
 Sun, 23 Oct 2022 02:04:28 -0700 (PDT)
Received: from fedora.cloudlinux.com ([85.143.112.90])
 by smtp.gmail.com with ESMTPSA id
 c27-20020a056512239b00b0049908e21e26sm3938101lfv.253.2022.10.23.02.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 02:04:27 -0700 (PDT)
From: Nikita Ivanov <nivanov@cloudlinux.com>
To: qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PATCH v4 0/2] Refactoring: expand usage of TFR() macro
Date: Sun, 23 Oct 2022 12:04:20 +0300
Message-Id: <20221023090422.242617-1-nivanov@cloudlinux.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=nivanov@cloudlinux.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment, TFR() macro has a vague name and is not used
where it possibly could be. In order to make it more transparent
and useful, it was decided to refactor it to make it closer to
the similar one in glibc: TEMP_FAILURE_RETRY(). Now, macro
evaluates into an expression and is named RETRY_ON_EINTR(). All the
places where RETRY_ON_EINTR() macro code be applied were covered.

Nikita Ivanov (2):
  Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
  error handling: Use RETRY_ON_EINTR() macro where applicable

 block/file-posix.c        | 37 ++++++++++++++++---------------------
 chardev/char-fd.c         |  2 +-
 chardev/char-pipe.c       |  8 +++++---
 chardev/char-pty.c        |  4 +---
 hw/9pfs/9p-local.c        |  8 ++------
 include/qemu/osdep.h      |  8 +++++++-
 net/l2tpv3.c              | 17 +++++------------
 net/socket.c              | 16 +++++++---------
 net/tap-bsd.c             |  6 +++---
 net/tap-linux.c           |  2 +-
 net/tap-solaris.c         |  8 ++++----
 net/tap.c                 | 10 +++-------
 os-posix.c                |  2 +-
 qga/commands-posix.c      |  4 +---
 semihosting/syscalls.c    |  4 +---
 tests/qtest/libqtest.c    | 14 ++++++--------
 tests/vhost-user-bridge.c |  4 +---
 util/main-loop.c          |  4 +---
 util/osdep.c              |  4 +---
 util/vfio-helpers.c       | 12 ++++++------
 20 files changed, 73 insertions(+), 101 deletions(-)

-- 
2.37.3


