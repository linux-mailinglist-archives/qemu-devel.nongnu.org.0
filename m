Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2354DA290
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:43:20 +0100 (CET)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUC8d-0005nF-AW
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:43:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUC54-0002bq-LF; Tue, 15 Mar 2022 14:39:39 -0400
Received: from [2607:f8b0:4864:20::102f] (port=51058
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUC4z-0004rU-Gv; Tue, 15 Mar 2022 14:39:35 -0400
Received: by mail-pj1-x102f.google.com with SMTP id m22so270778pja.0;
 Tue, 15 Mar 2022 11:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1r8IaytRp27ExjX9rB0D2iSm3KjyZx3WPI58s3YMr4A=;
 b=AvSjhMHWAZeWS730g98AZs7HWBYJl0E/OeXqjymZMPCH3TKDaP2ThKl/qPP0xdDhGL
 JLpRnJt2bGbff42ZwV+b24S9ypehOK+MQVuCpY5ISEJSn/YvGG4btG6AA4eLqZYRgUXl
 cjPM5z1qBOIdsuHZtA6xbmRwRMo+mjdl6o9zFSVxHGkHTXKlRKP17xsP0B6bmdT4JlP1
 peBQbKwn6DyW+qg9MSR4DvLYv87VUnotK6iZUrgUq+yvZs3rcHP4lFgvhEktM5dDQdCC
 J9WQL8OYacBZ2agYGeKV08vPlFoCImxxX0fsHskGf4GpLjIE/xM24CqQqC4w8sbTkC31
 +Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1r8IaytRp27ExjX9rB0D2iSm3KjyZx3WPI58s3YMr4A=;
 b=COegzL9mii+HjQevdoxpkUxEYxzxPQTCB+wNTfZkwDGrpCPd1fQfjtPejNiYYEW3/j
 eQnGU9QBgkYZey6odPgCZNnjRQ60ExK6oYXaBlVpDCF2DPrnyUo7PPhoiTfSGOHqwnE3
 VgHzNfddmkig2dtwGXQYogdNUW4CDk3pbKwhPFHZ9fzb5wiw5JY+Peh9oDatsg8++cW8
 EMar/NP14n1rOC3qu/DlVjuMYDFP5/AhGeteWmZeIhuLkG7Syv3IlZxTp2RNpD9G5RqH
 0N2k+KceB0di8eGtnXsxnvgbzowhh3uWPz89d0M8fa7JSwt1U+6gChDrmh1kVsi67zEU
 OzVw==
X-Gm-Message-State: AOAM530m+CkCEOhQmvY+bVHVhfIXpQxLBZi45nf5HmHB3SbjywDvCJiM
 erIAwlYEjkTCFyjZ7x8TIoo=
X-Google-Smtp-Source: ABdhPJwnzgUpSoD5HfW9rYdicaEJMZWKfFcrz7MCU82APn7V3yK7fDsNGdJ7/ajm4DlzenewGNuz+g==
X-Received: by 2002:a17:902:f686:b0:151:ca86:e1be with SMTP id
 l6-20020a170902f68600b00151ca86e1bemr30105422plg.16.1647369571278; 
 Tue, 15 Mar 2022 11:39:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 oo16-20020a17090b1c9000b001b89e05e2b2sm4118325pjb.34.2022.03.15.11.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 11:39:30 -0700 (PDT)
Message-ID: <206283a0-3977-894f-6907-e9c51db554ba@gmail.com>
Date: Tue, 15 Mar 2022 19:39:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GICV3_TCG is unset
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 peter.maydell@linaro.org, drjones@redhat.com, f4bug@amsat.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220308182452.223473-1-eric.auger@redhat.com>
 <20220308182452.223473-3-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308182452.223473-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/3/22 19:24, Eric Auger wrote:
> In TCG mode, if gic-version=max we always select GICv3 even if
> CONFIG_ARM_GICV3_TCG is unset. We shall rather select GICv2.
> This also brings the benefit of fixing qos tests errors for tests
> using gic-version=max with CONFIG_ARM_GICV3_TCG unset.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - Use module_object_class_by_name() and refer to the renamed
>    CONFIG_ARM_GICV3_TCG config
> ---
>   hw/arm/virt.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46bf7ceddf..39790d29d2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1852,7 +1852,12 @@ static void finalize_gic_version(VirtMachineState *vms)
>           vms->gic_version = VIRT_GIC_VERSION_2;
>           break;
>       case VIRT_GIC_VERSION_MAX:
> -        vms->gic_version = VIRT_GIC_VERSION_3;
> +        if (module_object_class_by_name("arm-gicv3")) {

Too late, but why not use TYPE_ARM_GICV3?

> +            /* CONFIG_ARM_GICV3_TCG was set */
> +            vms->gic_version = VIRT_GIC_VERSION_3;
> +        } else {
> +            vms->gic_version = VIRT_GIC_VERSION_2;
> +        }
>           break;
>       case VIRT_GIC_VERSION_HOST:
>           error_report("gic-version=host requires KVM");


