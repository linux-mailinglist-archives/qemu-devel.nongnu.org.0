Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D2268A6E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 13:59:31 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHn8r-000190-Ue
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 07:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kHn7m-0000iS-Uu
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 07:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kHn7k-0004Ba-Hw
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 07:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600084699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+oSl2VHTwsoluU+wV4CDMZxrnMXn+YCSGBc7NzOsPA=;
 b=ApO0cTbwTjxNDItAeNo72OT2sZtCivt/N/5tY95B9SXXX8vpQrh7v5+uwAxeafjiR7TUO1
 m7Jwk3ujPQh819LuqVmOnHudcSbkSuSDjrkjRxZbG1apP+dQpszZld35hoZEiTqzvXxoKu
 d52udwkeP4M0ktn/jFl8BQByXeKK+XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-Oc8gcHl6NVurPKTsxKiz4A-1; Mon, 14 Sep 2020 07:58:16 -0400
X-MC-Unique: Oc8gcHl6NVurPKTsxKiz4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143B21019657;
 Mon, 14 Sep 2020 11:58:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53A3B101418B;
 Mon, 14 Sep 2020 11:57:46 +0000 (UTC)
Date: Mon, 14 Sep 2020 13:57:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 2/9] tests/acpi: add a new unit test to test hotplug
 off/on feature on the root pci bus
Message-ID: <20200914135744.69d83e93@redhat.com>
In-Reply-To: <20200911180755.28409-2-ani@anisinha.ca>
References: <20200911180755.28409-1-ani@anisinha.ca>
 <20200911180755.28409-2-ani@anisinha.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:55:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Sep 2020 23:37:48 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Ability to turn hotplug off on the pci root bus for i440fx was added in commit:
> 3d7e78aa7777f0 ("Introduce a new flag for i440fx to disable PCI hotplug on the root bus")
> 
> This change adds a unit test in order to test this feature.
> 
> This change has been tested against upstream qemu master branch on top of tag v5.1.0.

isn't this seriest a rebase on top of master?
should comment be amended?

> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
 
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 504b810af5..d8c7d57557 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -740,6 +740,20 @@ static void test_acpi_piix4_tcg_bridge(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_piix4_root_hotplug(void)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = MACHINE_PC;
> +    data.variant = ".roothp";
> +    data.required_struct_types = base_required_struct_types;
> +    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
> +    test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
> +                  "-device pci-bridge,chassis_nr=1", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_tcg(void)
>  {
>      test_data data;
> @@ -1144,6 +1158,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>          qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>          qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> +        qtest_add_func("acpi/piix4/hotplug", test_acpi_piix4_root_hotplug);
>          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);


