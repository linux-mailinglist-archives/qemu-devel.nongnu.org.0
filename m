Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9E1534774
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:23:09 +0200 (CEST)
Received: from localhost ([::1]:58380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu1HQ-0002YD-6l
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14l-0004L9-DP
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14j-0002nu-4I
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pu3L2Xs6JpLOfbtjSmWSAbei9Q1pqINHSalLJ6h7UYo=;
 b=BfdokEY2odpK1Xu/jj4kJUfmdE+1upEDlp9OPftfCujeUvCS2DQARTE5p5Tw9LtPEct7eu
 S/j0tJtgEn6tfLLHpVplZxxbMl9zOMgvXxCzRa9m4505joaIR5TzmrRnLpOSadOh/p1N04
 S0/RyAxsHSef609XxS+wdHLVf86Nb8A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-TqaxrFmAMtSvhB_CbFsVQA-1; Wed, 25 May 2022 20:09:56 -0400
X-MC-Unique: TqaxrFmAMtSvhB_CbFsVQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B3A829AB3FC;
 Thu, 26 May 2022 00:09:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B49B2166B26;
 Thu, 26 May 2022 00:09:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 8/9] tests: add python3-venv to debian10.docker
Date: Wed, 25 May 2022 20:09:20 -0400
Message-Id: <20220526000921.1581503-9-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is needed to be able to add a venv-building step to 'make check';
the clang-user job in particular needs this to be able to run
check-unit.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/dockerfiles/debian10.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f7..03be9230664 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -34,4 +34,5 @@ RUN apt update && \
         python3 \
         python3-sphinx \
         python3-sphinx-rtd-theme \
+        python3-venv \
         $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
-- 
2.34.1


