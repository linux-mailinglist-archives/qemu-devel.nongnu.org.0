Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1B32CA76
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:27:26 +0100 (CET)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHdi1-0003lE-Nj
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdgU-00034t-93
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:25:50 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdgR-0000qD-Qf
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:25:50 -0500
Received: by mail-pg1-x535.google.com with SMTP id a4so17853756pgc.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPfBpbkfMKyo4uWM+HOs5ZeOcnTnwl6JG1fNoxFLjEk=;
 b=KDC8tfybz/Rwy/psZaJ+p3L5eCjwVLqzALGryIfMWm+MQ7VrWqxHGwDb7vGE23RQxW
 ndgFyo5TToojcYWojZSOyxNwcZrPGtTXWadWEdVX3PKzjXwwRx0SDLeTYQ5YAwwHl+eh
 3FSxYC53Ciy/IbVpQ0XohyQfhhM0e4SVbG2B6fr3j1zGtQRGqRhyANkfWaEdVQAISul5
 lHi3xnnbdXdQ/cUgoLBNAcY4wKyA+HdvsC9+zA9QMv+6YDhMVahqWFtwP7iMuo/Rwb0S
 iO5F0VcFxat7RrLPfMbojoAyYTdjOB/wVqcn3/4T2d9jobCXvoevPGweTCz7iwmCz7OH
 ZAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPfBpbkfMKyo4uWM+HOs5ZeOcnTnwl6JG1fNoxFLjEk=;
 b=aemTnXa36/xLdONyaT4gFfE7KgHk/1NY9R7aJOp6vy48NhtIIX5sKmWcXcjdcAv7xZ
 KLCxiMQWlSh4oruvTPIvMGpWa6MRHymWx2svr9wB9dyepTlNu69p37xr8b04nvncaHJ6
 7OvkV6PoKib6gBZaiTWtTUSY9AJsJy6qTEUhpj1E52qZZXMCst0AJPlIbRmZflspaBrO
 4EpYPUs30dw3jdf1/JEDWGeFn5Jbe2eVSYNaZUmIKD7jLo8K9SCRoR513DHfu9L02aR9
 ClzcYtMF0E41zFh+x1x63jn7d5p84xZI+yNMfypYpXVJOY2Hw74wXeXU6alOIbYl5FfT
 BjYA==
X-Gm-Message-State: AOAM533WHxWLAs1quNeyfr8FABAW1flgVmMpM9eQWsue4sAsv6PI603y
 Ew5FhtfFl7e0eUxGX/SDRQeHRQ==
X-Google-Smtp-Source: ABdhPJx+5yEZzy00MZ4DLY1yaJ2QzgQ87Pde5XeiXghmGZuc44WRVlB38f8N/R+D1EPZFAUPHhspqw==
X-Received: by 2002:a63:ce18:: with SMTP id y24mr1737522pgf.246.1614824745978; 
 Wed, 03 Mar 2021 18:25:45 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k63sm27026584pfd.48.2021.03.03.18.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:25:45 -0800 (PST)
Subject: Re: [PATCH v2 23/24] docs/system/arm/mps2.rst: Document the new
 mps3-an524 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5cb7840f-e6ba-228a-a166-bc46a7500a3b@linaro.org>
Date: Wed, 3 Mar 2021 18:25:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Add brief documentation of the new mps3-an524 board.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   docs/system/arm/mps2.rst | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


