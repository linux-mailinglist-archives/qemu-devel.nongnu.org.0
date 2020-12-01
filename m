Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2B2CA021
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:43:27 +0100 (CET)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk382-0002pv-JS
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk303-0002IB-7c
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk300-0003oR-RT
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGyWuyk96qqKzEbfJ4PiZWk+a4+54l1Ti4T2Ca7YwMM=;
 b=Dr9ID2OPdBcvY7T2UR38bFhdBNd/0rQ2BbZBiLrOgQnQP0pxWb0GqHJij7u3Bp4KS8rSOx
 dqLFsisXMMH8vdLIrMVyqk8n6TjL4bTLfq3hQC/FX6MhEnQXX9hlg1QnNKppb1D81Nrucj
 Rn5i2hOK1RJ9TGeFkGD5hIvKL8NZrio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-u9KUJCYyMIKpvJRBmyKtaA-1; Tue, 01 Dec 2020 05:35:06 -0500
X-MC-Unique: u9KUJCYyMIKpvJRBmyKtaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FA56190A7A1;
 Tue,  1 Dec 2020 10:35:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF2A10023B1;
 Tue,  1 Dec 2020 10:35:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/32] scripts: kernel-doc: accept negation like !@var
Date: Tue,  1 Dec 2020 05:34:36 -0500
Message-Id: <20201201103502.4024573-7-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On a few places, it sometimes need to indicate a negation of a
parameter, like:

	!@fshared

This pattern happens, for example, at:

	kernel/futex.c

and it is perfectly valid. However, kernel-doc currently
transforms it into:

	!**fshared**

This won't do what it would be expected.

Fortunately, fixing the script is a simple matter of storing
the "!" before "@" and adding it after the bold markup, like:

	**!fshared**

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/0314b47f8c3e1f9db00d5375a73dc3cddd8a21f2.1586881715.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-6-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 99530fb08b..e4b3cd486f 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -215,6 +215,7 @@ my $type_constant = '\b``([^\`]+)``\b';
 my $type_constant2 = '\%([-_\w]+)';
 my $type_func = '(\w+)\(\)';
 my $type_param = '\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)';
+my $type_param_ref = '([\!]?)\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)';
 my $type_fp_param = '\@(\w+)\(\)';  # Special RST handling for func ptr params
 my $type_fp_param2 = '\@(\w+->\S+)\(\)';  # Special RST handling for structs with func ptr params
 my $type_env = '(\$\w+)';
@@ -239,6 +240,7 @@ my @highlights_man = (
                       [$type_typedef, "\\\\fI\$1\\\\fP"],
                       [$type_union, "\\\\fI\$1\\\\fP"],
                       [$type_param, "\\\\fI\$1\\\\fP"],
+                      [$type_param_ref, "\\\\fI\$1\$2\\\\fP"],
                       [$type_member, "\\\\fI\$1\$2\$3\\\\fP"],
                       [$type_fallback, "\\\\fI\$1\\\\fP"]
 		     );
@@ -260,7 +262,7 @@ my @highlights_rst = (
                        [$type_union, "\\:c\\:type\\:`\$1 <\$2>`"],
                        # in rst this can refer to any type
                        [$type_fallback, "\\:c\\:type\\:`\$1`"],
-                       [$type_param, "**\$1**"]
+                       [$type_param_ref, "**\$1\$2**"]
 		      );
 my $blankline_rst = "\n";
 
-- 
2.26.2



