Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A153A5AB2
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:50:24 +0200 (CEST)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXzr-0002XP-Il
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lsXyU-00019s-PF; Sun, 13 Jun 2021 17:48:58 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lsXyS-00064m-83; Sun, 13 Jun 2021 17:48:58 -0400
Received: by mail-qt1-x842.google.com with SMTP id u20so7142106qtx.1;
 Sun, 13 Jun 2021 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YH1ZHL3nN5IyXeFCw1ybiMbsjrCnhlNILSxlimVPs7I=;
 b=mGK7fmz2ISZs9INDRIpX2yoAYgnAuP8RI01RdRcS5xpHCoLK01OCdtZKlAGqWa/ofN
 qoSZHjDYb63BoS/a/3oO8bbQ2V3Z6/yrxKy0XL+6YM5z2tRno/M36AwgbfHY7820j8Gw
 u8xTlDlemOHCxK1nftpe3Upuy0ZISiXgN0OkattdLl6i5sfHIyqHcJFTTequu6Ba8onN
 qgOrQDfX/Bo/LwYQf8OXM0kIktBUXOj7KK6vFBjFhyHpCSf6tYpTnqutwCqfKAyHovAg
 8kg+21DeHIEaHy7szuWSqoMC7wRY8rCUpVK/OyU8HBKdxLTn4psG9iofezxw3ciYg53R
 Q7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH1ZHL3nN5IyXeFCw1ybiMbsjrCnhlNILSxlimVPs7I=;
 b=nlcPiDBdWZYmHiRmZvnT/J4OVPG5kr37sxqYKg+p4x9fANZ0nUeubS/+RXRJegp7nV
 mvnVuj1ilGTX8BKcKTCTZsThtjAC+hpEI70BkXzG1uBdcTN1muPDR65I7suVlcj5LL01
 AcBqn87dRv0OcLzuKzVnoWmRj/sTVXQI6WmynROrNLtDnq7YsHGPPDGCnlGnE1+64Hfm
 +Poctt5Y3PpUeeesH7Et7NkUFY4rGnojQRWvCEeE4lqDg6ktz54G3H1v2qAHEXXQSK/y
 mszXX1TdgmzCXIjEFRfS+PDra6oh3pUtPxS7ItmtIgUIIspwP8f+uzypH8l+zK5vxXRR
 b57w==
X-Gm-Message-State: AOAM532a+hCIJRTG+c4c2ks/xK4bLKRKUI8FqtFLDAjwHvQTB5X25ysQ
 wCqUH9vDuCf1USQVNKuHeWHZNLcAW/W3K4PzG6Y=
X-Google-Smtp-Source: ABdhPJz6BuZyDVOuoPtfzmSSuF4jnEWB+Z1sdRo00SVBrLY+RymQ8t9MEMia7cV38BWBt5noDPxxePf7NQy7dXSBUKQ=
X-Received: by 2002:ac8:5e81:: with SMTP id r1mr13601199qtx.70.1623620934622; 
 Sun, 13 Jun 2021 14:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-3-peter.maydell@linaro.org>
In-Reply-To: <20210603171259.27962-3-peter.maydell@linaro.org>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 14 Jun 2021 05:48:46 +0800
Message-ID: <CABSBigRHYpx2MDecLLB1KQoCByk_pTMXS_aqp+Gqqm-28VZmUA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/acpi: Provide function acpi_ghes_present()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-qt1-x842.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Swetha <swjoshi@microsoft.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 01:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Allow code elsewhere in the system to check whether the ACPI GHES
> table is present, so it can determine whether it is OK to try to
> record an error by calling acpi_ghes_record_errors().
>
> (We don't need to migrate the new 'present' field in AcpiGhesState,
> because it is set once at system initialization and doesn't change.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/acpi/ghes.h |  9 +++++++++
>  hw/acpi/ghes-stub.c    |  5 +++++
>  hw/acpi/ghes.c         | 17 +++++++++++++++++
>  3 files changed, 31 insertions(+)
>
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 2ae8bc1ded3..674f6958e90 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -64,6 +64,7 @@ enum {
>
>  typedef struct AcpiGhesState {
>      uint64_t ghes_addr_le;
> +    bool present; /* True if GHES is present at all on this board */
>  } AcpiGhesState;
>
>  void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
> @@ -72,4 +73,12 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
>  int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
> +
> +/**
> + * acpi_ghes_present: Report whether ACPI GHES table is present
> + *
> + * Returns: true if the system has an ACPI GHES table and it is
> + * safe to call acpi_ghes_record_errors() to record a memory error.
> + */
> +bool acpi_ghes_present(void);
>  #endif
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> index 9faba043b85..c315de1802d 100644
> --- a/hw/acpi/ghes-stub.c
> +++ b/hw/acpi/ghes-stub.c
> @@ -15,3 +15,8 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>  {
>      return -1;
>  }
> +
> +bool acpi_ghes_present(void)
> +{
> +    return false;
> +}
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index a4dac6bf15e..a749b84d624 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -386,6 +386,8 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      /* Create a read-write fw_cfg file for Address */
>      fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
> +
> +    ags->present = true;
>  }
>
>  int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> @@ -443,3 +445,18 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>
>      return ret;
>  }
> +
> +bool acpi_ghes_present(void)
> +{
> +    AcpiGedState *acpi_ged_state;
> +    AcpiGhesState *ags;
> +
> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +
> +    if (!acpi_ged_state) {
> +        return false;
> +    }
> +    ags = &acpi_ged_state->ghes_state;
> +    return ags->present;
> +}
> --
> 2.20.1
>

Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>

