Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC853E556
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:14:57 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyERU-0006rx-Nl
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrV-0002ik-TZ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrH-0000dt-Ni
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZAV0eg6lDmmxM3ixA7TzgAPz7jYzxfHainhH3CBCcM=;
 b=gF7Vfzib8KFhK9En8NpxkS9/yiJwQpA0O5YAgPYqQGBO0hF2WOl/iDP/9/J/64ImzOIWnV
 7ox4+0G+544IQ/E6Uv1WF56ntr8WeemwE+8bXggJdaQYdkRw9jEH7FaF4FdkcrNy1hJJ6W
 d/tZEwzV06xg1/q5L1kxSVIvykurvQk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-i8kKrhiTON6oUNnKc750RQ-1; Mon, 06 Jun 2022 10:37:28 -0400
X-MC-Unique: i8kKrhiTON6oUNnKc750RQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 bv8-20020a0560001f0800b002183c5d5c26so745915wrb.20
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TZAV0eg6lDmmxM3ixA7TzgAPz7jYzxfHainhH3CBCcM=;
 b=o8CMmI7VzrnfqRhCRD5ZnzRcroVvOCbOb06HX5ese+vxHyhj4Um5JBVi5267ep+MhV
 /Cxsbc1r6POOefPu+kjylSbMzlC/QMEKNPle6VpzImPH5A6omUbdSI4zwMDe9Cm7AKGA
 t62t773Dywkqe75Sq78sCoLQQ/HumQPRJolVSuTdOCowtO3I9KAzY5oRSYPnCjkzzUtL
 +OEkD8+unCZR5oFxng4X4AqEccm/TDr6K3PXjchINxY+jjH8to/sUUQ/j5n1ZIc8Lkq1
 luE3gLSIRGhKZgVvg+Uddcy8jbzMDwRFyFgaAW/hkgSSEBTWNY/9u+2DLtqLhISbzbM5
 +tOQ==
X-Gm-Message-State: AOAM533+sZuUWZ91FcJyCwbZnGohN1Mj0Hl7t+yFIzQCUocEKBgTzsfK
 N2g9Kp0FOog+oIijqGxGAsDU5NttmwysGOyTHZB4R6caxIt/EQGek5v+BzqKJkhwNRj5GmyYCJL
 KqRIEM91REp+9Xbob1K0EmbouE6e/KasW+L0tRWCTWP58axLYt83oNZoYOhKavtJrS98=
X-Received: by 2002:a05:600c:4f0c:b0:397:6a3a:d3f9 with SMTP id
 l12-20020a05600c4f0c00b003976a3ad3f9mr23082656wmq.103.1654526246710; 
 Mon, 06 Jun 2022 07:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgr46egaN94aMXw/ugNsSW7VemMYiVF+Taa6jN+4cCe/qVEGVaK8uPNj1eLZQnyvvBau3nXw==
X-Received: by 2002:a05:600c:4f0c:b0:397:6a3a:d3f9 with SMTP id
 l12-20020a05600c4f0c00b003976a3ad3f9mr23082621wmq.103.1654526246380; 
 Mon, 06 Jun 2022 07:37:26 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d624b000000b0020ff3a2a925sm19169075wrv.63.2022.06.06.07.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 21/29] tests: silence pip upgrade warnings during venv creation
Date: Mon,  6 Jun 2022 16:36:36 +0200
Message-Id: <20220606143644.1151112-22-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Turn off the nag warning coaxing us to upgrade pip. It's not really that
interesting to see in CI logs, and as long as nothing is broken --
nothing is broken.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-5-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fae2dd0f3c..ba9f5bd65c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -109,8 +109,8 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
             $(PYTHON) -m venv $@, \
             VENV, $@)
 	$(call quiet-command, \
-            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
-            PIP, $(TESTS_VENV_REQ))
+            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
+            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
 $(TESTS_RESULTS_DIR):
-- 
2.36.1



