Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA37564CED
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:24:19 +0200 (CEST)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EZG-0004qz-AA
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EQg-00067i-GM
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:15:26 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EQe-0001Lu-Vq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:15:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so2174435pjn.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s5OEacJPFFw/SNBeMSCnUM0TgdHNg4b9t63+pGqEYao=;
 b=G3ChkXPPFkRl/P8glBzkKIkqa+n3YBkRaPM2QHn0MvvpFKi0pqz4JYgGvJ6r3E70ji
 Y3mXnWPEpBydvOWDE/vnosRf/ZeQ3R4vG1wQ/zyOlFsvEzq5zY5iCcek3tHcp+Kczqrt
 cJiEvn31mJUwdpyguWc2+pM0e4MgUOXokPOOoOCYIBbwCoW/dDMIhdwFRJaQHuQvIyKQ
 Ehm7HIsSm47D90cwodeqW7x1KpMQ8Khea96t5knilZ5BRTFr855gyLcM6R2VHYrV61d0
 IWrCCdNFtC4vyfJhf94/HhzRHUzppUGQkkMPHfqz+No/QLpuWWh2X4ErwSJajWHl8t7J
 vjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s5OEacJPFFw/SNBeMSCnUM0TgdHNg4b9t63+pGqEYao=;
 b=gFz2q8QCZL4/AC07/x+UNojO2VUoSkXWhzQsO2bECg1F2zEDU86AtAZjYSpW7LgsRY
 rIkIxXkYPF6HS5MTDX5CF7Cbq+7K7lD+5egM8M8t1cJxHkZl0d+BElhpuo3mChL7CWrj
 HMvYJR+efyn5+XvQY2vOCfeAVUWUx/i/1S99pHZ/LzlCHx2tkgneUHgn/35Sd34pLenx
 CIDA2h8nkSurRi9Nz68KXDdRJXH+IhfvTd9/Zug1JP2BGEZxAmmxSYHp2V91W9/WoZST
 S7hS8Ttixybt/9MCZYaDLwBTDSjqAbH/8TK6GBhLobXNtc0IWrVzXEEHORk1E9Rk3cBU
 wn/A==
X-Gm-Message-State: AJIora/QVa7DJkWmiLzuexmBY5LBA7UInyabtF6ukiETtAGcaEdAWcrx
 tRdgrn1kiE60M+LmX5MCHdlFmZLgROclZMt5
X-Google-Smtp-Source: AGRyM1u7rXtPafrufB0paqZak4it5Gz6DSgVfeHJdxSQbxogZpHFeVIPDG56a9f6DukUryTaqu/W0g==
X-Received: by 2002:a17:902:7049:b0:16b:bf58:ded2 with SMTP id
 h9-20020a170902704900b0016bbf58ded2mr16214426plt.98.1656911723445; 
 Sun, 03 Jul 2022 22:15:23 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902988100b0016a4a57a25asm19936290plp.152.2022.07.03.22.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:15:22 -0700 (PDT)
Message-ID: <f11a64b4-c098-7732-a60a-612edade9f2a@linaro.org>
Date: Mon, 4 Jul 2022 10:45:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/11] hw/rtc/ls7a_rtc: Use tm struct pointer as arguments
 in toy_time_to_val()
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-7-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-7-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 7/1/22 15:04, Xiaojuan Yang wrote:
> Use pointer as arguments in toy_time_to_val() instead of struct tm.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/rtc/ls7a_rtc.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

