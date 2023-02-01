Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF06867E0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDge-0002rM-1N; Wed, 01 Feb 2023 09:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7iz-0007Dk-0m
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7iv-00064O-Mw
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso2084307wmb.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o11E6FNG2EDRoPicMPL8yrwk7ADtSIIPQIRNaZtC2vE=;
 b=Gm95tch1eRyNOpih0JRVAYr6Xh+z6IOLXQVQbhlTMH3hpOjEn+1Wn+fK4E/BzRyviY
 aK2xqw0co6HllQy+7nQ93Ud7uaNqSmbpIQfGwyH96b8vUNt6LVj5RwUwGJ5xj8/WcDw3
 ndZB92Uzm41qh9s/dW5vypZjqIJK6dRepxRGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o11E6FNG2EDRoPicMPL8yrwk7ADtSIIPQIRNaZtC2vE=;
 b=nEejF8IAjHss7TVvznAyyWFOVRSQkZEYUwDyeuCYaax1oUhtGC0F5Csb4RuuxuMXXi
 D9qAqr9WBnifslVqiB18nlqCGW7kIGlTg31Qo0/JeX+aLTtYnLd4UexwMhItCgQfMFGT
 UHln+gWeBJ8lezKr2MalPRZxaoj64J2C7RjSox8+ooOAiDxYvi5tRYYNYLR980/5cujt
 rE+0KyvY5Jq9BMYOxue/Gvn44q1tQaZXXb9jVBuSG9F0hrDmnz0/cTupW1ql38JBTxcz
 G1ydI01YkEhMc2u7nyP4C0tq2hrKD9OkTrSP8XpxIy2POBqttBJRuXTkV6TIV2bNA5oS
 uPcw==
X-Gm-Message-State: AO0yUKVHRkSeN+X0j0UKbq9zAVNLzRYqChYg2EvazrQtueJj5YDxqMkw
 kRGrv2076ZAD3UsmXcoFHIEwdTipnRrZOKOpPLk=
X-Google-Smtp-Source: AK7set/BU437uF3HAItew6Nghm2faBhBebJUeAA1c0AAgYu5vQGVkXF0zioe4wEipuPTP+RsHfeb2Q==
X-Received: by 2002:a05:600c:46c7:b0:3de:720c:10ff with SMTP id
 q7-20020a05600c46c700b003de720c10ffmr982466wmo.40.1675237204125; 
 Tue, 31 Jan 2023 23:40:04 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:40:03 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 4/9] Updated the FSF address in file include/qemu/uri.h
Date: Wed,  1 Feb 2023 12:39:45 +0500
Message-Id: <eeb9c64164a72bcdf77c76d1923ff9d9feeff206.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Feb 2023 09:01:51 -0500
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

 include/qemu/uri.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index d201c61260..2c1f6350eb 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -41,8 +41,7 @@
  * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
+ * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  *
  * Authors:
  *    Richard W.M. Jones <rjones@redhat.com>
-- 
2.34.1


