Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8A6867E1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDgd-0002q5-Qu; Wed, 01 Feb 2023 09:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7ix-0007Cw-D0
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:07 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7iu-00063Y-CB
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso2084243wmb.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B50Lv2+xxUUE48B8fNLDFb1Qo3fw4tW8h6iKKPV5QBM=;
 b=fJ6hU6tejFEmCvSHmHVxLNIIrKN+wGapufZpD9UGLXsIBEsPGOZBwMiQ0E2NZSSKXT
 5oXPoCSQpf/QCNC08hOmq6K9GJoMRNSiUTcRgG9C1+tJq6ku4D+hYuZ+oyFQxtcyq8ek
 TbMgWgAX+Ve5f0f9H4h3e5wThmEmkwKbB5D3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B50Lv2+xxUUE48B8fNLDFb1Qo3fw4tW8h6iKKPV5QBM=;
 b=bENusCTJiYs8/cxwHxs2JsfHU81fa0IDwMN17rKnBobl9pvvsE5+2yfNOg+VkRUH8h
 z898eDdSPUnOiuBJC2VEyLlE9e+LqAmzfV8ULEamSEF41TYyDfCUvwvirtsiVnMO6IS7
 3WYe5dhmlLaJLmM0l3WKqXsGCP2/AOBAjnCZVwIwpvsXwvYEHm6lziN8jrDjBvbA0Rxq
 OBad7CVGiOmLGxsXHnR/RiHOaP45F8vFMcJAQ6O9VAWUvwe8DeRPFt1AWEhC5V9kIZO3
 6Ojq0/ve+WHlDJiTrLNHG/nyT0AmmhH6CrLje8JzIp6eCna9pCYo8ZTRqP996PsVjN7I
 XrWg==
X-Gm-Message-State: AO0yUKVZYI/h3/2qqgEdMKL1Gtnblwd9XPbQNJUGBW9yTXsf2QDDxFfL
 CyNuvLWPqfednXRWKRJ3JpIg/p0nxDpwN7+ZhU8=
X-Google-Smtp-Source: AK7set8I26fiioVC5eA4NkmnijgyPaRCabVdgKoEx2+s8Y9DXUPJ8oun3oAqEdtAVxgByW5cgWQNlw==
X-Received: by 2002:a05:600c:1f0c:b0:3dd:97d6:8f2e with SMTP id
 bd12-20020a05600c1f0c00b003dd97d68f2emr1033694wmb.17.1675237201829; 
 Tue, 31 Jan 2023 23:40:01 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:40:01 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 3/9] Updated the FSF address in file hw/scsi/viosrp.h
Date: Wed,  1 Feb 2023 12:39:44 +0500
Message-Id: <3c2ceaf1995dfd98c254cf3e2f6d1a68970bb1e8.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Feb 2023 09:01:47 -0500
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

 hw/scsi/viosrp.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
index e5f9768e8f..8b3ac3af56 100644
--- a/hw/scsi/viosrp.h
+++ b/hw/scsi/viosrp.h
@@ -16,8 +16,7 @@
 /* GNU General Public License for more details.                              */
 /*                                                                           */
 /* You should have received a copy of the GNU General Public License         */
-/* along with this program; if not, write to the Free Software               */
-/* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA */
+/* along with this program; if not, see <https://www.gnu.org/licenses/>.     */
 /*                                                                           */
 /*                                                                           */
 /* This file contains structures and definitions for IBM RPA (RS/6000        */
-- 
2.34.1


