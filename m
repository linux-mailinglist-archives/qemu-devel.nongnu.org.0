Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952B3B76B5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:52:27 +0200 (CEST)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGyI-0001I2-La
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpS-0003mF-Bb
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpQ-0006BD-Kh
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624984995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZrozozfvwqA4qmYRM/EhTMS4p+B+LAHgFGaFyE/YPM=;
 b=BbKGy7y1+MISuNPbcSpF9aeBqTdaaBwXJwmhfiLe5UDNTy3jLKGQyeJODDFDBI9fMIuRGZ
 bbvgSHHWiqtZDxM7GnH7EU20kT8AlM0lXXTyRL9gLSn0Irc+Bo0TvDYjPsynXr+tn0NmJ3
 5HF8Tag66TKYHbrJVPyGb3efAuWE3mo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-g4w-NXBXPz2ZWtNhpUNurw-1; Tue, 29 Jun 2021 12:43:13 -0400
X-MC-Unique: g4w-NXBXPz2ZWtNhpUNurw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1D6019057A1;
 Tue, 29 Jun 2021 16:43:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8943119C79;
 Tue, 29 Jun 2021 16:43:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] python: Add no-install usage instructions
Date: Tue, 29 Jun 2021 12:42:46 -0400
Message-Id: <20210629164253.1272763-6-jsnow@redhat.com>
In-Reply-To: <20210629164253.1272763-1-jsnow@redhat.com>
References: <20210629164253.1272763-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not encouraged, but it's legitimate to want to know how to do.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/README.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/python/README.rst b/python/README.rst
index 107786ffdc..d4502fdb60 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -37,6 +37,34 @@ See `Installing packages using pip and virtual environments
 for more information.
 
 
+Using these packages without installing them
+--------------------------------------------
+
+These packages may be used without installing them first, by using one
+of two tricks:
+
+1. Set your PYTHONPATH environment variable to include this source
+   directory, e.g. ``~/src/qemu/python``. See
+   https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPATH
+
+2. Inside a Python script, use ``sys.path`` to forcibly include a search
+   path prior to importing the ``qemu`` namespace. See
+   https://docs.python.org/3/library/sys.html#sys.path
+
+A strong downside to both approaches is that they generally interfere
+with static analysis tools being able to locate and analyze the code
+being imported.
+
+Package installation also normally provides executable console scripts,
+so that tools like ``qmp-shell`` are always available via $PATH. To
+invoke them without installation, you can invoke e.g.:
+
+``> PYTHONPATH=~/src/qemu/python python3 -m qemu.qmp.qmp_shell``
+
+The mappings between console script name and python module path can be
+found in ``setup.cfg``.
+
+
 Files in this directory
 -----------------------
 
-- 
2.31.1


