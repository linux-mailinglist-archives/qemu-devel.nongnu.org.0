Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD249371551
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:39:54 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXrd-0000vi-IH
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldXom-00088d-KM
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldXoj-0004Jm-Rg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620045412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3igQNUhCbE3a5GvfM6OXBjDrklYB9819k3D5lD3AOTE=;
 b=Q/0zgdABabh3yudCq1Smap7jp7MzzEatrMTNWbstzrriSnZSyJ2QoEog1RLyMcD98vt+v9
 w10NiuJX8TjYtv0lmL/IAVO+EdJdhu9m/b5pncQzGjwFifSHlFI5QayXvhCvyZXKPt7B2x
 pyh/F/Ode4TZcPh1ligGQl5XH6moaVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-XZIp9i4GO_ymEP0Uqsmwfw-1; Mon, 03 May 2021 08:36:50 -0400
X-MC-Unique: XZIp9i4GO_ymEP0Uqsmwfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738C1107ACCD;
 Mon,  3 May 2021 12:36:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2BF10190A7;
 Mon,  3 May 2021 12:36:41 +0000 (UTC)
Date: Mon, 3 May 2021 14:36:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v5 08/10] qtest/bios-tables-test: Make test
 build-independent from accelerator
Message-ID: <20210503143639.57e7c52c@redhat.com>
In-Reply-To: <20210501223638.510712-9-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-9-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun,  2 May 2021 00:36:36 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by an assertion.
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>  1 file changed, 52 insertions(+), 47 deletions(-)
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index 156d4174aa3..a4c7bddf6f3 100644
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
> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_=
data *data)
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
> +
stray new line?

>      test_acpi_load_tables(data, use_uefi);
> =20
>      if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
> @@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
>      const char *arch =3D qtest_get_arch();
>      int ret;
> =20
> +    tcg_accel_available =3D qtest_has_accel("tcg");
> +
>      g_test_init(&argc, &argv, NULL);
> =20
>      if (strcmp(arch, "i386") =3D=3D 0 || strcmp(arch, "x86_64") =3D=3D 0=
) {
> @@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
>              return ret;
>          }
>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
> +        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
>          qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
>                         test_acpi_piix4_no_root_hotplug);
>          qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
>                         test_acpi_piix4_no_bridge_hotplug);
>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>                         test_acpi_piix4_no_acpi_pci_hotplug);
> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> -        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> -        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
> -        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> -        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem=
);
> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
> -        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
> -        qtest_add_func("acpi/piix4/smm-compat",
> -                       test_acpi_piix4_tcg_smm_compat);
> -        qtest_add_func("acpi/piix4/smm-compat-nosmm",
> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
> -        qtest_add_func("acpi/q35/smm-compat",
> -                       test_acpi_q35_tcg_smm_compat);
> -        qtest_add_func("acpi/q35/smm-compat-nosmm",
> -                       test_acpi_q35_tcg_smm_compat_nosmm);
> -        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_px=
m);
> -        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_h=
mat);
> -        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat)=
;
> -        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
> -        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
> -        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
> -        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2=
_tcg);
> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_m=
icrovm);
> -        if (strcmp(arch, "x86_64") =3D=3D 0) {
> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_t=
cg);
> +        if (tcg_accel_available) {

most of this can run without TCG if KVM is available, so why are you limiti=
ng it to TCG only
or am I missing something?

> +            qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis=
);
> +            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
> +            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_brid=
ge);
> +            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> +            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> +            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> +            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> +            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> +            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp)=
;
> +            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
> +            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp=
);
> +            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> +            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_num=
amem);
> +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem=
);
> +            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm=
);
> +            qtest_add_func("acpi/piix4/smm-compat",
> +                           test_acpi_piix4_tcg_smm_compat);
> +            qtest_add_func("acpi/piix4/smm-compat-nosmm",
> +                           test_acpi_piix4_tcg_smm_compat_nosmm);
> +            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohp=
et);
> +            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
> +            qtest_add_func("acpi/q35/smm-compat",
> +                           test_acpi_q35_tcg_smm_compat);
> +            qtest_add_func("acpi/q35/smm-compat-nosmm",
> +                           test_acpi_q35_tcg_smm_compat_nosmm);
> +            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
> +            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dim=
m_pxm);
> +            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_px=
m);
> +            qtest_add_func("acpi/piix4/acpihmat",
> +                           test_acpi_piix4_tcg_acpi_hmat);
> +            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_h=
mat);
> +            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
> +            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg=
);
> +            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg=
);
> +            qtest_add_func("acpi/microvm/ioapic2",
> +                           test_acpi_microvm_ioapic2_tcg);
> +            if (strcmp(arch, "x86_64") =3D=3D 0) {
> +                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pc=
ie_tcg);
> +            }
>          }
>      } else if (strcmp(arch, "aarch64") =3D=3D 0) {
> -        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> -        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> -        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> -        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> +        if (tcg_accel_available) {
> +            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numam=
em);
> +            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
> +            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> +        }
>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt=
);
>      }
>      ret =3D g_test_run();


