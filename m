Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE846867EC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:04:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDga-0002lx-J4; Wed, 01 Feb 2023 09:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7j8-0007GT-Pk
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:18 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7j7-00068M-89
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:18 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so680058wmq.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejjgBv7wOS62eWZdOWI7sjR/8URCCY97sfO0xCb8JyQ=;
 b=Gcud9FkT78dTTnQliY93AGChXZJt7gt2RnVPd5YqYxYCSuK3wsTrTp0fSC+o/rpwAK
 vvEa44lInaCr5NOYFAF98uNRyFi4sIf/P2byexTAasu0amL2UFmFofX+mstaXLSN3iw0
 OgK5ItW1KoxWvaGVhMl5QEtnePC+LITK9YBdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejjgBv7wOS62eWZdOWI7sjR/8URCCY97sfO0xCb8JyQ=;
 b=V52QaeWgvY7AKXoj464jA/sfLylvTrQ4y9zLV5U1MV5cUGbyrKt0foFsA97HFlhU7x
 2B47gIAn0YTSEFqft/oHDhzpA/tJ4twCwnTInpW+Nvb68efz9vq+0C4DFy3csKQpKLtQ
 jiLH5HAAFLqeWG1N/Eq0el+6lsEqGIeKjF6s1Gffvx8K/yfvvRw6uHrDVojX28AUxwFs
 6EI/TDU3Wj2FXGQBuTXRU21Ez1UUNw1WXPOInQ8rSJZIi0xk446h5eSirH4WtmxT+Z4a
 iItcFPmVfcOxUUMt2GT+Ikb5CclVLP45s/E46sVKOT9r3kdJd0acQR2kjq/k8zj74eOZ
 SQMQ==
X-Gm-Message-State: AO0yUKVd++YpanQr/BdZJ+MaoviEn+yZjo2W44mI5FkuLqhwT4k/A91J
 dC/cm6ZShTV0jMfyaGgJRGJEHwVL7OjuMEPiTFU=
X-Google-Smtp-Source: AK7set/UAuoHPJTWMumpkLnztiGaZtLXP3C629eEuky0o0/M+gkUSRAwl3S8qzIdTLbOUN1+JOAKTA==
X-Received: by 2002:a05:600c:358a:b0:3da:fcb7:39e5 with SMTP id
 p10-20020a05600c358a00b003dafcb739e5mr1086144wmq.23.1675237215462; 
 Tue, 31 Jan 2023 23:40:15 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:40:15 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 9/9] Updated the FSF address in tests/qemu-iotests/022
Date: Wed,  1 Feb 2023 12:39:50 +0500
Message-Id: <404c2309c845321a21e2896a151840750ec4fe2e.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=kkamran.bese16seecs@seecs.edu.pk; helo=mail-wm1-x332.google.com
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

 tests/qemu-iotests/022 | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/022 b/tests/qemu-iotests/022
index a116cfe255..52473aefde 100755
--- a/tests/qemu-iotests/022
+++ b/tests/qemu-iotests/022
@@ -16,9 +16,7 @@
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
-# USA
+# along with this program; if not, see <https://www.gnu.org/licenses/>.
 #
 
 # creator
-- 
2.34.1


