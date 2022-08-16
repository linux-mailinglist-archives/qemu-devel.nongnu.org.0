Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20410594BB0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:52:12 +0200 (CEST)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkoV-0002gO-7p
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkle-0006k2-4P; Mon, 15 Aug 2022 20:49:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkla-0005yx-4N; Mon, 15 Aug 2022 20:49:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z16so10798267wrh.12;
 Mon, 15 Aug 2022 17:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=t975Nu1FkWMj/KCnwWT4Vq62/hvJRjgmm6CErW+TC4A=;
 b=KlHj1QmgJQjAb1E9fnyQHtQEgLtcly3kvvalq4+ZLpoHb6vqc3WG4einBjuSXZH9W2
 N2gv/6th5aQ36xzMkvml9tSWNE+M02VS8bW6D5rbpT0Z1QCXEUGTzRdM/Vtdd1nC8FH8
 3SE9NQuFmGDjjZ+oQCf4lYn/DgC/qFvJ0TJJ9DMvyGqnQOrcdCHqCM0WamWTB0Bn66Yf
 zbE5fwuWF5e57+i/iQXZ4yWhH77VGB8dZ/oVt8VFgK1R5cRXZJ1CjcA12CV5cjLHt/mF
 kjaPDmxKzquuhYBznPhs6Gvme4HTuZ0FPsf8+2HCLbNTFG8TAVyj4nh9hc7i06N5Os/u
 1vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=t975Nu1FkWMj/KCnwWT4Vq62/hvJRjgmm6CErW+TC4A=;
 b=2AQwGLgXDFyV94Tq+uVRqmqI36t/G14LUpjrmLzWAhT/SIr4AW9Sg4QV2O/p3joCTP
 UUin4WRPC/CdcCAEBga3N65pQ68IadYDjtD9IrEsXPFlByQmWTdGlAcmTeLHxncMdd5G
 +5amB12lk3V3TBupRNPVQ5PxKDDbfz3uSc+eUm+0SWWxSRSzunMzvHdbm+JDIl2blTUb
 BWSkmOedAFMS5SIWyzI+rYU5aSRp0XGBu6AsBkpkje1vmX+UbEOU1E/VPKcP+C+uqosL
 HdXBoyRTBSa5Y/ZHl7z+n21tXudJMhGD3Et16zMabfUasIWhfIHw3h18IAOXLDoQGUE9
 zOfw==
X-Gm-Message-State: ACgBeo2MICVIDAyT8KLQ7Fj2lzVzHoP1p6UTixMQ3fz51Yn/77L6SYzJ
 /ip6DS2XZstwsmCh0NtmOg65TZvh2Mo=
X-Google-Smtp-Source: AA6agR5TJiZBjV/HMNGbZQ6sob8ox5tRPMbXkVjyhtXqIGXMcy76799IaEpUXDmB1fGnVrqdmBko4Q==
X-Received: by 2002:a05:6000:1a89:b0:222:c186:ca8a with SMTP id
 f9-20020a0560001a8900b00222c186ca8amr10128757wry.333.1660610947270; 
 Mon, 15 Aug 2022 17:49:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600010c800b0022062459ce5sm8553958wrx.30.2022.08.15.17.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:49:06 -0700 (PDT)
Message-ID: <b436b27a-186b-d5aa-585d-904ce8228fa8@amsat.org>
Date: Tue, 16 Aug 2022 02:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Content-Language: en-US
To: Enrik Berkhan <Enrik.Berkhan@inka.de>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
In-Reply-To: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 12/8/22 16:35, Enrik Berkhan wrote:
> In more recent Raspbian OS Linux kernels, the fb driver gives up
> immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
> displays are reported.
> 
> This change simply always reports one display. It makes bcm2835_fb work
> again with these more recent kernels.
> 
> Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
> ---
>   hw/misc/bcm2835_property.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index e94e951057..890ae7bae5 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -270,6 +270,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>               stl_le_phys(&s->dma_as, value + 12, 0);
>               resplen = 4;
>               break;
> +        case 0x00040013: /* Get number of displays */
> +            stl_le_phys(&s->dma_as, value + 12, 1);
> +            resplen = 4;
> +            break;
>   
>           case 0x00060001: /* Get DMA channels */
>               /* channels 2-5 */

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

