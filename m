Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15D179B28
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 22:41:37 +0100 (CET)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9blo-0002lS-Nj
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 16:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1j9bio-0006CX-7b
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 16:38:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1j9bin-0007ZW-Aq
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 16:38:30 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50271
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1j9bin-0007Z6-79
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 16:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583357908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1RQzbBuNSBJdRf8VUS425UJ44KSwNzkCvF6jJ/U60U=;
 b=NW+gybNxfNpJAI50vr5A+I/tfNiM/2NSdd2X7pjwYVeg6QYUuD2jtUMOcdpooEvIqUPCsm
 M9nJhEWU6qLFqtCexHUKkF7HW4R7ETTm/iSvsxwO+F7t5K4IcRcByVN/7KYJxXD0w6cjU2
 0AuVW9yXkdS6+w3GvKuVMRrmHNacS40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-lH5LjYTjP1CWOFAsGcPx2w-1; Wed, 04 Mar 2020 16:38:24 -0500
X-MC-Unique: lH5LjYTjP1CWOFAsGcPx2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76999800D5A;
 Wed,  4 Mar 2020 21:38:23 +0000 (UTC)
Received: from probe.redhat.com (ovpn-120-212.rdu2.redhat.com [10.10.120.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 877D45C1D4;
 Wed,  4 Mar 2020 21:38:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/10] iotests: ignore import warnings from pylint
Date: Wed,  4 Mar 2020 16:38:11 -0500
Message-Id: <20200304213818.15341-4-jsnow@redhat.com>
In-Reply-To: <20200304213818.15341-1-jsnow@redhat.com>
References: <20200304213818.15341-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The right way to solve this is to come up with a virtual environment
infrastructure that sets all the paths correctly, and/or to create
installable python modules that can be imported normally.

That's hard, so just silence this error for now.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index cd0f185d30..fd65b90691 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -29,6 +29,7 @@
 import io
 from collections import OrderedDict
=20
+# pylint: disable=3Dimport-error, wrong-import-position
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pytho=
n'))
 from qemu import qtest
=20
--=20
2.21.1


