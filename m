Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F444536AC4
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 06:35:24 +0200 (CEST)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuoAb-0001pp-AE
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 00:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nuo9S-00019g-CL
 for qemu-devel@nongnu.org; Sat, 28 May 2022 00:34:10 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:32914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nuo9Q-0003Qu-EN
 for qemu-devel@nongnu.org; Sat, 28 May 2022 00:34:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 qe5-20020a17090b4f8500b001e26126abccso3602797pjb.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 21:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Ua/xY9fIYWObANmrAF3MNSR4m35GR/i3WBAs53hTxfA=;
 b=LHtSOBJg1duok7X1zr4VqNMbT392o/cEzIYL00rjsiNd6rTuFSWwi++6nv+/+ZNeRz
 lpwXqIa9p3EDOPXMKCUUISAvvqFfYjT27b0R3RvkuM0o/IqCjHPDNaH+MhMhfc9fmC1w
 VE6mivXYaCD5WVcMszgBsyAEXm9tbrHrjzurQ2oYFvp/OmKEUjWfRyUyZwDUpBRorH3t
 VoDyn9cRtEIriY58mE2H7CayTCRL/g/HjT9PpxBOd94dDafP8ofCZwHnaLsGOdp0Vqw+
 2goSzmg1S0YwzkuU41nxSLz51bRPoFtJYvTtsJ99EIrUbDVuYDWyn8I/V/IoENTgaBbJ
 qFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Ua/xY9fIYWObANmrAF3MNSR4m35GR/i3WBAs53hTxfA=;
 b=FoddIgFk5UfIGL847pYJeHmqxRFSRGRXAtIjrNx2HbJwh+jNyYeuB4I2zc45k5AwLT
 mawjVPZ62WJO/vpPJi4Qn8cmMjPCb+WJyAczZecsiqF1XIemAzvx38c1gMD0bMITn/sM
 TkPHq211Olv7LOaEIbthWC+yFM4Eow4YOwjq+tAcqql/p3VSo5nCznM6Z8m2WLSwwkh9
 Aklo5zKTaVLp+VIYdMeAcrsjz/u3nsDDpZnrEVkbKb1c2LDSlf6h6thoyW2JydiowsIE
 003qixxK+3nGqfI3ozToIeynl6WWCBGPwKyt12id1bwycc+91bEb9Y4kJ1QeCQO1zVIl
 6I7w==
X-Gm-Message-State: AOAM530QV/VV63j1PlMshpCmFM7eNhBsQL5M9x4mqYIyS40Ui9Z/6Nb9
 Z7RCh8zgQ+pVwyRZdjm27L802A==
X-Google-Smtp-Source: ABdhPJwyVmJYqPduNNnooctR+X5ZWIOZTrkVmSqlIr37Jq98CSU+z4laMQcYyXmaUZkVoDMfUU2mRw==
X-Received: by 2002:a17:903:124a:b0:154:c860:6d52 with SMTP id
 u10-20020a170903124a00b00154c8606d52mr46639704plh.159.1653712446413; 
 Fri, 27 May 2022 21:34:06 -0700 (PDT)
Received: from anisinha-lenovo ([116.73.134.210])
 by smtp.googlemail.com with ESMTPSA id
 r4-20020aa79624000000b0050dc76281fdsm4294918pfg.215.2022.05.27.21.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 21:34:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sat, 28 May 2022 10:04:00 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Julia Suvorova <jusual@redhat.com>
cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 1/5] hw/smbios: add core_count2 to smbios table type 4
In-Reply-To: <20220527165651.28092-2-jusual@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2205280950260.153682@anisinha-lenovo>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-2-jusual@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Fri, 27 May 2022, Julia Suvorova wrote:

> In order to use the increased number of cpus, we need to bring smbios
> tables in line with the SMBIOS 3.0 specification. This allows us to
> introduce core_count2 which acts as a duplicate of core_count if we have
> fewer cores than 256, and contains the actual core number per socket if
> we have more.
>
> core_enabled2 and thread_count2 fields work the same way.
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Other than the comment below,
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  include/hw/firmware/smbios.h |  3 +++
>  hw/smbios/smbios.c           | 11 +++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 4b7ad77a44..c427ae5558 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -187,6 +187,9 @@ struct smbios_type_4 {
>      uint8_t thread_count;
>      uint16_t processor_characteristics;
>      uint16_t processor_family2;
> +    uint16_t core_count2;
> +    uint16_t core_enabled2;
> +    uint16_t thread_count2;

I would add a comment along the lines of
/* section 7.5, table 21 smbios spec version 3.0.0 */

>  } QEMU_PACKED;
>
>  /* SMBIOS type 11 - OEM strings */
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 60349ee402..45d7be6b30 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -709,8 +709,15 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
>      SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
>      SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
> -    t->core_count = t->core_enabled = ms->smp.cores;
> -    t->thread_count = ms->smp.threads;
> +
> +    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
> +    t->core_enabled = t->core_count;
> +
> +    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> +
> +    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> +    t->thread_count2 = cpu_to_le16(ms->smp.threads);
> +
>      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
>      t->processor_family2 = cpu_to_le16(0x01); /* Other */
>
> --
> 2.35.1
>
>

