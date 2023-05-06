Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0476F926E
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 16:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvIZF-0001yI-4k; Sat, 06 May 2023 10:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvIZD-0001wH-6m
 for qemu-devel@nongnu.org; Sat, 06 May 2023 10:07:19 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvIZA-0005WR-FT
 for qemu-devel@nongnu.org; Sat, 06 May 2023 10:07:17 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ab032d9266so26748435ad.0
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683382034; x=1685974034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yVcDmxlyiKb+QNTDAIRDCWbHM2S4dHH1J7A3RssMVro=;
 b=oKrIx+wk7yALvZH2TG6rNDukHEVyYcvZy7uKk7eQgClzoTUNBTQi0CdLGsalzNyeR0
 FPg2pEbLsJ7omIFxIM2LvJQ9dPs08sgqEYAHyi57Kr0f7RsxnFCZDqGARMqXCOTMH7Mi
 o7079PTP5KuPYuYhjnntQK3nEYa6CLD6K19mOP/Re8YhsfIBzt0F7ppu9DsctdNFEwNy
 NZg1ttc0Hw1QX8bjpWln1j19LaOpGXTL2dtHG8nH9ewthrBvXWkeBkcHJIugoQNCoiQJ
 9IQzjzzrlguIiYsSvB1jJXN0U7mTxjauOzahSfrqu3hnReeCp2ekbhF8V/pvtxt4JVVb
 HQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683382034; x=1685974034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVcDmxlyiKb+QNTDAIRDCWbHM2S4dHH1J7A3RssMVro=;
 b=fqZQSMBtWJTA0Mq7SmRWxZ/tQg0NHDAuJu2MQU4y7hizvMNByV+q5djfo56u2gZhSt
 YqMWpV8uGXAp32pR3TPuvVz/vq9Vp4wwD49sOn/FunRTPjgDHMjzjF38GKeociGPK6z6
 b/5O6ExIZWTlRKFWuMFZaRe+K+HP5BI7ku8gQQrS0Iv0+KFZEQQM/efzqpkTEbioNJUz
 ntbFoMUnC0HL5l1LXNQ2jgjZrR40fRswq9b+Zz5Z71GXGqSHl3o99Hp3+B6O/T9WgkwL
 ExPWAfcu4/vY9DiWJTDq4pj1l8KPnqNuvrSqFLICoZ00Za4+gWzjhnEdMTr7m7u13j55
 D/Kw==
X-Gm-Message-State: AC+VfDwclZ0eMjiJkAbxlQuStsNrbHl2gjame2KqRu/2KDf9DOxrMYHE
 vep2NRW04dNJZMluxAMXfL8=
X-Google-Smtp-Source: ACHHUZ6X8fXzv92GJVGKa36Ql0VtvjN/DzfcETizbXIsewA9f3I4uunO6xM9H3bPLfsz/WrxhvVbVg==
X-Received: by 2002:a17:903:2351:b0:1ac:4ddb:5d22 with SMTP id
 c17-20020a170903235100b001ac4ddb5d22mr3805170plh.1.1683382033956; 
 Sat, 06 May 2023 07:07:13 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 q16-20020a170902dad000b001aaf1679c9fsm3692331plx.221.2023.05.06.07.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 07:07:13 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: eperezma@redhat.com,
	jasowang@redhat.com
Cc: yin31149@gmail.com,
	18801353760@163.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Send all the SVQ control commands in parallel
Date: Sat,  6 May 2023 22:06:11 +0800
Message-Id: <cover.1683371965.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=yin31149@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset allows QEMU to poll and check the device used buffer
after sending all SVQ control commands, instead of polling and checking
immediately after sending each SVQ control command, so that QEMU can
send all the SVQ control commands in parallel, which have better
performance improvement.

I use vdpa_sim_net to simulate vdpa device, refactor
vhost_vdpa_net_load() to call vhost_vdpa_net_load_mac() 30 times,
to build a test environment for sending multiple SVQ control commands.
The monotonic time to finish vhost_vdpa_net_load() is as follows:

    QEMU                            microseconds
--------------------------------------------------
not patched                              85.092
--------------------------------------------------
patched                                  79.222

So this is a save of (85.092 - 79.222)/30 = 0.2 ms per command.

This patchset resolves the GitLab issue at
https://gitlab.com/qemu-project/qemu/-/issues/1578.

v2:
  - recover accidentally deleted rows
  - remove extra newline
  - refactor `need_poll_len` to `cmds_in_flight`
  - return -EINVAL when vhost_svq_poll() return 0 or check
on buffers written by device fails
  - change the type of `in_cursor`, and refactor the
code for updating cursor
  - return directly when vhost_vdpa_net_load_{mac,mq}()
returns a failure in vhost_vdpa_net_load()

v1: https://lists.nongnu.org/archive/html/qemu-devel/2023-04/msg02668.html

Hawkins Jiawei (2):
  vdpa: rename vhost_vdpa_net_cvq_add()
  vdpa: send CVQ state load commands in parallel

 net/vhost-vdpa.c | 165 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 130 insertions(+), 35 deletions(-)

-- 
2.25.1


