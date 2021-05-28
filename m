Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5069393BAC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:51:32 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSax-0008EA-ND
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKi-0004a4-Ff
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKd-0000Vy-7f
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeBKr7x9F8bWXJh4dE8XAschdM/dVEsirxTrh3SYYbw=;
 b=foAISJgwZJ4ezlXqrP9/VLSp1/UQIZA2TKOOzqxY7MxICBDD5yfVK8/WLCFfwxoa9Eg/5i
 8pRiFVkp9cekmulsLk0mDDm4O/aN5c87jkM8AYQUcctlIUnq20eNMb+naV6++IP21vHZsB
 G3tdIeXt0bdKrl0u0brpggMylrPD1sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-iKdd5rmGP5KO2FVdSt46PQ-1; Thu, 27 May 2021 22:34:35 -0400
X-MC-Unique: iKdd5rmGP5KO2FVdSt46PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FDFA107ACC7;
 Fri, 28 May 2021 02:34:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8015B1F0C0;
 Fri, 28 May 2021 02:34:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/44] python: add VERSION file
Date: Thu, 27 May 2021 22:32:00 -0400
Message-Id: <20210528023220.417057-25-jsnow@redhat.com>
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

Python infrastructure as it exists today is not capable reliably of
single-sourcing a package version from a parent directory. The authors
of pip are working to correct this, but as of today this is not possible.

The problem is that when using pip to build and install a python
package, it copies files over to a temporary directory and performs its
build there. This loses access to any information in the parent
directory, including git itself.

Further, Python versions have a standard (PEP 440) that may or may not
follow QEMU's versioning. In general, it does; but naturally QEMU does
not follow PEP 440. To avoid any automatically-generated conflict, a
manual version file is preferred.

I am proposing:

- Python tooling follows the QEMU version, indirectly, but with a major
  version of 0 to indicate that the API is not expected to be
  stable. This would mean version 0.5.2.0, 0.5.1.1, 0.5.3.0, etc.

- In the event that a Python package needs to be updated independently
  of the QEMU version, a pre-release alpha version should be preferred,
  but *only* after inclusion to the qemu development or stable branches.

  e.g. 0.5.2.0a1, 0.5.2.0a2, and so on should be preferred prior to
  5.2.0's release.

- The Python core tooling makes absolutely no version compatibility
  checks or constraints. It *may* work with releases of QEMU from the
  past or future, but it is not required to.

  i.e., "qemu.machine" will, for now, remain in lock-step with QEMU.

- We reserve the right to split the qemu package into independently
  versioned subpackages at a later date. This might allow for us to
  begin versioning QMP independently from QEMU at a later date, if
  we so choose.

Implement this versioning scheme by adding a VERSION file and setting it
to 0.6.0.0a1.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-12-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/VERSION   | 1 +
 python/setup.cfg | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 python/VERSION

diff --git a/python/VERSION b/python/VERSION
new file mode 100644
index 00000000000..c19f3b832b7
--- /dev/null
+++ b/python/VERSION
@@ -0,0 +1 @@
+0.6.1.0a1
diff --git a/python/setup.cfg b/python/setup.cfg
index 3fa92a2e73f..b0010e0188f 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -1,5 +1,6 @@
 [metadata]
 name = qemu
+version = file:VERSION
 maintainer = QEMU Developer Team
 maintainer_email = qemu-devel@nongnu.org
 url = https://www.qemu.org/
-- 
2.31.1


