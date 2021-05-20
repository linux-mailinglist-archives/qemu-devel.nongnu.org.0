Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E81389F32
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:56:42 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdXt-0006gr-NS
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdVI-0003ht-DK
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdVF-0006Sl-ON
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFG5g+GAZozjb7SaNfbi5cnAb8Bb64SceKpex9iJFD4=;
 b=TnI7ATTsaI5aiVMqca00NFltqA/va5VCaRsCpnhzJh5O7zZrUlNW8tts37g+lceXz71pQl
 /YUImn12TGIGATt4YKDbV8ykTRhBuWMTCOkWHMYvpzTS7HhWJd3sYzUJyuh/hSLzwurR//
 3nhKrnz4XAqREL7O5j9WEevsHTPYBXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-ZJX0P7hlOi2omwswusluAQ-1; Thu, 20 May 2021 03:53:55 -0400
X-MC-Unique: ZJX0P7hlOi2omwswusluAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAC801043DCA;
 Thu, 20 May 2021 07:53:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-52.ams2.redhat.com
 [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6660069FB1;
 Thu, 20 May 2021 07:53:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 03/15] docs/devel/testing: add debug section to the QEMU
 iotests chapter
Date: Thu, 20 May 2021 09:52:24 +0200
Message-Id: <20210520075236.44723-4-eesposit@redhat.com>
In-Reply-To: <20210520075236.44723-1-eesposit@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the "Debugging a test case" section, in preparation
to the additional flags that will be added in the next patches.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 docs/devel/testing.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1da4c4e4c4..8144e316a4 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -224,6 +224,14 @@ another application on the host may have locked the file, possibly leading to a
 test failure.  If using such devices are explicitly desired, consider adding
 ``locking=off`` option to disable image locking.
 
+Debugging a test case
+-----------------------
+The following options to the ``check`` script can be useful when debugging
+a failing test:
+
+* ``-d`` (debug) just increases the logging verbosity, showing
+  for example the QMP commands and answers.
+
 Test case groups
 ----------------
 
-- 
2.30.2


