Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADDC4691C9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:51:08 +0100 (CET)
Received: from localhost ([::1]:57454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9iF-00069l-2L
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mu9fC-0004wC-0d
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:47:58 -0500
Received: from [2a00:1450:4864:20::535] (port=34304
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mu9fA-0002R2-Ez
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:47:57 -0500
Received: by mail-ed1-x535.google.com with SMTP id x15so40007511edv.1
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 00:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+XeRjkRU+WU+Rvr0FWXTZh1t+JMTx+JPbU3eATHUUSQ=;
 b=5NVkEOVsNXHiZvqvYSrkOhksT+LuEJXIMKv326oojAxsbtxoDbhdQ37/oU1kldw/DD
 Lg/cZktGV1SOPLhEB0mQorM6nmpGEqYgzKERdwBFoIygOlQJ78z/GQNBQGQ6Z5har6AG
 JUxcpmJBby/EYv2gd8mYWhStDTseOcMaP1WijijjM+h8mDKlIWPU+TxvagetgPqvdXfk
 fVsEo3GjubSkZSrzvfrESZWjSGpYoAGggKE2qlJ3ZEprtM+XSLJyWCoP7PPkKfZz7KUE
 M98HVPQdjngE0trXXzCszZ1k9TnVzi/KmWbaKSn06PM9tmjbDXzbeZGsLiQZm4cuTgDg
 WhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+XeRjkRU+WU+Rvr0FWXTZh1t+JMTx+JPbU3eATHUUSQ=;
 b=EhkzTTKTxkRw2U647/+owIKdErPC2NnwKLwciPp4UAVeVgUQMp80jCjcjoHuF8RRv9
 s0+5eerHR2ePBrWvJUt5iF3m/g6cwCS78HAmv5n1Nj/m0jjArPfSLbWfAIkuyyCB3E5X
 o2dG0SyM4kfd9IvDxjwfAv+Yyr0tDJugyjnDft3BECnEN8xf4RJA9hGEAdhO1T2kJ+4O
 x9aIRtvn16ZteUrT9ZRJna8SD6tt5B3ZB3N2otNdU2n6fUmmAOKTECfuX1J1Zlhm1ycP
 v+IbBm1kgSK70xuvyjs336l8ktGqTrzUwNWzrONmazCk7pPln27cHaFva4sDW6sTpWxF
 jOPg==
X-Gm-Message-State: AOAM5320pADgksXsXcAqkDCamwQGmX2R05mlbDE87gEjuxq8R/Fn1+3p
 tt0ayRtVAV160IyqiyfXilYUrTun2y3WRBPhxzkRLw==
X-Google-Smtp-Source: ABdhPJw2vr0p1zf4hpzIgLZn08Agoeh9C2hricdmxqT7uS7HWkeL23v9YgIrwyAivG0joiGt0wa1Svng5wov8vFUsOo=
X-Received: by 2002:aa7:de86:: with SMTP id j6mr53169180edv.1.1638780474792;
 Mon, 06 Dec 2021 00:47:54 -0800 (PST)
MIME-Version: 1.0
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-10-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1638472142-14396-10-git-send-email-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 6 Dec 2021 14:17:43 +0530
Message-ID: <CAARzgwzC6maazE3Lxrm0Rg6o5hzgPdgPYWsL_5W6depQu7u82Q@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] ACPI ERST: bios-tables-test testcase
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x535.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> This change implements the test suite checks for the ERST table.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test.c | 56 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 2588741..2f073e6 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1446,6 +1446,57 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>      test_acpi_tcg_acpi_hmat(MACHINE_PC);
>  }
>
> +static void test_acpi_erst(const char *machine)
> +{
> +    gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
> +    gchar *params;
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = machine;
> +    data.variant = ".acpierst";
> +    params = g_strdup_printf(
> +        " -object memory-backend-file,id=erstnvram,"
> +            "mem-path=%s,size=0x10000,share=on"
> +        " -device acpi-erst,memdev=erstnvram", tmp_path);
> +    test_acpi_one(params, &data);
> +    free_test_data(&data);
> +    g_free(params);
> +    g_assert(g_rmdir(tmp_path) == 0);
> +    g_free(tmp_path);
> +}
> +
> +static void test_acpi_piix4_acpi_erst(void)
> +{
> +    test_acpi_erst(MACHINE_PC);
> +}
> +
> +static void test_acpi_q35_acpi_erst(void)
> +{
> +    test_acpi_erst(MACHINE_Q35);
> +}
> +
> +static void test_acpi_microvm_acpi_erst(void)
> +{
> +    gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
> +    gchar *params;
> +    test_data data;
> +
> +    test_acpi_microvm_prepare(&data);
> +    data.variant = ".pcie";
> +    data.tcg_only = true; /* need constant host-phys-bits */
> +    params = g_strdup_printf(" -machine microvm,"
> +        "acpi=on,ioapic2=off,rtc=off,pcie=on"
> +        " -object memory-backend-file,id=erstnvram,"
> +           "mem-path=%s,size=0x10000,share=on"
> +        " -device acpi-erst,memdev=erstnvram", tmp_path);
> +    test_acpi_one(params, &data);
> +    g_free(params);
> +    g_assert(g_rmdir(tmp_path) == 0);
> +    g_free(tmp_path);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_virt_tcg(void)
>  {
>      test_data data = {
> @@ -1624,6 +1675,8 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>          qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>          qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
> +        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
> +        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
>          qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>          qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>          qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
> @@ -1639,6 +1692,9 @@ int main(int argc, char *argv[])
>              qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
>              qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
>          }
> +        if (strcmp(arch, "x86_64") == 0) {
> +            qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_acpi_erst);
> +        }
>      } else if (strcmp(arch, "aarch64") == 0) {
>          if (has_tcg) {
>              qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> --
> 1.8.3.1
>

