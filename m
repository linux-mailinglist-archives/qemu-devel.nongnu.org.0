Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832448DA37
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:57:40 +0100 (CET)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81Xg-0005GK-Au
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dima.orekhov@gmail.com>)
 id 1n800n-0002lz-U7; Thu, 13 Jan 2022 08:19:29 -0500
Received: from [2a00:1450:4864:20::132] (port=37763
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dima.orekhov@gmail.com>)
 id 1n800m-0002Vd-FI; Thu, 13 Jan 2022 08:19:29 -0500
Received: by mail-lf1-x132.google.com with SMTP id m1so19400241lfq.4;
 Thu, 13 Jan 2022 05:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ysCH4LN50EmbLz+B8J9u9vR6AMfKit2sQUICrWSsF/Q=;
 b=LRL9HcddZKbnAsrCNgX5+RP+aUb8wPZpf/76OT5c761drx9ohRdiHTEGWMgUlfojE7
 fv29DMQn5af1GBSMGOLRpeB6iZmsD/kFwaatENGfoX0yihCDQ/+nc7fD5e49BhikFZ9M
 xd8Jo7m27FsEd33/8Cgl/2tOn/u2QmolDp6lUjZxnY1jHpOEfunl4BshJ5m4v7is3ibu
 gmSdejKGWK1WRdrrFCRbciR0gRHm0e/UvEkyVz2JE1UMY4tRsGqYWI+ZDsaYQunJpJpx
 Iri/5pdDK1cr8WPifNpeeg79T3d+zZ0qnrRRBE1k4/971fcsqWAs999KuQA+I0Ec+btt
 rjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ysCH4LN50EmbLz+B8J9u9vR6AMfKit2sQUICrWSsF/Q=;
 b=3YK+++76fBeiZmweJ+KEhP5wVqleHhcHewFEPlKT1BMC+FjjI/T2ZZSQ9k0RAHRQ5i
 qoejBdZGu37xQer3yYPWvzC7x0EdX66e8aOKOkGV65hYNDAeOIp+l28Di+LxruR079Rk
 uUKHgQ+B+LVDbOTNcgACFrsytkNzDhv9GsHRG0Dbg0k8cKoqXFwg2dHuI6wrgouMmXzB
 5zKb5Qt7anVFyySktOcLx0pMJ/3YhRKPVAQ61ZlFNqvaCloSosP9RtGcFTLvMsK2w9xK
 oKaPcfc3n1hwOHg9+1VWTvHW9tiTxdfYNACVr8xkuP53uICNqRWv1RJhXWEiz2ZEAw1j
 238g==
X-Gm-Message-State: AOAM533rIB1/5p29AHeR3il8syb8VNAoHyj7RvvnMmuqzYsSgUxLBH31
 lQt5KEe0dlLA5uoZlKMa8H4=
X-Google-Smtp-Source: ABdhPJxQvE7JKjfSSOxzOsg2zDBlszyXZ2SGzHwyznLTHkN+vZm3Z3ypBUiI37AHHaDCUwejeObLPQ==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr3339253lfq.384.1642079966140; 
 Thu, 13 Jan 2022 05:19:26 -0800 (PST)
Received: from [192.168.0.4] (ppp85-140-218-44.pppoe.mtu-net.ru.
 [85.140.218.44])
 by smtp.googlemail.com with ESMTPSA id t17sm260684ljj.38.2022.01.13.05.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 05:19:25 -0800 (PST)
Message-ID: <79aab88b-fcd4-a763-5d73-340a29799a3f@gmail.com>
Date: Thu, 13 Jan 2022 16:19:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <a98aeef0-aa94-0555-bcee-d19a79e37ad6@gmail.com>
 <alpine.OSX.2.20.2201131550280.66766@athabasca.local>
From: "Dmitry V. Orekhov" <dima.orekhov@gmail.com>
In-Reply-To: <alpine.OSX.2.20.2201131550280.66766@athabasca.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=dima.orekhov@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 09:54:20 -0500
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-stable@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/22 13:22, Ani Sinha wrote:
>
> On Thu, 13 Jan 2022, Dmitry V. Orekhov wrote:
>> I can't apply the patch to the qemu-6.1.0 source code on my own.
>> There is no acpi_table_begin function in the qemu-6.1.0 source code
>> (hw/acpi/aml-buld.c).
>>
> Try the following patch :
>
>  From 10620c384bf05f0a7561c1afd0ec8ad5af9b7c0f Mon Sep 17 00:00:00 2001
> From: Ani Sinha <ani@anisinha.ca>
> Date: Thu, 13 Jan 2022 15:48:16 +0530
> Subject: [PATCH] acpi: fix OEM ID/OEM Table ID padding for qemu 6.1.1
>
> Replace whitespace padding with '\0' padding in accordance with spec
> and expectations of guest OS.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   hw/acpi/aml-build.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index d5103e6..0df053c 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1703,9 +1703,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
>       h->length = cpu_to_le32(len);
>       h->revision = rev;
>
> -    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, ' ');
> +    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, '\0');
>       strpadcpy((char *)h->oem_table_id, sizeof h->oem_table_id,
> -              oem_table_id, ' ');
> +              oem_table_id, '\0');
>
>       h->oem_revision = cpu_to_le32(1);
>       memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME8, 4);

The problem has been solved. Thanks.

Tested-by: Dmitry V. Orekhov dima.orekhov@gmail.com


