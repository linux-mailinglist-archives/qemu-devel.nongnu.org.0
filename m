Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2A835782B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 01:02:09 +0200 (CEST)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUHBY-0002xe-Gy
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 19:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUH92-0000yP-OT
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:59:32 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUH8y-0001Ap-5D
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 18:59:32 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v8so23173plz.10
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 15:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6EkxbiY+NIoyu8xdhMte+HJ7xOFHbxj6pBXNu28kt48=;
 b=LKO9vjsVdQ0v8Gz7VEC+P74kiMgEH+XJlQj3vztHihAHXQ/Wu2+0j5KnIvtwhvqAgu
 PhLiSiDmaXcPK28rcQCz58hj+7HWSuzNd859fembOUjbIAnus9hII5MpBUcDtc7b7tNP
 bYqVWYfUSW+qhVyvMbFVz0WDWILEZgQ7+gX+30581F3X0kHdjh6Msjvq8544vZeC73kf
 kISAIWE6RFnVygqYcl18krqrDqhdA0u1swiWtabeQB1xy5Bf37L+MX7D8ut8cbVE1Y3w
 sshPBKowdeeZOUnVjLwrEHSUspb7PgCzv8MABSCneDd4PrCdtdcIi38T5rwjveDkTeOt
 QmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6EkxbiY+NIoyu8xdhMte+HJ7xOFHbxj6pBXNu28kt48=;
 b=f0brH5B1ft1rjNK/YZ1bdb/aPYEhBLuVZ8zll/AGrZ5yKQzM/asWG38ehtfZjEiwVE
 SxxZUTjl3I7x0GrkNmxG5QhdG6l+Yq0Xb9MGa4T8dtwrij0TfpOZyFZ3l9csh4+Gij3t
 JCdvJYzOGyzSFKNANCrhiZzxadx71s+M8NGWt0q+19/tW9wm8u2ybsyg53Ko7HEHxztE
 62WtLNjJXVeQngCWJ31HE19VeEeV0miPgCDO39RrY46ZkH2RJSuSlsgRbd7tE7jzJ/I8
 EJU+5/fbChEY8yE+ShcS4+JUoiQRSYBJA4WNBD/EKVkSHCk7a2QKWW925eLziVgu7mRE
 deZg==
X-Gm-Message-State: AOAM533x0zUR8OAWq4TQ7aj4a4c04TAdtflIPn2drN2vtCIhVkohOEfI
 3PQp6vyzfWs5eQexnpurFvhF+w==
X-Google-Smtp-Source: ABdhPJx4PNKd/TTR+cb+8fIvNndgVDZhcfRNOWQz//3R2SrfdKRKphAa6eeoQD5Co+mgvjNAeY6tmA==
X-Received: by 2002:a17:902:e886:b029:e7:386b:1b30 with SMTP id
 w6-20020a170902e886b02900e7386b1b30mr5126132plg.42.1617836366625; 
 Wed, 07 Apr 2021 15:59:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z23sm22927819pgn.88.2021.04.07.15.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 15:59:26 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] hw/arm/imx25_pdk: Fix error message for invalid
 RAM size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210407225608.1882855-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98c04529-d9a3-1a1b-65e1-a0b51da90081@linaro.org>
Date: Wed, 7 Apr 2021 15:59:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407225608.1882855-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 3:56 PM, Philippe Mathieu-Daudé wrote:
> The i.MX25 PDK board has 2 banks for SDRAM, each can
> address up to 256 MiB. So the total RAM usable for this
> board is 512M. When we ask for more we get a misleading
> error message:
> 
>    $ qemu-system-arm -M imx25-pdk -m 513M
>    qemu-system-arm: Invalid RAM size, should be 128 MiB
> 
> Update the error message to better match the reality:
> 
>    $ qemu-system-arm -M imx25-pdk -m 513M
>    qemu-system-arm: RAM size more than 512 MiB is not supported
> 
> Fixes: bf350daae02 ("arm/imx25_pdk: drop RAM size fixup")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/imx25_pdk.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

