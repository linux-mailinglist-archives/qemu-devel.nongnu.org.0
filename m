Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F52471D09
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:49:23 +0100 (CET)
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVmc-0001wM-De
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:49:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwVlE-00014E-5i; Sun, 12 Dec 2021 15:47:56 -0500
Received: from [2a00:1450:4864:20::336] (port=56260
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwVlC-00088D-Br; Sun, 12 Dec 2021 15:47:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id p18so10614365wmq.5;
 Sun, 12 Dec 2021 12:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QK4IgL2PhuslEAczWGM8tN3iN5M3RPsV9nieV1QfAH4=;
 b=hjQBwTkSkbXJK5sOjX9NmIkNtTSCqTG34hbmmop8K84a57yTPcGD8Bj8c4dhu33t4P
 QPH0tbGjhAXhivNMJgaHdpV/2Sr+6gKTVdsJd3Nhw5XCdMBzE/+UHMEAh0fCbOHbEkzC
 hkafCHTYDPKXQU2lVpRbwe3jz4NOIO5gNEuMgNMgKvfrs60fIonIjsXpfReGmkGzskC7
 LZcoHlqB7nOLbVh9OGWehSY90yfopQ7uk/pQxwv0Xc150Ex/grP0zab0PTRPl/zZ9WIE
 YEzQM5bcMaHyA7xZPM+PYzGZk9B7dDJzOjyEVX783gJ+fNo5ZJzBm4qL35ur7B60R77n
 Kyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QK4IgL2PhuslEAczWGM8tN3iN5M3RPsV9nieV1QfAH4=;
 b=d0+ie/r/a/G7ncWXhayhkuVtvh6pr4deLsb5UbYWr0hXRGBaNoIqT8pqiW0O151W41
 RPBaPRVALCjjDisn1BOEvKqCH/cUPrQwBSUASyitZnVsyq3buYKC8FoF3uhtwgKNTXA+
 A3qLphKwopUASw+BoobIkCg0WVaMbX8USjRyxEeH7grAwVgfZb3s4UXu+hSGJTkEie+e
 Kj+DSJYdKXiQ+puzlf1Bk9tdyUrjPJyYW7/20fZHCIfkh1Otn+uAgUI4Yo71LsyGEcVa
 g+xe5eANqFF5Dm/3QlgOm+4gT2PNHCrKUYOlEIa10b0Ym+m9EMnGvaeLqRyNr274Up3n
 hliw==
X-Gm-Message-State: AOAM531RAdQTkI7WSzdhIdWGJuQzSG56BYPUtjvLqNlz2qZ3iEVFLn2v
 gN03pgI5V5LviYxGOYCZ9bI=
X-Google-Smtp-Source: ABdhPJx0Ili8NYVYY+igOcpH9vWT60L36onip0W/utwnZMYeJwjEy+Z8lP6UCZc2HCHWJd+8jMxSZA==
X-Received: by 2002:a1c:5414:: with SMTP id i20mr33406020wmb.88.1639342072665; 
 Sun, 12 Dec 2021 12:47:52 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h15sm5384201wmq.32.2021.12.12.12.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:47:52 -0800 (PST)
Message-ID: <3b4e4399-419b-55b4-a787-4131b0e06d4e@amsat.org>
Date: Sun, 12 Dec 2021 21:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/26] hw/intc/arm_gicv3_its: Reduce code duplication in
 extract_table_params()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 20:11, Peter Maydell wrote:
> The extract_table_params() decodes the fields in the GITS_BASER<n>
> registers into TableDesc structs.  Since the fields are the same for
> all the GITS_BASER<n> registers, there is currently a lot of code
> duplication within the switch (type) statement.  Refactor so that the
> cases include only what is genuinely different for each type:
> the calculation of the number of bits in the ID value that indexes
> into the table.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 97 +++++++++++++++++------------------------
>  1 file changed, 40 insertions(+), 57 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

