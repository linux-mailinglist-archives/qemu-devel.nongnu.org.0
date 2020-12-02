Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0100C2CB8CD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:27:56 +0100 (CET)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOQV-0007G0-2O
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDL-0003pO-5J
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCZ-0003oc-Li
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9hSD6aXz202BRQxQakOz7bqCncJQ7SCRZireavH59k=;
 b=b5XzYbI/+oKxo/u3ZCQ55fQoWIHceUk0bWdA+pFnOMx+PcepOF/RjuSr71cvv1cT+lPcyb
 yqHhQyGTPU/J1NmqgxTt1QEvo7yN4PCaVlluU82hlDpl+6Sh18E8R/sgXZHwDXZ9vf2sqb
 2Dzn6PHLMs1r5jXEeIpV7osBTBUvrME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-2x65Rl16Oz6dxKw7Ov8eZw-1; Wed, 02 Dec 2020 03:09:24 -0500
X-MC-Unique: 2x65Rl16Oz6dxKw7Ov8eZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDD3E80364B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A22785C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 091/113] scripts/kernel-doc: handle function pointer prototypes
Date: Wed,  2 Dec 2020 03:08:27 -0500
Message-Id: <20201202080849.4125477-92-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are some function pointer prototypes inside the net
includes, like this one:

	int (*pcs_config)(struct phylink_config *config, unsigned int mode,
			  phy_interface_t interface, const unsigned long *advertising);

There's nothing wrong using it with kernel-doc, but we need to
add a rule for it to parse such kind of prototype.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/fec520dd731a273013ae06b7653a19c7d15b9562.1592895969.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-10-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e8fff6a525..1cdece23fb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1801,6 +1801,11 @@ sub process_proto_function($$) {
 	$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
 	$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
 	$prototype =~ s@^\s+@@gos; # strip leading spaces
+
+	 # Handle prototypes for function pointers like:
+	 # int (*pcs_config)(struct foo)
+	$prototype =~ s@^(\S+\s+)\(\s*\*(\S+)\)@$1$2@gos;
+
 	if ($prototype =~ /SYSCALL_DEFINE/) {
 		syscall_munge();
 	}
-- 
2.26.2



