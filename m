Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90096867E8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDgg-0002vU-Nc; Wed, 01 Feb 2023 09:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7j6-0007FS-6n
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:16 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7j4-00066V-KX
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:15 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n13so4952130wmr.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bH0+jfMzg206alskFMiuVKv7zSOdNgHvmvbkQTGFYi0=;
 b=mRS9ppSiywCGfAJFfQe34tnwshogow8N3aGu7/7qNBBwi/zOCjgAWlLG+z2pbfgsSg
 x/735HTDY+OqZ9k+Aff15+AddQrqj50QIgWFcnoX5qtJlUSSRk8t/TOqwthSzJr3Fkqi
 2CMdaF3A2tUHhH86E/i1TK21NtzYAHlJ6tN5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bH0+jfMzg206alskFMiuVKv7zSOdNgHvmvbkQTGFYi0=;
 b=Xvot7YuzQquX2AZhPbuRRlyt5unpaVeywnB5JDOIWS/WVSay4vV/CypXctt8wx6Mfo
 HCX9JEmCtv90xKEg6GMgyojU/95JBOGPvVUP6Nw8VvEY3B/xvtwnW6POSff+fl38Synt
 IWtzLxKp06da5CbZHZxuR/M66UV+17JBHqyUUeIbLJLSCqwuy39hmRYN1Ln/Jsg9wI4u
 ZBniwdVAVfLW+IWYbWt64BrlEiD9BpZADHpbjwvDZWoYL0oxrp43EbO/UDldEfc8hqpS
 iWnVfgHXcEnaUIq3dnLdLFnuw1AP8yRWq7gQwMCDUtFeTPSezlRrtRCkonFuDHGkFqLd
 CJvg==
X-Gm-Message-State: AO0yUKU3GEe9re3CrhgQZS2rz8cbWpExtWncbGKfGyBXmHD+0JqMvAq7
 zYzHFUrEaA01p9AOlWQ+s+iWtJe1x5J/WtS+1sk=
X-Google-Smtp-Source: AK7set8i1xJ7C7ToE245Z2/06Qy5dq1KaoRMtDkryhFViPB4bQ1LTNvM0iWJbaMcXRDW7nQIrgQUCg==
X-Received: by 2002:a05:600c:16c4:b0:3dc:16d2:ae5e with SMTP id
 l4-20020a05600c16c400b003dc16d2ae5emr953395wmn.32.1675237213169; 
 Tue, 31 Jan 2023 23:40:13 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:40:12 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 8/9] Updated the FSF address in tests/unit/test-rcu-list.c
Date: Wed,  1 Feb 2023 12:39:49 +0500
Message-Id: <16ac94d6761721ffe5e65dbc9f2b6319c880e369.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Feb 2023 09:02:00 -0500
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
This will resolve the issue #379 in the QEMU source repository.

 tests/unit/test-rcu-list.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
index 64b81ae058..2011a78ed0 100644
--- a/tests/unit/test-rcu-list.c
+++ b/tests/unit/test-rcu-list.c
@@ -14,8 +14,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ * along with this program; if not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2013 Mike D. Day, IBM Corporation.
  */
-- 
2.34.1


