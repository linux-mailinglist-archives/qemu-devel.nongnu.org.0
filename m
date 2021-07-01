Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2243B8C0B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:18:20 +0200 (CEST)
Received: from localhost ([::1]:58066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymHT-0001uu-Sh
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9M-0008KN-03
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym99-00068L-RY
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwspzJIfZEJC6JdklCYV4JdKAqGdyvuu55+TbwVDQ8g=;
 b=A1NzgRLhiLaygIQe/eW6YuE3zRgx8515Yw8790o1EHyWcS0BpUMjdfTnI6UYA2t+rR6iyF
 oeFwhPz4z5LWAN65NxazhkNF6dDzrm4D5rJ9hp5j9QKfjfC7rlTlfT79hDCJF7ZdYrVTMn
 x25TpM0Vi005ACRQPAKvOps9hsZLBJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-mwekNntxP_KTP-ElZqVYgg-1; Wed, 30 Jun 2021 22:09:40 -0400
X-MC-Unique: mwekNntxP_KTP-ElZqVYgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742A2100B3B5;
 Thu,  1 Jul 2021 02:09:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 546F35C225;
 Thu,  1 Jul 2021 02:09:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] python: Add no-install usage instructions
Date: Wed, 30 Jun 2021 22:09:12 -0400
Message-Id: <20210701020921.1679468-7-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
References: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not encouraged, but it's legitimate to want to know how to do.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-7-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
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


