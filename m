Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F51D97C9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 18:45:09 +0200 (CEST)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKmQ8-0005tU-Aq
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 12:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3XkinXQYKCn8vdphlgjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--sameid.bounces.google.com>)
 id 1iKmNJ-00046T-HR
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3XkinXQYKCn8vdphlgjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--sameid.bounces.google.com>)
 id 1iKmNG-0006Br-Di
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:42:12 -0400
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449]:38042)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3XkinXQYKCn8vdphlgjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--sameid.bounces.google.com>)
 id 1iKmNG-0006AR-8E
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:42:10 -0400
Received: by mail-wr1-x449.google.com with SMTP id w10so11982175wrl.5
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=E89nW/zbiaC6f3L/yPugJBT28Z9/vrZkYwI78yCPi60=;
 b=p6zBUQjc9k6gj3CDXZkSUQ5JvLyGxIChJh4Mpo9LP2bgfxOMAHV/ztOb7BkU0t03/R
 ImaPiAUe7L924UIHUhjqo12iAsCPJyEHAspu6LboqA/vchCUHMeEZYmakj3zHLg230Y8
 pC4z1b3If9pqmuUKa7ZwRDNtRfGhBnXySvjf9a5qkB3T7i9FrVnwuEkE3qFpSXWS7Lmh
 CExcW/kLe3ugbVWnvfRVClzEWHTRQ8sUV5xpbS127sCi4GR8XtQnZU12YGAc0FIC7pNb
 U5Mrn3qbmg2CwDAfYmg6aUN61qS/oiA5H3+VdGAaM5fowvSE+DGnD8oVN0OggBN59Vf2
 w3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E89nW/zbiaC6f3L/yPugJBT28Z9/vrZkYwI78yCPi60=;
 b=U4G+ZTGLUycasgfdYp0TiGJNMTSzCQYVgOEhi0TEGx+Z8wmVIre8EDBq9xHKijDL10
 ONPVquejTdBq0jlep4UO82npmzrNZ+0wg2EmULspoGPo9LmT2cg/yHxGzSobnS19IpmF
 0rzOfE6nfnLFqiHFRGmxYpJQZzeWpOTqdTHgjOXTvpIYc5AYXBktdkigQ+3Q/5Jpya3z
 XA7ep+BrzsILcuTlfwK7ZyvRby0GPFb+/sAWOA+JCYAYWsZr9wQUnOheLa9rSQS00gov
 AoayKfz9lhdODBD7sx8FaKln1XesDFWTSytnxg0rjTePHmIs7+VsPAcRTX1fro4Aub9H
 SnXQ==
X-Gm-Message-State: APjAAAVP3Zs2wVZaaYUz2RXtqtg0oVjlsWCm8DmEbQIDwU46mBQXKsdN
 Ce4cnynEW+vl3jrjCqjdAwj4QkPY8Ta1KlfyCdJBEilyOGYHSECSGXvghwFJ277C974Rr7NiIyS
 uHT58O9DpwHZa67iyqKWFN/bnnqsCurhMLKwCYoHIzu2pveiBFANIPTQYr9sS
X-Google-Smtp-Source: APXvYqxgbr+nQqZYUNNm+vaKrBek/8RPN3Tds3pAA81ahdVwc1CJd806LiBXJgLAUBq+2uPgByN+U8uxVpY=
X-Received: by 2002:a5d:6685:: with SMTP id l5mr3412033wru.44.1571244126426;
 Wed, 16 Oct 2019 09:42:06 -0700 (PDT)
Date: Wed, 16 Oct 2019 19:41:39 +0300
In-Reply-To: <20191016164145.115898-1-sameid@google.com>
Message-Id: <20191016164145.115898-4-sameid@google.com>
Mime-Version: 1.0
References: <20191016164145.115898-1-sameid@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH v8 2/8] block: Support providing LCHS from user
From: Sam Eiderman <sameid@google.com>
To: qemu-devel@nongnu.org
Cc: arbel.moshe@oracle.com, karl.heubaum@oracle.com, kevin@koconnor.net, 
 kraxel@redhat.com, kwolf@redhat.com, liran.alon@oracle.com, 
 qemu-block@nongnu.org, sameid@google.com, seabios@seabios.org, 
 lersek@redhat.com, philmd@redhat.com, jsnow@redhat.com, 
 Sam Eiderman <shmuel.eiderman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::449
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sam Eiderman <shmuel.eiderman@oracle.com>

Add logical geometry variables to BlockConf.

A user can now supply "lcyls", "lheads" & "lsecs" for any HD device
that supports CHS ("cyls", "heads", "secs").

These devices include:
    * ide-hd
    * scsi-hd
    * virtio-blk-pci

In future commits we will use the provided LCHS and pass it to the BIOS
through fw_cfg to be supplied using INT13 routines.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
Signed-off-by: Sam Eiderman <sameid@google.com>
---
 include/hw/block/block.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/block/block.h b/include/hw/block/block.h
index fd55a30bca..d7246f3862 100644
--- a/include/hw/block/block.h
+++ b/include/hw/block/block.h
@@ -26,6 +26,7 @@ typedef struct BlockConf {
     uint32_t discard_granularity;
     /* geometry, not all devices use this */
     uint32_t cyls, heads, secs;
+    uint32_t lcyls, lheads, lsecs;
     OnOffAuto wce;
     bool share_rw;
     BlockdevOnError rerror;
@@ -65,7 +66,10 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
 #define DEFINE_BLOCK_CHS_PROPERTIES(_state, _conf)                      \
     DEFINE_PROP_UINT32("cyls", _state, _conf.cyls, 0),                  \
     DEFINE_PROP_UINT32("heads", _state, _conf.heads, 0),                \
-    DEFINE_PROP_UINT32("secs", _state, _conf.secs, 0)
+    DEFINE_PROP_UINT32("secs", _state, _conf.secs, 0),                  \
+    DEFINE_PROP_UINT32("lcyls", _state, _conf.lcyls, 0),                \
+    DEFINE_PROP_UINT32("lheads", _state, _conf.lheads, 0),              \
+    DEFINE_PROP_UINT32("lsecs", _state, _conf.lsecs, 0)
 
 #define DEFINE_BLOCK_ERROR_PROPERTIES(_state, _conf)                    \
     DEFINE_PROP_BLOCKDEV_ON_ERROR("rerror", _state, _conf.rerror,       \
-- 
2.23.0.700.g56cf767bdb-goog


