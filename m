Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0853F9027
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:29:59 +0200 (CEST)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMwg-0000dl-0K
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg1-0006K7-DT
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:45 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:45995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg0-0006vu-1T
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:45 -0400
Received: by mail-io1-xd2b.google.com with SMTP id e186so5548234iof.12
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEkC4W7uTDt5OeWX/S5kHSE0qmVobg9OD2eDr+oF0C4=;
 b=oJKTWfrFeM7Ii4TpMOCNpnwThseM354yp2fAQCQ9w9VCT4J9a2k75dg7x2Q0SBpXEF
 QuPHbCjrkE6r0RddisY8wL6xXnMd2g63ndxh0xjmyN5Sho/XdldprrTGCXipptdmm8H1
 +1v7MLzFk8FtAB0xS+OUkgKunz+WkkAb6psM4i6htyJsDNIbSZ20lPLu570kGGF1I+9X
 Wh+LvRy237352IU14dejQ1a49vcpg/MssB6EywVF0Nos4HHpI2p5hbi7FeErTde5K1cu
 2D0gat7cJPjHPK1fxkFFLjT8hrtIM6/Fl+CMky0kE5UDvBReM6shqN9Mp73KhqXj/Jjp
 UsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEkC4W7uTDt5OeWX/S5kHSE0qmVobg9OD2eDr+oF0C4=;
 b=UdVmNGOP+nga4LfGEedLBOKCD78A+m8EabNlyMdNzp2LmSaA926SjfeJTG4nC8eL7K
 T38HhWn/i1cCDPZioj4Tb8IHLAkbX5rNB08n7IxDTI9qL0oX2BItqJrz6ghJIaG/sxku
 v+ePLdZ5dTs54vOay1EQRmIOcfOrjo8OoErh2wjtiiy49nFbJvTKYYCJ0RASQXUOyZNM
 7RhQwZbZalTTP8Myh0r5hLaWbSn1JNA4hPeQvHUPbwoo185hTvXxNr5j8zS+C1VQhvou
 3dtX6yRYjQMsclMk1rhWnAQgX3XhTNGPlP3BX67nTqB8A3Zp/Q28+A5YELdygfP+nyH+
 8pIw==
X-Gm-Message-State: AOAM533UKyPZtulMt2o0+Ww1p++wD4BmeX19EpBgC470/zDSDJahtivR
 5aNrhEJbsvct6qjAp1GRL/nYboh30ddrpG09
X-Google-Smtp-Source: ABdhPJwFTS1sDdaTRgN0zCBg+XV/tNdK3O4hUE9xjnscisAvBSW4RsHzCE4A/NCb140ywWFRZwRsqg==
X-Received: by 2002:a05:6638:265:: with SMTP id
 x5mr5014125jaq.23.1630012362733; 
 Thu, 26 Aug 2021 14:12:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:42 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/43] bsd-user: Include more things in qemu.h
Date: Thu, 26 Aug 2021 15:11:40 -0600
Message-Id: <20210826211201.98877-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Include more header files to match bsd-user fork.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 5e4cbb40d4..55d71130bb 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -18,12 +18,12 @@
 #define QEMU_H
 
 
+#include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/cpu_ldst.h"
+#include "exec/exec-all.h"
 
 #undef DEBUG_REMAP
-#ifdef DEBUG_REMAP
-#endif /* DEBUG_REMAP */
 
 #include "exec/user/abitypes.h"
 
@@ -36,6 +36,8 @@ enum BSDType {
 };
 extern enum BSDType bsd_type;
 
+#include "exec/user/thunk.h"
+#include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
 #include "exec/gdbstub.h"
-- 
2.32.0


