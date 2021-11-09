Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A72A44AA5E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:13:46 +0100 (CET)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNCL-0006oc-G4
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:13:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNAu-0005zI-Ed
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:12:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNAr-0004wc-3g
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636449131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CFktBgWCj9eZXIWie4+kNqsmZ3N9hqF/m1Ph5ttOsw=;
 b=f3XPhJ7FW9sMGk+FzwPqGdHG/J2AFWPJM1cuVFCY8wV3iRmSLPi2BZt9rWaOC3vDeoRUWu
 gMZ2IeLN5Z8zJKUry7bpSzN7JPlrwKGY9c6zZrmxHeDDjT91bnhX5HsTEE0sHrvZQXR6w3
 5cPwtK7DtRnenwNd4ab5FIiLDcUbhWY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-xFnWwuT9OO-tSYhEJ5W4kQ-1; Tue, 09 Nov 2021 04:12:08 -0500
X-MC-Unique: xFnWwuT9OO-tSYhEJ5W4kQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so1019469wmd.1
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 01:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8CFktBgWCj9eZXIWie4+kNqsmZ3N9hqF/m1Ph5ttOsw=;
 b=lng90sz5n5c+ST0UPIBbahrgdTi/SyMVKff6HtG8+S+BxtkdcgrWJrIGVmIdzYOcdt
 qWudYfVg/POUBwZiiDGGRm4BsqBIiymf68P+BuJSEqAUf1YPnribtviqQMfDIZ4A4dTZ
 ONOOFjZdgcu+SqH9T6Dq6nmOlehZ+tqTrl6JQUuD1jPqcgqG+kp2lznNpzj0YgZAEjld
 VivgJJ9Al+pEr9gRGKs0qS9wvmIcvJ0P2v5XlFQnXsfwasb/tt36nX38RPuvni4JT1PO
 aeWe8FfFJh7sADUsrH/gVleYEZHTdKQ1q6xunikwpK/OzY5PfN8jkiZQkpMbS5TwYe4K
 dM2A==
X-Gm-Message-State: AOAM530btrZrEQar1Qlolx3PCcN63dXKPkzGvjz9mLw1A2WCdLjoFP5a
 p/zHJQz9y4/W8jn1VII33bdqltVAkUyrboEp9np2jJiPMk2eDHcjrubzBAUMPcSDGsVI34qyWUF
 CYFmyW5fQoi3H6eg=
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr5622233wmj.12.1636449127055; 
 Tue, 09 Nov 2021 01:12:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyfF1837esZYPrp4oTyxO4ZdhVfc2LHJudxiwGcQbhaxElT7ow9F9neDi1Mr1M5/+3wPq+2A==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr5622191wmj.12.1636449126757; 
 Tue, 09 Nov 2021 01:12:06 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z11sm19204551wrt.58.2021.11.09.01.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:12:06 -0800 (PST)
Message-ID: <eae893e0-b808-8d45-1e4c-8f28081d9270@redhat.com>
Date: Tue, 9 Nov 2021 10:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, marcandre.lureau@redhat.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 01:46, Stefan Berger wrote:
> From: Stefan Berger <stefanb@linux.ibm.com>
> 
> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: #708

https://gitlab.com/qemu-project/qemu/-/issues/708

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..09456424aa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  
>      Aml *dev = aml_device("TPM0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>  
>      Aml *crs = aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a3ad6abd33..d6d3541407 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev = aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device")));
> +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>                  } else {
>                      dev = aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
> 


