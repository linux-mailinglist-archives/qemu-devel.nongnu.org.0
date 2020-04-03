Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C779719DE33
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 20:48:24 +0200 (CEST)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKRMd-0006nY-C9
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 14:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jKRIu-0004VB-K5
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 14:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jKRIt-00038I-Jj
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 14:44:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53292
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jKRIt-00035v-EM
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 14:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585939470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TUMkpmo4L6jdTvSkcZxgtOX/YBbJXfdZHtdto482kKg=;
 b=GjTtgCJ7YvCXuyZTr57LaStroN2csnud8c6yrn9/MzK4tgVWBuPAsLb0HvxfQjcebPtRMD
 /L3BOsHdTd434rRykfchPEb+ONd/na1HQdp9xvEL3XKdpCcC8Z9hlNogg4NQDpOXqQhjH9
 2usahaCskSDb4mtVPOVfgtAW6ggiJMU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-528raUyXND2IAnO68oNGIA-1; Fri, 03 Apr 2020 14:44:29 -0400
X-MC-Unique: 528raUyXND2IAnO68oNGIA-1
Received: by mail-wr1-f69.google.com with SMTP id v17so3536612wro.21
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 11:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EGdQcBF6x6tqNzirw5Y4Fl1t9GhDUE9kmNp/xheoSqY=;
 b=TJphPaLS81saEtVjzgfU9Fnr9oIszSh62VTZcUPrzhm0mQiWASUUdjemjQ/STvYPi1
 kRo15jJQ+EiVdS1ZBW7WKe2Nz3OD7EbwrG6KZLoFAN8DgeWmfIPNdgLTWnF7lco8e7aC
 oNb52yVWKNUIVM4O0xSWGKxHA6wse08TFF6CX5eNfLiaZwQbJOPH6siwGWv5sHXy6Qf3
 PdgKsHsLxG7GcHW63UwXen5DEAe1e5Oj8J139EA2oQ2Xi9NSJaxGQgI9RS7nt8N/zR7/
 Vwwn/cTTjrn8ap+KnD7E/u1caNKEuvFVtaafO7//Q1Cwb206TGbB89geMoEda5PA80LL
 fomA==
X-Gm-Message-State: AGi0PubRD6svQS4oILJGaq6VD88she28YmId6ViLhkt1PnkSqO4bxUTD
 cdK3qV0zd4JzkDiDRu9JcgIeWdC6lbnIVZTQI/DoNJ5Wpihk3EBzj7KmDKTm+aDqbNy/j0harq2
 1o0oDWnb8exnOauA=
X-Received: by 2002:a1c:ac88:: with SMTP id v130mr10271317wme.34.1585939465478; 
 Fri, 03 Apr 2020 11:44:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypIJCzK5udgjw74yYEbaPe5g67WiM5jWY5jjDjYz1ELtXI8Psl/B7RUhL7jaCJSm3QwNutI8BQ==
X-Received: by 2002:a1c:ac88:: with SMTP id v130mr10271076wme.34.1585939461976; 
 Fri, 03 Apr 2020 11:44:21 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id o67sm12691083wmo.5.2020.04.03.11.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 11:44:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2] target/rx/translate: Add missing fall through
 comment
Date: Fri,  3 Apr 2020 20:44:19 +0200
Message-Id: <20200403184419.28556-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reported a missing fall through comment, add it.

Fixes: e5918d7d7f0 ("target/rx: TCG translation")
Reported-by: Coverity (CID 1422222 MISSING_BREAK)
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Fixed typo 'comments -> comment'
---
 target/rx/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index b3d7305f23..61e86653a4 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2362,6 +2362,7 @@ static void rx_tr_tb_stop(DisasContextBase *dcbase, C=
PUState *cs)
         break;
     case DISAS_UPDATE:
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
+        /* fall through */
     case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
         break;
--=20
2.21.1


