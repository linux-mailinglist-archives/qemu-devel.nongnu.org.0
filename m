Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECBB3FE03F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:42:48 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTK3-0007Oo-87
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLSex-0003GH-3X; Wed, 01 Sep 2021 12:00:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLSev-0004hf-5Q; Wed, 01 Sep 2021 12:00:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x6so255589wrv.13;
 Wed, 01 Sep 2021 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XfSukScJLJxCgklkfWrY6l+qKwS9yAR37XMRLBoslpc=;
 b=j00RAn1uh05sLi2N4X8DW1yoV+g7B1ghb7GXMECPcpumXv3ovYN6P/9g7DLSuVMTw9
 +friQkb3mCT6t7uu+PX61r//WNO8nIC1JV2udSweYmEfo0nJtVqoOVdO1EMGXrt2ECvl
 KtalSm4IJxiO9PmUHStTnvPeJSiuRGjOQYLQPQlhShDwdMcCXnTKftgL5QtkNf/cOQKL
 q/09YB7pSX2n83b3ta2oXyqMOdoPs+zJSRyOklofNpgf5yd3500q0w3qLRrN0vuweTSf
 DuYEg60y8oGRdj/Qpt6uyoINT63TdRINvgoCJE31P002coXbdBzdZhO4bEW9nUA61Tde
 2dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XfSukScJLJxCgklkfWrY6l+qKwS9yAR37XMRLBoslpc=;
 b=aLLDm1ku8T2MnKFZGDguTLiykqyer0QzDzcyrbNc5DS53JOch3LQmVKUWZoq+RGKfO
 kEsqwyUYm+aCyZ7xfIVhGXJcfCFo1dBvuDlzqhIlMxE5Hluv87JFB+HI30c6cwh+i5G7
 MpCkjTBIjWLtuKq7663qhbQ6YP/d2fJqqtxq2GZ8tLo3Djte+xs6ooLwAPrxRjgldLcw
 y5MCFO83wmhyKKjuCTh3MrssdSVs+1JANfRoBzDEPRDIhXg2ALkheMqAttZO1uEIApYF
 5lJvdEZWmzz34xRs/tuBSSRW7kI0tVXdw1tKimf6r4sKbZrnelhcqsC9cnHuTotnjn7k
 lDiA==
X-Gm-Message-State: AOAM530gYYLzRRpQyQwj1mpqcYiRCuFlpQ13B7Klw1WRWyITY4ZnYVcs
 ZXegLPAXaN1SS7b09diW4i4=
X-Google-Smtp-Source: ABdhPJy7HyyocD7LmfHYsWO1ZaGSazSZ6hf3NI2+uNYLFvwPKq8FjiCMY/zGEXp8VQORjtJBo5qGWw==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr96301wrw.48.1630512015156;
 Wed, 01 Sep 2021 09:00:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z137sm6489626wmc.14.2021.09.01.09.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 09:00:14 -0700 (PDT)
Subject: Re: [PATCH v2 0/1] hw/arm/aspeed: Allow machine to set UART default
To: pdel@fb.com
References: <20210901153615.2746885-1-pdel@fb.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <78e7129b-d652-7dae-ef8e-6289ccb28b06@amsat.org>
Date: Wed, 1 Sep 2021 18:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901153615.2746885-1-pdel@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 patrick@stwcx.xyz, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 5:36 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> v1: https://lore.kernel.org/qemu-devel/20210831233140.2659116-1-pdel@fb.com/
> v2:
> - Replaced AspeedMachineClass "serial_hd0" with "uart_default"
> - Removed "qdev_get_machine()" usage
> - Removed unnecessary aspeed.h (machine class) includes in device files
> - Added "uint32_t uart_default" to AspeedSoCState
> - Added "uart-default" uint32 property to AspeedSoCState
> - Set "uart-default" just before qdev_realize()
> 
> NOTE: Still not totally sure I did this right, especially because I only
> initialized the properties in the aspeed_soc.c file (2400 + 2500), but
> not aspeed_ast2600.c (2600), but I guess that's because
> aspeed_soc_class_init is common to all the SoC's.
> 
> Peter Delevoryas (1):
>   hw/arm/aspeed: Allow machine to set UART default
> 
>  hw/arm/aspeed.c             | 3 +++
>  hw/arm/aspeed_ast2600.c     | 8 ++++----
>  hw/arm/aspeed_soc.c         | 9 ++++++---
>  include/hw/arm/aspeed.h     | 1 +
>  include/hw/arm/aspeed_soc.h | 1 +
>  5 files changed, 15 insertions(+), 7 deletions(-)
> 
> Interdiff against v1:

[...]

Not needed because QEMU uses patchew :)

https://patchew.org/QEMU/20210831233140.2659116-1-pdel@fb.com/diff/20210901153615.2746885-1-pdel@fb.com/

