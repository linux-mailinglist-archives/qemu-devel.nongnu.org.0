Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345B393BAE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:51:55 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSbK-00016e-Ku
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKz-0005oe-Lp
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKx-0000nE-39
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ys9sAAItz+weyvua66xc+eEZkr7hrFBSotZXeQp6Bc0=;
 b=Xy2WoLNu44HLkGfMCKmMQgU8tj7LnFgX/9p6R3WrkT6sCPAC8cpgArdn1278GxAOeMJXzp
 vTILW+O0ZAeuMAtsyP8i4ZDmdH3J/R8qHgAc7B0DVJlfM5bskPouZuN3nY9Y9gNm83s4oS
 ADNuoFPCT71L7xEBocGTQsZKD7FaWQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-PKQCn1u_N2ip-JdIhxqpcg-1; Thu, 27 May 2021 22:34:54 -0400
X-MC-Unique: PKQCn1u_N2ip-JdIhxqpcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 859CD501E1;
 Fri, 28 May 2021 02:34:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F950E17B;
 Fri, 28 May 2021 02:34:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/44] python: move flake8 config to setup.cfg
Date: Thu, 27 May 2021 22:32:07 -0400
Message-Id: <20210528023220.417057-32-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the comment concerning the flake8 exception to match commit
42c0dd12, whose commit message stated:

A note on the flake8 exception: flake8 will warn on *any* bare except,
but pylint's is context-aware and will suppress the warning if you
re-raise the exception.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-19-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
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


