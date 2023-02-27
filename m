Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3CA6A413C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc6W-0005ef-Bl; Mon, 27 Feb 2023 06:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc6M-0005eJ-OW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:55:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc6K-0000hd-E8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:55:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id bv17so5921102wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EWSrkYudlSki4kE8Xpb0XBXqzfN+yMyfgZ5IYXHoN28=;
 b=icGRrTcQ8pjJ34iw1lGFk/wzzUAjMMj7liGGCxgi1wpJ4kFaytxhvtjEMV4D4nWNk/
 pzPwmS+sQu167FIT1oNxOAy3f2ow0yfx+rpzyf7q8n6wMFGiSECHOHPKhltj2FK99CbB
 V1vOxfoHTlm6eSahvS7Bi07/+gHcDtVfrZ2v/hukEX4+5s2wp8KVPonB7EsNE3uUtNSF
 vEcEn5U7udJAJdB/rvNUYpw6l+sJOYAUKYALmmjXU8Jj+FnvVxV+D0Q43+Ny2A/WMqEy
 gsInWg+iMnMGRJZ4rfUn9jD3MbTP2kMEMN8nziYCDcBqsQ8PNrSiofOexKBZ18NBIxDb
 J4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWSrkYudlSki4kE8Xpb0XBXqzfN+yMyfgZ5IYXHoN28=;
 b=dNUJwPSS1VE0eyLEaraBkIzLByovJP+hNhiBFBHv3mx+qJ2KPE++KgWlTeF034UBVL
 Q0mMYLxO1frZ3CkxwlMNoU3tJdG738ETfBLK+QJUSjYNN6TX2q8oeDD3+ymf9oIz0sBu
 CNw7qnFfLyPUNtKSmpZspoRW6Wc3f5RlOzlam6epQMSBOBVwEZogZWjMMfhTJINTAjQp
 2BkUY3snoXUd3o5GWDDiNc6jo/XN8HINuwr9V7w+aZMSiNq4e8G0647nYvZb1RiHzoj2
 bg7WRtRX7kfUybY5pJa9fnb4mQgK1Ge67H+ZWI8iU1jLjgjZeh2Z09EHurgYH4SD7z6f
 UOvg==
X-Gm-Message-State: AO0yUKWAqT8PVRvx+MXkD5TFumtPMsdP04cPmrJgRzA4eOa4Waw3sEk8
 WXfHiIQZDg0+uBOFnFxZXYJ3CQ==
X-Google-Smtp-Source: AK7set+eTfs1E9FF+ZKbLcbibWau5PzIm8VLTCl+yhEOqWjECsv6nlJxCorTNY/cAZ4kJ4GeCaCpPg==
X-Received: by 2002:a05:6000:1049:b0:2c7:6bb:fb7a with SMTP id
 c9-20020a056000104900b002c706bbfb7amr16920753wrx.54.1677498926888; 
 Mon, 27 Feb 2023 03:55:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k28-20020a5d525c000000b002c556a4f1casm6833167wrc.42.2023.02.27.03.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:55:25 -0800 (PST)
Message-ID: <7e9d9d2d-2cc9-8d97-9c34-39e888882a6f@linaro.org>
Date: Mon, 27 Feb 2023 12:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 07/12] hw/isa/lpc_ich9: Connect pm stuff to lpc internally
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> Make TYPE_ICH9_LPC_DEVICE more self-contained by moving the call to
> ich9_lpc_pm_init() from board code to its realize function. In order
> to propagate x86_machine_is_smm_enabled(), introduce an "smm-enabled"
> property like we have in piix4.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/acpi/ich9.h | 6 ++----
>   include/hw/i386/ich9.h | 2 --
>   hw/acpi/ich9.c         | 8 ++------
>   hw/i386/pc_q35.c       | 5 ++---
>   hw/isa/lpc_ich9.c      | 8 +++++---
>   5 files changed, 11 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


