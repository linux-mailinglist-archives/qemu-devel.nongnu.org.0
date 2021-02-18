Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC231F00B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:40:44 +0100 (CET)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpAJ-0004sp-0C
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoyh-0003MM-67
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoyf-0003mf-IJ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q32loMpCorhrTCAx86Wi07OVol2OdrfDkuDNPiSXX8Y=;
 b=Pex6RvtjCex4lX5z8AWutze2gnQvUzZTbL+Ni6T2RPKZB53oXGv/6gqRm+uCo2rDtL3Re9
 slK3XSAqZTc8C7+5Sf+qnHno5Pn9a/cDHk/D9qaxRuFD+ZaNvab51lcCbLRpa1cu6agTvp
 3+0l/e0lhSDTjudCNsAYJVLgpVCe9D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-tN3YCNQaOn6u5VFaK6Wpzw-1; Thu, 18 Feb 2021 14:28:37 -0500
X-MC-Unique: tN3YCNQaOn6u5VFaK6Wpzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65F861005501;
 Thu, 18 Feb 2021 19:28:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 533FF60BE5;
 Thu, 18 Feb 2021 19:28:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/25] python: add .gitignore
Date: Thu, 18 Feb 2021 14:27:31 -0500
Message-Id: <20210218192733.370968-24-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ignore *Python* build and package output (build, dist, qemu.egg-info);
these files are not created as part of a QEMU build.

Ignore miscellaneous cached python confetti (__pycache__, *.pyc,
.mypy_cache).

Ignore .idea (pycharm) and .venv (pipenv et al).

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/.gitignore | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 python/.gitignore

diff --git a/python/.gitignore b/python/.gitignore
new file mode 100644
index 00000000000..78c522768bc
--- /dev/null
+++ b/python/.gitignore
@@ -0,0 +1,9 @@
+*.pyc
+.idea/
+.mypy_cache/
+.pytest_cache/
+.venv/
+__pycache__/
+build/
+dist/
+qemu.egg-info/
-- 
2.29.2


