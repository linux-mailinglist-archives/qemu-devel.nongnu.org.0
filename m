Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518804C5F67
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:20:19 +0100 (CET)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORtq-0008Dg-FM
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:20:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORsp-0007UC-8C
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:19:15 -0500
Received: from [2607:f8b0:4864:20::1034] (port=54191
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORsn-0003nD-MG
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:19:14 -0500
Received: by mail-pj1-x1034.google.com with SMTP id bx5so9490871pjb.3
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ulh40nCFG8/w2I6xbf1Pi8Ouq8dUFv9Ch4dX3HYHWs8=;
 b=JmKeb0kOflGt1DPRXBq9yKOBRY/LPxyCMkJdt3hzmLmWZy3fghEuOTmbxzWEFZmL27
 BusKkUFfbBBkC2NYQ3Kzk162fT25/lrKOtmDh3B4hxHz+u2ZU0S0RaLHsYUcgKgTYqle
 U29541kOlERolgSFDKVmfGvvmIk//K1SVMII5HTDrCIjFLTHv5GNMJTDpxr/gamqhT0M
 W24aO26UBk0gXTnOU2W+dJWP0ypC51GS/clolLtLWagQ44cbNSczK1aS/FKB+U/tFfS5
 t0S9j+sI2NMEREvHfqyga9jyvvsSnVo0ksHine/zn5oNxIvIqaHLDAzuoqt+RBgR8Cc2
 uv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ulh40nCFG8/w2I6xbf1Pi8Ouq8dUFv9Ch4dX3HYHWs8=;
 b=igl1E/dgkMBzzNmXB6JZz6IWQeM3kVqmX858GklLdJtKsLEgOpYdXYz4X6vNXkJUxg
 FGcFvGYNjmaGfuYPCny4rhP5mZql3QiTJhYl7jkZUCxD5w3l9iSqO+yKqsp0cS7TOv/w
 87rgQfV8FGTHIDLY4GkvGpoPiPseIab9g1VxjfnvFHmJgxMHlNEB/LY6Y2Z8vM4VKOCH
 zxNPzQXSusN+3W1CPfQAd5ZoZixCrEchC4wAx9FAS3gIg7owNAsePt0aKUjhJEyhukzc
 OaomWRagI5XNWyjmVD1/JfBKCM8mCG3YxZp84oUbAe345MqE5lwel52Bfr8l27ePLN87
 a45Q==
X-Gm-Message-State: AOAM531po7wsICYC60TGrVAONPBZgVcQIretkG97/nysWgO3HB9OqOw2
 9e6IjgDtwSYOk+lngdliIA4=
X-Google-Smtp-Source: ABdhPJy1bgPYUKw3oCBOFpfmq+my5ZHgo4Dsv9Pz8tlXTXP2Ag0ctFyKH9BQvlG42bEQ0qDqz20uXQ==
X-Received: by 2002:a17:902:704b:b0:14d:2c86:387 with SMTP id
 h11-20020a170902704b00b0014d2c860387mr17858362plt.1.1646000351941; 
 Sun, 27 Feb 2022 14:19:11 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 j67-20020a636e46000000b003740d689ca9sm8217046pgc.62.2022.02.27.14.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:19:11 -0800 (PST)
Message-ID: <f324047d-8156-6c6f-f5a4-db1c771907fa@gmail.com>
Date: Sun, 27 Feb 2022 23:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 06/22] isa: Drop unused attributes from ISADevice
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22/2/22 20:34, Bernhard Beschow wrote:
> Now that the last users of ISADevice::isairq[] have been resolved during the
> previous commits, it can be removed for good.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/isa-bus.c     | 13 -------------
>   include/hw/isa/isa.h |  2 --
>   2 files changed, 15 deletions(-)

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

