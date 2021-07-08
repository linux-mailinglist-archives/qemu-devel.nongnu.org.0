Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA223C14D1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:02:28 +0200 (CEST)
Received: from localhost ([::1]:38558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ubj-0002m5-4g
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1UYj-0000fU-Hn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1UYf-0006hY-1d
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625752755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFWHkuHORE6PqvOKANAkpLf4z7H8fQZ7KIAqIIMEKYA=;
 b=fi11QgCCxnuM0pz4OgSFpiLSMh17PrKAxYqD5LwJzPMTxfrC/3mWzN0NeDi7dwzI93MnQR
 Pz+/q5JuO8gukA6RTUO3b2hty50Lpagghs2OKDibxvPG+wF3EFl9l3hiw5BoRl1gdvupdW
 P58DbkL4L2K1tlWNvWAlHrwuyHW9JTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-_2JjA3gjOzWBubc2eUBDoQ-1; Thu, 08 Jul 2021 09:59:12 -0400
X-MC-Unique: _2JjA3gjOzWBubc2eUBDoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF5C9CF983;
 Thu,  8 Jul 2021 13:59:11 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A3E2369A;
 Thu,  8 Jul 2021 13:59:03 +0000 (UTC)
Date: Thu, 8 Jul 2021 15:59:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/7] tests: Add suffix tpm2 or tpm12 to ACPI table files
Message-ID: <20210708155902.53e3d7f7@redhat.com>
In-Reply-To: <20210630153723.672473-4-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-4-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: marcandre.lureau@redhat.com, mst@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 11:37:19 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
>  tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
>  tests/qtest/bios-tables-test.c                  |   3 ++-
>  3 files changed, 2 insertions(+), 1 deletion(-)
>  rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
>  rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

it fails checkpatch which falsely detects it as adding new files

ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found

ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found

looks like checkpatch needs to be fixed to handle testcase variant renaming.


> diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis.tpm2
> similarity index 100%
> rename from tests/data/acpi/q35/DSDT.tis
> rename to tests/data/acpi/q35/DSDT.tis.tpm2
> diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis.tpm2
> similarity index 100%
> rename from tests/data/acpi/q35/TPM2.tis
> rename to tests/data/acpi/q35/TPM2.tis.tpm2
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 93c9d306b5..4ccbe56158 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1101,7 +1101,8 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>      TPMTestState test;
>      test_data data;
>      GThread *thread;
> -    char *args, *variant = g_strdup_printf(".%s", tpm_if);
> +    const char *suffix = tpm_version == TPM_VERSION_2_0 ? "tpm2" : "tpm12";
> +    char *args, *variant = g_strdup_printf(".%s.%s", tpm_if, suffix);
>  
>      tpm_tis_base_addr = base;
>  


