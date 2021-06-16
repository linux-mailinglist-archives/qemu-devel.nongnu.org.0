Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BE73AA1E0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:56:00 +0200 (CEST)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYpb-0003E9-Oy
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltYnB-0000jo-OO
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:53:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltYnA-0005UF-0h
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:53:29 -0400
Received: by mail-pf1-x429.google.com with SMTP id x16so2651747pfa.13
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=O7xKgZ2Vl/DnKUDWYbyJyEQGGmVhGLkGEjdLtZEOKsQ=;
 b=LuVy/5N00jTlRh38Avbo4Hd5GFOTJFnkF3Y8BHEqUUIwulCTlO5OKc+C8BEqtjfpOZ
 IJMV3LFNyXD5xVvPBzRxm+APGpCBg/X1C7VpiiumYrS/ytgf9ptTAHKo2RXHjPxFuNJ+
 EcYEGbUgALzaIcVC1fjeQwMwouQ6PhMwZH9MAbgy1YqJtGcTl8QXXfppYqpTmUZaGmVA
 Ni8E5t/NWIkUZUdzVyZtHPzuoQNyLRYgR6RZZGVGxS5nWvx42xic7dhTKAuiQDW5ezAF
 xGmHnYMdeKiaf2qdqqX1mDtcwABP8IdhqUBg7UP2BdfW/ETgMt8hB1Bsbu4vz5C7nVQC
 3oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O7xKgZ2Vl/DnKUDWYbyJyEQGGmVhGLkGEjdLtZEOKsQ=;
 b=JtehIpX8ifDlpcsbKIqZPpbav9UFrwEo3Rmq3dRenkJfkBjAGH326pNZOqJ9vgqXD0
 C52EAzVcE2JLdN+DwaqIa5xsUMKIkRwRJIbwcMtBydJca2ulf4wezYc0EJ+JJS0Bckhl
 /FxXQphCue33JCaVfLBM4FvTsgaIvSlJ4dKCc5p8a00+Jt5C4JJo92KqzyCGa/jxyGw1
 cDSchGFZODSLL+LIUPubtNy3lTTrTGETeZHD4jPxOA154DGsQes/3HDBMabw2re4+Z9V
 fr0URs3YtMK7Gev4/4kSOkUXSyuScYNC7oj+EJHJLIWT6fCP6aLhBChICaT6Z3XZ1jrL
 oQtA==
X-Gm-Message-State: AOAM5313UFxNA93c1CyBNP/CKAZQxL5T9CgiKFi5nRIAbvq1wExfcReo
 36mKMvm91vLH+G8KHxzvl09yOkUVofH5kg==
X-Google-Smtp-Source: ABdhPJzdLExBeZoTXsR6Y5fs5ew5LZVJVlXjNT+nY4M+5US63Wp5xYnmVGRCBrv5eEtEIjPFMbGsXA==
X-Received: by 2002:a05:6a00:14c5:b029:2f9:b8ea:7ab3 with SMTP id
 w5-20020a056a0014c5b02902f9b8ea7ab3mr718607pfu.76.1623862406255; 
 Wed, 16 Jun 2021 09:53:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i7sm2633832pgn.6.2021.06.16.09.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:53:26 -0700 (PDT)
Subject: Re: [PATCH v2] alpha: Provide a PCI-ISA bridge device node for guest
 OS's that expect one
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210616141538.25436-1-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f78d7087-43bf-5fb5-7ab3-1d3d261c5fe1@linaro.org>
Date: Wed, 16 Jun 2021 09:53:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616141538.25436-1-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 7:15 AM, Jason Thorpe wrote:
> - Move initialization of the ISA bus from typhoon_init() to clipper_init();
>    this apsect of device topology is really associated with the individual
>    model, not the core logic chipset.  typhoon_init() now returns the IRQ
>    to use for the output of the ISA PIC.
> 
> - In clipper_init(), instantiate an i82378 instance, and connect its
>    PIC output to the ISA IRQ input provided by typhoon_init().  Remove
>    the explicit instantiations of i8254 and i82374, as these devices
>    are subsumed by the i82378.
> 
> Signed-off-by: Jason Thorpe <thorpej@me.com>
> ---
>   hw/alpha/Kconfig     |  1 +
>   hw/alpha/alpha_sys.h |  2 +-
>   hw/alpha/dp264.c     | 36 ++++++++++++++++++++++++++++++------
>   hw/alpha/typhoon.c   | 19 ++++---------------
>   4 files changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/alpha/Kconfig b/hw/alpha/Kconfig
> index 15c59ff264..e907a052c3 100644
> --- a/hw/alpha/Kconfig
> +++ b/hw/alpha/Kconfig
> @@ -4,6 +4,7 @@ config DP264
>       imply TEST_DEVICES
>       imply E1000_PCI
>       select I82374
> +    select I82378
>       select I8254
>       select I8259
>       select IDE_CMD646

Looks good.  I removed the direct dependencies on I82374, I8254, I8259, which are now 
handled by the Kconfig entry for I82378, and the includes for them.

Queued.


r~

