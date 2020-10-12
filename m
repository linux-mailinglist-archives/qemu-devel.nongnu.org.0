Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA4828C2C1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 22:41:49 +0200 (CEST)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS4dg-0004Ka-BJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 16:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WH-0002nV-Bm
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WF-0002gm-3H
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602534846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0kTn7HQTEu9mz/vf0nqbO9WjMO4OPLQb9grbSPnkXg=;
 b=MDWKyi/UcAFpDMnRkR39fu59ddgAGSi7VS3ukOdhMyw8e2GS5KYJ2RFDAHHGo461RKs3t9
 XsS9XQrVsRIFgwSO1OTkdzBsk3DCWt2d5NTWdu6dLuAFJlbZGERvelkk3Az2V3gPmU94Nf
 LCiJ2LdeOmVfP32S4ZlSj0jZPeupaRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-XOgWPhnIM6uu84YZ1FXs3A-1; Mon, 12 Oct 2020 16:34:03 -0400
X-MC-Unique: XOgWPhnIM6uu84YZ1FXs3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8081C100963D
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 20:33:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BC6A5D9CD;
 Mon, 12 Oct 2020 20:33:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/38] build-sys: fix git version from -version
Date: Mon, 12 Oct 2020 16:33:24 -0400
Message-Id: <20201012203343.1105018-20-pbonzini@redhat.com>
In-Reply-To: <20201012203343.1105018-1-pbonzini@redhat.com>
References: <20201012203343.1105018-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Typo introduced with the script.

Fixes: 2c273f32d3 ("meson: generate qemu-version.h")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reported-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20200929143654.518157-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qemu-version.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu-version.sh b/scripts/qemu-version.sh
index 03128c56a2..3f6e7e6d41 100755
--- a/scripts/qemu-version.sh
+++ b/scripts/qemu-version.sh
@@ -9,7 +9,7 @@ version="$3"
 if [ -z "$pkgversion" ]; then
     cd "$dir"
     if [ -e .git ]; then
-        pkgversion=$(git describe --match 'v*' --dirty | echo "")
+        pkgversion=$(git describe --match 'v*' --dirty) || :
     fi
 fi
 
-- 
2.26.2



