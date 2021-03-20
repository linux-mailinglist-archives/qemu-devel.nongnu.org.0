Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0BF342E90
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 18:16:02 +0100 (CET)
Received: from localhost ([::1]:42908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNfCj-0008SI-Gj
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 13:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1lNf9R-0007UN-MN
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 13:12:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1lNf9K-0000zk-0n
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 13:12:36 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t4so1865804wrn.11
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 10:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjKczt/EBILj8A+L4FwwJQkBWsGDBGnkl5PPrm7RF4A=;
 b=LN7ZxtcpRBzaSAmSNqMIfIFgAOLOvfkQOH/JdPxDNYiLb7LcoVi3o4rQmmSXne265h
 5+NxAb/V76L0zN0VwjGoFtHCmhzigSNt12WnXNCX9H65dux1+lxUDmNhn1iQxUrd1IFA
 9vilu6xcuN+0Qd1qGp0NLXga0iNCLzbDmJXvtuj9u0/lEvdUuG5+V0lJTG1U5aVSKjdv
 HizYYHkYepxPJS6MN2+7o+Rw3rHCFXgx3kn3Sk0puYAcHMVM5Hwnb6Ui6HCs+GnfXjfr
 PH/H1dh2ORqQ/IvoaZCR0IvubVEbyAjatAfYfHd6hh0ZxSxUZEU13P6TayRSfKTAQjmx
 AGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjKczt/EBILj8A+L4FwwJQkBWsGDBGnkl5PPrm7RF4A=;
 b=oTLPokxAuFpb/W/upr4m9bqP4+mc0HREhuh6cg95i+k427b1SjevWaVhsKrvOxBq7J
 mtQ1+29grsfUt5SgRiqb2kAS+tsixJVnByCs9wQvd4ncM5Ik8IR6jkjHGSgQfN/EqK8U
 bhZzVcl3y6wSljTm/GVQcoly908vXhTHvhaWSCXxIRY+rGds8YleYc+yxNUull6144LW
 YR/IQqC5AtoZKY63u39WT7otfTOrkoKO4Pp6ZfIDMapwwktidBlphAPBV4BZkEXvxyg1
 uynEZKotk1KbX70DSyN4ngJ0J3Tomh2IEDfgWXiY/TQ6GUVWkeSQWtAuZsOVjPnmrPbO
 FoWA==
X-Gm-Message-State: AOAM532pYkxBPQ+dXWxzESOKspZft9BzuAHtPTiXpfaVIVkVXJ64hKf0
 BL1DyXYnH9kpa9vt8T3gueX3NQ==
X-Google-Smtp-Source: ABdhPJxjmhSNB7dRmjKBLqX9OZvb4mVPIXumTwq2Fu8qG+//Mo3mdaHqtpG1lQY/ZLD25sTB9k/MKg==
X-Received: by 2002:adf:c401:: with SMTP id v1mr10415656wrf.242.1616260348338; 
 Sat, 20 Mar 2021 10:12:28 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.local
 (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id p6sm13073587wru.2.2021.03.20.10.12.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 20 Mar 2021 10:12:28 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id 96296337EA2; Sat, 20 Mar 2021 17:12:26 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] meson: Propagate gnutls dependency to migration
Date: Sat, 20 Mar 2021 17:12:21 +0000
Message-Id: <20210320171221.37437-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210320164730.33285-1-jrtc27@jrtc27.com>
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Jessica Clarke <jrtc27@jrtc27.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
for softmmu configs, which pull in migration's use of gnutls.

This fixes the following compilation failure on Arm-based Macs:

  In file included from migration/multifd.c:23:
  In file included from migration/tls.h:25:
  In file included from include/io/channel-tls.h:26:
  In file included from include/crypto/tlssession.h:24:
  include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
  #include <gnutls/gnutls.h>
           ^~~~~~~~~~~~~~~~~
  1 error generated.

(as well as for channel.c and tls.c)

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
Changes in v2:
 * Added error to commit message

 migration/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..6fa2f8745d 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -24,7 +24,7 @@ softmmu_ss.add(files(
   'savevm.c',
   'socket.c',
   'tls.c',
-))
+), gnutls)
 
 softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
-- 
2.31.0


