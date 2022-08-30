Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3D15A6FE4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 23:52:21 +0200 (CEST)
Received: from localhost ([::1]:56396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT99g-0007MK-HR
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 17:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT96z-00053h-DA; Tue, 30 Aug 2022 17:49:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT96x-0001Vr-V9; Tue, 30 Aug 2022 17:49:33 -0400
Received: by mail-pf1-x431.google.com with SMTP id z187so12619837pfb.12;
 Tue, 30 Aug 2022 14:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=RnlWIAApBjHbrNK6LPS8O4ZDdrrnwcinxb/f5ynDCp8=;
 b=bv02qNIppEMVn6LVZrqgTaTHfGHJBnBAaX43gLOdooTpHsrUtei7D4/c3ADEn7Tgd1
 ZYvcohBD3JIKROxwLeFFPXJl+pggL220Bxm76dZXD99XvzDnBurcEULygzzuGgWGiwc8
 KBLpGvkx89uDPClcQ0cWBA6PBQ8KdTQDmNsoba8QZzUtJoQ18gDky0n85WA7TTkTy1Kw
 iPQxAAm1yk1jI7t36yQeVnYXAh6CtVM9fulMRDeleGV8j+oiSRyrJMqYlHkrDOzFoIlL
 5Zi3OjTrg8L9koNPWgYZSVknlhfCUGDQJoo1tQlSg93aUf1wRjUJdLa4XGuE24lJx0lq
 OlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=RnlWIAApBjHbrNK6LPS8O4ZDdrrnwcinxb/f5ynDCp8=;
 b=5WXlgtpC6Gq2qM4/a8XOh7B6k4MpfHtAJWFt8dQBaqtwZaCTpKHQsjnq+CudIzMVKE
 IhSE8+6bL2a1xWfZywK0PkwnivR6DbEN87GQzCdpKv6ECfo8TMJnKWxn4Jr/EFUOptDs
 j/L5DqDVUSVCo7ZhND71NSi6igeR+nnZCLV8ws30hqrqI23cfD9MbVTAb7DcP6pauxp1
 TjIHSu3YNeXpkoeD5iUANvwDeaUTsuWZoNnLnReYgXwjg1TomzCT99ye0q38GaQ+tp5S
 yI55nGegoG+2llwz4Svs+/nuwC8tYOpZkIWxe7i+IAeSrUYydRWyTHUWW+xdJHaaEH6G
 Oy4Q==
X-Gm-Message-State: ACgBeo2L++DcmfwG9SzRhm2p076+cKt/tXb9mc1FP3U9JGUWeL1FgTSX
 KgID4+DWls8rVgXpS2+3R8c=
X-Google-Smtp-Source: AA6agR6GllB7BK2lB1NO3D3iCT5v4olCecQ4K5n7YD38adc7ZEsdsNHq7uD1zhDDAlvV8pQsBMzB6g==
X-Received: by 2002:a63:491f:0:b0:41d:89d5:b3e7 with SMTP id
 w31-20020a63491f000000b0041d89d5b3e7mr19436147pga.18.1661896170073; 
 Tue, 30 Aug 2022 14:49:30 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a170902e5d200b00172eb493487sm2770337plf.167.2022.08.30.14.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 14:49:29 -0700 (PDT)
Message-ID: <5d827b49-41a8-dacc-2752-c6c56efa7a31@amsat.org>
Date: Tue, 30 Aug 2022 23:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/10] Instantiate VT82xx functions in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220830190048.67448-1-shentey@gmail.com>
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/8/22 21:00, Bernhard Beschow wrote:
> v2:
> * Keep the call to pci_ide_create_devs() in board code for consistency (Zoltan)
> * Create rtc-time alias in board rather than in south bridge code
> * Remove stale comments about PCI functions
> 
> v1:
> This series instantiates all PCI functions of the VT82xx south bridges in the south bridges themselves.
> For the IDE function this is especially important since its interrupt routing is configured in the
> ISA function, hence doesn't make sense to instantiate it as a "Frankenstein" device. The interrupt
> routing is currently hardcoded and changing that is currently not in the scope of this series.

Excellent!

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

