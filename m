Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D596F48C5EC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:26:27 +0100 (CET)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ea1-0000ic-Vb
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:26:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dI2-0008FQ-Ps
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7dHz-0001O5-IZ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 08:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641992622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Is8R8FT4SdosGkzbuinR/uNzKCsBMYym8tuAKYqUYMw=;
 b=ffJ6cb1xp+BmRnuMjtaYMEfZ4S+vwnb4blWpSmpRECxSMOu/yLzom9+Slss1aS3ajrtpXF
 oniZpxhqId6s1kQFjW/emFKRCBbxa7BRPzOUFp+7FbA0WE9+uDxsencu8g+qJ78AfCZRp5
 Wp+X3VhkmiZycS+LZ8rczVCPbuYx+g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Cyk4is4jNnavakvP1iq2GA-1; Wed, 12 Jan 2022 08:03:38 -0500
X-MC-Unique: Cyk4is4jNnavakvP1iq2GA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69490100CCC2;
 Wed, 12 Jan 2022 13:03:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 578997BB53;
 Wed, 12 Jan 2022 13:03:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] tests: acpi: whitelist nvdimm's SSDT and FACP.slic
 expected blobs
Date: Wed, 12 Jan 2022 08:03:30 -0500
Message-Id: <20220112130332.1648664-3-imammedo@redhat.com>
In-Reply-To: <20220112130332.1648664-1-imammedo@redhat.com>
References: <20220112130332.1648664-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Marian Postevca <posteuca@mutex.one>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next commit will revert OEM fields whitespace padding to
padding with '\0' as it was before [1]. That will change OEM
Table ID for:
  * SSDT.*: where it was padded from 6 characters to 8
  * FACP.slic: where it was padded from 2 characters to 8
after reverting whitespace padding, it will be replaced with
'\0' which effectively will shorten OEM table ID to 6 and 2
characters.

Whitelist affected tables before introducing the change.

1) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..7faa8f53be 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/SSDT.memhp",
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/q35/SSDT.dimmpxm",
+"tests/data/acpi/q35/FACP.slic",
-- 
2.31.1


