Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67367609A28
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:01:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompl5-0006CJ-8M; Mon, 24 Oct 2022 01:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompky-00065O-5L
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:12:12 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompkw-0000d3-H4
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:12:11 -0400
Received: by mail-wr1-x429.google.com with SMTP id k8so5665036wrh.1
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rJMtHcIMjcIdaGUYJL+XY/D8z/7MMRPFGeO+/Vl2SiM=;
 b=VuVIOJ+3OkrSdffoAa6beL3dLZwiM++77NU9HiLl2458W4P0HrBRoB5p02M0ouKsyD
 AU/r853vUxduQcnb3UIu+x9c6QF4BjygfNAccbMZp2hRDL1NLI9wpuJ0rtxO2Rqgkcj3
 6PmZDR92Kz+A4d8/LAY+0aXExigwRDW4Fkh+BiNaWb+yD0+qx6/33MSvgK4Dlsj/LzLx
 odz+bFZnmLXcSflfvlActjfqVEpjLsu1tK54ryGtNTSpsFbG96zCprJHqoZWC6DTW8AL
 NRRxO3d5dJ2fxh1IKQ1s2+sqWPn1/DsbTS7F+og7mb/+CUyRkw2pNMK4K6A3aGAJhjXD
 iNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rJMtHcIMjcIdaGUYJL+XY/D8z/7MMRPFGeO+/Vl2SiM=;
 b=aVnpzBWV1R1thlyZrNY7I2spnqdiUl4y0LpNnvtebRtYcQAIpFwbjAAIx3ULRaXUjF
 +wVBsiYhkh4ofTcDvQgtZZtvORvmX3kfAtj3muIAnMMp5JWG17cjmuC/qmXlbQtAEAK/
 2pWCVHiquAUH0rS8nBg9DPOkuH+1QEd5T5Zg2KZhsoFZyLj3HQ2xWuDDaxIXXnc9T6Rx
 PZdAyrRwbf4EpoGSmIT40QExox8RXOFvGSUzqNq7a1Uo7lvYiBalLbWouoozslaUGuRF
 fMv4uFhlKHhHgD4z7zzcPrwb5/EyqDwKsS09npVdHdxPdxf04Xx9d5mftXINparSQNI1
 Sj8A==
X-Gm-Message-State: ACrzQf2SuKSUtWu9fDuP4R1f+66uPM6xyidUk7bOm1z1exBqWmHbxZkW
 aZXH5wJDeKVYBc61QqE/BqLlfA==
X-Google-Smtp-Source: AMsMyM4QmeSYF5J0KZlqkmZHDSLbs0ifr4X30usBas4er+DEC/gq3Ni8QxAGhslwz134AWPqWRV7lw==
X-Received: by 2002:a5d:648c:0:b0:22e:6417:751a with SMTP id
 o12-20020a5d648c000000b0022e6417751amr19847992wri.261.1666588328795; 
 Sun, 23 Oct 2022 22:12:08 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a5d52ca000000b0022e653f5abbsm25844657wrv.69.2022.10.23.22.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:12:08 -0700 (PDT)
Message-ID: <7e55a76a-1336-6abf-c1d7-3f7ea14e11d1@linaro.org>
Date: Mon, 24 Oct 2022 07:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 19/43] hw/isa/piix3: Allow board to provide PCI
 interrupt routes
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-20-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-20-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/10/22 17:04, Bernhard Beschow wrote:
> PIIX3 initializes the PIRQx route control registers to the default
> values as described in the 82371AB PCI-TO-ISA/IDE XCELERATOR (PIIX4)
> April 1997 manual. PIIX4, however, initializes the routes according to
> the Malta™ User’s Manual, ch 6.6, which are IRQs 10 and 11. In order to
> allow the reset methods to be consolidated, allow board code to specify
> the routes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c                | 12 ++++++++----
>   include/hw/southbridge/piix.h |  1 +
>   2 files changed, 9 insertions(+), 4 deletions(-)

> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 1f22eb1444..df3e0084c5 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -54,6 +54,7 @@ struct PIIXState {
>   
>       /* This member isn't used. Just for save/load compatibility */
>       int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
> +    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];

pci_irq_reset_mappings[PCI_NUM_PINS]?

>   
>       ISAPICState pic;
>       RTCState rtc;


