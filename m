Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19B6131A5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQ4K-0001E8-P4; Mon, 31 Oct 2022 04:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ4H-0001As-G9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:22:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ4G-0001UK-0b
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:22:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id y16so14815699wrt.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SMerCS/DzvWylwi5sC0jp5Z1T9mm3AeZOTDx+x7nz8E=;
 b=SKZPvTfRYagmXCdoZ9944NJUUJz9KPxRqUis5TO05T6ca4WHmj7/q6ErZilMPYaqZX
 yk8uoHdO0mXH4BhNZCLflYMsCROjc3mpS/YNXUPEgAeFJvhLU5FX5pKo9axqYchU76QM
 x/ALijMKXvIKfBQe2NkJoT2EVwlXqDImaMGaRtQ5sU4a1ezF7bG/+uNDxzLViArcwFWE
 fCUpB+XCQTUHQPrK7bMRG3w+SPdSXrigQFs8T+btcU00EOcusowXff7WNJX0CAZvW7yd
 iPUgNxBt1eDHacC4HbblBnTgFPqvOpJz8e6nJLvwS+f4ZHv7r2bYV0615wCRx5xFGq5Y
 t40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SMerCS/DzvWylwi5sC0jp5Z1T9mm3AeZOTDx+x7nz8E=;
 b=cUrx4ClacubfPNnV3x/93XNlIpaM2Ge3IkKU9WV3pgsYvH2pshYeM7zNNDmgeeLQNZ
 D8VnG67swcGoCI1U+PYCBUDIXRi+tlO9hCtBu5DEO34oDpRifWADtEbfPIsinNbtRZ8C
 tNNpTYtS2dhdGpExMwV+eUt/NJZvJJdc+XK0tqhDKD+J1HOuB0Jpl4Wx/upYWZk8Tdmo
 S7gwhPhhMul+psgwdbfBlnixi2tqYyZfmL1cSs5EfvLyVmdzwRgx4gPiwQ6zbWxXylCn
 vcxzCRou8/WHT0NAiEQIFyeL8O/pMLKv4PchBA7Z9CbGJBZqPqvWScG2Y/Pfknv3ZqTL
 WiZw==
X-Gm-Message-State: ACrzQf2nfMrh79luKqFBoUla1DhPjZpiC5R3FHjQuaJr13uxSOpw5U5I
 yhE5lJmiO5P34ZspMiWu2V8WXg==
X-Google-Smtp-Source: AMsMyM6OwsPbCh96mWtPg+0mmvWOC3EWHxEVm9PEm8ymRDxMBx/tLKxCtznsyeXNDQthSz2C2kuhYw==
X-Received: by 2002:a5d:5a14:0:b0:236:c206:f1f9 with SMTP id
 bq20-20020a5d5a14000000b00236c206f1f9mr4013997wrb.694.1667204566399; 
 Mon, 31 Oct 2022 01:22:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r2-20020adfe682000000b002365b759b65sm6380639wrm.86.2022.10.31.01.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:22:45 -0700 (PDT)
Message-ID: <df438e87-f414-dcf3-19f4-df1f85f475e5@linaro.org>
Date: Mon, 31 Oct 2022 09:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 08/11] hw/timer/imx_epit: simplify CR.ENMOD
 handling
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-8@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-8@git.sr.ht>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 29/10/22 18:41, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


