Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97EA2CA01F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:42:02 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk36f-0001Ze-TF
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk305-0002Ks-2L
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk302-0003pH-JZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63F4hjsPgY3g+SgiHAsRKv4smSA5qlvgJjHWOrAc6a8=;
 b=YY9Mzxg5ufee6+NV5Q/7H6en+mNsb2neuZke9S1s+fr7NYxzfqdUeS1iQkSdj3o0sJs/uW
 0LA6GwXzvjvtPFnL2bNEz4hZ8DWkozLZfOMcw6q1MKv28Lx2Hn7sfw+j87/HYdYDdZuZEc
 49bwctPU3PZkIZKnJ1o70Mmq2VLzltk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-dZMN4633OKa8Qc7Iiuqvhw-1; Tue, 01 Dec 2020 05:35:07 -0500
X-MC-Unique: dZMN4633OKa8Qc7Iiuqvhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A5E7805BE0;
 Tue,  1 Dec 2020 10:35:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04E5F10013C1;
 Tue,  1 Dec 2020 10:35:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/32] scripts/kernel-doc: parse
 __ETHTOOL_DECLARE_LINK_MODE_MASK
Date: Tue,  1 Dec 2020 05:34:39 -0500
Message-Id: <20201201103502.4024573-10-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The __ETHTOOL_DECLARE_LINK_MODE_MASK macro is a variant of
DECLARE_BITMAP(), used by phylink.h. As we have already a
parser for DECLARE_BITMAP(), let's add one for this macro,
in order to avoid such warnings:

	./include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
	./include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/d1d1dea67a28117c0b0c33271b139c4455fef287.1592895969.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-9-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index fadc2f5b86..e8fff6a525 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1113,7 +1113,9 @@ sub dump_struct($$) {
 	$members =~ s/\s*__packed\s*/ /gos;
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
 	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
+
 	# replace DECLARE_BITMAP
+	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
 	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
 	# replace DECLARE_HASHTABLE
 	$members =~ s/DECLARE_HASHTABLE\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
-- 
2.26.2



