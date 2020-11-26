Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CB2C4FEA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 09:02:20 +0100 (CET)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiCEN-0004sd-Hd
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 03:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiCBf-0003Rw-93
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:59:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiCBc-0007Fu-Su
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 02:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606377567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2v4a8dtkHjMlGEaKD3psu8JUdLX0AIWK/wxoBPTbn2Y=;
 b=V/BS4rtHN4k8DyTRNV/W0VSzk2i8cLZjIGHCXEi46EkXeouiciF1zQD1x3QoiA6Wu2gOmv
 RiSr4okbOBRPOmqCTtby/U1Vd9kYnqOrdjmOlcRsbeGLXvtZ/NsdkAI2upK1xLNbT/a7tD
 2Im43izKLi2c6gbO4U3CuyZx9WYBAGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-H5Hf2C9hNtmqmFG77Mbr5w-1; Thu, 26 Nov 2020 02:59:24 -0500
X-MC-Unique: H5Hf2C9hNtmqmFG77Mbr5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D7A09A225;
 Thu, 26 Nov 2020 07:59:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7CF460855;
 Thu, 26 Nov 2020 07:59:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] configure: remove python pkg_resources check
Date: Thu, 26 Nov 2020 02:59:18 -0500
Message-Id: <20201126075921.3116321-3-pbonzini@redhat.com>
In-Reply-To: <20201126075921.3116321-1-pbonzini@redhat.com>
References: <20201126075921.3116321-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Olaf Hering <olaf@aepfle.de>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Olaf Hering <olaf@aepfle.de>

Since meson.git#0240d760c7699a059cc89e584363c6431cdd2b61 setuptools is not required anymore.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201124211925.4194-1-olaf@aepfle.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 796cec14de..18c26e0389 100755
--- a/configure
+++ b/configure
@@ -1912,9 +1912,6 @@ fi
 
 case "$meson" in
     git | internal)
-        if ! $python -c 'import pkg_resources' > /dev/null 2>&1; then
-            error_exit "Python setuptools not found"
-        fi
         meson="$python ${source_path}/meson/meson.py"
         ;;
     *) meson=$(command -v "$meson") ;;
-- 
2.26.2



