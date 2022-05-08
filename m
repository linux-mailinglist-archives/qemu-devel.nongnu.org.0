Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C698E51EB1A
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:51:32 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnX19-0006Bl-TN
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX0C-0005WD-8c
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:50:32 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX0A-0005BJ-L3
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:50:31 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a191so9297051pge.2
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=+X50dThcAltMg+HFNIjytxOW+wfG+eTtYoJpvn/PgF4=;
 b=EIgPgWIlq0MOcnc3L6BDPHO/WZ/2TZFJ5Z+LDOBcsBcWFmmHGGFnLpVMnTbFGNxHxb
 mTeWEsB4CveC600w/K/kQUixwSEfL6AIl6R3IpK+SP75S8ScidrQnkOI9yuVq5yJKuDJ
 DHsQNUxxkiNr9sULsyzQlLBmYCkfD2+sBL5ZB6QPDnZfaqcEmtRzBXG0T89/cUbioHXM
 gMSJ2zZ9TVv/8yHmgUpeCBjeAp7FXZMQmAns8y9uDEzIgDBBkWEWcz45IfayCcDKdMPR
 k5TnqpdwuMp4sRTgcGnX2qBgrvHGw1NocWqlP2GOh+ebaEQx8QQVeqe4eOatVAxKZdNs
 ukEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+X50dThcAltMg+HFNIjytxOW+wfG+eTtYoJpvn/PgF4=;
 b=4nCG7eZLy2O1hkXJgsKzInNnqDZBo0BmZwFxRAF+f/rbhoAISx9HA553iGKv428W5/
 WluysiuhZebXob0qYb/3fyVLPwBr+EOJYdh6mpnKpHwUZgYdJbekiJJh8l9YIe4JPm2H
 IlDClbRqkNsezIwh2diTDhVaoqR61HypLdt8VodUwV+D8Ih9GFGZgL0eAh0EblSKdZoP
 m1JiBHujlGBV7OtibrrvSweH3gtVr7MkBQOKjlME+xGdqEir4sdvPROCcuGqdb4cjqsd
 f6872Ye5D+dKVZ/pg1MeByYkzi8OFTQ5+NJQqt2r1icQnZ19mfRmw+2ztundjwK+U9ug
 A2Gw==
X-Gm-Message-State: AOAM533LSR6FPLk/lLT3pr0i3VuyQEA/ntmuDy6IdgeT4ZcTnsEUT1gh
 43w9oACJ9thPlSLXggYrI6v/MQ==
X-Google-Smtp-Source: ABdhPJxrI5er0mZTeTELYpcHDDG8vAMsLhaVMVnygZVAqSH2dFbwCOvXB77nS2BKE3OlyEVjvJLxkg==
X-Received: by 2002:a05:6a00:1941:b0:50d:807d:530b with SMTP id
 s1-20020a056a00194100b0050d807d530bmr9916348pfk.17.1651978228703; 
 Sat, 07 May 2022 19:50:28 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170903244c00b0015e8d4eb21fsm4411446pls.105.2022.05.07.19.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:50:28 -0700 (PDT)
Message-ID: <27fa6494-b5a7-d158-4cd0-2db1c40bf47f@linaro.org>
Date: Sat, 7 May 2022 21:50:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 35/50] lasi: move second serial port initialisation to
 machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-36-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-36-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>   hw/hppa/lasi.c    | 8 --------
>   hw/hppa/machine.c | 7 +++++++
>   2 files changed, 7 insertions(+), 8 deletions(-)
> 

In that it is code movement,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    if (serial_hd(1)) {
> +        /* Serial port */
> +        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
> +                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 8000000 / 16,
> +                serial_hd(1), DEVICE_BIG_ENDIAN);
> +    }

Although I believe there's a bug: both of these serial ports are being registered at 
LASI_UART_HPA + 0x800.  I suspect this bug was hidden by the bug fixed in patch 31, in 
that serial_hd(0) should be at 0x800, and serial_hd(1) should be elsewhere.


r~

