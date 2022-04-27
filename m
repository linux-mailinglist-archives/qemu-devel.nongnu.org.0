Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986BA510EB3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:22:14 +0200 (CEST)
Received: from localhost ([::1]:38634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXJl-00049F-OY
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXIt-0003Ps-98
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:21:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXIr-0004n5-P5
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:21:18 -0400
Received: by mail-pl1-x62e.google.com with SMTP id s14so379767plk.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IK0pADLZlGIIpUj6/otOWReekVfqxxtUjMqVKHDPcZY=;
 b=KUYgsaJmyO5C8fXZRDWjVtR2voJS9Ky9Up5PzerJKr/f7+pU9WT0P1TvV66oQpCNMU
 vRujHafr8A4xXPLakKnetaGziTU8UN0aBKeWn52QiA5K23LR81LpaN+EEsBioCxcfSw7
 ghm/anRReuLPAAGrxpG2P3TE6Yng7DjIttvKrm8v7j3ZVomkZI0JE9ujPH+NRClBpA1Z
 HlZbsenPtyCKi5Ukckq9umCHU89toUZZgsmFdmezbED4T8pWzZ4qQvSgx/KNHyO1Z/V6
 sz8JMP4ycjbWheGJyuYf98v/FC7LSLOPUhdI88C/k1Ckgz4Lkp8G0wvsxtveOpvOcc0l
 jgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IK0pADLZlGIIpUj6/otOWReekVfqxxtUjMqVKHDPcZY=;
 b=dIJMhFRibtwZZovimKR/7Mqc61agZZVGGlAHhH5Yxvx74Gh9Eh3KyqkU6Z/8iKdBAr
 5d/YoeaVNWKk0bSusEQuinoLzFdnaMVRYe5fgyPouw4b+27H3VTWMTRxIuwfIn1suShA
 Jw7xynlkV047TmSTLjFmzWjIkDdO2CRED6B+S24+dhMn2VvJGExwyxsoX43O8MFhMiyA
 2NwtOc5rhIF1nu6bbaeq/bjzLwiTnfWhBUpRuhJHJuEKbZDjXtwkOivKXDO5w0HsGn+I
 tSosXscpGzIEoZcYozc89XbPrH3+Qk0ojwtk/sG1qDh7KBYB05Sme4CfhGmZFER/Ub/w
 hmoQ==
X-Gm-Message-State: AOAM532bXEpqiBMpl/3KKDhpbkzNhwl4UCAAlYFynRlXCWvZlKpwNEgQ
 jyiSPmEWGjBnLmyZcT6thgCfTg==
X-Google-Smtp-Source: ABdhPJzncAfxNGZCR3yEjETg2wQd6Lw5SbEef+znGDBlbwsZjF2vkgKuE8K7vthaJMQk7IAbT7r6LA==
X-Received: by 2002:a17:903:41d1:b0:15d:3192:5785 with SMTP id
 u17-20020a17090341d100b0015d31925785mr7791872ple.82.1651026076334; 
 Tue, 26 Apr 2022 19:21:16 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm14169391pga.36.2022.04.26.19.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 19:21:15 -0700 (PDT)
Message-ID: <e9bf825b-e8cf-2874-744b-2e57b0995a69@linaro.org>
Date: Tue, 26 Apr 2022 19:21:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 37/43] hw/loongarch: Add some devices support for
 3A5000.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-38-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-38-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> 1.Add uart,virtio-net,vga and usb for 3A5000.
> 2.Add irq set and map for the pci host. Non pci device
> use irq 0-16, pci device use 16-64.
> 3.Add some unimplented device to emulate guest unused
> memory space.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   hw/loongarch/Kconfig       |  7 ++++
>   hw/loongarch/loongson3.c   | 77 ++++++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/ls7a.h |  8 ++++
>   3 files changed, 92 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

