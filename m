Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C14E564CE6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:17:44 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ESt-0006WE-Lj
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EPR-0004Xv-3z
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:14:09 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EPP-00012B-MW
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:14:08 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so4101167pjm.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zVx47SEwW8vmKp8Tf2iri69DxOdT3KCBLT/dIhInA+g=;
 b=ROE+2B8uH+d2TjZpWt0pA1hxGYgQtbknCaus1sIM71IMqo8k6XYgUfMWUq7DSTIm1y
 aWD8TFb6ESBHTvAImGq/nwpe733zVxa8Sq1MULIECkzYZhiHlDi6rj41md1uHj10hcR4
 AFihCAN548/UKcYcoW8kpNV/nWbRRDipyjFlCqDmefu81LX56rOgpKWmGd8aiJjvctZT
 3Vg1MZjelxjqJJA9Inv1SqnNGE5FTXx2FDomR2Dtq8TJGbwj52K3h8eVZRzoe1Cw5noq
 iX1kFtM+5+DxFj7ZolC+6yx4WPoRnY4Y24h9z6dP57b23Zn5SKTW+saeLu223tSMy/fE
 O96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zVx47SEwW8vmKp8Tf2iri69DxOdT3KCBLT/dIhInA+g=;
 b=YxqodHLPFtTLFeOQ+KsHaqPnrK9xD3lnzyR06+8iedKe7R8v2CIzdfytxWVgVvf0No
 7hcPQxPIxwWWQvF8lYBkazSVDWXJs5SbngNpLLvzIj8nBlh8RF9K+hh2sjQmtKLp/WQE
 X0EBybh+QBan5cSiNduISLSh8v6YpTzDnDfmVWBi0W7NrCBtl1Gx51qjuOUrR1aEIzsv
 xHbXrpoGeZN1UXQ7HA8mRc7Ek3Mp/E2ixRc1rK/Q+sBDX8aXvhXlUepUWvZib0jFnQQX
 lRWH2YDFYvAZjz2BIo0rs8Yynh+4OF0uyDMUolJgJKKYSdD99dzCeH2vxoqKAZ5uVGOY
 KDTA==
X-Gm-Message-State: AJIora8b0JbJa2TZnz7AB9Ptc4xliBUOMMvYOdj7h9ffg3UgRx6u4Sgy
 UwOrkE/RyjLx3Wq7741ucp0rAg==
X-Google-Smtp-Source: AGRyM1v672O1PgS6EB66aQYNxb8wmsS0R1NgJfCySvROJ+J822RwOeBDjEBqV3cmCBcuicUOrEG8mw==
X-Received: by 2002:a17:90b:3a8d:b0:1ef:7d4:6a5f with SMTP id
 om13-20020a17090b3a8d00b001ef07d46a5fmr32494570pjb.139.1656911646404; 
 Sun, 03 Jul 2022 22:14:06 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056a0007c200b0051c758a3957sm20455418pfu.149.2022.07.03.22.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:14:05 -0700 (PDT)
Message-ID: <40cdd44e-ced2-396b-8d75-e9b839f55e77@linaro.org>
Date: Mon, 4 Jul 2022 10:43:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 03/11] hw/rtc/ls7a_rtc: Remove unimplemented device in
 realized function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-4-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-4-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 7/1/22 15:03, Xiaojuan Yang wrote:
> Remove the unimplemented device when realized ls7a RTC, as it is not uesd.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/rtc/ls7a_rtc.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

