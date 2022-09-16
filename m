Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED895BA7C3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:05:54 +0200 (CEST)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ6MD-0003d7-Oy
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ6H7-0000Wg-IF
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:00:37 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ6H5-0006tn-FI
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:00:37 -0400
Received: by mail-ej1-x631.google.com with SMTP id u9so47677057ejy.5
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=3y+bXXpWEdDI9cmjlPYHaa+YyEhXNZg2enPUUa6+NAY=;
 b=gZUYrlUBMLx8XPgktN541e1E2+gPw+ahVoHyamlJp/wFH9+Qu5HlgCBzBanlUZZ3VV
 vEE+GTJhhsBSQN53JN/eg+f3M3bxDV6qao4JdB1qlDzRDiEpawH8HEkrbtHDCRoNKaxG
 ouWLo9cS7sTNwE0SEALZrgP2aqMrtBGtcTrilgg94II2knkzJLdAKXmT9YwngH48W4sW
 68BPAEraV2NWvAY1C0GgUc6pgJHgcQy+XRNvLkUHbJD7i0KBhoRRdUh0BPUNc9UcAVCV
 FbvP5lGhTBDS5IEy/Pbe+vrqj8/sOZBdtDuKJQl3HDOQ7AK4CfMVXhF5gry1AqXORyHQ
 SXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3y+bXXpWEdDI9cmjlPYHaa+YyEhXNZg2enPUUa6+NAY=;
 b=nztZTX/UfhJAeonauufJv7bdg3wmuhYAA/jW57GBWqICaGFTptQ5AkXHb1bvcucaH+
 FJ7G7sAMXruPnaaMXZIaCn0Im6wbcR/kWEHr3Dm9B6r4vroRS0uYrNW8r2bwjnJDMGi7
 TZtknvwB6IG0S4SrF6PoI2LZXjV2U4m19094hOUvqGgiZxlw8IfxmLHTbb2NG3WEV17b
 dtm9BGn9457T4+Be0tiSKVOoPl5ihRHJkAKnHGkgnJTISZhQcJxxbldvk2nWyO4Rd6LG
 RGvPelJbEltc8NiUmFmmrbEVnXpeNeFjAheSED4ECmvnpyikiP0CQ1NMG1RJv1jwcfDd
 +Mug==
X-Gm-Message-State: ACrzQf3+vdtw8BfItth5jKcI1QZ9mHuldiGnRKMerg0TIo2lK082yGd7
 jbpLTurvLU0rpzPkqkI7ymI6Rffaz7rnKxpBtuh9cA==
X-Google-Smtp-Source: AMsMyM6dfuokuS1qh10gBIoKngmD/GZrsMh6WnWs1yZZLuqmxe4Sk12KvGaeRQ7ZRyITsJ3tk+dAUJ5zP1oUgBH7SdI=
X-Received: by 2002:a17:906:8a65:b0:780:9cb2:d57d with SMTP id
 hy5-20020a1709068a6500b007809cb2d57dmr1705964ejc.625.1663315233147; Fri, 16
 Sep 2022 01:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-7-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-7-armbru@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 16 Sep 2022 13:30:22 +0530
Message-ID: <CAARzgwyZK9EuKKj0UpUxC8BYEUBDwRYG==eTfndgNmKOE_FgKA@mail.gmail.com>
Subject: Re: [PATCH 06/27] qapi acpi: Elide redundant has_FOO in generated C
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, jsnow@redhat.com, 
 eblake@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 16, 2022 at 2:13 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C"

Commit is referenced using <commit hash 13 chars min> ("commit header")

provided the means to elide
> them step by step.  This is the step for qapi/acpi.py.
>
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/acpi/core.c           | 14 +++++++-------
>  hw/acpi/cpu.c            |  1 -
>  hw/acpi/memory_hotplug.c |  1 -
>  scripts/qapi/schema.py   |  1 -
>  4 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 3e811bf03c..6da275c599 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -185,7 +185,7 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
>      changed_fields = 0;
>      ext_hdr->_length = cpu_to_le16(acpi_payload_size);
>
> -    if (hdrs->has_sig) {
> +    if (hdrs->sig) {
>          strncpy(ext_hdr->sig, hdrs->sig, sizeof ext_hdr->sig);
>          ++changed_fields;
>      }
> @@ -204,11 +204,11 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
>
>      ext_hdr->checksum = 0;
>
> -    if (hdrs->has_oem_id) {
> +    if (hdrs->oem_id) {
>          strncpy(ext_hdr->oem_id, hdrs->oem_id, sizeof ext_hdr->oem_id);
>          ++changed_fields;
>      }
> -    if (hdrs->has_oem_table_id) {
> +    if (hdrs->oem_table_id) {
>          strncpy(ext_hdr->oem_table_id, hdrs->oem_table_id,
>                  sizeof ext_hdr->oem_table_id);
>          ++changed_fields;
> @@ -217,7 +217,7 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
>          ext_hdr->oem_revision = cpu_to_le32(hdrs->oem_rev);
>          ++changed_fields;
>      }
> -    if (hdrs->has_asl_compiler_id) {
> +    if (hdrs->asl_compiler_id) {
>          strncpy(ext_hdr->asl_compiler_id, hdrs->asl_compiler_id,
>                  sizeof ext_hdr->asl_compiler_id);
>          ++changed_fields;
> @@ -255,12 +255,12 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
>      if (!hdrs) {
>          goto out;
>      }
> -    if (hdrs->has_file == hdrs->has_data) {
> +    if (!hdrs->file == !hdrs->data) {
>          error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
>          goto out;
>      }
>
> -    pathnames = g_strsplit(hdrs->has_file ? hdrs->file : hdrs->data, ":", 0);
> +    pathnames = g_strsplit(hdrs->file ?: hdrs->data, ":", 0);
>      if (pathnames == NULL || pathnames[0] == NULL) {
>          error_setg(errp, "'-acpitable' requires at least one pathname");
>          goto out;
> @@ -297,7 +297,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
>          close(fd);
>      }
>
> -    acpi_table_install(blob, bloblen, hdrs->has_file, hdrs, errp);
> +    acpi_table_install(blob, bloblen, !!hdrs->file, hdrs, errp);
>
>  out:
>      g_free(blob);
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 3646dbfe68..4e580959a2 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -35,7 +35,6 @@ static ACPIOSTInfo *acpi_cpu_device_status(int idx, AcpiCpuStatus *cdev)
>          DeviceState *dev = DEVICE(cdev->cpu);
>          if (dev->id) {
>              info->device = g_strdup(dev->id);
> -            info->has_device = true;
>          }
>      }
>      return info;
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 0a7e89a13e..a7476330a8 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -44,7 +44,6 @@ static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
>          DeviceState *dev = DEVICE(mdev->dimm);
>          if (dev->id) {
>              info->device = g_strdup(dev->id);
> -            info->has_device = true;
>          }
>      }
>      return info;
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 3ae94300c4..5160a659b7 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -759,7 +759,6 @@ def need_has(self):
>          assert self.type
>          # Temporary hack to support dropping the has_FOO in reviewable chunks
>          opt_out = [
> -            'qapi/acpi.json',
>              'qapi/audio.json',
>              'qapi/block-core.json',
>              'qapi/block-export.json',
> --
> 2.37.2
>

