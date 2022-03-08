Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF524D2215
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:58:33 +0100 (CET)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfya-0007BG-VD
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:58:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfxO-0006LF-5H
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:57:18 -0500
Received: from [2607:f8b0:4864:20::532] (port=42779
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfxM-0001wk-RK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:57:17 -0500
Received: by mail-pg1-x532.google.com with SMTP id o8so53583pgf.9
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W7H4pN4DcTnqyYSF2ABoCv5Q3TdiCK/cwTHUQChLzt0=;
 b=N54BHVglMd7ZdPIQhL44w6U/fbQG4DqeMy2zOTwg5aXT4U5Sfu5TQphaIm1zjm+ON9
 q28FH4NCCSU+PW5GhnWxdM/BRuDxBqMiJ9mM5HaEAYbmQbh6zHBUjDgWR3+e9PNxtDSE
 AkGw0Zn4MIT3JS62t+RYGXcOYK5BQWCvtAhL82qGjxOumARDXcJb5V3a5Nn+NNK3MTlv
 d/cYh05gT3gYEp2Z7ZbIOqncT41amGyeMNOi4yu3MLb6rxHnVL2gyYoxswo9Ib8gtlEq
 /Vf+anOSkiYALstvYa35TQ98dHNO/D3j88/8CYYLyASGKBB4HAqeuwvVdSy5Go+aK9gm
 a5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W7H4pN4DcTnqyYSF2ABoCv5Q3TdiCK/cwTHUQChLzt0=;
 b=RLngak0AMat8THFksc2fSPzDZITqCAYTqa6bxGIHBN8LnUla/LcG3VW+Njn3/5qlDf
 j9OFdr8Jc5gkhRKEPXXfGvBtFxYattUPP3y2xl5MeRGljZOi+aJ42j4KeKAqmuwtvYf8
 /Id6hvSKtd3nc+Kjp+GOlM/u5RjjMwtOcJUSAFb6RK117GI0o4GBzhjn5gWgUQUu2HSl
 71mLJzcWYfvx91hhT4Xu7Y+W5/CqZbnhCLFjkD0O1K5XRkH25Xmcufws5cRxEeTK6zN1
 JohtnNg4kvbmeUT6HCZp7Vgks8yUHtFkWXRXJyvGlBhpqnPoPqfsvG7usJiIuvo73Xb6
 OwSA==
X-Gm-Message-State: AOAM530bkQ81NLSP7h46Oyb3ELwLG1hmmlQjn0hmSD6mrFKsTly6B14+
 I+o7vwg+E1fkMCqgPBaeHgSCNw==
X-Google-Smtp-Source: ABdhPJwVkDec6s72V6BcXrusCCmjdpACLkwaMnrQD/Fm6o2K6o63vRXTFYDt6ps6XXEgkvSIZ/+l1A==
X-Received: by 2002:a62:586:0:b0:4e1:dc81:8543 with SMTP id
 128-20020a620586000000b004e1dc818543mr19954438pff.0.1646769435505; 
 Tue, 08 Mar 2022 11:57:15 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q20-20020a056a00151400b004f3cd061d33sm21263966pfu.204.2022.03.08.11.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:57:14 -0800 (PST)
Message-ID: <add98c82-d984-74ba-275b-969fb4e558cb@linaro.org>
Date: Tue, 8 Mar 2022 09:57:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 33/33] hw/nios2: Machine with a Vectored Interrupt
 Controller
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-34-richard.henderson@linaro.org>
 <7f7eac6c-a013-1682-1c4f-2b4bb87dc7d6@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7f7eac6c-a013-1682-1c4f-2b4bb87dc7d6@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 22:43, Mark Cave-Ayland wrote:
>> +    qdev_realize(DEVICE(cpu), NULL, &error_fatal);
>> +    object_unref(CPU(cpu));
> 
> I believe this can be replaced with qdev_realize_and_unref()?

Oh, nice.  I copied this from hw/arm/virt, which has code between these two points.

>> +    if (nms->vic) {
>> +        DeviceState *dev = qdev_new("nios2-vic");
> 
> And with a separate header for nios2_vic.h you can include that and use TYPE_NIOS2_VIC 
> here instead of hard-coding the type name.

Ok.


r~

