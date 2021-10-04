Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D6342197D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:54:16 +0200 (CEST)
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVuZ-0002zO-SM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVtF-0001Rd-W0
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVtE-0002WD-Cx
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633384371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYSltukETy+XnFbMSZEHnLdV9qk370nfP2Wpmta8f/U=;
 b=gGNWxrxL1tRzkHwrvNFClBF2D2fS2ahJhJkYlhnXmS45G+YoygRbiUO7bxK82zeXnIHjNH
 CuF+EDkXizAwqVWpjAajoIKW1ghyV0VGmvBrP1Jhl8Pe/JXuWA8DckWiwbv4enVu4Q66go
 JvwaDrhPjLGkDZQfVORhCEDiL2SBiV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-mAL8c9VTO8aZEuq8__nLlQ-1; Mon, 04 Oct 2021 17:52:47 -0400
X-MC-Unique: mAL8c9VTO8aZEuq8__nLlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59C9F1084683;
 Mon,  4 Oct 2021 21:52:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FE9F19C59;
 Mon,  4 Oct 2021 21:52:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] docs: (further) remove non-reference uses of single
 backticks
Date: Mon,  4 Oct 2021 17:52:37 -0400
Message-Id: <20211004215238.1523082-3-jsnow@redhat.com>
In-Reply-To: <20211004215238.1523082-1-jsnow@redhat.com>
References: <20211004215238.1523082-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 John Snow <jsnow@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The series rotted already. Here's the new changes.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/system/i386/sgx.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
index f103ae2a2fd..9aa161af1a1 100644
--- a/docs/system/i386/sgx.rst
+++ b/docs/system/i386/sgx.rst
@@ -77,9 +77,9 @@ CPUID
 
 Due to its myriad dependencies, SGX is currently not listed as supported
 in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
-Control) to a guest, you must either use `-cpu host` to pass-through the
+Control) to a guest, you must either use ``-cpu host`` to pass-through the
 host CPU model, or explicitly enable SGX when using a built-in CPU model,
-e.g. via `-cpu <model>,+sgx` or `-cpu <model>,+sgx,+sgxlc`.
+e.g. via ``-cpu <model>,+sgx`` or ``-cpu <model>,+sgx,+sgxlc``.
 
 All SGX sub-features enumerated through CPUID, e.g. SGX2, MISCSELECT,
 ATTRIBUTES, etc... can be restricted via CPUID flags. Be aware that enforcing
@@ -126,7 +126,7 @@ creating VM with SGX.
 Feature Control
 ~~~~~~~~~~~~~~~
 
-Qemu SGX updates the `etc/msr_feature_control` fw_cfg entry to set the SGX
+Qemu SGX updates the ``etc/msr_feature_control`` fw_cfg entry to set the SGX
 (bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
 i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
 assuming said firmware supports fw_cfg.msr_feature_control.
-- 
2.31.1


