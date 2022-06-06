Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A353E547
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:02:35 +0200 (CEST)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEFW-0001G1-3g
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrG-0002S3-CS
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrD-0000cF-OA
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHFAZa0D1mkGaSFNbR5sBnh3O6dLrWaXXrtFWWPw/AY=;
 b=NMaRBC8QxhC7k0mVEzhmuG1RBHj4t3/ePVNVAk7AjgZOFZTLcxAS/JRZB7P7Hf//aBKSbM
 JlMJn6sWCdxUyUTZczxuw2/Iu+E5gKDyL2KamRoLOxPm2ZcLSFZ3TIzbXo8CYErFEY+go8
 zPNaWTN3yVRjs/ELqCr+5mEjVG9nkAg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-9KxOL5P0PpC5TSkNl7emqA-1; Mon, 06 Jun 2022 10:37:25 -0400
X-MC-Unique: 9KxOL5P0PpC5TSkNl7emqA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so11305069wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eHFAZa0D1mkGaSFNbR5sBnh3O6dLrWaXXrtFWWPw/AY=;
 b=NF5B4lZZk+WyBvVnWGttzS1AWrIJk6jCLgxLPRbW6L7On5ZLvz/K8cmWcX6gI9ldl0
 Nb8xPQTVMGc9exwqpbFuOdSuI4annN5IiX3gcX9749aII/MMEFPYLHZUzdQbO3+xTsGi
 ltkhpZCybqQW1k2W+Xx1/vIQjW+YyRFFlfKo+eEDk34s5hZEMEnEnH41/2sDk6YcVysS
 QNgMGp1ep6dVPxz0H0qtumrt2gYf255qMllmo7IqHWaGNrmqHrImVbz9MOE2CCt10iXi
 n0yRvBhuJk19xU1fY5wK49G58LAaZzNTOx//JbLQ5FwoMGaAoMuM2dP6cANkezdXYunX
 D/0w==
X-Gm-Message-State: AOAM530d/Q3Et/PUvFE8aX6/R0z4TBVaxJQJJVJWw+bT4Xmjdx1cxJM2
 AiBrD5gNmNRaKIa2eGkoYd03J0G/iV7fYgt5oiQEx/zw8MBTLHxAasjIMSHS1oWA+oNgkFgReGB
 D9X/xJGkRpFC/DnefSb+kdwDFKl0D+aQg3ZFGkKddm2sCGbUEHtLhqNSFd21pnb4qRjk=
X-Received: by 2002:a05:6000:1091:b0:213:b515:f46f with SMTP id
 y17-20020a056000109100b00213b515f46fmr18841307wrw.632.1654526244458; 
 Mon, 06 Jun 2022 07:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGb/evxNnlR9mIEqlUMt1srJhU4QGP1rj7Zuq9PnvyE5QMbnwNWZZHpgi34YVJNn7NwG0RUg==
X-Received: by 2002:a05:6000:1091:b0:213:b515:f46f with SMTP id
 y17-20020a056000109100b00213b515f46fmr18841278wrw.632.1654526244135; 
 Mon, 06 Jun 2022 07:37:24 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b0039c55bc2c97sm809048wmq.16.2022.06.06.07.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 20/29] tests: use python3 as the python executable name
Date: Mon,  6 Jun 2022 16:36:35 +0200
Message-Id: <20220606143644.1151112-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Use "python3" instead of "python" as per PEP0394:
https://peps.python.org/pep-0394/

This should always be defined (in a venv, at least!), matching the
preferred python shebang of "#!/usr/bin/env python3".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-4-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 50237f073a..fae2dd0f3c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -89,7 +89,7 @@ TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
-TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python
+TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python3
 ifndef AVOCADO_TESTS
 	AVOCADO_TESTS=tests/avocado
 endif
-- 
2.36.1



