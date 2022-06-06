Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A953E52D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:56:38 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE9l-0001DY-5j
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrL-0002Yi-Au
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrJ-0000dy-Bn
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtdG7+moIsVrDLabgHqSVJHSE1P/RLWxJNaayZ41e5w=;
 b=gtKfrxiJo/9H85NFxztY/Fbb3d4iMQoAZELDP2AshHmCqFzLGEBDUydfOy3rjApKVZERXM
 hCgqcIjX5BCZaOfzuQfRvnhetaXVRHNqkQo1S1eQ2ot3U1nM0IOC1C7HqvLUZHvbXvP8NT
 swcwIBf2TVeEJ1kXqXSo5qJAr9buacY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-Q8xfV6r-Pn-hcYU241Ip9g-1; Mon, 06 Jun 2022 10:37:30 -0400
X-MC-Unique: Q8xfV6r-Pn-hcYU241Ip9g-1
Received: by mail-wr1-f69.google.com with SMTP id
 d9-20020adfe849000000b00213375a746aso2396244wrn.18
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtdG7+moIsVrDLabgHqSVJHSE1P/RLWxJNaayZ41e5w=;
 b=Fh30Y5ZtyYi4a/ZLP/DB6KY8/Ev2yhYRGq4b7xE/+lW4JNkXn3tMfqmKBJceYKRKz2
 t+HXLrN2jKSEtYIYRmg9GMynCKsuT9TitPE9BHyTtexnL3/g9Iz7a5ZOOgswqR6M8mio
 48fo4ZfqnMCCTM71GoP6WTlnRiOVEzzO5C429PNrhdRVMjpDYLcac1/QP5PkYgTiRRIF
 9CXlG51dZSWjmnScyRe1Wzr00ubx2m1sZ/O/3WsCi3+Y2141OI4gUYABSS+tMMc92UL7
 3b3/qeLHpbmlCLZrfED5NkGMqdZUcBaZX4SxFhcgMAAYoR7PbLJetXFGYZx2GFYeU9tE
 hgYw==
X-Gm-Message-State: AOAM530qa0LVlmI4Ew5LsVq5ak/y24owWISGmTF/I4pHuMrhCmD1m/pf
 aGM9Sd8/t1Y7GTrk3avUVXgwSw3hMiSJ4faZ/JvGVCIrj7i+M2xAhDpI3cAiWBeiTJn4Ym406L6
 0rYXPXHKhpoRkIP/xE5VlgsWi+cbPM9neaXKdBnL3oW0hwLvGYysLOgoEUtKQZK92wMM=
X-Received: by 2002:adf:e488:0:b0:20f:d981:4b42 with SMTP id
 i8-20020adfe488000000b0020fd9814b42mr22407354wrm.455.1654526248482; 
 Mon, 06 Jun 2022 07:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBIp1oeBJl1MUpRg9eHpGbRTMbqKwDJd2qD4rq7TA9AJ5lc/NnP3cgCLukwxqjsZ+XzX+Vjw==
X-Received: by 2002:adf:e488:0:b0:20f:d981:4b42 with SMTP id
 i8-20020adfe488000000b0020fd9814b42mr22407320wrm.455.1654526248124; 
 Mon, 06 Jun 2022 07:37:28 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c500d00b0039c5649018asm508711wmr.3.2022.06.06.07.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 22/29] tests: add quiet-venv-pip macro
Date: Mon,  6 Jun 2022 16:36:37 +0200
Message-Id: <20220606143644.1151112-23-pbonzini@redhat.com>
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

Factor out the "test venv pip" macro; rewrite the "check-venv" rule to
be a little more compact. Replace the "PIP" pseudo-command output with
"VENVPIP" to make it 1% more clear that we are talking about using pip
to install something into a venv.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-6-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ba9f5bd65c..fa46c0c61b 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -104,13 +104,13 @@ else
 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
 endif
 
+quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
+    $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
+    "VENVPIP","$1")
+
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
-	$(call quiet-command, \
-            $(PYTHON) -m venv $@, \
-            VENV, $@)
-	$(call quiet-command, \
-            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check install \
-            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
+	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
+	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
 $(TESTS_RESULTS_DIR):
-- 
2.36.1



