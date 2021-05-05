Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC57373B79
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:38:21 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGnE-00023s-Is
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1leGlZ-0000xr-Pc
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1leGlY-0008Mv-3S
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620218195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogYmNKWR9ZkckddfL12BxYTI9aXpldL3OP0i8oAuYUQ=;
 b=G/E/Sr33Rw1m8mRO6FhUSliAu2UcJrOyIdnLDCUQUGkpU1dv0cUCQCLhhIOs3yFq+qsJR1
 G9SkgZIT2MhJcOo/SOPMnFEBmUNucbtAkb7eZv3xww6rlYSzhFvCWJUr654itT+e4AWZdz
 K1bclhYYMzQO3qKyEbYLcAgwofP/mg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-uSQHvLDdMZ-TH-TiPE4QIQ-1; Wed, 05 May 2021 08:36:33 -0400
X-MC-Unique: uSQHvLDdMZ-TH-TiPE4QIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D9A835DE1;
 Wed,  5 May 2021 12:36:33 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2983620DE;
 Wed,  5 May 2021 12:36:26 +0000 (UTC)
Date: Wed, 5 May 2021 14:36:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v6 11/12] qtest/bios-tables-test: Make test
 build-independent from accelerator
Message-ID: <20210505143625.5fa539e8@redhat.com>
In-Reply-To: <20210503211020.894589-12-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
 <20210503211020.894589-12-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  3 May 2021 23:10:19 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v5 had:
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> v6 is simplified and keeps the same logic, however since
> it is different, I'm not keeping the R-b tags.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index ad877baeb1b..762d154b340 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -97,6 +97,7 @@ typedef struct {
>      QTestState *qts;
>  } test_data;
> =20
> +static bool tcg_accel_available;
>  static char disk[] =3D "tests/acpi-test-disk-XXXXXX";
>  static const char *data_dir =3D "tests/data/acpi";
>  #ifdef CONFIG_IASL
> @@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_d=
ata *data)
>      char *args;
>      bool use_uefi =3D data->uefi_fl1 && data->uefi_fl2;
> =20
> -#ifndef CONFIG_TCG
> -    if (data->tcg_only) {
> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
> -        return;
> -    }
> -#endif /* CONFIG_TCG */
> +    assert(!data->tcg_only || tcg_accel_available);
> =20
>      args =3D test_acpi_create_args(data, params, use_uefi);
>      data->qts =3D qtest_init(args);
> @@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
> =20
>      g_test_init(&argc, &argv, NULL);
> =20
> +    tcg_accel_available =3D qtest_has_accel("tcg");
> +
>      if (strcmp(arch, "i386") =3D=3D 0 || strcmp(arch, "x86_64") =3D=3D 0=
) {
>          ret =3D boot_sector_init(disk);
>          if (ret) {
> @@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
>          qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2=
);
>          qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
> -        if (strcmp(arch, "x86_64") =3D=3D 0) {
> +        if (strcmp(arch, "x86_64") =3D=3D 0 && tcg_accel_available) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_t=
cg);
>          }
> -    } else if (strcmp(arch, "aarch64") =3D=3D 0) {
> +    } else if (strcmp(arch, "aarch64") =3D=3D 0 && tcg_accel_available) =
{
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>          qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);


