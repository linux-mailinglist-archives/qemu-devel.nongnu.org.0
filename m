Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF13C1528
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:27:22 +0200 (CEST)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Uzp-00011u-AY
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1Uxq-0007h0-Iu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1Uxo-0006tX-SF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625754316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C00JldUAXzsAzq3mxqIanRxImZ3J/wImP1Wz1hD0BHk=;
 b=ODTRb46uWWYcmQGoFCsv3ky+ZXr35/pm1zyDagOE4pHjs8cYtlBGPmb/JM7KlUR6g3hYV6
 +YUY2VVKNyMx15oOj+ioGqo3+x7UkntJCh84xnSlVnUPT84pQ0iGpgPrBZnsW0cvcRNQv1
 AWQx0osJM4HVwjwRO4ij/kLPLKo3wrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-QHO_JPrKOjOU7KA4ft4UdQ-1; Thu, 08 Jul 2021 10:25:12 -0400
X-MC-Unique: QHO_JPrKOjOU7KA4ft4UdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01CDA804140;
 Thu,  8 Jul 2021 14:25:12 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01B245D6A8;
 Thu,  8 Jul 2021 14:25:00 +0000 (UTC)
Date: Thu, 8 Jul 2021 16:24:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH 6/7] tests: acpi: Add test cases for TPM 1.2 with TCPA
 table
Message-ID: <20210708162459.2fa937de@redhat.com>
In-Reply-To: <20210630153723.672473-7-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-7-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Wed, 30 Jun 2021 11:37:22 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4ccbe56158..ddfd2d2b2a 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1145,11 +1145,16 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>  #endif
>  }
>  
> -static void test_acpi_q35_tcg_tpm_tis(void)
> +static void test_acpi_q35_tcg_tpm2_tis(void)
>  {
>      test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
>  }
>  
> +static void test_acpi_q35_tcg_tpm12_tis(void)
> +{
> +    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_1_2);
> +}
> +
>  static void test_acpi_tcg_dimm_pxm(const char *machine)
>  {
>      test_data data;
> @@ -1518,7 +1523,8 @@ int main(int argc, char *argv[])
>              return ret;
>          }
>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
> +        qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
> +        qtest_add_func("acpi/q35/tpm12-tis", test_acpi_q35_tcg_tpm12_tis);
>          qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
>          qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);


