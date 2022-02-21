Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E134BD871
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:15:02 +0100 (CET)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM4mb-00020T-3B
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM4f4-0007vm-1Y
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:07:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM4ep-0005b7-7Z
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645434416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ikaERTzraN3wEK6WVLHFPp7f5igc/1vf970cwsEBlE4=;
 b=X6wLsc8Txpk4tZ0pQPNXlPecjVNJVVIytkPMovVHs8lMtRY1zRbrb+NKykBU7V5t4eVoX0
 IUJE04kv/2VSVmekMH0Itppds5WaQvaL4BjfgTX0IUh5VdTLGeHSYTRaBdb6Va8y0lVPDe
 3qADGQUJQKkD7aJbfkRPKCOch2aw8tw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669--C9wPJelPD2O7FRGdJ1cZA-1; Mon, 21 Feb 2022 04:06:53 -0500
X-MC-Unique: -C9wPJelPD2O7FRGdJ1cZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91AC6801AC5;
 Mon, 21 Feb 2022 09:06:51 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DFD07B6F1;
 Mon, 21 Feb 2022 09:06:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] configure: Disable capstone and slirp in the
 --without-default-features mode
Date: Mon, 21 Feb 2022 10:06:47 +0100
Message-Id: <20220221090647.150184-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the users, it looks a little bit weird that capstone and slirp are
not disabled automatically if they run the configure script with the
"--without-default-features" option, so let's do that now.
Note: fdt is *not* changed accordingly since this affects the targets
that we can build, so disabling fdt automatically here might have
unexpected side-effects for the users.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 I thought I sent out that patch a couple of weeks ago already, but
 I cannot find it in the archives, so I likely missed to send it
 correctly. Anyway, sorry if you've got this twice!

 configure | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 3a29eff5cc..36d10d95bb 100755
--- a/configure
+++ b/configure
@@ -361,9 +361,14 @@ slirp_smbd="$default_feature"
 # are included in the automatically generated help message)
 
 # 1. Track which submodules are needed
-capstone="auto"
+if test "$default_feature" = no ; then
+  capstone="disabled"
+  slirp="disabled"
+else
+  capstone="auto"
+  slirp="auto"
+fi
 fdt="auto"
-slirp="auto"
 
 # 2. Support --with/--without option
 default_devices="true"
-- 
2.27.0


