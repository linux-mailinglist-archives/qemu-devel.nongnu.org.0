Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9898429437A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 21:48:04 +0200 (CEST)
Received: from localhost ([::1]:47246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUxc3-0002mf-LD
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 15:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUxRF-0006eW-4x
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 15:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUxRC-00013p-3S
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 15:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603222605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/C1WJLAlLtQo/RDEEByZTPpqtoGhx6aW15Z0HD2swg=;
 b=Pt2hQYA3kNftyS1Js29PZtKd7CH+a1Md6+grfIskRtCLEehJg1ImLAR/ZDzU4QcEjimBHp
 0kx9LqT9QhIUU1MFJkY3SKrJpoaIzSwK+RnRpQqll2G0sP7bOaUQ0utt1JuWZyQOMX94nz
 OqG4c/d+IEo6BZj53eA4EcC0hj7Gq14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-ZTNaz3TzO5iq9LifFqP9nQ-1; Tue, 20 Oct 2020 15:36:42 -0400
X-MC-Unique: ZTNaz3TzO5iq9LifFqP9nQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EB0D18BE160;
 Tue, 20 Oct 2020 19:36:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-115-172.rdu2.redhat.com [10.10.115.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CF8B5C1C2;
 Tue, 20 Oct 2020 19:36:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] python: move flake8 config to setup.cfg
Date: Tue, 20 Oct 2020 15:35:49 -0400
Message-Id: <20201020193555.1493936-10-jsnow@redhat.com>
In-Reply-To: <20201020193555.1493936-1-jsnow@redhat.com>
References: <20201020193555.1493936-1-jsnow@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Ben Widawsky <ben@bwidawsk.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Rohit Shinde <rohit.shinde12194@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the comment concerning the flake8 exception to match commit
42c0dd12, whose commit message stated:

A note on the flake8 exception: flake8 will warn on *any* bare except,
but pylint's is context-aware and will suppress the warning if you
re-raise the exception.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/.flake8 | 2 --
 python/setup.cfg            | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)
 delete mode 100644 python/qemu/machine/.flake8

diff --git a/python/qemu/machine/.flake8 b/python/qemu/machine/.flake8
deleted file mode 100644
index 45d8146f3f..0000000000
--- a/python/qemu/machine/.flake8
+++ /dev/null
@@ -1,2 +0,0 @@
-[flake8]
-extend-ignore = E722  # Pylint handles this, but smarter.
\ No newline at end of file
diff --git a/python/setup.cfg b/python/setup.cfg
index a65802d85e..87506a4f10 100755
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -18,6 +18,9 @@ classifiers =
 python_requires = >= 3.6
 packages = find_namespace:
 
+[flake8]
+extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
+
 [pylint.messages control]
 # Disable the message, report, category or checker with the given id(s). You
 # can either give multiple identifiers separated by comma (,) or put this
-- 
2.26.2


