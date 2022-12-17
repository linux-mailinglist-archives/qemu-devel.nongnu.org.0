Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E039564FD0F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 00:36:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6gj1-00019G-Jj; Sat, 17 Dec 2022 18:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6giy-00015j-03
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 18:36:12 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6giw-00051t-GJ
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 18:36:11 -0500
Received: by mail-ej1-x633.google.com with SMTP id u19so13948616ejm.8
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 15:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VphACfB/7phHMqrkMR/3jr+u9i8pF2YALiB/psTTwCI=;
 b=gU7OColdC5Z+fW+EwLc/9RuspQ+iw+FcNX4ZhQZVlldEXpbasGywPfBf03MWHzwKBL
 0HtnjstTWsCzyLMGZIP9JvvOFwxpfQqEs9krKkFQcmtJMp/z1WySxBXpW6txm3Xr+rRU
 AOjL8RBErRo04ulHDoq/0zYgYm6zYyEnxIwRK/puOMRIkDgLyZz91SHwqYeVo3d0/Y78
 Jw8S8gg0pcWUfKbxgqJ8L0WIJIDnN1kxcgDLa1dhME9BtRkMpHL/EeGeJjK94t4or9oT
 3bfDgMXb90II4brlfehwDi9mB8ObrO9rjcFt8NeaEiqkW3RJ6+XpwXK5hOCDpuWxZ63P
 npnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VphACfB/7phHMqrkMR/3jr+u9i8pF2YALiB/psTTwCI=;
 b=PriVaSXlFHfncV3BiodycVu93kOlXR4Y+NL1Qhnx/Wuwrd64bHh9QDqb+/o7KRgxiA
 CZDCXGcw/KBRk0+AdUlfrk4D/aJyUSS66/orNkdDPEERef6LxJC54PLuI2ApS/09o1Bk
 c/BOPPfHwpBrnQr2cc6gqQm5Vl9Bct7wICvncdIsN7Gacny/VFB5C0uunho2MCLeJt2B
 rmuSTGF2v2dr23WBWaM50CO8qX85wrnD0U9N1n+Mzk5AurCdhgrtH+xW1aYw1cyCabtP
 b+/Bzu4ReOg1T0jpPyP9UIHuhHBfIrmYwLQChwn64TR7UjZ/NwdDyZlxCG3jm393xYyJ
 t/4g==
X-Gm-Message-State: ANoB5pm57dwnQ8ZkZ+raG/+4+svBMhX+19KF6F3TNNWauc1pfM92LpxE
 Kp21plvzl/iO+ZzW9shNYA6Xiw==
X-Google-Smtp-Source: AA0mqf5qiRUgOEIJTvyS4Z1drtvU4Cqgw0y9QfvS22g8pniB9zlhCK1byUbQOBwFBj3ypunqJ5MJIw==
X-Received: by 2002:a17:907:789a:b0:7c1:2980:7fd8 with SMTP id
 ku26-20020a170907789a00b007c129807fd8mr34313916ejc.17.1671320169071; 
 Sat, 17 Dec 2022 15:36:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a17090671d000b0079800b81709sm2489221ejk.219.2022.12.17.15.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 15:36:08 -0800 (PST)
Message-ID: <046af7cb-96ed-8292-4ae4-039025557275@linaro.org>
Date: Sun, 18 Dec 2022 00:36:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/7] hw/ppc/Kconfig: Remove unused dependencies from
 PEGASOS2
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-8-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216130355.41667-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

On 16/12/22 14:03, Bernhard Beschow wrote:
> Removes the following dependencies from ppc-softmmu:
> - CONFIG_ACPI_CPU_HOTPLUG
> - CONFIG_ACPI_CXL
> - CONFIG_ACPI_HMAT
> - CONFIG_ACPI_MEMORY_HOTPLUG
> - CONFIG_ACPI_NVDIMM
> - CONFIG_ACPI_PCIHP
> - CONFIG_ACPI_X86
> - CONFIG_MEM_DEVICE
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/Kconfig | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


