Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1CB1F1D1E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:19:31 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKUj-00047r-KX
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE7-0006iQ-Hf
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:02:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30501
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE5-0007qY-Vu
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=Uco4YaRe3hMr07HFj38pGS4HP//z2aWjJ0WRMrG9Vl8in5/8wHs1/VqyYQDjZSUHkgnMim
 5IeQN+PoaO6Wuh3gRcXLp+3li987Gk4rDz+UeGCizz9pRmxwYluntbGPlH0fPyj8CEuN/v
 owy63odkIfSPiAmbPc28vxN8aRye1nE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-4H0jC5q2PjeU5xhw--QONA-1; Mon, 08 Jun 2020 12:02:02 -0400
X-MC-Unique: 4H0jC5q2PjeU5xhw--QONA-1
Received: by mail-wr1-f72.google.com with SMTP id w16so7326912wru.18
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=O43dOniP0kJi4grM3Swv6ta1Ij//VVmAyELSGjqmqaJPgRNHxzfrIw+NNRFdmijis6
 /CUblfTZT5MEhAIr7Fw574MPV5LnvutGiAIyBj/3ofVE+dUIa83XVlB5xA/Ks3XBEsbq
 og+Ei5INO0gmYjVJt8gUfCLiE+BWutU/mT303gFRd86PVFwB2Sc7HNhj0ZbtTmSUMy6x
 J7rQChoffWqN5eQ+GEBc6glPds9TtcJ9w2FHeP7h7bPq71zXO78UD83TFLcNl4QcarST
 2fQli8wHoJe3qLUVNulQHqxPsBEKXPu5vXzMFRYtumt2oMVfYBUtW0ozVquRIiE891eG
 D6uw==
X-Gm-Message-State: AOAM530vUc2uw2bwq2ha8qsLSZSHWvWfLyuEWBx2HSrLQ16/tGnd/iko
 0+eWF6UbSebiFzJE7RscFBkJyyiP9XFH50iX8+XTE2lvvQBJ24RoQk3ulkuOALhFvYjJiB+Gj4G
 jTWTjKZGt+7CAOqA=
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr73368wma.46.1591632120645;
 Mon, 08 Jun 2020 09:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOUfdYxrvW9CPb/dnvfewyhVs9Qx2I/bhjoR6HiKlxToMKENTue7cOTAycSFeLnlY6TznpXw==
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr73337wma.46.1591632120442;
 Mon, 08 Jun 2020 09:02:00 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j11sm154169wru.69.2020.06.08.09.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/35] hw/dma/soc_dma: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:22 +0200
Message-Id: <20200608160044.15531-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/soc_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 3a430057f5..22fd8c38b0 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "hw/arm/soc_dma.h"
+#include "hw/qdev-deprecated.h"
 
 static void transfer_mem2mem(struct soc_dma_ch_s *ch)
 {
@@ -242,6 +243,8 @@ struct soc_dma_s *soc_dma_init(int n)
     int i;
     struct dma_s *s = g_malloc0(sizeof(*s) + n * sizeof(*s->ch));
 
+    qdev_warn_deprecated_function_used();
+
     s->chnum = n;
     s->soc.ch = s->ch;
     for (i = 0; i < n; i ++) {
-- 
2.21.3


