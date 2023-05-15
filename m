Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAEB7025BB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:12:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySN3-00039S-HE; Mon, 15 May 2023 03:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySMw-000389-EB
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:11:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySMt-0001BH-N6
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:11:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3063208beedso11742292f8f.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 00:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684134696; x=1686726696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sBdlLd0RGmZoGMQI2SU5HJRgzkUTKTcbuAttEZnC7Hs=;
 b=gSA3hRNv4z8ocOBKDn7UWeB2JV6IW5qQgZU2NrWdWMqToHSwjtqS4a1y2nPBKBQodZ
 g7kVH39dUkBSDRCo6tJi6Hce1IahrhfEJATsCGhhwvCm0g5Wi8fMyAchutzrZZaiqwI9
 gwAzAJzpM8KFbJjunRjJBe3R3PjXfarG60qmAvOcI1K19P7KMC7WV+Mm3E9C32LkZPsg
 ajXX0RHEXJlPeSGFiEdESNAQsNX+F81mSS8j8lAnm+ofOJ991SSFOJFh+F5eyJQI9qRG
 76HhgRAtqEZac+zlyU0MRLZ8gGFfUgYYtvXnXXntC/vhNErANNsOi8Lpd01LU18fjJ5T
 Tzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684134696; x=1686726696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sBdlLd0RGmZoGMQI2SU5HJRgzkUTKTcbuAttEZnC7Hs=;
 b=XVKCG4zhZ//H460dVhlRODmEXbeoYVud6DIoFeWB8NHkaxjxOK4E3+ka474epzSvig
 TsktcKMqpgRMea/I+TnUQMFVfx639XZ79+ok0FsKZrqH+F9w815HVGr9yqFYijCcGRiq
 8K5QqTulJD4EKVLzUR8tOjHW2HwnxWxI3SoxBzkqC1ZvGYdu+f0BCR6XahhJ2hZdIJj0
 FHO3NuYZkwDrqwI4qC42//vbE0WDeKfdlhc0o3VDVPQ4IcDcUkt4INDzTUQh+rohgNyJ
 5UWsiwVecBuM6VNxT7tUbhzn7rx7zcbK4Y26EmKYZKU3bDcWlZbJBkKeSSP7Z1oMFaEZ
 w2+g==
X-Gm-Message-State: AC+VfDxumuT3rgDaMkanAJlluuRETE+F2605kMDZ36rzdSp8ywoI9CO0
 e1dUh/EYQcHY/bLJrzUoC5BW7A==
X-Google-Smtp-Source: ACHHUZ45scSzwkKUcQCOkH9IA2nXxAncrFwWI5UFnKw01t0q7DOPx9CxgrE5oK1j1PcUi4+GKoHjew==
X-Received: by 2002:adf:e552:0:b0:307:7be5:90da with SMTP id
 z18-20020adfe552000000b003077be590damr21224140wrm.68.1684134696341; 
 Mon, 15 May 2023 00:11:36 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d65c7000000b00307925ff35bsm24590535wrw.49.2023.05.15.00.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:11:36 -0700 (PDT)
Message-ID: <16934ed7-b58d-6685-2aaa-6e2e9560bb75@linaro.org>
Date: Mon, 15 May 2023 09:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] hw/arm/omap: Remove unused omap_uart_attach()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230513100906.46672-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 13/5/23 12:09, Bernhard Beschow wrote:
> The function is unused since commit
> bdad3654d3c55f478e538037d9eccd204e5fc8ee ('hw/arm/nseries: Remove
> invalid/unnecessary n8x0_uart_setup()').
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/arm/omap.h | 1 -
>   hw/char/omap_uart.c   | 9 ---------
>   2 files changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


