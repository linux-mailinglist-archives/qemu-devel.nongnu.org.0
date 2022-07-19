Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D757951C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:17:42 +0200 (CEST)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiQH-0006ld-Qz
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiGd-0000Fe-71
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:07:47 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:36732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiGR-0004JS-MN
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:07:42 -0400
Received: by mail-qk1-x72a.google.com with SMTP id l3so8436586qkl.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RIPPBejWgDMcQwzPxOUCCwT96Ac7zfMGL8Gzx420Z0s=;
 b=AmUCHnxZi7Mvm67aD1woBrRgJa34WHW7KcPyXvSZbIXxb3Avub1tX3ZHydnhIydR9x
 f1tp8attq5hfIo+hqtnYazlmJK4TePqCAKd8sfbGrS0iQePvpw9/nqzAu3sx+d/suN4o
 1ry4FSiYSKEOhc19UIIcUwQQp3Rhrh1lg0pgRBsUuQWNr09YZ+UaN0+EoEWS36FF+jmu
 H/18mqWTRhsYvN3SUjL9F/5yxQM4jV0Hc8ZgI539oKTI155u7riX5OpZXnFd6v1wgUy6
 bU7fLG7f67aKlWpgcNNXLLXfRzVUbDyY1MQqB2usiVWAo9NHJclDtdgjwOqQH0yn8rbt
 ZHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RIPPBejWgDMcQwzPxOUCCwT96Ac7zfMGL8Gzx420Z0s=;
 b=6K9Nvs6vx8NpOKGMXp4PSbPAXzGmRRax6yzs0ZOMyp9UywU0Y7Y4mjnqp3iVDoeZVW
 1DYkCFV5yDOvL/dt7n40JJUYRU8oppPlNrIlaz1sUh0GjKKMoxzvoNPwIMBNenq1aUNa
 quMyuVb4mncqCP6ne41wRU4m296rd7lggr0NF7s4M16BAn82knx+0G3eNlqXFY7dmxi0
 D+yoNK5VmBsp4WaM5M8kgC/VsfIIqMu06n/269ua9D+o9HNf5WMCAQqtAMnNlkrIxPX9
 7LDmo8flQHUkI7kvZIWEnJEiqeqpqPe9NQOCLSgTGhtvSFJNirvoutrs1yJhskX7hAYH
 xyVA==
X-Gm-Message-State: AJIora83dHByBsGVD5ehk67kMJktCB7xjIvHNNruQ5ribia6RjuWoZ49
 GuP6+V3uXOPbh9bgB47GXft+EA==
X-Google-Smtp-Source: AGRyM1ux8akt9r72Ipdc8deiLCfUkCJNo7BQCZMcbFQvYNxWpOXZs+w+rpft9xwPXnKUXBYo3b2SRA==
X-Received: by 2002:a05:620a:2996:b0:6b5:e434:66b3 with SMTP id
 r22-20020a05620a299600b006b5e43466b3mr6422225qkp.616.1658218050750; 
 Tue, 19 Jul 2022 01:07:30 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 fb10-20020a05622a480a00b0031ecb762677sm6287507qtb.66.2022.07.19.01.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:07:29 -0700 (PDT)
Message-ID: <0cae38b9-ac5e-2139-62b5-d05673853e70@linaro.org>
Date: Tue, 19 Jul 2022 13:37:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 6/6] hw/loongarch: Add fdt support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-7-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712083206.4187715-7-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/12/22 14:02, Xiaojuan Yang wrote:
> Add LoongArch flatted device tree, adding cpu device node, firmware cfg node,
> pcie node into it, and create fdt rom memory region. Now fdt info is not
> full since only uefi bios uses fdt, linux kernel does not use fdt.
> Loongarch Linux kernel uses acpi table which is full in qemu virt
> machine.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/loongson3.c    | 136 +++++++++++++++++++++++++++++++++++-
>   include/hw/loongarch/virt.h |   4 ++
>   target/loongarch/cpu.c      |   1 +
>   target/loongarch/cpu.h      |   3 +
>   4 files changed, 141 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

