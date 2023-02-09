Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F06901A7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:59:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1oM-0005h2-2d; Thu, 09 Feb 2023 02:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1oI-0005gB-Sd
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:57:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1oG-0006hT-SI
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:57:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y1so894514wru.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOg3K0kslXsqe5kuQtNCNHCWg7t598kG6Ipm6ET+Uus=;
 b=oq88IRsEDag6FwpOxEhoAb4FYM9zoXpF8AWvdjxjPCL5RQPeNaXFv1FtZunavnY76/
 dDc6cxsNwlPQ9pZDnyPywGJ+ur7tfRf/c8Cw6GwXiIeUxdEccLhuWpJH6/5EHrlT0h2h
 EnZpwuAU86WeGsFIC/+w6SgD4oVWUFZ8RPoWBn+aepoy+z207zT4PzGx4I7IHSsBKfqo
 XUgVowpjz5KdvOLYGuaHoKHvN811p03l02H3RiShbR0WRa0ddeaHpbRcqzNmk8FbabTl
 xG6ZNfG07qQdEMZhM4mLAHiLAcrzxPx+2Wc5uucSsIUxX3c8wpZ39Y/Jof7H2Vzwm5ei
 15uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOg3K0kslXsqe5kuQtNCNHCWg7t598kG6Ipm6ET+Uus=;
 b=ShaU1fK9O6Y+tvOiMkG5bLYh2jDTttoRXIL5JiL+qMu2yrbVapVANCFxuLtF+v/htH
 3RSSs1btc5Vc0XdcCT2+991XTlML69QYH8qtb1YxvLHc+gP95HWxmy+UwvTFYeD2fy/M
 coJPqcfewFrWtXNLvppPxN5cdpYBsol/RFGv1/EwD76SESmwxPOJFGuNfl8Sv1aN1obi
 kNg9WFy+7EEylCdlOE8hMS/MpQeEv8+ie4sc3jHJhCMjMPS1Nfs3KRj8DrKZ0TNB5MXC
 B5lDBgs4UzFwDAKW3kKjk+bhSW7O20yezLDc3bhJgZk733p+u2ZGovx+vN/im0WW/JAd
 Lgng==
X-Gm-Message-State: AO0yUKUWvrO6o4tbXq1nyjifOIga61HIet24puQ/0SZ16SoxfjTC8zgV
 N9zvImwbC42OqZGtRBh5F+mA7w==
X-Google-Smtp-Source: AK7set/ohYn4sk6e69o+aTRZ97EVi7WvXMwvYKHLUlJnmXHaQKdU5uiRUpQkCq1pReeIqxwI31OT1Q==
X-Received: by 2002:adf:e412:0:b0:2bf:9437:30eb with SMTP id
 g18-20020adfe412000000b002bf943730ebmr10956252wrm.17.1675929455138; 
 Wed, 08 Feb 2023 23:57:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c8-20020adffb08000000b002c406b357cfsm570181wrr.86.2023.02.08.23.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:57:34 -0800 (PST)
Message-ID: <ed2ae7f2-70b1-e5bd-217e-783c7071e4e8@linaro.org>
Date: Thu, 9 Feb 2023 08:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/4] hw/gpio: add PCA9538 8-bit GPIO expander
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au,
 Hao Wu <wuhaotsh@google.com>
References: <20230208224339.270589-1-titusr@google.com>
 <20230208224339.270589-3-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208224339.270589-3-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/2/23 23:43, Titus Rwantare wrote:
>    The 8-bit expander has different register offsets than the 16-bit one,
>    making them incompatible.

Following extract/deposit API suggestion on previous patch, an
alternatively is to use PCAGPIOClass::input_port/output_port/...
offset fields.

> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/gpio/pca_i2c_gpio.c         | 94 ++++++++++++++++++++++++++++++++++
>   include/hw/gpio/pca_i2c_gpio.h |  7 +++
>   2 files changed, 101 insertions(+)


> diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.h
> index 99322959e1..3ab7d19a97 100644
> --- a/include/hw/gpio/pca_i2c_gpio.h
> +++ b/include/hw/gpio/pca_i2c_gpio.h
> @@ -19,6 +19,7 @@
>   
>   #define PCA_I2C_MAX_PINS                     16
>   #define PCA6416_NUM_PINS                     16
> +#define PCA9538_NUM_PINS                     8
>   
>   typedef struct PCAGPIOClass {
>       I2CSlaveClass parent;
> @@ -62,8 +63,14 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
>   #define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
>   #define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
>   
> +#define PCA9538_INPUT_PORT                   0x00 /* read */
> +#define PCA9538_OUTPUT_PORT                  0x01 /* read/write */
> +#define PCA9538_POLARITY_INVERSION_PORT      0x02 /* read/write */
> +#define PCA9538_CONFIGURATION_PORT           0x03 /* read/write */

Something like this maybe:

     static uint8_t pca_i2c_gpio_recv(I2CSlave *i2c)
     {
         PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
         PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(i2c);
         unsigned shift = (ps->command) & pc->shift ? 8 : 0;
         uint8_t data;

         if (ps->command == pc->input_port) {
             data = extract16(ps->curr_input, shift, 8);
         } else if (ps->command == pc->output_port) {
             data = extract16(ps->curr_input, shift, 8);
         } else if (...) {

Maybe I'm over-engineering :)

