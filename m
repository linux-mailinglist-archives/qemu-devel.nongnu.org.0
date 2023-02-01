Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30086867DF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDgc-0002nv-RO; Wed, 01 Feb 2023 09:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7j2-0007E7-0F
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7j0-00065S-AE
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id l8so11961065wms.3
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYiG6KTC/ND6fT9FORUjmCkLRBVr/rH1cX2vD0X4g3o=;
 b=Pmfe6tNZYltj8HLZq6Nl4oSp9F3rOY0SearEdzM3C7vYtLRG8lRtaKiPHMaKyprcIX
 wo7LwEVusHSAuROy2Q9BFmnbrPGBn5S/GHn4X/M+RPQozplOwKIejI+qb7lMK50vCSBI
 vke7VKKRj3DWqXevNIbInJ9f+/ixlEiGX/TI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYiG6KTC/ND6fT9FORUjmCkLRBVr/rH1cX2vD0X4g3o=;
 b=xS4Em9Lkrdkq+Yg5+ecxm+ZGqmj1GjH3+3qKNZkhBuhbHl5Nozt+XWwxTVQavtjRXV
 0yHpX14VfzUqHQtPRMnoPa6w7GruI3jzFP8CLgb8CjL/L+Q+5Pa/WpR9nyrl2MN08Hc2
 jLmP0OVdKfOqJ99Ob4bX63cDbwgzcrfEqmfnEKlXEfyCLYbhTkFFZE6AKAuyBRtuobx3
 hTAEOSy9gUEV6xzAO0qlI+EWs6KoVJCXyUhy3cekDx/oA9zwFg6nJ6FyKBm0rX7AZ5cQ
 CB0YbVS0RLezZ7e7B6Ox0vgQ8XiTRwMpjQ7jjx/AWTb7elb7WEgCKaUe2RXGOWtlBcIi
 gWgg==
X-Gm-Message-State: AO0yUKXGZWs/+6mt3leW7RT4raMLXIWecETe/VzXaMqHqMihWNbAefEx
 /GagPmGBTXFoqwRQ8FB/b2mqZOED+O7OqIg0ur8=
X-Google-Smtp-Source: AK7set+nDbSKUTusWlj8XGLoftEJSxw+5ioaWuKHjJRCf6kakROIlyvWPbgfif5acgLHPbpBY0dNag==
X-Received: by 2002:a05:600c:198a:b0:3dd:6d69:7cda with SMTP id
 t10-20020a05600c198a00b003dd6d697cdamr983606wmq.39.1675237208664; 
 Tue, 31 Jan 2023 23:40:08 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:40:08 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 6/9] Updated the FSF address in file tests/unit/rcutorture.c
Date: Wed,  1 Feb 2023 12:39:47 +0500
Message-Id: <c9c0f70c68d9fb37eb8cd397bf89a92a31c84ba0.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Feb 2023 09:01:55 -0500
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

 tests/unit/rcutorture.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c
index 495a4e6f42..fb02d85ac2 100644
--- a/tests/unit/rcutorture.c
+++ b/tests/unit/rcutorture.c
@@ -50,8 +50,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ * along with this program; if not, see <https://www.gnu.org/licenses/>.
  *
  * Copyright (c) 2008 Paul E. McKenney, IBM Corporation.
  */
-- 
2.34.1


