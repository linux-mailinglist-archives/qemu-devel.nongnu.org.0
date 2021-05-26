Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB6390D99
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 02:56:12 +0200 (CEST)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llhqE-0004ZA-T6
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 20:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhO3-0005Y1-0u
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhNw-0007Y4-SG
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621988815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1i2r1B4FpoFsnjnSSkyc16gi8N2SH4zmmwjbGuuMgm4=;
 b=FI7Zv4sFR5QWvac1egaP8o/xReBjh9QkHH6SK1aT7KafihCSMCBGtmyb8mLxhlFeRj8C25
 6Rov2DQvq6w28QfxyqUUvvhMCR8J3RRr0OrDJXz6lj0ABZ3gT2R73Ch+UA5bj2N0OpEebI
 58zAO5o6YbDFI+D4Kfl0GxTkuHW3v3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-GkuPGi4oOxudgul35d7afQ-1; Tue, 25 May 2021 20:26:53 -0400
X-MC-Unique: GkuPGi4oOxudgul35d7afQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 911F6800D55;
 Wed, 26 May 2021 00:26:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616116E51B;
 Wed, 26 May 2021 00:26:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 29/31] python: add .gitignore
Date: Tue, 25 May 2021 20:24:52 -0400
Message-Id: <20210526002454.124728-30-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

Ignore *Python* build and package output (build, dist, qemu.egg-info);
these files are not created as part of a QEMU build. They are created by
running the commands 'python3 setup.py <sdist|bdist>' when preparing
tarballs to upload to e.g. PyPI.

Ignore miscellaneous cached python confetti (mypy, pylint, et al)

Ignore .idea (pycharm) .vscode, and .venv (pipenv et al).

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/.gitignore | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 python/.gitignore

diff --git a/python/.gitignore b/python/.gitignore
new file mode 100644
index 00000000000..4ed144ceac3
--- /dev/null
+++ b/python/.gitignore
@@ -0,0 +1,15 @@
+# linter/tooling cache
+.mypy_cache/
+.cache/
+
+# python packaging
+build/
+dist/
+qemu.egg-info/
+
+# editor config
+.idea/
+.vscode/
+
+# virtual environments (pipenv et al)
+.venv/
-- 
2.31.1


