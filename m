Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDB64CA36
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 11:03:47 +0200 (CEST)
Received: from localhost ([::1]:45010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdsyw-00028l-EO
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 05:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38435)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pizhenwei@bytedance.com>) id 1hdsqM-0006RW-Vx
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1hdsqK-0006WL-ND
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:54 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34461)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1hdsqE-0006L6-QO
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:48 -0400
Received: by mail-pf1-x443.google.com with SMTP id c85so1294578pfc.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=8YwYO4bCCzFTtyvf/RTMvLZ3PGv0Kl4cUOALIRGnxFk=;
 b=OD37YE2HUxagU6ekUkBJz1cGfDHsx73tIxdq/a+2oZdWw/KrjsL5uD3FRu+m1ma2ky
 N8Gt8GQA71C9cIms8A/AsSLJqwPRKwnJQtsPOlHe9LQB7xK3sflwBfSM+n8rIfOPGsS6
 NLdJUIXNd8TnT22LqOb78BSIIoAvBoHwvFEvNw/2CZkxzmTr1+f50SSQcdnc9F6sGSec
 61UqNAt5obivfM0AQYYOTA5aTwx1gpP3Vz/epMieyUOXeczgXJ9wmtgeYZ4iFrKkDZ5v
 e8Brf4m3s2STfIiMltHGklRqcPyORHl+0U3CDbmxnmpbrE5HcTtDHb4jhHH5I8LH1Zpy
 C+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8YwYO4bCCzFTtyvf/RTMvLZ3PGv0Kl4cUOALIRGnxFk=;
 b=Q+uldhgN+k0CYyo1nOIEF6XuwW0ek7Hx1rpNNNQiaItoFYzYOY37yp8MI31sQxMkol
 7jDVv18U+FOchMfuO75YNK+3dTzXeQGH3VCMTByVIxRiALlFvdRwh26eR2C8N79ys4Vr
 F8UFpKoMQFujg7avbU/TmyEs7VH7EHK1MGtz4VLXv9CRcpX/icUHnT9OB8lpYBtu0GMv
 v61jn0jUjJu5xUGuxt4/DtMn01RHfZjBmzoHtZ+U8/KGb2zLmAs8CqcPbid8ucZ4FGEu
 6TgaseOod2rNWOfWndtaqaRI6FM4fMP9nWCex1sNCp7WsPYtCn2zkXgoY+ilrQiPFns2
 F8hQ==
X-Gm-Message-State: APjAAAVchXvi+NFQKBU3XFLn184rB5u8WUduqFbVW646lZRXEYL1+Fhi
 Dfx1vH6nsC2/s+h5QMQbADfI1A==
X-Google-Smtp-Source: APXvYqyXr0LOPSU7IUlZCt4H/ywFXzQYzcqBmqfh9GDIPaXYqEt57HxEIxsVPh0tT07xU9GaP5fqBg==
X-Received: by 2002:a63:dd53:: with SMTP id g19mr11447345pgj.3.1561020878744; 
 Thu, 20 Jun 2019 01:54:38 -0700 (PDT)
Received: from always-ThinkPad-T480.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id c11sm19240635pgg.2.2019.06.20.01.54.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 01:54:38 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kwolf@redhat.com,
	mreitz@redhat.com
Date: Thu, 20 Jun 2019 16:54:29 +0800
Message-Id: <1561020872-6214-1-git-send-email-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH 0/3] Add block size histogram qapi interface
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

Set/Clear block size histograms through new command
x-block-size-histogram-set and show new statistics in
query-blockstats results.

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
  qapi: add block size histogram interface

 block/accounting.c         |  55 ++++++++++++++++++------
 block/qapi.c               |  26 ++++++++++-
 blockdev.c                 |  56 ++++++++++++++++++++++++
 include/block/accounting.h |  12 ++++--
 qapi/block-core.json       | 105 ++++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 235 insertions(+), 19 deletions(-)

-- 
2.11.0


