Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71E390D83
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 02:46:09 +0200 (CEST)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llhgW-0003xt-9J
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 20:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhNO-0004qV-51
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhNI-00078O-H4
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621988774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OclvukiY1H6sfo8th6djoXgx+CxhHpvNr8Ovm8pp4dI=;
 b=T6L4M9RIFX1r5fABD3AuYvg1Mct/LtU8V5Ejy0Xt7NRRczTL/qSNgZQrkJ9EpHEx+eCQRS
 FPy9BSgYEdfT7zzL7yFJ/d/Zeb1PgzNhMf4/uhPQbcozX5rs6F0BfFW/MvvvVJ3JFoexql
 jESo+JR7bQ8D8iS7SBxrghCbKGjOqw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-uMYirzPSO7uBsudqpMEd7w-1; Tue, 25 May 2021 20:26:12 -0400
X-MC-Unique: uMYirzPSO7uBsudqpMEd7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 971151005E48;
 Wed, 26 May 2021 00:26:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3569D14103;
 Wed, 26 May 2021 00:26:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/31] python: move flake8 config to setup.cfg
Date: Tue, 25 May 2021 20:24:41 -0400
Message-Id: <20210526002454.124728-19-jsnow@redhat.com>
In-Reply-To: <20210526002454.124728-1-jsnow@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the comment concerning the flake8 exception to match commit
42c0dd12, whose commit message stated:

A note on the flake8 exception: flake8 will warn on *any* bare except,
but pylint's is context-aware and will suppress the warning if you
re-raise the exception.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine/.flake8 | 2 --
 python/setup.cfg            | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)
 delete mode 100644 python/qemu/machine/.flake8

diff --git a/python/qemu/machine/.flake8 b/python/qemu/machine/.flake8
deleted file mode 100644
index 45d8146f3f5..00000000000
--- a/python/qemu/machine/.flake8
+++ /dev/null
@@ -1,2 +0,0 @@
-[flake8]
-extend-ignore = E722  # Pylint handles this, but smarter.
\ No newline at end of file
diff --git a/python/setup.cfg b/python/setup.cfg
index 36b4253e939..52a89a0a290 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -22,6 +22,9 @@ packages =
     qemu.machine
     qemu.utils
 
+[flake8]
+extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
+
 [pylint.messages control]
 # Disable the message, report, category or checker with the given id(s). You
 # can either give multiple identifiers separated by comma (,) or put this
-- 
2.31.1


