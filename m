Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956BC3C212A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:04:39 +0200 (CEST)
Received: from localhost ([::1]:55828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mR4-0004SO-MT
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1mPq-0002Sk-RM
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1mPp-0000kM-B1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625821400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvVs0bd8RcJrgg0Nr/RfTw3Dx0ks0WpBhxlFSdtFHnk=;
 b=PklEIj7uzCiRGnog16ZRy/6igrRUNscng823sDjwM+uxomp90qCqOu9FL7v9atPXp/4xfn
 v34QnIkFrmYaaYy7gBuedvr+rqI06vr4og8FeR0IavI1JRFF79jjnzZw5IAIopWaIyOWFk
 /IuMZjdHJhhFeiedmj/hw8mN4Jg6nII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-nl9PN8d7N6eo_2j1I6RTmA-1; Fri, 09 Jul 2021 05:03:19 -0400
X-MC-Unique: nl9PN8d7N6eo_2j1I6RTmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8554B8030D7;
 Fri,  9 Jul 2021 09:03:18 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40030100EBB0;
 Fri,  9 Jul 2021 09:03:10 +0000 (UTC)
Date: Fri, 9 Jul 2021 11:03:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 5/9] tests: acpi: tpm2: Add the renamed ACPI files
 and drop old ones
Message-ID: <20210709110309.3b24c094@redhat.com>
In-Reply-To: <20210708183814.925960-6-stefanb@linux.vnet.ibm.com>
References: <20210708183814.925960-1-stefanb@linux.vnet.ibm.com>
 <20210708183814.925960-6-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  8 Jul 2021 14:38:10 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/q35/DSDT.tis                | Bin 8465 -> 0 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8465 bytes
>  tests/data/acpi/q35/TPM2.tis                | Bin 76 -> 0 bytes
>  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 --
>  5 files changed, 2 deletions(-)
>  delete mode 100644 tests/data/acpi/q35/DSDT.tis
>  delete mode 100644 tests/data/acpi/q35/TPM2.tis
> 
[...]


