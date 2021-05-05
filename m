Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD267373B6B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:36:27 +0200 (CEST)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGlO-000092-S7
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1leGiy-0007NR-AN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:33:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1leGiv-0006jC-C0
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620218032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9xRbDHaSd1pcUBugALkZgF8/0HBoKGqJ3esPgBQ2UQ=;
 b=Jdy5Yhng0wJ8ovTSl29BJGISKM9UOCmRD/z2RMPAHt/QXdl8IHhkXHESfDsLioMnNohTyR
 a0XtcDURcSuHOPCq5AzAFe9iilb9Ge9VSv4YT7DtIqamTbgd+0RvLlO9BOo3MOd86l5Uh7
 41HrO5USqLi7IE4MzVngB9opAQC6tgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Fw0fOBveN42ya_O04VT_tQ-1; Wed, 05 May 2021 08:33:51 -0400
X-MC-Unique: Fw0fOBveN42ya_O04VT_tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 641811006C86;
 Wed,  5 May 2021 12:33:50 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E643421F;
 Wed,  5 May 2021 12:33:35 +0000 (UTC)
Date: Wed, 5 May 2021 14:33:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v6 10/12] qtest/bios-tables-test: Rename TCG specific tests
Message-ID: <20210505143334.6daddb2d@redhat.com>
In-Reply-To: <20210503211020.894589-11-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
 <20210503211020.894589-11-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  3 May 2021 23:10:18 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Some tests require TCG, but don't have '_tcg' in their name,
> while others do. Unify the test names by adding 'tcg' to the
> TCG specific tests.
>=20
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index ce498b3ff48..ad877baeb1b 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc(void)
>      free_test_data(&data);
>  }
> =20
> -static void test_acpi_microvm_pcie(void)
> +static void test_acpi_microvm_pcie_tcg(void)
>  {
>      test_data data;
> =20
> @@ -1475,7 +1475,7 @@ static void test_acpi_oem_fields_microvm(void)
>      g_free(args);
>  }
> =20
> -static void test_acpi_oem_fields_virt(void)
> +static void test_acpi_oem_fields_virt_tcg(void)
>  {
>      test_data data =3D {
>          .machine =3D "virt",
> @@ -1555,14 +1555,14 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2=
);
>          qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
>          if (strcmp(arch, "x86_64") =3D=3D 0) {
> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie);
> +            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_t=
cg);
>          }
>      } else if (strcmp(arch, "aarch64") =3D=3D 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>          qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>          qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> -        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt=
);
> +        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt=
_tcg);
>      }
>      ret =3D g_test_run();
>      boot_sector_cleanup(disk);


