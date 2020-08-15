Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5B245139
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 17:21:46 +0200 (CEST)
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6y09-0008D3-G5
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 11:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.shinde12194@gmail.com>)
 id 1k6xrZ-00046W-CC
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:12:53 -0400
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rohit.shinde12194@gmail.com>)
 id 1k6xrX-0000jk-Pu
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:12:53 -0400
Received: by mail-qv1-xf44.google.com with SMTP id b2so5696357qvp.9
 for <qemu-devel@nongnu.org>; Sat, 15 Aug 2020 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM//LrDWGGGhJjEJLnCRBQiCm5i3PZw6ntawugMtwbE=;
 b=hhsk2zFHNi6DTEt4TgySbvXeEaRIgubuVPAkNGSGQM9n7mFUSCr5vt8X7ENLJqgvLK
 UwEE88dZPqZAEYtaV3oysbdilQa+7UuUKEX381Oii+WnhUF2ePh1PjV9ivWBwNTI3SCa
 PIY+y4a7XHJ05WrxG1N4OA91NW+b+az/AHLtiCh+8gGp/kK6/B+uV8i/45RZY4LvtEFA
 zPhEdj5iUgFYoM1bMxLqoeYP985pnM8m2XQzB4VsbKvJ/ZceFbCykzQjE6YaJh2whCy6
 +MlCbRVD/2W5/yaHgVtsy3Iu3/Ow4nqlxTDP5Sql0ennWwuGlzUD7ZYDNYhb4cn1T0LS
 kEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM//LrDWGGGhJjEJLnCRBQiCm5i3PZw6ntawugMtwbE=;
 b=D2waZSPl1GzJML72YwNJyRg4wUjnWi+O9aook7u1LvPSu4twuUduTkcAlPJ5g57mi+
 A21V4smHRbyhex550HV6NStQP8XPgP6LREcj+QYoZYdMFfV1BDGovePWD3tg2ha/6j3h
 J8kKlDNoBf2jtYZAJ/gH/pls/YiQ7x56o0TgSk0EzlQtTdDMURXUgjZqd5JNapmfFkej
 SvWB34OFdBe4/Kmj7uSAJy+U578wifrSiA7FveOqjfyvco+tzNqTxr/cnZ+Ai5GS0rVZ
 jPeZeEQmEt6RvS+3o30nvja68h70jp441w4RDSncxjzoNbsTOJDJUqHzpbZNtiOexsHu
 DmZw==
X-Gm-Message-State: AOAM5323Ft/0kcrWJPbRTEyG4p+KOrcwYI2mRnIm40cCIHyBX5+6BpKX
 8jSxh809Xu8VQBHT20TqReB/baLUJBkSdQ==
X-Google-Smtp-Source: ABdhPJxCgVtHl9zYuaSbpKBCwHqfRpiJEvy6Klc3mVqfzTYkI+9PLCYgu51iDuavLL/Ls+T0zxNsNg==
X-Received: by 2002:a0c:d44e:: with SMTP id r14mr7353017qvh.105.1597504370477; 
 Sat, 15 Aug 2020 08:12:50 -0700 (PDT)
Received: from ubuntu.localdomain (pool-108-35-56-31.nwrknj.fios.verizon.net.
 [108.35.56.31])
 by smtp.gmail.com with ESMTPSA id z197sm11754989qkb.66.2020.08.15.08.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 08:12:49 -0700 (PDT)
From: Rohit Shinde <rohit.shinde12194@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Fixes: Fallthrough warning on line 270 of
 qemu/qapi/opts-visitor.c
Date: Sat, 15 Aug 2020 11:12:45 -0400
Message-Id: <20200815151245.10640-1-rohit.shinde12194@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=rohit.shinde12194@gmail.com; helo=mail-qv1-xf44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rohit Shinde <rohit.shinde12194@gmail.com>, armbru@redhat.com,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added the fallthrough comment so that the compiler doesn't emit an error on compiling with the -Wimplicit-fallthrough flag.

Signed-off-by: Rohit Shinde <rohit.shinde12194@gmail.com>
---
 qapi/opts-visitor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 7781c23a42..43cf60d3a0 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -266,6 +266,7 @@ opts_next_list(Visitor *v, GenericList *tail, size_t size)
         }
         ov->list_mode = LM_IN_PROGRESS;
         /* range has been completed, fall through in order to pop option */
+        __attribute__((fallthrough));
 
     case LM_IN_PROGRESS: {
         const QemuOpt *opt;
-- 
2.25.1


