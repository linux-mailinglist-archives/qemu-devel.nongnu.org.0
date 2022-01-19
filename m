Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17D493B1A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 14:31:01 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAB39-0007as-Ro
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 08:30:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nA9rS-0008VQ-UP; Wed, 19 Jan 2022 07:14:49 -0500
Received: from [2a00:1450:4864:20::336] (port=35462
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nA9rQ-0005bj-84; Wed, 19 Jan 2022 07:14:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso14196996wmj.0; 
 Wed, 19 Jan 2022 04:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Viquf70vnxMxZfgtgaQ76mrfFQLoYK9p8+ok5REEpqU=;
 b=ZL7ymSx8upNjZ3Xjd4dSpDzDJsVMEkQoRUGW5SoPqU7RRAmbdqJ7f3rbEy0p29c6ie
 PqHp05fzgZMvSbPXNWhvHAlMWR7awTDaJfRFCSzuDuSMiCniqeIarBPy3wpnFf+fJu6/
 Q4iU8fuji8xIfI4Eu0f2hHcsYCeXl/zcFQkQwkjV/00yu97CtL/b+yDRBGnuT8mO8mcF
 y0oTBNBJctLY/IlDOQz+51zDvT2q0p1m7htCt/51kh9GiCeoSqy8D7lppov54bMgnLVP
 mzO/WwwZkWaETGowzKHlNzvMs+CGIsAQQkUbd1lKnOoXBIrm/scF895C24wMCR24cAmU
 h8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Viquf70vnxMxZfgtgaQ76mrfFQLoYK9p8+ok5REEpqU=;
 b=12Gb0kUbOfMRTPjb8l8+LvjAxb5drg5CiQoXwvllisRA0MNlLTeRap5juA7wuvv/zY
 brN8aZPwdXTNcOOG6P9e7xRKGqGdx4uMT4hkctwBER0qS55HOS+3U6KQ4Kyt7HQQkHQp
 hP8hPMDbZMJ51VygbDTOY1WO/BKavH9Svru/3M/WtPMbooTS9Y+PI4H26/+DOY9RH9Uw
 9kYA8S210jdkTLCQSwRdzCWodCKoO/dyETiW97SuXpbvVc9+MoIWUSntz0JtJgz1lWZg
 GuWxiuyf3hxwpryGJ0/E/gcHlB8QStm11vEBGIg+p/uF47l0UjfvN+JTQyLsJxA/V7eP
 sdSQ==
X-Gm-Message-State: AOAM531fJ+o577Op1veNzS7BNtbIoNeWNcCFoFCte0thAnkFymr1fpkN
 PSnIkvmF28ry63VFTCWiaX3fX5LZy6A=
X-Google-Smtp-Source: ABdhPJwXryYWHiHIgrlo5fOQP9EHoGOXx/rBsLs9b+1xE8XB4hMSDah9+M7BjpGZlER7+IjqH4JwgQ==
X-Received: by 2002:a05:600c:587:: with SMTP id
 o7mr3313188wmd.114.1642594481742; 
 Wed, 19 Jan 2022 04:14:41 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 v16sm10535736wrn.104.2022.01.19.04.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 04:14:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Subject: [PATCH] qapi/block: Cosmetic change in BlockExportType schema
Date: Wed, 19 Jan 2022 13:14:39 +0100
Message-Id: <20220119121439.214821-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daude <f4bug@amsat.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix long line introduced in commit bb01ea73110 ("qapi/block:
Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER").

Suggested-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/block-export.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f9ce79a974b..f183522d0d2 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -278,7 +278,8 @@
 ##
 { 'enum': 'BlockExportType',
   'data': [ 'nbd',
-            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
+            { 'name': 'vhost-user-blk',
+              'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
             { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
-- 
2.34.1


