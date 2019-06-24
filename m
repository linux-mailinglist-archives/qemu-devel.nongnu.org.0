Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AD50287
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 08:52:10 +0200 (CEST)
Received: from localhost ([::1]:48300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfIpl-00060Q-IS
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 02:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pizhenwei@bytedance.com>) id 1hfInU-0004ao-CL
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 02:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1hfInR-0002yo-Lp
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 02:49:46 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35227)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1hfInR-0002ua-Fl
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 02:49:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s27so6585065pgl.2
 for <qemu-devel@nongnu.org>; Sun, 23 Jun 2019 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=1OMlUS5nPfK95593P0uZOUMCquD6tXw4v+9sW3dINBc=;
 b=sCrCgWma4bLL7s2AZuy/yricA/5LljGCGp7HPfASPycN17OkucYbaHRFnHxAZJXHZt
 96aNzICY+fuWWD5nOU0TfaTUX6S6+EYCcb+fZRaq0+ki5/zs/uZsFkXUvbUKYpn56HEK
 527mzfzyEVBGimXiqao8H+oZ23bmp8TzLJtZu0We7UV4e41b57wggrJoGSmnE+jXqu6p
 uGtngIGauwX2OC/XqXeYugJegDqcgrUl7v5zh5shbHD9y9S7+YtrPafxATvv/sr8QzkI
 o8LvjExcZ/3sOkDVtbyg89nolKMIlq/Uav9IPHUTdKnKK1Ve3mO3plV4lCO7IwFOQ6vT
 AESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1OMlUS5nPfK95593P0uZOUMCquD6tXw4v+9sW3dINBc=;
 b=FY5foV4J5MfZlksoX0/Q8HN1jn/Cu/cpEK2RacfkQ9QEfDFR9lZA2XQTUhiNAkH+R6
 +YrPr5AwYRkIhMMrFLl7Iefl+0RsKLqr5nkjrZJIg3t+PT1JvSqqfaihQTV3IAHW1z2q
 Xo9ChC9DJxjMSYeqW6OpXLUjvlkBP+5gkIU6srUgUzM91FAHQHGYN1nezDMQ4jvbCw80
 Da+DrHx+fAGpQejhEN2wTo5RAjLKNb4TgfjtN2Eph4JTShCCIyr4vSx1curJLFqUeul+
 5yiFCjmjlc2I9AGuexaM2M2qHEaWMpzWQMoXFtKuYRG08wk35v1EwO2uphGbkDoE+9TX
 tYrw==
X-Gm-Message-State: APjAAAXhAVZN+HvPPqSZCpgVv9Ljm9kGKHpgdOG+uB2KylvKZQzLLe1e
 ONeFYGehXoXULqBKAS0850M8/A==
X-Google-Smtp-Source: APXvYqzrbdvIAp4Vj/tDXEy8Q/Q03r9k7OHWcAnrS+V7TjOff3NNtIl+zrcMHudRYxClgD2iGZvSFA==
X-Received: by 2002:a17:90a:2486:: with SMTP id
 i6mr22762220pje.125.1561358983138; 
 Sun, 23 Jun 2019 23:49:43 -0700 (PDT)
Received: from always-ThinkPad-T480.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id n17sm17734259pfq.182.2019.06.23.23.49.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 23 Jun 2019 23:49:42 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kwolf@redhat.com,
	mreitz@redhat.com,
	eblake@redhat.com
Date: Mon, 24 Jun 2019 14:49:33 +0800
Message-Id: <1561358976-5183-1-git-send-email-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52b
Subject: [Qemu-devel] [PATCH V2 0/3] Add block size histogram qapi interface
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
Cc: fam@euphon.net, qemu-block@nongnu.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify command 'block-latency-histogram-set' to make block histogram
interface common to use. And support block size histogram.
Thanks to Eric Blake&Vladimir Sementsov-Ogievskiy for the suggestions.

This command has been tested for half year on QEMU-2.12, and we found
that 3K+ virtual machines write 25GB/s totally, the block size
histogram like following:
        0 ~ 8k: 58% ~ 62%
        8k ~ 32k: 10% ~ 12%
        32k ~ 128k: 2% ~ 3%
        128K ~ 512K: 24% ~ 26%
        512K ~ : ...

And the histogram data help us to optimise backend distributed
storage.

zhenwei pi (3):
  block/accounting: rename struct BlockLatencyHistogram
  block/accounting: introduce block size histogram
  qapi: make block histogram interface common

 block/accounting.c         |  62 ++++++++++++++++++++--------
 block/qapi.c               |  32 ++++++++------
 blockdev.c                 |  33 +++++++++++----
 include/block/accounting.h |  13 +++---
 qapi/block-core.json       | 101 +++++++++++++++++++++++++++------------------
 5 files changed, 158 insertions(+), 83 deletions(-)

-- 
2.11.0


