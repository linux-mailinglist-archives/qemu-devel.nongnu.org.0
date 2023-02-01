Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB426867E9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:03:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDgd-0002oW-40; Wed, 01 Feb 2023 09:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7iy-0007Dd-KK
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kkamran.bese16seecs@seecs.edu.pk>)
 id 1pN7iu-00062u-Dt
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:40:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so668146wma.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seecs.edu.pk; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blmcB5GA8MhaXPwHBpQoZpnfBneV7pn18exKdQ3lSQE=;
 b=oPrMu3mtoqb1CohFimPpoLPHUFo4r1fQUOuxhOgoPJyzZE02chOwmJIZebQ7Mp4Cl8
 sM1igVZgJrxPLiQBNkZyOpoldxREMB6xVSkdCHoU64Axzz7xxCbQ5yNgctsc5q3WO3mu
 669UK4Nf7tZ1X3YqQ4KevwINSR7B5G8PcToh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blmcB5GA8MhaXPwHBpQoZpnfBneV7pn18exKdQ3lSQE=;
 b=IKDeBYoZxqrWVAel4tRzLz307D3IkhztCAsHH6Oh+OD3c/uhPKJyAZzu2Fbg9MFjPk
 1CZxgh7uOPOpgWOuV9TYxVQuGi54o8ypYFtalmx/b/8+FcFW8y0E3CHrQ3qS7wvubGMT
 7bC+w1TzBJm5VR7ZpG4sg3gBWNU4EMiJecEG0pieFXEEzzBpeDg7ftXUFOhmy+waYx/s
 q66v7mAKVELiRvA4UBhEMc6QK1opAWyceff5ndAzNTLoVrAx2D5WdDFa6C1a3kAb/2XQ
 MrHGzlJtodXIJXzsSX2bkX4otJ1jRfw+S8a9LD5yv+r91RwyEx041NaFbrrf0eDJP8zk
 pf+Q==
X-Gm-Message-State: AO0yUKWwL5LfXdtsole4u+B9IfGNWPoK/Zm3IkP/UXfzr/X0MgpZKyxN
 aNFVgXB2C/L2XZr4AofFzjQJfKfvd7Eild6HBlk=
X-Google-Smtp-Source: AK7set9lLkQ1gaPmIgTDekc68ERo3RDcWmJdyJ2ozmp8gk7NoPS5uoKtAbaaHdIttdGGVEpVfVRfUw==
X-Received: by 2002:a05:600c:46c9:b0:3dc:48ab:d8f8 with SMTP id
 q9-20020a05600c46c900b003dc48abd8f8mr1102915wmo.0.1675237199455; 
 Tue, 31 Jan 2023 23:39:59 -0800 (PST)
Received: from khadija-ubuntu-vm.localdomain ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a05600c319c00b003dc47d458cdsm851428wmp.15.2023.01.31.23.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 23:39:59 -0800 (PST)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
To: qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, philmd@linaro.org,
 kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 2/9] Updated the FSF address in file
 contrib/gitdm/filetypes.txt
Date: Wed,  1 Feb 2023 12:39:43 +0500
Message-Id: <0cbfbd52041b97982d1c8a4dbd94a1b71427bff9.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Mailman-Approved-At: Wed, 01 Feb 2023 09:01:50 -0500
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

 contrib/gitdm/filetypes.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
index d2d6f6db8d..4d26650988 100644
--- a/contrib/gitdm/filetypes.txt
+++ b/contrib/gitdm/filetypes.txt
@@ -12,8 +12,7 @@
 # GNU Library General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# along with this program; if not, see <https://www.gnu.org/licenses/>.
 #
 # Authors : Gregorio Robles <grex@gsyc.escet.urjc.es>
 # Authors : Germán Póo-Caamaño <gpoo@gnome.org>
-- 
2.34.1


