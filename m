Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2B3894F0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:00:20 +0200 (CEST)
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQUV-0006sK-Lr
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQRu-0003cO-W1; Wed, 19 May 2021 13:57:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQRt-0004dJ-Ie; Wed, 19 May 2021 13:57:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p7so11203104wru.10;
 Wed, 19 May 2021 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/2sPs+ru2T4x3kpaPoLZ4bxZnL9mzLFOYVpuWjbVtWM=;
 b=InPNeW9DTJOzXF2r7VXxqLHGdYyHRM4r4quC5VwRGUfFw9vTAmHJX6aCPirULXiLXN
 cefPUf6T2wpAjZy+5plcMxpvn07zDWS3oXpylalpHkz3+uAaLGp12QaPOVMecU31+Ljo
 2BAu4UbNFhVTonfvrAGuwFXSVss+GOl3J+AqDHoFlABGyVVHqDaK6HUecsMWsYoDwxdW
 Dk/cZWuFUnX44zeAtXPYJE9U+yU48feYq6bDdoLDYOBCQNlQ2J4jofh33JXw//ylFaxE
 3Z9Fnhvi9JX9uAbJ6GE7G+/Q89gJPZsJXCvIZLzULLmokcaK9EouqJX6a50Iahkky9m0
 Umfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/2sPs+ru2T4x3kpaPoLZ4bxZnL9mzLFOYVpuWjbVtWM=;
 b=aJYq4lqKFmWObMtUiQ7x82RWwDIYcurYUctU0kRwKmNGQXDKlELkGvolkW6vtTLePv
 MVDG0YJg5/NH1KYXZpWRvsPt1uAn0VYLK6o2NmGJswtxyD+A9a0L/Fig6PlXhjA70Ytm
 owP55Bp3oJTuQjouByNZsDzDVyA967eEzFF9mebrenCJNTxqHwArqQGF3iugezBJCqyy
 xqoNSeID6hNmvVe1bxS7lQRTc+qsAlSJK9l3aQIyWEMxk8xuEFlHXSAXIz4D4sYNsMmA
 eY9kaUgwMThq152+T2nTfV0Gi6jLFkNIjjVqlHd8hCvV8Dt9oXyMYe1WT9Hxbx57BbFw
 2BvQ==
X-Gm-Message-State: AOAM5322yQo8c71omNdGRa0mjt6wid0ZwdCMRJKVMd+RZ3+0xCBXBfRF
 Zx5hkhhFF8SBAxy3H8EaRngaVoKMRL2wxw==
X-Google-Smtp-Source: ABdhPJwpvV4AWxaJf6YFDng6b3n5Co9Eg5tZ+0rOpYPj3qm48mHnJwdFcyDVgzDPptNzUrtvf+LB+g==
X-Received: by 2002:adf:e484:: with SMTP id i4mr132614wrm.117.1621447055195;
 Wed, 19 May 2021 10:57:35 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q186sm163538wme.20.2021.05.19.10.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 10:57:34 -0700 (PDT)
Subject: Re: [PATCH 1/3] adc: Move the zynq-xadc file to the adc directories
To: minyard@acm.org, qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>
References: <20210519000331.3690536-1-minyard@acm.org>
 <20210519000331.3690536-2-minyard@acm.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b08ac221-e8fa-fbc0-5dbc-158841c79405@amsat.org>
Date: Wed, 19 May 2021 19:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519000331.3690536-2-minyard@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Corey Minyard <cminyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 2:03 AM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> It's an ADC, put it where it belongs.
> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  MAINTAINERS                          | 6 ++++--
>  hw/adc/meson.build                   | 1 +
>  hw/{misc => adc}/zynq-xadc.c         | 2 +-
>  hw/arm/xilinx_zynq.c                 | 2 +-
>  hw/misc/meson.build                  | 2 +-
>  include/hw/{misc => adc}/zynq-xadc.h | 0
>  6 files changed, 8 insertions(+), 5 deletions(-)
>  rename hw/{misc => adc}/zynq-xadc.c (99%)
>  rename include/hw/{misc => adc}/zynq-xadc.h (100%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



