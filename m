Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88744558D0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:15:31 +0100 (CET)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneS2-0000GL-Dl
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:15:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mneQD-0007Hs-GN
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:13:38 -0500
Received: from [2a00:1450:4864:20::32f] (port=40579
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mneQB-0002Dt-6F
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:13:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so7144854wmb.5
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 02:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b3w93Dn7lz63BdxbIaPxsUMqawYiezuTbOO1o28gH8k=;
 b=g998Ifa6pTzoZ/aMGTRFEQeROMRlYMmxU1tlEkZeG24VQie0H2rMG39XsEo+bWkhEK
 VFLIyYpA0SqxVKLvne21xyFEKHtVDO0bDvtWqlyoPYmtGh+OdvdO2HbzOvbyvNuRZNbZ
 +QpgagsOR9U64bnTEJ+clhp6o3QIudBfJxFr8DSAV/LH3S6AdIVt26qTIgE7vxXacdpi
 9qJGFblWUOu2rY7wckQXWGczDk22UOI5Z3siG+wi0FVsVpQSAyO5wTJheHtp984hhfX9
 sNmIj9tavC/LNvZqz9iQA6n/zOUqRym/KUz/McyhOcHOlofgJsG17I+y+IhW09bdc2L1
 +e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b3w93Dn7lz63BdxbIaPxsUMqawYiezuTbOO1o28gH8k=;
 b=QVVVuxwQHResX58hsjELvg8mwa5lcbx/liDObODUfVfVdZ+oKCdAnEPeSzLQcOlCht
 6qeh/eguNEa3ddE9TtFfHvCOJFelMVrIcGPc1n3bmLZAW5Jmiwq1lkKBrH17qywboWmX
 FkLW4ZL88WQiLQdWGt6e8CsjagHlBXKOrlMZQClKiawPiihf6hKt80bAaEvu8/wTORdn
 YVnMyxfeFBEb7iGdkYxrIlO90QDrZZpulUsgACdhwxYPrGbacZUwBd0DyL6JvGdsgg1t
 pfCofQfn6cGczt0J/7H6OZWMzD7kE+qpk3b00u8S89IZuWxhFEt+Wa4xECO6x3cCEX5d
 ZemA==
X-Gm-Message-State: AOAM530ieDQXZbvD/jp8Belni7BMkftej4iEJYZgpQ+5J6752hxYpPwY
 NwuRDwwO+AIhF/XxRzjdXAovlw==
X-Google-Smtp-Source: ABdhPJz6V3CtYV+9xyCUIUwQh5l0HyCYoyUT0KE8WEbKg4n/UPjExH9R135glfhCArmg1IgTDf8yqg==
X-Received: by 2002:a05:600c:1f0e:: with SMTP id
 bd14mr8689347wmb.3.1637230413327; 
 Thu, 18 Nov 2021 02:13:33 -0800 (PST)
Received: from [192.168.8.105] (30.red-95-126-207.staticip.rima-tde.net.
 [95.126.207.30])
 by smtp.gmail.com with ESMTPSA id q26sm2669223wrc.39.2021.11.18.02.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 02:13:32 -0800 (PST)
Subject: Re: [PULL 0/1] VFIO fixes 2021-11-17 (for v6.2)
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <163717652748.2560806.10593927801828190496.stgit@omen>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8fb77b26-2a96-28d2-dc98-d1561b2b5848@linaro.org>
Date: Thu, 18 Nov 2021 11:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163717652748.2560806.10593927801828190496.stgit@omen>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.084,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: liangpeng10@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 8:17 PM, Alex Williamson wrote:
> The following changes since commit 3bb87484e77d22cf4e580a78856529c982195d32:
> 
>    Merge tag 'pull-request-2021-11-17' of https://gitlab.com/thuth/qemu into staging (2021-11-17 12:35:51 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20211117.0
> 
> for you to fetch changes up to f3bc3a73c908df15966e66f88d5a633bd42fd029:
> 
>    vfio: Fix memory leak of hostwin (2021-11-17 11:25:55 -0700)
> 
> ----------------------------------------------------------------
> VFIO fixes 2021-11-17
> 
>   * Fix hostwin memory leak (Peng Liang)
> 
> ----------------------------------------------------------------
> Peng Liang (1):
>        vfio: Fix memory leak of hostwin
> 
>   hw/vfio/common.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Applied, thanks.

r~

