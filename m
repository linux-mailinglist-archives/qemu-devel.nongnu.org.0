Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045F314F6D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 13:49:15 +0100 (CET)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9SS9-0000Ev-SZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 07:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9SQE-00083L-S8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:47:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9SQ9-0002P7-03
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612874826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lD3OOtwveZkMklralxwCKzRwawfSy+ZkDGR5RFgQAw=;
 b=H/If+Bpr2XUqUSOrTLa2hLRz8hTh3VU9JqT12yhFiJp9SitMUoH4ByW5hx1e5G/E33l1LG
 algdbTvc7ocs5laf13ZOUHZNB2rEefs9+ljkdJMo15D/D2Q/ImBAqMEfMHwXpTiXwXZ0Zl
 77A0oA6lPegZRdqvsOlA5eKxBMbhuJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-RQ05Fxd5ME6lfPDwkcjIrw-1; Tue, 09 Feb 2021 07:47:04 -0500
X-MC-Unique: RQ05Fxd5ME6lfPDwkcjIrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C307E801975;
 Tue,  9 Feb 2021 12:47:03 +0000 (UTC)
Received: from localhost (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 906AC1002382;
 Tue,  9 Feb 2021 12:46:58 +0000 (UTC)
Date: Tue, 9 Feb 2021 13:46:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v2 2/9] qtest: update
 tests/qtest/bios-tables-test-allowed-diff.h
Message-ID: <20210209134657.0b6e5230@redhat.com>
In-Reply-To: <ec80955a1c7a9263bdb12b2117f3460e23ef7b09.1612821109.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <ec80955a1c7a9263bdb12b2117f3460e23ef7b09.1612821109.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Feb 2021 13:57:21 -0800
isaku.yamahata@gmail.com wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> The following tests will modify acpi tables.
> prepare qtests to allow acpi table change.
> add new tables for new tests.
> - tests/data/acpi/q35/DSDT.nosmm
> - tests/data/acpi/q35/FACP.nosmm
> - tests/data/acpi/q35/DSDT.nohpet
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/q35/DSDT.nohpet             |  0
>  tests/data/acpi/q35/DSDT.nosmm              |  0
>  tests/data/acpi/q35/FACP.nosmm              |  0
>  tests/qtest/bios-tables-test-allowed-diff.h | 13 +++++++++++++
>  4 files changed, 13 insertions(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.nohpet
>  create mode 100644 tests/data/acpi/q35/DSDT.nosmm
>  create mode 100644 tests/data/acpi/q35/FACP.nosmm
> 
> diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/DSDT.nosmm b/tests/data/acpi/q35/DSDT.nosmm
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..b79ac495c2 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,14 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/q35/DSDT.tis",
> +"tests/data/acpi/q35/DSDT.bridge",
> +"tests/data/acpi/q35/DSDT.ipmibt",
> +"tests/data/acpi/q35/DSDT.cphp",
> +"tests/data/acpi/q35/DSDT.memhp",
> +"tests/data/acpi/q35/DSDT.numamem",
> +"tests/data/acpi/q35/DSDT.dimmpxm",
> +"tests/data/acpi/q35/DSDT.acpihmat",
> +"tests/data/acpi/q35/DSDT.mmio64",
> +"tests/data/acpi/q35/DSDT.nosmm",
> +"tests/data/acpi/q35/FACP.nosmm",
> +"tests/data/acpi/q35/DSDT.nohpet",


