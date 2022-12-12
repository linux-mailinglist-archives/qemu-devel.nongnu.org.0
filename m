Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF96649E1C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:44:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4h64-0002lz-2e; Mon, 12 Dec 2022 06:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4h5j-0002ej-5u
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:35:30 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4h5f-0001Ct-SB
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:35:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id h10so11751556wrx.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z7xkNmPUMiqyWI1sTuagUvy+JttWb8I92FFgZ/op5QA=;
 b=UZhosk+2fh/h+Y2WZ8MSZuPKiAie7R48N37L5tO4daik/jIio+SVsB/R00KpYzUHEU
 B+5ZzKiKpRKu1QoUTEbG+lVSJS/fPsscqApvsoxQzFwAeKowwB3HQLExIcAi1hnXegFw
 oMuNLC/m9UTPvKQMGcotmMHd9OhradmpX4YKeSNd4/sUea3QJgvho99BBuPbhmuoG/1s
 TZtzye6pJ58jEZLZ5G5/Obp66sAB8tIxHJCwYJRdIlU8VdH7dYC6UF6GooSPIaNB+sWC
 Ohn8tgtro7wMbeDwl2CySricdlXRrAcc+Umr1Jpw9+cCsMpFTeykE+ZKV3iRqv98UBpi
 /p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7xkNmPUMiqyWI1sTuagUvy+JttWb8I92FFgZ/op5QA=;
 b=wfAgyt1Amg4YP+eFgBbQuPf7lz8napO4SbeaG39WY4qRyepSTmHAvSabpIH9+MMnsv
 IQlMeTGl9KObFyxgxPmakys27bjxkj1mZnfiZkGwJDFJwAAvCCbDKwP0a0Q9xX2gnIM7
 57jRM7ftG6k5Q/LBDSC6tUYL8OsXjzJ9Fz5hYz4j84fyRQhVjTTmAWoCOoHtOAUWGEnc
 JD1k5N5B5PeoJQgfzYxJiusdx1oum56KIQ6AeamkQmI12i54/zZoNxCoHzMSOvhjzEfy
 s1cI3A+2uh8seWgcBcLwzX6CU8ljNdTWgEH1utOUisAUKuU1Y/tvejGKCJGj4h2uTf3f
 wecQ==
X-Gm-Message-State: ANoB5pkxS0DR8KR44yZX4cI7/sgeThQsWbir/i/8dN2+DyJAk4WSU0Rv
 dYhTYAdGhSu27rMsqOA3t3TN3A==
X-Google-Smtp-Source: AA0mqf5JixSFasl4tSNbpRS/tFq9ovE+bdrXFEF68SdTVvXBYLNzVFLugAMI4Wtz2Y2aQVvc2v9HVQ==
X-Received: by 2002:adf:f0ca:0:b0:241:fd48:dccd with SMTP id
 x10-20020adff0ca000000b00241fd48dccdmr10181854wro.63.1670844922207; 
 Mon, 12 Dec 2022 03:35:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bv28-20020a0560001f1c00b002423620d356sm8675355wrb.35.2022.12.12.03.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:35:21 -0800 (PST)
Message-ID: <a32b241c-e46d-a422-ebe5-aee4b1cc5b0c@linaro.org>
Date: Mon, 12 Dec 2022 12:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/4] hw/nvme: fix missing endian conversions for
 doorbell buffers
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org
References: <20221212113215.33135-1-its@irrelevant.dk>
 <20221212113215.33135-4-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212113215.33135-4-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/22 12:32, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The eventidx and doorbell value are not handling endianness correctly.
> Fix this.
> 
> Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
> Cc: qemu-stable@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


