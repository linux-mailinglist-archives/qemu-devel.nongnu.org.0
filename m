Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2AE4CBD63
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:13:37 +0100 (CET)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkKu-0006Dr-3M
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:13:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPk8I-0002li-80
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPk8C-0003cf-SO
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646308828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SChHcwg/89XMGoVWOn4WPsullesTZfsuoF5vcE1hxbw=;
 b=QxA6kedIPZQN3bFZTC5ucHtK0xDzM24Al4i61nunqWBDdyQzhPGM4o0Edx1xJAHPOEQx0x
 Ep9gg+NzPE097tunHb4vOI/xbWNGfLGCONuH4eIYcVp8MtwZMlpb+ZbUAqWzMUoX2M8ZQq
 ti/4SS1dblWVGL+vrDr/lCRDoB/gcC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-XBLt5vFsMViTWgAkHsQfNw-1; Thu, 03 Mar 2022 07:00:25 -0500
X-MC-Unique: XBLt5vFsMViTWgAkHsQfNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F344D801AAD;
 Thu,  3 Mar 2022 12:00:22 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.37.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C688842CC;
 Thu,  3 Mar 2022 12:00:18 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] docs: vhost-user: add subsection for non-Linux
 platforms
Date: Thu,  3 Mar 2022 12:59:11 +0100
Message-Id: <20220303115911.20962-5-slp@redhat.com>
In-Reply-To: <20220303115911.20962-1-slp@redhat.com>
References: <20220303115911.20962-1-slp@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a section explaining how vhost-user is supported on platforms
other than Linux.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 docs/interop/vhost-user.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index edc3ad84a3..590a626b92 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -38,6 +38,24 @@ conventions <backend_conventions>`.
 *Master* and *slave* can be either a client (i.e. connecting) or
 server (listening) in the socket communication.
 
+Support for platforms other than Linux
+--------------------------------------
+
+While vhost-user was initially developed targeting Linux, nowadays is
+supported on any platform that provides the following features:
+
+- The ability to share a mapping injected into the guest between
+  multiple processes, so both QEMU and the vhost-user daemon servicing
+  the device can access simultaneously the memory regions containing
+  the virtqueues and the data associated with each request.
+
+- AF_UNIX sockets with SCM_RIGHTS, so QEMU can communicate with the
+  vhost-user daemon and send it file descriptors when needed.
+
+- Either eventfd or pipe/pipe2. On platforms where eventfd is not
+  available, QEMU will automatically fallback to pipe2 or, as a last
+  resort, pipe.
+
 Message Specification
 =====================
 
-- 
2.35.1


