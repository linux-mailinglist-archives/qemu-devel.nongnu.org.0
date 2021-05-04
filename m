Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAAB3731A2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 22:51:04 +0200 (CEST)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le20U-00029E-VG
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 16:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1le1z8-0001Y1-9r; Tue, 04 May 2021 16:49:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1le1z6-00051l-M2; Tue, 04 May 2021 16:49:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n205so165343wmf.1;
 Tue, 04 May 2021 13:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yHS2LqqxmsFxUsJAdbVMpK73ptvKCLvKS048Pl7ppm8=;
 b=D9U1nyhIJ60ZPRiW03JVeH33L3lV70h7OFZnRx9/xn7MLHf0vNe43iIL3TmD74OiOz
 oQ6ORboefrrBsFPi/2kOQzcLQlz5x6AiW/TgX0/8htXATUsSFEscsLLi7d0fQaX+CyMG
 pyXUfJ5kfVuDJxZKUghKKhsNh3DSs8gLUFPndxl1cZS7T4mUEjm9wHqIGNWXfn+r7DNr
 4gkuh+jJY+a+Ljen3V6zxR2b1EM8GbjFYAggn7Tzy81LE5GW+z//42eLeCezlmlQ8+ez
 n/uK0A5LtW2bhtx/dIYJ/N6WxN51b4K/hxchkoIARJ+CG9GRd4X/oQ4rpWEYk2J39Oi+
 qw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yHS2LqqxmsFxUsJAdbVMpK73ptvKCLvKS048Pl7ppm8=;
 b=poowrQYAe53IZvJ4NyeFSUeVeDwJO4MmfDsejht13ZfKxXy/AccfA5i8TmVA/IJUwa
 yMLOMNSSLwVfQW0GJdXw6M6PjVISpOIqn+o0/JDjsTsCG8EEavczqLxjyIDqw8gcaXy6
 f4LmdRn0XBk7NsexCZMxhVIC1IO5OdBv4yUkkRCwT031M9kfAOhYpyeaIPzBBsmA6lr/
 qjnCYKLwKmehAQE7aMkTdM+srZfliOg+6chUnT6QzYiMJHnZPD4whvSFj+3NqY9QIDmF
 Oiv+C/aGAE/G0pH/IdW0CuWFGG6HMCdk1fz9U+CS3z4hqelKeSU6v+2mGgyMDmJTk0cL
 CKNQ==
X-Gm-Message-State: AOAM533A6nzJfB514/EjjNsANDwldJM/ZQ4FFfp1Va2+mBzumSEmatYv
 SJcd2oS2dtS+C4jhvo7Inv4=
X-Google-Smtp-Source: ABdhPJzOZ0b7gzDu1qZQpO82wgnlCxe864CwPQ56fUrmopJW04YWxidbBOoxXhwlq9fckd4nKI9wAg==
X-Received: by 2002:a7b:c312:: with SMTP id k18mr29715859wmj.89.1620161374919; 
 Tue, 04 May 2021 13:49:34 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id h9sm3751008wmb.35.2021.05.04.13.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 13:49:33 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/i2c: add support for PMBus
To: Titus Rwantare <titusr@google.com>, Corey Minyard <cminyard@mvista.com>
References: <20210504162841.2884846-1-titusr@google.com>
 <20210504162841.2884846-2-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0e4ed67-d8fd-3902-6a71-144203b9a9da@amsat.org>
Date: Tue, 4 May 2021 22:49:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504162841.2884846-2-titusr@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Titus,

On 5/4/21 6:28 PM, Titus Rwantare wrote:
> QEMU has support for SMBus devices, and PMBus is a more specific
> implementation of SMBus. The additions made in this commit makes it easier to
> add new PMBus devices to QEMU.
> 
> https://pmbus.org/specification-archives/
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/arm/Kconfig                |    1 +
>  hw/i2c/Kconfig                |    4 +
>  hw/i2c/meson.build            |    1 +
>  hw/i2c/pmbus_device.c         | 1611 +++++++++++++++++++++++++++++++++
>  include/hw/i2c/pmbus_device.h |  520 +++++++++++
>  5 files changed, 2137 insertions(+)

TBH this is quite a big patch to digest.

Any chance you could split it?

Thanks,

Phil.

