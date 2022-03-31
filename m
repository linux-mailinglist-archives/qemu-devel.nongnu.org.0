Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236F34ED7B9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:22:52 +0200 (CEST)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrx5-00053r-7k
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:22:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZru8-0002mW-Fa
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:19:49 -0400
Received: from [2a00:1450:4864:20::432] (port=42710
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZru7-0005u0-3F
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:19:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id r13so33028864wrr.9
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KCU7/kj8HYU5VvAMkuilOs/cF6dBXCWulrDwOU0DkJw=;
 b=QI1FqVJyr7132TWItPTtgoMLsdp1vN1I/kJGaGAQt2Q4EHamAg2tN1BdYlIlhOTXVQ
 KP6cBBxxOv1605Bko8ctooA03iE8b3aCaKudPZTho6OVQtr4vBjjnsYnfWNKGgBk/GlG
 L9UwiZaKJDCpc/N63eLRj9Strbm815byLmnEysypuVmd1UAz305lB6MhXgdD1pZ84SZF
 ME2jWKy0EA79MJn0laJIQ6ENPHaq3a2nENP6tWzuwoyXF3kSyCPOnGieB39XM4KpuxwT
 E3jEQB8R53BdoVpQs2RXbsckw+Kcivv7gVihlPeNpzHruJvm/iLM6S71yFiauyxo+QnO
 wpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KCU7/kj8HYU5VvAMkuilOs/cF6dBXCWulrDwOU0DkJw=;
 b=0CWjKkv+VrwXGis/lNdIZ07d7GPp/YPyctcc/yF+UcD4AzDiuhQ30zgiHNjhdmoP4W
 +VnmiJNKhtW84B58c3qJMtUAeEFuy2NeU33q6wL+f+inVu3siRVA3pJ5yndw5eodjtbX
 PPKPMbB4iVH+QRup2wFoYqOB1GuWSLb8LncMwiE77WSnq6vDny4qR0n6UB8N+cmGNx3z
 NOwn9odEdGeA2H/GCA7tj2pVwmIEdze9vDR1vzlPmpeX63vWq80msK0rDRvsUQuEmMFV
 mXhTJCsW/EUypHPw9qOeRmGluIUHLGkgOsj3bun8i1eLcg76W3XoHAFLcpLwNHUXV8qM
 bi7A==
X-Gm-Message-State: AOAM530JBQpx13yi4V5QZrJ6yW+HYQwa0h22NdEbAXAZ50KvVXGbCjX+
 ECDN3teK9m0rLUMK9X2nWMoWBurQww0HSw==
X-Google-Smtp-Source: ABdhPJyMO6bqHCdOnR1p5fOsuHA/FiS8gHSZYxQBBXFy87XRum4teteFIVugxcFLuGi4Hxm5cZ7E3A==
X-Received: by 2002:a05:6000:1546:b0:205:d7c8:3173 with SMTP id
 6-20020a056000154600b00205d7c83173mr3560506wry.204.1648721985573; 
 Thu, 31 Mar 2022 03:19:45 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:49f5:f512:3c8e:a801?
 ([2600:70ff:f07f:0:49f5:f512:3c8e:a801])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm7109962wmz.43.2022.03.31.03.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 03:19:45 -0700 (PDT)
Message-ID: <7ba04b48-31cb-1780-83fc-bee1c5209412@gmail.com>
Date: Thu, 31 Mar 2022 12:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 4/5] rename machine_class_allow_dynamic_sysbus_dev
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220330161215.235231-1-damien.hedde@greensocs.com>
 <20220330161215.235231-5-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330161215.235231-5-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/3/22 18:12, Damien Hedde wrote:
> All callsite are updated to the new function name
> "machine_class_allow_dynamic_device"
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   hw/arm/virt.c               | 10 +++++-----
>   hw/i386/microvm.c           |  2 +-
>   hw/i386/pc_piix.c           |  4 ++--
>   hw/i386/pc_q35.c            |  8 ++++----
>   hw/ppc/e500plat.c           |  2 +-
>   hw/ppc/spapr.c              |  2 +-
>   hw/riscv/virt.c             |  2 +-
>   hw/xen/xen-legacy-backend.c |  2 +-
>   8 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

