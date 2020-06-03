Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853C1EC624
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 02:17:19 +0200 (CEST)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgH5q-0000Id-N9
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 20:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgH4G-0007A1-Ge
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 20:15:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45393
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgH4F-0005jJ-OJ
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 20:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591143338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnq6PPtGF+8POfZDXkRhMlV8IawKgYHb5YtRpAtTuWg=;
 b=LWjpUrRLJVAhgEuTe19uuBz6rb30I3L9Y1VER9R/CsZ1C0MY3UvzBqt/5F68obo/UN94rw
 9OY9tR768ikukTm7Zp6zSvddqjF1r77i/LFgx6Gyunf/XzxAQUyBiwBek3nVg/uqPhVm8M
 uDBaJEsM91AGRO7RgLbjW/mlwxYCj8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-Y-xkLa4NPY6CXY_A7mnsGg-1; Tue, 02 Jun 2020 20:15:34 -0400
X-MC-Unique: Y-xkLa4NPY6CXY_A7mnsGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3D311B18BDE;
 Wed,  3 Jun 2020 00:15:33 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-142.rdu2.redhat.com [10.10.112.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 294387F0B5;
 Wed,  3 Jun 2020 00:15:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] python/qemu: add README.rst
Date: Tue,  2 Jun 2020 20:15:19 -0400
Message-Id: <20200603001523.18085-4-jsnow@redhat.com>
In-Reply-To: <20200603001523.18085-1-jsnow@redhat.com>
References: <20200603001523.18085-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 17:45:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a short readme that explains the package hierarchy, which will be
visible while browsing the source on e.g. gitlab/github.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/README.rst | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 python/qemu/README.rst

diff --git a/python/qemu/README.rst b/python/qemu/README.rst
new file mode 100644
index 00000000000..96447b90616
--- /dev/null
+++ b/python/qemu/README.rst
@@ -0,0 +1,8 @@
+python/qemu/
+------------
+
+This directory serves as the root of a `Python PEP 420 implicit
+namespace package <<https://www.python.org/dev/peps/pep-0420/>`_.
+
+Each directory below is assumed to be an installable Python module that
+will be available under the ``qemu.<module>`` namespace.
-- 
2.21.3


