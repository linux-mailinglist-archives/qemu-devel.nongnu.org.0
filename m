Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709166867E4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDge-0002ri-LB; Wed, 01 Feb 2023 09:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7j0-0007Dw-SB
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:10 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7iy-00064l-UU
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:10 -0500
Received: by mail-wm1-x335.google.com with SMTP id q8so11948304wmo.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ulaV5LxJzXU2jXAqyGzHZF3K53nhyxzuU+44pzzmo64=;
 b=iDxJIn/tYVLD1GCntaISVE5eE7Z+dnp1qW5px0scUU59DmfCZz/bGAJcQ1lyChf59B
 XB7rIMmFTgPPTUUrfSB7sAvMIa3aSkjiZxnSx9ZWKX1WRnReQvqjlAPzqgoYBM2wtxgu
 gG23BZgYwQAQzhXys/6i0p5z2i/VirDtzZqeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulaV5LxJzXU2jXAqyGzHZF3K53nhyxzuU+44pzzmo64=;
 b=XgGSoX2P/yXcpRNNp32X6HEATo9CtwA5tUt+ptBAK1l7X4FW5U5EfpRKhRvgx/Brp/
 /7kIJ9/u0dtFk36eSJ68KfxEKHonqBNYaxpQKzRly3KJL0GlXm2wQmUFjStEfRfO2Biz
 9AmOdQ0xt8P4BVXB9mNHYIrYddl1zlfX0jBT8Wq1c1S5VtTi9FTSB7rOKUnuB1sXt4vC
 JVuov9hzl33LZa+GITg4glrdLRjlNeWiJUT5QtWOC8d2bxVSeENAP/Uff89WmOUUg27p
 IokepnVqGqyeBxMBs8RC/2UkShp7RDF1CDESSlz8jn2v9exORp3QtoxwS2X4XVCkI1pD
 5IjA==
X-Gm-Message-State: AO0yUKUkmsL0wSOZluPsRGHlxIHnNvpGPNmNrKe3DqU0xeSe7ZPrLKss
 o23JuLQ32F0oZb7VoYrDnb7RM1Mq4ApupfhTQ9Q=
X-Google-Smtp-Source: AK7set99R7JTtTujGC0hn9Zf7p7P/co5RALcfkVmt5JK+p/gYRNrtrbB1zNOeuRBhZnHo8SY+6SkKA==
X-Received: by 2002:a05:600c:3d92:b0:3dc:2039:1710 with SMTP id
 bi18-20020a05600c3d9200b003dc20391710mr1008515wmb.20.1675237206399; 
 Tue, 31 Jan 2023 23:40:06 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:40:06 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 5/9] Updated the FSF address in file
 include/hw/arm/raspi_platform.h
Date: Wed,  1 Feb 2023 12:39:46 +0500
Message-Id: <2027b734e65a94bbe59be038e580d55064edca54.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x335.google.com
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

 include/hw/arm/raspi_platform.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index e0e6c8ce94..bdeb6012d6 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -18,8 +18,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ * along with this program; if not, see <https://www.gnu.org/licenses/>.
  *
  * Various undocumented addresses and names come from Herman Hermitage's VC4
  * documentation:
-- 
2.34.1


