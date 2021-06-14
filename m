Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6356B3A5F87
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:54:38 +0200 (CEST)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjIi-0002ly-TX
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsjHd-0001sk-EJ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsjHX-0008Ev-5r
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623664401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwI1U2MApPX059JCLdhqih8ITJHSz+Hx8Mr8ToVF8cA=;
 b=MjwZmcXQyXIAT/XkPuxLmavfXffwbm/WGJhfMoNOSi+RZIYL8XKlx4bMatbIbGsMkc6NuM
 9R3rWsVxeSFdyo2kkj9y7/RzbxfGPkKu5Xo3JFwhQTX89NiT4skPhsAduz6X58dhG+qZ0Q
 +cIh33qtKoTvaWn4elm4Vasq5fqNki8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-OrGGbJ0MOAicBo7ByHSkdw-1; Mon, 14 Jun 2021 05:53:20 -0400
X-MC-Unique: OrGGbJ0MOAicBo7ByHSkdw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a25-20020a7bc1d90000b029019dd2ac7025so5463423wmj.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HwI1U2MApPX059JCLdhqih8ITJHSz+Hx8Mr8ToVF8cA=;
 b=WANMdpMTQygX5LYXR1zEil6S/cPT9YRxKMYPdhyQWFylC3aZFAIIC4gxoSgLfwnRPc
 E7vcHS12nXiySgqpObTrHUVWOm2w1juRza6BmZ2O8Xn8T1GbmM+KbgQf6b+aRIY88/b5
 fW0RkDR6ytht07knvw31WbGO0YyD3Xi45NXGErrFcgh3iGoJpL4sDOlNuiievBk+Bhw5
 tbJm4ngksh8BUUivREmH+h7J2iN17OH20jS55y91rLsfTSxXfcXflRzB3Uk1UZj+SyrP
 pnnitPGChvQj38W+yXcQ0VQT7/iUvhA8o3Oh3aMGyVcWh0G1wUKMoCiFUX6ZXUDUcAXb
 iVyg==
X-Gm-Message-State: AOAM533AG8/CMM9auyQOUembEZrXf9u4Jc8PCxc6vZKiWw0+KoCmlVPM
 YlirysUz2BUQpHlbyNuRjNdUTl3pr/pDF3Zip5ZVoi4ZGgF0GAHr0HhLjA0FBfx9nyqqn5/Ez+k
 l8eASkDOUPDrmaa0=
X-Received: by 2002:adf:e401:: with SMTP id g1mr17113048wrm.415.1623664399069; 
 Mon, 14 Jun 2021 02:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrpMO5CnCYNcVQQdLt9Pc2LTifp3JUEofi4Sav9CIBJpvunFj8V9aEmt8uVPtovmwV10AyHw==
X-Received: by 2002:adf:e401:: with SMTP id g1mr17113033wrm.415.1623664398840; 
 Mon, 14 Jun 2021 02:53:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m7sm16474767wrv.35.2021.06.14.02.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:53:18 -0700 (PDT)
Subject: Re: [RFC PATCH V1 1/3] acpi: Eliminate all TPM related code if
 CONFIG_TPM is not set
To: Stefan Berger <stefanb@linux.ibm.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <20210612012102.1820063-1-stefanb@linux.ibm.com>
 <20210612012102.1820063-2-stefanb@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d097926e-5f55-e2a0-0cf9-42dfd71815d4@redhat.com>
Date: Mon, 14 Jun 2021 11:53:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210612012102.1820063-2-stefanb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "M : Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/21 3:21 AM, Stefan Berger wrote:
> Cc: M: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  hw/acpi/aml-build.c      |  2 ++
>  hw/arm/virt-acpi-build.c |  2 ++
>  hw/i386/acpi-build.c     | 20 ++++++++++++++++++++
>  include/hw/acpi/tpm.h    |  4 ++++
>  stubs/tpm.c              |  4 ----
>  5 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index f0035d2b4a..d5103e6d7b 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2044,6 +2044,7 @@ build_hdr:
>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
>  }
>  
> +#ifdef CONFIG_TPM
>  /*
>   * build_tpm2 - Build the TPM2 table as specified in
>   * table 7: TCG Hardware Interface Description Table Format for TPM 2.0
> @@ -2101,6 +2102,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                   (void *)(table_data->data + tpm2_start),
>                   "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
>  }
> +#endif

This makes the ARM virt machine build to fail for missing
the build_tpm2() symbol.

You probably need to split the patch in 2 and rearrange the
series:

1/ hw/i386    (current 1)
2/ hw/arm     (current 2)
3/ hw/acpi    (current 1)
4/ sysemu/tpm (current 3)

> diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
> index 1a2a57a21f..559ba6906c 100644
> --- a/include/hw/acpi/tpm.h
> +++ b/include/hw/acpi/tpm.h
> @@ -21,6 +21,8 @@
>  #include "hw/acpi/aml-build.h"
>  #include "sysemu/tpm.h"
>  
> +#ifdef CONFIG_TPM
> +
>  #define TPM_TIS_ADDR_BASE           0xFED40000
>  #define TPM_TIS_ADDR_SIZE           0x5000
>  
> @@ -209,4 +211,6 @@ REG32(CRB_DATA_BUFFER, 0x80)
>  
>  void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev);
>  
> +#endif /* CONFIG_TPM */
> +
>  #endif /* HW_ACPI_TPM_H */


