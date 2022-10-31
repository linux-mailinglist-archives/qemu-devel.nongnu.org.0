Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A036131A3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:22:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ3K-0008FZ-Gm; Mon, 31 Oct 2022 04:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ3H-0008Az-7y
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:21:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ3F-00012X-OO
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:21:47 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a14so14849945wru.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tBVSlDFe99sqTWtCb8HKi7D8HNcy0+FflhqJUiCgRaw=;
 b=QCag9tahbDab+mMbX/oi24A30IGtxCC00sNzaqcQ2Rx6ZPDM+Lzt4HAuOmgu22vHJN
 ZPHmLRWhiOoRPeU/oLhNWyidByi76q9H+JIMpUAOl/+zzNVi7hxhzchhuUaxjDatBw9r
 vmaG2hovX8zLQKYRKVqxTIfqjReUzIbilc+M689Ib7ZHqMdCi4vDJ4inpdCfd1UprfhM
 LPa3kDpW/bsFpci7Xn7WL+MhNASCM9gAS8CSig0fgA6jybSij8Oa7g/NWd7qzo2JoZOC
 qOVHHsNIuOBvZ+66362KBuHQ4aaD/Em7NExZgK+2Ffeub2rgfW4Oy7X5/MWYUBISvDOx
 F2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBVSlDFe99sqTWtCb8HKi7D8HNcy0+FflhqJUiCgRaw=;
 b=mb0ajTZoMwnNanqun6vt5Xb3jzZHEsv2PW2st49vMbL949+FHHBj52ucu4RbG0pURM
 nl3mgQ0oidwRickhmvtR9dJK2zmkzxM7CsNNBtijUJlAo46a9dahXkyX+AiKzKyZq+4T
 ENJyo8I+L0arIeET/3b5okZIvcHyHq62bseO6I1z78Df5Y9yM+2OgSZELzWDzHHU9eOY
 Hukr2Ubo7xGilGcPCt3W0EfHxFeLWtjZg/qCOHyu/Y86TZOydjgMLMcjWJqyIreWYefD
 fWlrYyB+HAcCH23DCwPmdFzg04ZBIjMwPx97GhRfm5RZNBJX6/+6V52qsVd7+CCHUGml
 czzQ==
X-Gm-Message-State: ACrzQf1klbZfkU4/NFuTh0/6fV3CF4WjvLDE62tnTeq2yBfOgMf4pLV4
 Mzk7p/75poPrAQkoXJZsbhu/2g==
X-Google-Smtp-Source: AMsMyM49l5MQXKaB+0ZKg+K4WdBvz8W6E/RrFAsSjrrvpZ+TbbquPPAxmuyXHjLz1RQWFx3SqBKxwA==
X-Received: by 2002:adf:e88e:0:b0:236:792e:f2a2 with SMTP id
 d14-20020adfe88e000000b00236792ef2a2mr7050785wrm.220.1667204504234; 
 Mon, 31 Oct 2022 01:21:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e11-20020adfe7cb000000b00236740c6e6fsm6275029wrn.100.2022.10.31.01.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:21:43 -0700 (PDT)
Message-ID: <8aa499aa-170e-3e6a-8461-f42072fb9b45@linaro.org>
Date: Mon, 31 Oct 2022 09:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 06/11] hw/timer/imx_epit: software reset clears
 the interrupt
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-6@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-6@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 25/10/22 20:32, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> ---
>   hw/timer/imx_epit.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


