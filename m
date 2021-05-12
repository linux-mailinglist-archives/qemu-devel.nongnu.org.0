Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8BE37EF6F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:17:45 +0200 (CEST)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy6r-0002G8-0q
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2Y-0001UA-Is
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2P-00061m-Vp
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+dkfG79oSEy6op7DliyJIdQsudIgtKdsUZ+CKtzdKOg=;
 b=I1bQJVFDYH66fSry+x7rL62WDrBGmGxYaiAJDQNXOCj+vELqi5jF1kV5kU9DXYUKfQ5kag
 x95wx2NhBccjiD+u9AzyBVhuGikiTc2LsVw7mX9CWFVhwJbahll+kP7xWqaffrdJ73j2zM
 BThF45BnYx33k4YVS0tzC3OGm6tz5rk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-1u2fEJmiPY6GWZ83LqA9aA-1; Wed, 12 May 2021 19:13:04 -0400
X-MC-Unique: 1u2fEJmiPY6GWZ83LqA9aA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F15E6107ACC7;
 Wed, 12 May 2021 23:13:02 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D7E05D736;
 Wed, 12 May 2021 23:13:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/25] python: add VERSION file
Date: Wed, 12 May 2021 19:12:21 -0400
Message-Id: <20210512231241.2816122-6-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
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
index dd71640fc2f..e7f8ab23815 100644
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
2.30.2


