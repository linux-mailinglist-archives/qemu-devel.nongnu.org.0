Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238835F911
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:41:55 +0200 (CEST)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiaQ-0006fL-FN
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lWi7X-0000J9-U9
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lWi7Q-0006dE-Fs
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618416714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoXvQTN9X+iG2WULzyLP7mBpCySqmHMLLa4Gm+1DJjA=;
 b=G+t7RYAr7Ut+5XxP8DoY6U+SholY+bPwXodvXYjaL9/1WzbtPfID+vmoKesZxhC1WZPgMH
 xSIZxpQPpfPME51wMKfIizTW3FPl92z4YFBbP3M1cJQxzaxZgds0kIbx+d5p/G3JgF8uks
 1L/zdXfRW1TzFWbwuFbrALLBOOvhIUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-jl-USw8ZOsmpZKQTXXuLPw-1; Wed, 14 Apr 2021 12:11:51 -0400
X-MC-Unique: jl-USw8ZOsmpZKQTXXuLPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80C2C801FD8;
 Wed, 14 Apr 2021 16:11:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71BFB5946D;
 Wed, 14 Apr 2021 16:11:49 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] Acceptance Tests: bump Avocado version requirement to 87.0
Date: Wed, 14 Apr 2021 12:11:44 -0400
Message-Id: <20210414161144.1598980-2-crosa@redhat.com>
In-Reply-To: <20210414161144.1598980-1-crosa@redhat.com>
References: <20210414161144.1598980-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This version (and 86.0) contain improvements that address specific
QEMU use cases, including:

* Fix to the error message given when downloading assets

* Asset listing/purging capabilities

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/requirements.txt b/tests/requirements.txt
index 91f3a343b9..f57e895c4a 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,5 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-avocado-framework==85.0
+avocado-framework==87.0
 pycdlib==1.11.0
-- 
2.25.4


