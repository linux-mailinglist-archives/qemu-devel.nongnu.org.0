Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E31340D74
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:46:08 +0100 (CET)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxep-0002zH-Ti
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZ3-0008Fu-94
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:40:09 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:42743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMxZ1-0003tf-MQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:40:08 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so6121505ota.9
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ikMOIpgsPwhltCbBs+UCS9IGBk9Ra8KEgldmQ6cd/SE=;
 b=nf4LO98am2XF+94vMyHHjbnBKhja5OJsFAPH+d+SsAQQGI4xf5Tn8S48skanPV8g5Y
 7anPM7sqSllRbksGjvjbDBff/sxu4Yg2s0Pc0+R34U1GO1eto0x/CKHEPpsPVENuGRem
 Yl85QBeRrNcGTryEXGJWdAYhj4RZoG7EPu+MC1h0xEzWPn7JOxmCqq+Bps6kjLk28WZ3
 fVqUaaWW2xAqZva3vBdkfr2Lh94lfVlAXDGOM631sUBbmCz/HadgU9ROkRnTCUXy38h6
 qUaicY6cl7QAYS2jlOgPK+5OeGdUoI5+VfN9iw5lrL2FYICUUvQGefbUZS5wGzhGvJPX
 Zu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ikMOIpgsPwhltCbBs+UCS9IGBk9Ra8KEgldmQ6cd/SE=;
 b=NIg0thLsxOdycGQZEYwdF9Z+9JUyiKH1cLGIId5ZOLuF+nF91pkKVrMPUvY1+0ETHR
 6xinhioAMWUnInjpxj+FlcQb4Uzz5U3ZO3Br1lfDtraH4l2fQx8ipVvBhumvzg+zCoUV
 1UCXynNHFQ6+giXupE5BRlmTyX0QIX9J02HLXxWOeNkV7KHCUHWSlgF8trYp4vNAzm6r
 7PeelSGmDkXHqLdGI+bwLatOOIBYbLnll8Hf/6ab2tFVrB2g5W28QkDmOBAR8oxp8P8y
 KesV/KJeETrtNuGezfFhuxJWAMMPP1Rp6L5r9Z3XbIsFqvC9FXHDXRvB148mXnQmYeaQ
 xmjA==
X-Gm-Message-State: AOAM530ecDy8rpnkQ2MrIcfbSWQreS6ZovLoUf1ujo323GbYOundTEqB
 A8qqutfH4Er2pZsuABkKsGStVA==
X-Google-Smtp-Source: ABdhPJxKjS4AcgLYtsCD3HGjJJTu5j9LGj6KmK5KtFp77McZDs9dlKVSboYAtyk7gif3IlZPG4T+5Q==
X-Received: by 2002:a9d:202c:: with SMTP id n41mr5265520ota.289.1616092806440; 
 Thu, 18 Mar 2021 11:40:06 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h20sm688373oor.8.2021.03.18.11.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 11:40:06 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 2/5] memory: Document flatview_for_each_range()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c17c572-fb18-b6fa-0704-1bfd30aa8dff@linaro.org>
Date: Thu, 18 Mar 2021 12:40:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:48 AM, Peter Maydell wrote:
> Add a documentation comment describing flatview_for_each_range().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/exec/memory.h | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


