Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA6762FDCC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 20:12:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow6mN-0006aE-5h; Fri, 18 Nov 2022 14:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow6mI-0006Zg-9b
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:11:54 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow6mF-0007QZ-Sb
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:11:53 -0500
Received: by mail-pf1-x42b.google.com with SMTP id c203so5740506pfc.11
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 11:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JZUzOA0hQqpX0qBoD4ucJthktMFVYdCE3DXBBgQElDM=;
 b=YWCYCuGGe4ynj1JErHeEIjVtFTjqy1ZbtNJyBI1gJuvx/93FoOZLErCVWzMDrYD+GW
 qL1QYg2EsFQ2mSmH/CYHZ2lxBgCVqimLQuA2ySBTL1OEXZZrL69diEP3Emd7faBQ1R5k
 M8wQBl4LZA7F/9MWs7jGiblwHPnnVfkGcu0oDtECx+LrZTfdc4Pr/v2nshRgVNSyxJIK
 xPCOIxGPGVDqFi6ykcC3EgOR7ZgZUYRXKoGgWoEYB+8Dqq7TUmhd6oxMd2ESZLn46g0L
 Qn/SmxYxWazF2X2DRUjKcou7qw2QW/H3DS6+NWF+UwZ+TY2ODxHTRMD6lMs02N80J7cI
 GbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZUzOA0hQqpX0qBoD4ucJthktMFVYdCE3DXBBgQElDM=;
 b=2oido4G9zEi0V4WCRn17H1Ygi4SPcnIz+RQ4k3u4meG8hSqHL8z6pdrnMLWu5yEsyC
 Howfj9stwun1is7BFWwUnq8Zn1UwkaXJsjOhDJnv6Jop5G6Dtg5ttaTuf+j73ZsPUU4P
 0r9RnEgpTpH9Fh4IDYafijB0xBYhh+qFJECzS4O5R9pcZeaO0FU6OtxoIbCqj3jA0v1T
 0czef86oR13Tww94FR8t4sy+W4SJpajIX7+VJPfaD5Auhgs3JrleHdnFQ++X08PRGap8
 Ii4dPW1kGvelX3zvGzmuTElqFwYQ5C+R5UJYruQ645THwZDkUYN42OkXCkvBeF97L12a
 LebA==
X-Gm-Message-State: ANoB5pk6kdGQSYIVms11QrCH9qnYGSLKqY2bl5tn8akZcyW+dPiEG9rd
 eT1RSSa5TpS64Yjauif93ymqAZeatmusqh/JQWIlMQ==
X-Google-Smtp-Source: AA0mqf5bH2844+IMy0j3yysRnwsnMNn6FLMApuDUUYqc6ICWnsV5LCeQYKh3RPI34Ffax3RAPrAFvi/G1tyY1Ezb44Q=
X-Received: by 2002:a65:681a:0:b0:43c:7da:e64b with SMTP id
 l26-20020a65681a000000b0043c07dae64bmr8028158pgt.231.1668798710195; Fri, 18
 Nov 2022 11:11:50 -0800 (PST)
MIME-Version: 1.0
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 19:11:38 +0000
Message-ID: <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Mihai Carabas <mihai.carabas@oracle.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> Use the base_memmap to build the SMBIOS 19 table which provides the address
> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
>
> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
> ("SMBIOS: Build aggregate smbios tables and entry point").
>
> [1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>

Is this a bug fix, or a new feature? What are the consequences
of it being missing? Is this important enough to go into the 7.2
release? (My default position would be "no", given this has been
like this on the virt board for a very long time.)

> ---
>  hw/arm/virt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cda9defe8f09..855b6982f363 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1607,9 +1607,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  static void virt_build_smbios(VirtMachineState *vms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      uint8_t *smbios_tables, *smbios_anchor;
>      size_t smbios_tables_len, smbios_anchor_len;
> +    struct smbios_phys_mem_area mem_array;
>      const char *product = "QEMU Virtual Machine";
>
>      if (kvm_enabled()) {
> @@ -1620,7 +1622,11 @@ static void virt_build_smbios(VirtMachineState *vms)
>                          vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
>                          true, SMBIOS_ENTRY_POINT_TYPE_64);
>
> -    smbios_get_tables(MACHINE(vms), NULL, 0,
> +    /* build the array of physical mem area from base_memmap */
> +    mem_array.address = vms->memmap[VIRT_MEM].base;
> +    mem_array.length = ms->ram_size;
> +
> +    smbios_get_tables(ms, &mem_array, 1,
>                        &smbios_tables, &smbios_tables_len,
>                        &smbios_anchor, &smbios_anchor_len,
>                        &error_fatal);

Does this show up as a difference in the ACPI tables? If so then
the bios-tables-tests will need updating (and this would probably
show up as "make check" failing).

Do we need to care here about pluggable memory devices?
(We seem to do something with them in the ACPI tables
via build_srat_memory(), so maybe not?)

thanks
-- PMM

