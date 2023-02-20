Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82569CF29
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 15:17:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6xG-0001RD-DW; Mon, 20 Feb 2023 09:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU6xD-0001Qm-Dh
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:15:43 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pU6x8-0003Wo-H8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 09:15:43 -0500
Received: by mail-wr1-x434.google.com with SMTP id c12so1371294wrw.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 06:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xQCb1ix8pNS+owqIqISbUEGAgwSj/rWUCCNBqA9XyJ4=;
 b=S0QZmUyXNbfOuK49Loj+B7q4weWvEakMqyD6NU35NK7SDL8v1+IgWhu0mzrlIxknbE
 vRl/pCSG+Ftn0giOlnQX3g16OfYU0UpUkGuS4V+1RWMV7x4TjggvvQLoHNWGeqrAnkQ6
 zvTedmDD15vnVbMr5hSPnldhsNd8sOoL+On/IcoDszwJCCSYj4KpDs9TbvVaNBAPrGKh
 5mUSJd0No8Julb80I2sgNplotIkv7fcwhNTlrV+BA1cO6kbrVBKvzfjyKBws/hX+doAB
 h2Na/izk0TN9a8HaW981hFwPjpXXJ2Zb1TriDn4+d8jpcyH+XKWlW5r4S0m2XAh0Tk5G
 GZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQCb1ix8pNS+owqIqISbUEGAgwSj/rWUCCNBqA9XyJ4=;
 b=TYvSdw67Nze5JIGRzPVXGAo3tDZFxNwdzMza4oxgC/KbH16m3x+r+60fcVPA165t3C
 GNKkWdhaLqgM7sgzzoppCnf9lfq6VAEW6IEvYTANx1iPjqZ4Fc0RklZZY5x416Y6voYk
 LU1/CUiQhpRGQ+iYt46LpwbJvl48G00g7cRNvKDuU7s1diabcpEz01M/ez93/tQNm9P7
 ogoKrvAZ3FfN0hUHCPd4qFiTNqLEDXeR48BbvDVVHFAUr2PgZmmDT4qCNnQ4tP4/S9SU
 nE9RDot4pFe9zbxSYovyiFADp8oInSC/mUYdRf2tCfvFd1D6zmiKBUIvQKpOhx4UjKLi
 n5fg==
X-Gm-Message-State: AO0yUKU+Pp3y3b8u8OwBHIjlRx6yNfQmkgTxLbC/ODMRtVGRVmkGLGhx
 m6+Tx847xL+WaRV8ixLEXiw=
X-Google-Smtp-Source: AK7set/hYzJ62KuefT/lcq2s6/oWByZknFIl8q3J19ZABmaCyMvGNi2AMj4i5yhufpbIcca9PrSPSg==
X-Received: by 2002:a05:6000:45:b0:2c6:2ac4:66ee with SMTP id
 k5-20020a056000004500b002c62ac466eemr2249981wrx.39.1676902536787; 
 Mon, 20 Feb 2023 06:15:36 -0800 (PST)
Received: from [10.85.37.29] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc47d458cdsm1217989wmo.15.2023.02.20.06.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:15:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1cdab4ab-a73e-0971-dece-729994f2b8c7@xen.org>
Date: Mon, 20 Feb 2023 14:15:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/i386/xen: Remove unused 'hw/ide.h' include from header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230220092707.22584-1-philmd@linaro.org>
Organization: Xen Project
In-Reply-To: <20230220092707.22584-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/02/2023 09:27, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/xen/xen_platform.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 66e6de31a6..3795a203d4 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -25,7 +25,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
> -#include "hw/ide.h"
>   #include "hw/ide/pci.h"
>   #include "hw/pci/pci.h"
>   #include "hw/xen/xen_common.h"

Acked-by: Paul Durrant <paul@xen.org>


