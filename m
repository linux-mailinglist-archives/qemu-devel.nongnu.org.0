Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A718332FB6D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:41:21 +0100 (CET)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ3Q-0005vI-LJ
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzn-0001SJ-Gb
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:35 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzl-0008Sp-LK
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:35 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso1138606wmi.3
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8dN1hzgQ4tPFOcaWNv/scrVM7GwL38pvBm6AwY8BGs=;
 b=V0FVy0ciXk5yU/tt9oLtnui7wFGqoZWBkhIrdrCsG2gq/vCJUiHg2CZOeRmXOvTMc1
 Q22D93QDZOcrWVUqAULd9azaO1VJcT1Aw1F1kTypjj9esoHFRwB2zixx5xADhl4xtg5T
 bt+8Y6XbylYFBcLviCl3uGkpHdSipWZ9cO2Z2NGiTKjSVCMEo0L+gXIrxK//0iRXOToP
 HxVlEnoKSAh+ut+hEVYm9FEqv1cjPKmiTL5tHvDkLfVc2iSrufLn1gq8lFrJYFZ+7An5
 BaVEI81C9jwZkgTWrBxJuvYfi/UwHriKlHo7StHU5qfV13ANk+ZbfUG1G1GWwdmB8cMd
 vIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k8dN1hzgQ4tPFOcaWNv/scrVM7GwL38pvBm6AwY8BGs=;
 b=fkaOy+acsIb1UOtt4+FX0WdDMGSZXBTFxapI9jfB9Ow8rINAZWWpBvw9FHsfe0/Bmy
 OC1Ye/4ZszFrLvuza55rLCA2v3xb9YYDfUf/lu165BwzyKERaCLIrGtrUtoAlyj9tyO+
 aqBHl/dikFJmgMgplhboSCK6ocGWuk9noWtMtUTja1QLYUxw0rd9HmQVBnA9GfvN0A9p
 KflCduRnnjzhhxopXsG3Po8veuwUpzPqWGxC2Wnj5zdNl3g1T8f4IkuPnuIgGNrItKj6
 fJOljkXOSoGAJ4wfni6Jbz5kVixIAVHsiIDd00dkoSpi4+weuqxNiBbtS++7aG02N/Eu
 nnqA==
X-Gm-Message-State: AOAM531zYndOsrTCm5sP2RhOdDfNlk2rSMbzDX3+zRNR26zm2lE1bISA
 xOPycAiqo270ofjpdiNRj2GVNH50MXA=
X-Google-Smtp-Source: ABdhPJx1W0VNjqsGLN2dS1jmknLQOH0rT9visGLX7c7ol+1q2k5eAgvO2548VGJ9xVMz9Viqnn2BHQ==
X-Received: by 2002:a05:600c:2cb9:: with SMTP id
 h25mr14104705wmc.110.1615045051854; 
 Sat, 06 Mar 2021 07:37:31 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 91sm10376973wrl.20.2021.03.06.07.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:37:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] hw/sh4/sh7750_regs: Replace link to license by its full
 content
Date: Sat,  6 Mar 2021 16:36:21 +0100
Message-Id: <20210306153621.2393879-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file is borrowed from the RTEMS source code, which comes
with a GPL-2.0-or-later license with a header exception.

Expand the GPL-2.0-or-later license in place to not be dependent
on a 3rd party website. This also fix the misleading comment "The
license and distribution terms for this file may be found in the
file LICENSE in this distribution" referring to the RTEMS distribution
and not to the QEMU one.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210222185605.2714192-1-f4bug@amsat.org>
---
 hw/sh4/sh7750_regs.h | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
index 3e4554af315..ab073dadc74 100644
--- a/hw/sh4/sh7750_regs.h
+++ b/hw/sh4/sh7750_regs.h
@@ -10,8 +10,28 @@
  *         Victor V. Vengerov <vvv@oktet.ru>
  *
  * The license and distribution terms for this file may be
- * found in the file LICENSE in this distribution or at
- *  http://www.rtems.com/license/LICENSE.
+ * found in this file hereafter or at http://www.rtems.com/license/LICENSE.
+ *
+ *                       LICENSE INFORMATION
+ *
+ * RTEMS is free software; you can redistribute it and/or modify it under
+ * terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2, or (at your option) any
+ * later version.  RTEMS is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details. You should have received
+ * a copy of the GNU General Public License along with RTEMS; see
+ * file COPYING. If not, write to the Free Software Foundation, 675
+ * Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * As a special exception, including RTEMS header files in a file,
+ * instantiating RTEMS generics or templates, or linking other files
+ * with RTEMS objects to produce an executable application, does not
+ * by itself cause the resulting executable application to be covered
+ * by the GNU General Public License. This exception does not
+ * however invalidate any other reasons why the executable file might be
+ * covered by the GNU Public License.
  *
  * @(#) sh7750_regs.h,v 1.2.4.1 2003/09/04 18:46:00 joel Exp
  */
-- 
2.26.2


