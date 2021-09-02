Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF83FEE6A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:09:06 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmSn-0002fr-7O
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLmJp-0003Ea-AU
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLmJn-0008Tv-74
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630587586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AujG2AosQEjNAAL5/EBUtj+phujArHcpCPX16gbG9lM=;
 b=YNU/OyUxFz9+0jGo54X9jQGhOYGDjbOo6I56zqZVXlIivU6xOjoEjhomdIDuF56qdL+xUP
 1d6qz/kJ7qK7z3yk9SkjyfrXI/lX590k4BeEipDr33kW7QyXW5ucJBMfhZL0/CpLs5wpNm
 6Mgfolbzd0BmBrzi3GJjwijhC+99yXA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-0DtC9icxPSGsWrBWX5NCIA-1; Thu, 02 Sep 2021 08:59:44 -0400
X-MC-Unique: 0DtC9icxPSGsWrBWX5NCIA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so968810wml.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 05:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AujG2AosQEjNAAL5/EBUtj+phujArHcpCPX16gbG9lM=;
 b=rz/7m6ghISGIvgRUmGkMZNyDeQ8zN1qPrMdPCjB3MQk1PS1mGT2RntfsDtZoeZ97Mv
 mBdkaHWtlso16kPnF8iXyuINwBkEwivgrRW+B60ckDTQm6fAA9ZsIExmWs5BV8DeSO19
 ftEuZZ/nj+5qqLetTe0DOG/pkNeB1SkzJRJowxKE9/2PKLck/Eoa7jU2JZcegyBsMH1D
 SRatDaNvUkELYh4cwmRJzoWY/YCgltnli9vH78NsLlngXspQ1AH0/8/nwHra6ViS8JMf
 QfzVy9nqmogFqzIxdHXok0qy5HzFLCfoQasby7nSfG7vZJtNg22DIt3mvDOm5SUm9OK+
 lggw==
X-Gm-Message-State: AOAM5327yvfLQSSQyPjOkDMrHyCzK54ua0wYGdfkjeffZhJW2RTibRCc
 UBz3XwKcofMp9qxEqg+ftY0uWZICNBsFvXJfGZ1VSIPrgScRyLgPCmLWhI4B6/tWdlRRis6SYGE
 V/80GL3TsxI4IwtM=
X-Received: by 2002:adf:f884:: with SMTP id u4mr3481156wrp.411.1630587582924; 
 Thu, 02 Sep 2021 05:59:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb+Zr2GRAwcuyx2sEYaWjZPoO6f5NYPEPPIVLU40PyXUHaJv6UTa7MVgYs+4hWqmCxYawcBA==
X-Received: by 2002:adf:f884:: with SMTP id u4mr3481125wrp.411.1630587582658; 
 Thu, 02 Sep 2021 05:59:42 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q14sm1791556wrc.31.2021.09.02.05.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 05:59:42 -0700 (PDT)
Subject: Re: [PATCH v2 06/35] acpi: build_tpm2: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-7-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <e6b532c0-9094-220d-ff7d-4732833ec6fc@redhat.com>
Date: Thu, 2 Sep 2021 14:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-7-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, mst@redhat.com,
 stefanb@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 7/8/21 5:45 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
> CC: stefanb@linux.vnet.ibm.com
> ---
>  hw/acpi/aml-build.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 176d086b25..057c64fb48 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2103,13 +2103,14 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                  const char *oem_id, const char *oem_table_id)
>  {
>      uint8_t start_method_params[12] = {};
> -    unsigned log_addr_offset, tpm2_start;
> +    unsigned log_addr_offset;
>      uint64_t control_area_start_address;
>      TPMIf *tpmif = tpm_find();
>      uint32_t start_method;
> +    AcpiTable table = { .sig = "TPM2", .rev = 4,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> -    tpm2_start = table_data->len;
> -    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    acpi_init_table(&table, table_data);
>  
>      /* Platform Class */
>      build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
> @@ -2147,9 +2148,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>                                     log_addr_offset, 8,
>                                     ACPI_BUILD_TPMLOG_FILE, 0);
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + tpm2_start),
> -                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
> +    acpi_table_composed(linker, &table);
>  }
>  #endif
>  
> 


