Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79846867E3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDgb-0002lr-NI; Wed, 01 Feb 2023 09:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7ix-0007Cy-9n
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7iu-00062b-C7
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id k16so11968720wms.2
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MN7yNVq8PgWfoOl7GnWmVA2h3IpVlRhLFk2K2ypn7oA=;
 b=48tSMz6rfLwUTB5r53+vCPb9K61ZbHMuC5ndie53qAS1eQf7jDJXmgGn+8x9U7JCmv
 VIcWspM1jzglO7DwhM9w/9vNJHwmS1z5CHmAZcElDn5Q8jLXoakuhobYzwVdrUp6wofr
 e1jglBI0tOlMs6sIJ0amDY4TBYR86aCZSjE7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MN7yNVq8PgWfoOl7GnWmVA2h3IpVlRhLFk2K2ypn7oA=;
 b=hF79FRSLSeLwTzIAl4WmL1aL9aGmt266WSJUXzWtDD5hF3vdMrcxOLjwo5CCm3S9yt
 JtxBm8z99heSU+S4YNA4L/4syjkdWh/fF5MHTC23Q0Y/FkNxWcpeS9YoqkhccB4+Ugft
 AFu/i/ewQ81y+BT7Q/9rHTwVyWLPVgAFZwPToa5BSerRlHJnRIXcbS90rZnJHtQkJegg
 J10gghTGMeoiDJ8UoS4igFTCOm8kiCPz2kjBq5oRKe0sdFgPtrVZRtBIWNjQ/OVfvyNc
 Ja4R1W1cCDiM8Mg8unv98b5+eQ8vBxz5n3xUCv3ISZ7nMroxTeDuhkvhI9FetBwPnUSi
 af0w==
X-Gm-Message-State: AO0yUKU4A6I/+Okxt0DxK3rZyonqlZsGB88ZJO+aI5fqGAs3FNNw3UVz
 zK7BndTEg6nVvqufxvdvcQLHluQIZC5I3N+vM38=
X-Google-Smtp-Source: AK7set+4rJtwBbkSipjMMwySkFAoEOZ/34M9Gus5Mwt9ObxUaYwqqszlrsSBvvApx3wxl64F7WGrQA==
X-Received: by 2002:a05:600c:3789:b0:3dc:54e9:dfd7 with SMTP id
 o9-20020a05600c378900b003dc54e9dfd7mr1049367wmr.25.1675237197120; 
 Tue, 31 Jan 2023 23:39:57 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:39:56 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
Date: Wed,  1 Feb 2023 12:39:42 +0500
Message-Id: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Feb 2023 09:01:33 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
---
The Free Software Foundation moved to a new address and this file referred to their old location.
The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
This will resolve the issue #379 in the QEMU source repository

 hw/sh4/sh7750_regs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
index beb571d5e9..94043431e6 100644
--- a/hw/sh4/sh7750_regs.h
+++ b/hw/sh4/sh7750_regs.h
@@ -22,8 +22,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  * General Public License for more details. You should have received
  * a copy of the GNU General Public License along with RTEMS; see
- * file COPYING. If not, write to the Free Software Foundation, 675
- * Mass Ave, Cambridge, MA 02139, USA.
+ * file COPYING. If not, see <https://www.gnu.org/licenses/>.
  *
  * As a special exception, including RTEMS header files in a file,
  * instantiating RTEMS generics or templates, or linking other files
-- 
2.34.1


