Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2F3AE92E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:35:25 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJ99-0006Ui-PB
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvJ5h-0002Gn-3Q
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:31:49 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvJ5f-00015d-54
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:31:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id n23so10397990wms.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N2ry4BSN7osZOUUxa6lcZTMAbk6/WVrLj7m8GgNXke8=;
 b=qJXImE3sT4TnslTRyAAkEr8SXlWCSZ9TjyR0xFmKKLTQtER0KWMCOJnURmMdkJU69n
 uXbPMnFoWO9sFrOmMNqUfUjgeJrXhhq5O3SouXPM7Jk7L0ZM8TvPIuUbLdK7rm11qxDW
 KeJmkiJiEmwhHk1wuAyWdregPncK+NqetLLzlMFKpIlfphY16MiDPZBxa4sJAajhnRpy
 r8BxQPVQqmT9+78/AUnlt2geWxsLozUxeaor6ZTTqTf73op5h/zg0keWNWOlh4W46BLD
 BnOSFweBlUawvKm9bcUgtK5ugBg9nn2hiGbU3ewp8Yk7vK+iYc93f2GvqsnL3rrwRniA
 xHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N2ry4BSN7osZOUUxa6lcZTMAbk6/WVrLj7m8GgNXke8=;
 b=UNMXoh0Hwn9IUZ7HVv/VsY2rKlr+XXvCsG/tMqy5R4sai2KsX+6gk5p9JyaTPjF8x5
 TYmvfUSdGjwOhzq0DT+byoA1gibmHNxKN/atEn3EBhzu1kCoUIZAejDu8gJ66/824Q6T
 FujB7Pc0sb4yDGKbJWhZvek1RYv6YNLEXeVKZYiXkThnbHhFPR79xQDjc5rbaK1DqGLn
 VyUDrgOvU70Kv4pMuWc/JjAh0eYzYzIyIQgYkTWUEaDfICUOcZBpoXy0rxDfj+zVz3pS
 Q55K6rArgh1F+SKPcD5CUAG8E+OXvuOE4YMh38B/HuJVcrGf74PLaYpgg0odvD2TTsE1
 HHJA==
X-Gm-Message-State: AOAM533//Ebidgd9Tpb4yBocKpxNrGYsboQAxxjGVUO1W9wIuyni/5aK
 LwroBU++rLG7ibQHDTKjG7g=
X-Google-Smtp-Source: ABdhPJy2b0EyJrmT/vRkzmOCVDvfSz7WsdRybfNeXap20DUNO240DIRb1T0EuTKqqhot/JfQm3fODA==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr3666585wmk.56.1624278705764; 
 Mon, 21 Jun 2021 05:31:45 -0700 (PDT)
Received: from [192.168.43.238] (47.red-95-127-153.staticip.rima-tde.net.
 [95.127.153.47])
 by smtp.gmail.com with ESMTPSA id n7sm18691560wmq.37.2021.06.21.05.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 05:31:44 -0700 (PDT)
Subject: Re: [PATCH 07/26] target/avr: Mark some helpers noreturn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <56c74686-fec0-0aef-6023-92c9b1a9539c@amsat.org>
Date: Mon, 21 Jun 2021 14:31:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621013439.1791385-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 3:34 AM, Richard Henderson wrote:
> All of these helpers end with cpu_loop_exit.
> 
> Cc: Michael Rolnik <mrolnik@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/helper.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

