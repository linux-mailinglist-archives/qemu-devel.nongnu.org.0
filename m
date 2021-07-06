Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8A3BC947
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:14:48 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i6J-0003FE-Hx
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hto-0000bM-4N
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hti-0002Co-H0
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id t6so15430828wrm.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WYTvUd/0OGFtsl7VV7tTq8ZwqHW9D0vhcKkcr6GsaXM=;
 b=atjm79B91UvIWbBp479x7sMKj+hbO3JQYX79Uypq1wDVdb3hp6fQ7JnFWido0Ow1KL
 QL/11qNpQmOzOktx8FtYT/vdQl0IsXQytBxWUoE8R1xZl6Lc83eFsvG0m+Yl/2ARD+NM
 Z6WwUfaifbUuw9aJC9hUR9CBqxidRu7bvEuR7h+9ryy/goCqleQsz7sbGIqufDH794ut
 /36wfLHkt3fq0C+d/CKNqFOON+B12G/llXdxEpaLsaOxdE+U37lmZmDmzp/HnykWSKQ0
 Eosn/sw22VS6Kkm3zKUOISaqI7f0OH8U5B8gxyMIFJ07yAZoF0byJpEG3traEqdtlq3S
 VDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WYTvUd/0OGFtsl7VV7tTq8ZwqHW9D0vhcKkcr6GsaXM=;
 b=olTqjZJKVG3MIjTTW0KP8oLrzRS6NI9JregUaqZKayDFMFHYY9IUJ2cYWOErzXfmw3
 wQu/fQl7VtxgW9wuqvW842T/Cu4c5XknKV1xneFv6MhvILEGD02bjz2dZgfOL2dc99lA
 qSWIKFeCcinAe2WvTyvk65H3zQW9Tir7sDEuwEA9WWRVTK4ccTE9kzAaN2vt8TID3tYS
 1QjreTULf79v1IMNsCVmgxaXYnXTJBYSMTx2Cgd3E4z7SErsHWjdTJrPUpTSZSWE1oz6
 PBjbW2HUgx3aBSKRgjBWwa8UateMtt/XwbtmSxZ3AjLbxoMX9tyScvg3041QYCl3HEvQ
 O6NQ==
X-Gm-Message-State: AOAM533VK8N+Jh91CJDNDAneYPoDuliQaBOHZEtOMgBaje2H2KETfIX/
 KJOE7i/TBX6BW/c4gYzX8lzek5AZk74=
X-Google-Smtp-Source: ABdhPJy4u/WmSQb0DXYRrb5CKy+SuKxGjV4TnF8YVPoVlwQqQnIIENQvGej/qLmpeoH7urg7klxvSw==
X-Received: by 2002:adf:d08b:: with SMTP id y11mr20944420wrh.295.1625565704321; 
 Tue, 06 Jul 2021 03:01:44 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/40] softmmu/vl: Remove obsolete comment about the "frame"
 parameter
Date: Tue,  6 Jul 2021 12:01:03 +0200
Message-Id: <20210706100141.303960-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The frame parameter has been removed along with the support for
SDL 1.2.

Fixes: 09bd7ba9f5 ("Remove deprecated -no-frame option")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210630163231.467987-2-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index d99e2cbdbf..cee6339580 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1062,8 +1062,6 @@ static void parse_display(const char *p)
          * sdl DisplayType needs hand-crafted parser instead of
          * parse_display_qapi() due to some options not in
          * DisplayOptions, specifically:
-         *   - frame
-         *     Already deprecated.
          *   - ctrl_grab + alt_grab
          *     Not clear yet what happens to them long-term.  Should
          *     replaced by something better or deprecated and dropped.
-- 
2.31.1



