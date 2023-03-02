Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE26A7FC7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfz0-0007wI-Nm; Thu, 02 Mar 2023 05:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXfyp-0007nk-Tm
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:16:12 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXfyj-0000RN-FH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:16:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k37so10361512wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677752152;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2gr+fj5rz16xEpjDylDSjGoOmykD65FA325aFCo2PeU=;
 b=uSsx2QIMe6fha7YNoY07idmPjqK4jCHIuILRszQr5urqGUidbwCYV77qH3XxBLEgBS
 inPKAi5VdwTEh8VbkRglquHE7KfOcp32RXv5mOUZQO8fHQVkoTeRYLGri9pbA+wCTEiM
 Xu9vLO0WgdwTtIktJxok2jlfqYvA8XGnDunLI8NfPFxvpF7ptv1c+00efPAkByurOevb
 ftABbbHo3ZzqOtGMJXhFi7hHLderSz2VJGKdEfvVGBAnYdyjP8OACgftAPV1VdwGnXv6
 TXc/Zgzz0DNjGoawNfHB12rKqs39xi4EA+p+2sd32M3MjydGoOxkq5nWxJlQvoqcZBX0
 z4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677752152;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gr+fj5rz16xEpjDylDSjGoOmykD65FA325aFCo2PeU=;
 b=1dhFr2eYvYFjXuwBZX/hoU4keyRudXlynT5MLEjpJbNXQI3LkPy89AElG4Z89TQ2QM
 IJhrrBJvK/t0vXGE3Z1qGp+DQoYil6IO41Pi15/yNE3MQOMagldfkBYIX0PEAnlSoSJ7
 k4Ev5m4uZy4Gm0wpkNwRbM70K4W4ngqVAFlIuhUfZ9buj+4B48kvJYtBqLb1LUD8Ezld
 FJns56z3pFhJWDctX/CDmTrsJNpsft1XNYUjTMEmBw82mwohODbNOvhXwQzS4n/5vJbV
 bdLti1G3zV+drgqZogcX67IPJ23vBKh8hANFiQEOufd4chqktJYWmf5oV68xsNEajlyE
 fiyA==
X-Gm-Message-State: AO0yUKXQtapLkN1vOOFaDQgBvZV+SxMwQMCCRzcqMTdwagSlOemdlzCJ
 zQBGr5HIH6zDaB/+pQ7/219HUQ==
X-Google-Smtp-Source: AK7set+F9dZ3FrvAkJ30B5dBnhwhmSZHNONHPm+1qbFXHEi8TjnvH7MHKIpF5bgz9hT+aZzuQPHgYg==
X-Received: by 2002:a05:600c:3ca5:b0:3e8:490b:e286 with SMTP id
 bg37-20020a05600c3ca500b003e8490be286mr7207336wmb.14.1677752152552; 
 Thu, 02 Mar 2023 02:15:52 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 hg26-20020a05600c539a00b003e20a6fd604sm2509698wmb.4.2023.03.02.02.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:15:52 -0800 (PST)
Message-ID: <cd21f3b5-e6cb-7fbd-b66c-712edb416088@linaro.org>
Date: Thu, 2 Mar 2023 11:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/data/acpi/virt: drop (most) duplicate files.
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20230302072211.555383-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302072211.555383-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/3/23 08:22, Michael S. Tsirkin wrote:
> When virt ACPI files were added, lots of duplicates were created because
> we forgot that there's a no-prefix fallback: e.g. if
> tests/data/acpi/virt/APIC.memhp is not there then test will use
> tests/data/acpi/virt/APIC.
> 
> Drop these.
> 
> These were found with
> $find tests/data/acpi/ -type f -exec sha256sum '{}' ';'|sort -d|uniq -w 64 --all-repeated=separate
> (trick: -d does a dictionary sort so a no-suffix file ends up first).
> 
> Note: there are still a bunch of issues with duplicates left even after this.
> 
> First pc and q35 are often identical.
> Second, sometimes files are identical but not identical to the default
> fallback, e.g.
> tests/data/acpi/pc/SLIT.cphp and tests/data/acpi/pc/SLIT.memhp
> or
> tests/data/acpi/q35/HMAT.acpihmat-noinitiator and tests/data/acpi/virt/HMAT.acpihmatvirt
> 
> Finding a way to deduplicate these is still a TODO item - softlinks
> maybe?
> 
> We also need to make rebuild-expected-aml.sh smarter about not creating
> these duplicates in the 1st place.
> 
> And maybe we should use softlinks instead of relying on a fallback
> to make it explicit what version does each test expect?
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   tests/data/acpi/virt/APIC.memhp   | Bin 172 -> 0 bytes
>   tests/data/acpi/virt/APIC.numamem | Bin 172 -> 0 bytes
>   tests/data/acpi/virt/DSDT.numamem | Bin 5196 -> 0 bytes
>   tests/data/acpi/virt/FACP.memhp   | Bin 276 -> 0 bytes
>   tests/data/acpi/virt/FACP.numamem | Bin 276 -> 0 bytes
>   tests/data/acpi/virt/GTDT.memhp   | Bin 96 -> 0 bytes
>   tests/data/acpi/virt/GTDT.numamem | Bin 96 -> 0 bytes
>   tests/data/acpi/virt/IORT.memhp   | Bin 128 -> 0 bytes
>   tests/data/acpi/virt/IORT.numamem | Bin 128 -> 0 bytes
>   tests/data/acpi/virt/IORT.pxb     | Bin 128 -> 0 bytes
>   tests/data/acpi/virt/MCFG.memhp   | Bin 60 -> 0 bytes
>   tests/data/acpi/virt/MCFG.numamem | Bin 60 -> 0 bytes
>   tests/data/acpi/virt/SPCR.memhp   | Bin 80 -> 0 bytes
>   tests/data/acpi/virt/SPCR.numamem | Bin 80 -> 0 bytes
>   14 files changed, 0 insertions(+), 0 deletions(-)
>   delete mode 100644 tests/data/acpi/virt/APIC.memhp
>   delete mode 100644 tests/data/acpi/virt/APIC.numamem
>   delete mode 100644 tests/data/acpi/virt/DSDT.numamem
>   delete mode 100644 tests/data/acpi/virt/FACP.memhp
>   delete mode 100644 tests/data/acpi/virt/FACP.numamem
>   delete mode 100644 tests/data/acpi/virt/GTDT.memhp
>   delete mode 100644 tests/data/acpi/virt/GTDT.numamem
>   delete mode 100644 tests/data/acpi/virt/IORT.memhp
>   delete mode 100644 tests/data/acpi/virt/IORT.numamem
>   delete mode 100644 tests/data/acpi/virt/IORT.pxb
>   delete mode 100644 tests/data/acpi/virt/MCFG.memhp
>   delete mode 100644 tests/data/acpi/virt/MCFG.numamem
>   delete mode 100644 tests/data/acpi/virt/SPCR.memhp
>   delete mode 100644 tests/data/acpi/virt/SPCR.numamem

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


