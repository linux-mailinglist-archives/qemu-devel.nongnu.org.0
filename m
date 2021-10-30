Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FD440866
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 12:46:51 +0200 (CEST)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mglsw-00038U-Du
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 06:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mglr4-0002G2-Om
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 06:44:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mglp8-0001rz-Ph
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 06:44:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso5513858wmd.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Y3pjwjpjUeGF+seiZm429gtrMolXs9Pakm9xSAigJ4=;
 b=SdBqxxtWq69nUp1aH9zfqcH858r8IuduT2IodsGD0xMAaNW+6cDbYademOzk3i7G24
 FJy3XXOU9SjzQ0pG75zsOq0imrRJlYupflrVwRYkMFACKcNecjDv2sBt9oyWEpjsDHlU
 nQwj0PW+4G+/on15DPAd5q6yP9fhXkhD88Cp7HJG7hfbuW+A36Yt8l1fWH1yre5cF3gP
 VClveaqfBTfUurv7kEJeXHRBf+3g9T/ab/dOCnN5z59CG7CAYxQgnJPjTAs2ehGPlHMz
 Havtun16Q0MHvl7fi0mcclkCw4XW1QCdC+rNhLAlsuzF9VmXbbGgtHLDzpXopPTueV3J
 qStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Y3pjwjpjUeGF+seiZm429gtrMolXs9Pakm9xSAigJ4=;
 b=FCc3SEPl9rk+4475DHRbqQ6VmbXDP1Q+FXLPF6TM0E0tI7T/cSaHML5WHxXjTQRCZA
 zMbNvBhmwGLgPOzG4dGbejEwVmxOonc9IzTi3UUieTTca9GW3/MCIywgFHpeSrgJwHu6
 jk23wuxvphbCf4maxx7tmfH3zvbEkpjwiclD7SHJoQZ2lViBtpQsR6DXXhJuIRGRpCSU
 hlWVdWt3zOb2ytBqvf43RM1+sO2QeZWTieShsizqQoHrp+07R5XIlhX+IeeY7Ts8LhFj
 l02CB65jyTW1R5mXdF5koDgxUenjXvd2Xl98IC9T/jhbyLLWR978l4iIDrxO+ZWwVKhl
 sqwA==
X-Gm-Message-State: AOAM533+Iym4FtT6Ty58DWhK9Eg7JjjewBmLCpnZruz6LgTntc8ZhBF3
 zUyc0Uc7JAjWFCK1SPpt9AQ=
X-Google-Smtp-Source: ABdhPJy5Cimnj0SznQkV0vrW9tqW5u7zGg62/uZcUauUa9vue0cLFMpOpV0og/0oL8vNfGvtw7hfhw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr5716220wml.80.1635590572946;
 Sat, 30 Oct 2021 03:42:52 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r15sm9157984wru.9.2021.10.30.03.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 03:42:52 -0700 (PDT)
Message-ID: <8078302a-b8bd-3f07-45e2-44955c18c2c5@amsat.org>
Date: Sat, 30 Oct 2021 12:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 16/30] hw/intc/sh_intc: Turn some defines into an enum
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <4adf4e1ac9d2e728e5a536c69e310d77f0c4455a.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <4adf4e1ac9d2e728e5a536c69e310d77f0c4455a.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:
> Turn the INTC_MODE defines into an enum and clean up the function
> returning these to make it clearer by removing nested ifs and
> superfluous parenthesis. The one remaining #define is a flag which is
> moved further apart by changing its value from 8 to 0x80 to leave some
> spare bits as this is or-ed with the enum value at some places.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 43 +++++++++++++++++++------------------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
> index ac47b7f905..16d94458d4 100644
> --- a/hw/intc/sh_intc.c
> +++ b/hw/intc/sh_intc.c
> @@ -100,33 +100,27 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
>      abort();
>  }
>  
> -#define INTC_MODE_NONE       0
> -#define INTC_MODE_DUAL_SET   1
> -#define INTC_MODE_DUAL_CLR   2
> -#define INTC_MODE_ENABLE_REG 3
> -#define INTC_MODE_MASK_REG   4
> -#define INTC_MODE_IS_PRIO    8
> -
> -static unsigned int sh_intc_mode(unsigned long address,
> -                                 unsigned long set_reg, unsigned long clr_reg)
> +#define INTC_MODE_IS_PRIO 0x80
> +typedef enum {
> +    INTC_MODE_NONE,
> +    INTC_MODE_DUAL_SET,
> +    INTC_MODE_DUAL_CLR,
> +    INTC_MODE_ENABLE_REG,
> +    INTC_MODE_MASK_REG,
> +} SHIntCMode;

This doesn't seem clearer, because sh_intc_write() does:

    switch (mode) {
    case INTC_MODE_ENABLE_REG | INTC_MODE_IS_PRIO:
        break;
    case INTC_MODE_DUAL_SET:
        value |= *valuep;
        break;
    case INTC_MODE_DUAL_CLR:
        value = *valuep & ~value;
        break;
    default:
        g_assert_not_reached();
    }

Anyway I expect this whole file to be rewritten by Yoshinori,
so I don't mind much.

