Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B767649C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gBS-0007nA-KW; Mon, 12 Dec 2022 05:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4gBQ-0007mn-LO
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:37:16 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4gBP-00012E-30
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:37:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id ja17so1980938wmb.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SDXsM3jw7C3YssGp/4pvGNKs5Ad7mazZRUhDiX6ksIw=;
 b=kF82tdvY4x8XPVysPLsbcxMjgtFM/LM8Q9Q1JUGpKjPJI5uDYS8KA6FEpejubVRdN/
 abxeFS7GL+LbLr01a2b8lXbfAYtiNvLKSYnv57xQNcAGpiCuvOHLmBtuOly1UwnacPG9
 1H3aSsizpp7p2CIuuHs5QDWmaqdbpAwb/NWyv5Ft2mbXoddjUA7Gcpxy6Ez4jnQd4sHw
 euLWzhkWxWOZdlyUbjJTN3dUO17H2g9KA8kPjVHtGZtcGGnuJuy8lvHcQE3jKlfy3kxW
 kUsIwaAMmpYGWQiauJ6/t+1bOcqPP3A8SV74fEHPzxt3qvKdnDCmySurk0RLdV0mC8kE
 7VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SDXsM3jw7C3YssGp/4pvGNKs5Ad7mazZRUhDiX6ksIw=;
 b=scd4RzOtjGnyx6vnjStSIqNmRf3vKdGsxkVzAScbt6VPekxZGkD0dibxbGcp7k1rry
 0u9GWf5XZzrtrcidWRTZjqAacTcqelxH59bdMQzU9uGdZf7uFAOzt7BlGFgHaxCgqPXr
 nzy972HgRt6G2CKephlgAvfqiRG8pcJxFEfQ597IVarO0RI2nClOh2WErbboaEjzgvZy
 PsBkI0MhwiSmNoO2M7qK3T70EUJs0+TRXaCQOoB1v5LJzyV7OS41ClSwzEVug12zXtwj
 achuc6iPYMPi9MICNWeg+MKND50e2CKrwxOJYBn4lz+hkPy50oJ+7FgF+MrCI1sgCT+x
 OOQA==
X-Gm-Message-State: ANoB5pl6xQQuM48/qndI+uk2s8dE6YxWwHrHk6RL0/pYOqCAx1JGtrEC
 STNH50gEY+3Xsl4LWByTtcabSg==
X-Google-Smtp-Source: AA0mqf6MLqkUBRINay2fBWBnSZWO75wC/vFnvkQYk7vn6QS7LxxVzE3S4OY9n2jp/ps0PIS7CFwqWQ==
X-Received: by 2002:a05:600c:3d0d:b0:3cf:e95b:fe71 with SMTP id
 bh13-20020a05600c3d0d00b003cfe95bfe71mr11462562wmb.9.1670841433575; 
 Mon, 12 Dec 2022 02:37:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c511100b003cfa3a12660sm28259180wms.1.2022.12.12.02.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:37:13 -0800 (PST)
Message-ID: <8e05d6fa-1792-bb7d-cbf3-ce3a96e64e45@linaro.org>
Date: Mon, 12 Dec 2022 11:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/5] hw/isa/Kconfig: Add missing dependency to VT82C686
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221207231205.1106381-1-shentey@gmail.com>
 <20221207231205.1106381-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207231205.1106381-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/12/22 00:12, Bernhard Beschow wrote:
> Both ACPI_PIIX4 (directly) and ACPI_ICH9 (indirectly) require ACPI to be
> selected. Require it for VT82C686's ACPI controller too for consistency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 0a6a04947c..bc2e3ecf02 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -63,6 +63,7 @@ config VT82C686
>       select IDE_VIA
>       select MC146818RTC
>       select PARALLEL
> +    depends on ACPI

The VT82C686 *provides* the ACPI interface, so here we want to "select"
ACPI (if we need a VT82C686, then ACPI will be available).


