Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B775F3C6BB5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:48:32 +0200 (CEST)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3D9b-0007HL-QH
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1m3D7K-0006DY-JU; Tue, 13 Jul 2021 03:46:13 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1m3D7I-0001QB-Th; Tue, 13 Jul 2021 03:46:10 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n11so1140999plc.2;
 Tue, 13 Jul 2021 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=lL9gXCuPm/AvFCvn7u/yT0Zk+ZhHDauMRj2CA0gEiEM=;
 b=JsPXofdiVBNSqsV7th+xlL4pSPWV9V/gJGyUbgKzYcqNI26jb9dl6n1vJoErREh/ku
 zxIg7JVGy7+fdQtO8/l9wIWY+fvsnaMS+ZAHHxU+PIgbM+xkjRv/2ECP8ud9jVWcda/J
 eqLzNIiDK3INrfiPYrgYCI8Yn76GlK5I7T3LkRfbkgfYFLtEDJxpsuiufjE7s+gEfxW6
 Rc/HSRPM44fUNR5LfxnmZg3j1zGFR0thHjPZUed9o1NR5fC+Hmw7aJKp7Hf2mdaRUaD9
 32ShXzDXW359regJSr4HuPahjgZIxUOyxS98IsI6VA/vk+cZS6jP/mIzSotJxTV/OubN
 h7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=lL9gXCuPm/AvFCvn7u/yT0Zk+ZhHDauMRj2CA0gEiEM=;
 b=LZygMNF+aZQoXKlvj9APflxatj0mxBcYT0dfQZE6xkCNcvJE9XTv2WF+OJTMx2khFN
 Fc0s2jM1HLiVFUnUO4F+LOW1SZm3k+Tz6HMJUUOL7CTC85bHcpuIltqInCVA9Iwskf7e
 zHvciO+AxspM+e2tVlq91CWoIPp0EhZ1urF4qTzLvgaGihr7FBSXJpFiaiFgdnSXSX8S
 qA2knSIozn5djBBlhTthHiLJ5DHReWUgUYot6Vt+p0GomXq/YCDvydorgUT9wnm9gwAu
 T9aUk7PUNAYTIeYcdjVPMLcm90XALd95hwSN4UIyG+KdyYRGtMFeWFyUFV2B333hIiHz
 mV5g==
X-Gm-Message-State: AOAM532abrDAbgXo74AcG+R2+1E0+Cz7E6UAiT1d5LbRa+YXoG+Qcjhs
 b0OzGqj8/yY3GRoizDLfmfk=
X-Google-Smtp-Source: ABdhPJwd4LeysKjpT8L+7ONSnpO9VdBpsiJEwoKaNup9Euac1pvhpaPLxeltsYGh8QfeSvg9oKUXwg==
X-Received: by 2002:a17:902:8b8a:b029:129:d281:4a27 with SMTP id
 ay10-20020a1709028b8ab0290129d2814a27mr2528983plb.9.1626162366895; 
 Tue, 13 Jul 2021 00:46:06 -0700 (PDT)
Received: from [10.0.20.43] ([103.217.166.124])
 by smtp.googlemail.com with ESMTPSA id u19sm12787278pfi.4.2021.07.13.00.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 00:46:06 -0700 (PDT)
Message-ID: <d788cdcc6e10846ceef50ce65cdd281f5661e01a.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] hw: aspeed_gpio: Simplify 1.8V defines
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Joel Stanley <joel@jms.id.au>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Date: Tue, 13 Jul 2021 17:46:02 +1000
In-Reply-To: <20210713065854.134634-3-joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-3-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=rashmica.g@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-07-13 at 16:28 +0930, Joel Stanley wrote:
> There's no need to define the registers relative to the 0x800 offset
> where the controller is mapped, as the device is instantiated as it's
> own model at the correct memory address.
> 
> Simplify the defines and remove the offset to save future confusion.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Makes sense, and it is cleaner.
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  hw/gpio/aspeed_gpio.c | 73 +++++++++++++++++++++--------------------
> --
>  1 file changed, 36 insertions(+), 37 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index b3dec4448009..dc721aec5da7 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -169,44 +169,43 @@
>  
>  /* AST2600 only - 1.8V gpios */
>  /*
> - * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets
> 0x0-0x198)
> - * and additional 1.8V gpios (memory offsets 0x800-0x9D4).
> + * The AST2600 two copies of the GPIO controller: the same 3.6V
> gpios as the
> + * AST2400 (memory offsets 0x0-0x198) and a second controller with
> 1.8V gpios
> + * (memory offsets 0x800-0x9D4).
>   */
> -#define GPIO_1_8V_REG_OFFSET          0x800
> -#define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DIRECTION      ((0x804 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_ENABLE     ((0x808 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_SENS_0     ((0x80C -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_SENS_1     ((0x810 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_SENS_2     ((0x814 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INT_STATUS     ((0x818 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_RESET_TOLERANT ((0x81C -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DATA_VALUE        ((0x820 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DIRECTION         ((0x824 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_ENABLE        ((0x828 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_SENS_0        ((0x82C -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_SENS_1        ((0x830 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_SENS_2        ((0x834 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INT_STATUS        ((0x838 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_RESET_TOLERANT    ((0x83C -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DEBOUNCE_1     ((0x840 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DEBOUNCE_2     ((0x844 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DEBOUNCE_1        ((0x848 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DEBOUNCE_2        ((0x84C -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_DEBOUNCE_TIME_1     ((0x850 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_DEBOUNCE_TIME_2     ((0x854 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_DEBOUNCE_TIME_3     ((0x858 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_COMMAND_SRC_0  ((0x860 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_COMMAND_SRC_1  ((0x864 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_COMMAND_SRC_0     ((0x868 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_COMMAND_SRC_1     ((0x86C -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_DATA_READ      ((0x8C0 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_DATA_READ         ((0x8C4 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_ABCD_INPUT_MASK     ((0x9D0 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_E_INPUT_MASK        ((0x9D4 -
> GPIO_1_8V_REG_OFFSET) >> 2)
> -#define GPIO_1_8V_MEM_SIZE            0x9D8
> -#define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
> -                                      GPIO_1_8V_REG_OFFSET) >> 2)
> +#define GPIO_1_8V_ABCD_DATA_VALUE     (0x000 >> 2)
> +#define GPIO_1_8V_ABCD_DIRECTION      (0x004 >> 2)
> +#define GPIO_1_8V_ABCD_INT_ENABLE     (0x008 >> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_0     (0x00C >> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_1     (0x010 >> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_2     (0x014 >> 2)
> +#define GPIO_1_8V_ABCD_INT_STATUS     (0x018 >> 2)
> +#define GPIO_1_8V_ABCD_RESET_TOLERANT (0x01C >> 2)
> +#define GPIO_1_8V_E_DATA_VALUE        (0x020 >> 2)
> +#define GPIO_1_8V_E_DIRECTION         (0x024 >> 2)
> +#define GPIO_1_8V_E_INT_ENABLE        (0x028 >> 2)
> +#define GPIO_1_8V_E_INT_SENS_0        (0x02C >> 2)
> +#define GPIO_1_8V_E_INT_SENS_1        (0x030 >> 2)
> +#define GPIO_1_8V_E_INT_SENS_2        (0x034 >> 2)
> +#define GPIO_1_8V_E_INT_STATUS        (0x038 >> 2)
> +#define GPIO_1_8V_E_RESET_TOLERANT    (0x03C >> 2)
> +#define GPIO_1_8V_ABCD_DEBOUNCE_1     (0x040 >> 2)
> +#define GPIO_1_8V_ABCD_DEBOUNCE_2     (0x044 >> 2)
> +#define GPIO_1_8V_E_DEBOUNCE_1        (0x048 >> 2)
> +#define GPIO_1_8V_E_DEBOUNCE_2        (0x04C >> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_1     (0x050 >> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_2     (0x054 >> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_3     (0x058 >> 2)
> +#define GPIO_1_8V_ABCD_COMMAND_SRC_0  (0x060 >> 2)
> +#define GPIO_1_8V_ABCD_COMMAND_SRC_1  (0x064 >> 2)
> +#define GPIO_1_8V_E_COMMAND_SRC_0     (0x068 >> 2)
> +#define GPIO_1_8V_E_COMMAND_SRC_1     (0x06C >> 2)
> +#define GPIO_1_8V_ABCD_DATA_READ      (0x0C0 >> 2)
> +#define GPIO_1_8V_E_DATA_READ         (0x0C4 >> 2)
> +#define GPIO_1_8V_ABCD_INPUT_MASK     (0x1D0 >> 2)
> +#define GPIO_1_8V_E_INPUT_MASK        (0x1D4 >> 2)
> +#define GPIO_1_8V_MEM_SIZE            0x1D8
> +#define GPIO_1_8V_REG_ARRAY_SIZE      (GPIO_1_8V_MEM_SIZE >> 2)
>  
>  static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high,
> int gpio)
>  {



