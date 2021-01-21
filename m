Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FB32FF7BF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:12:11 +0100 (CET)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iBW-00005h-Mu
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i8j-0006AW-Sv; Thu, 21 Jan 2021 17:09:17 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i8c-0000Fd-Gr; Thu, 21 Jan 2021 17:09:13 -0500
Received: by mail-ej1-x62c.google.com with SMTP id r12so4819547ejb.9;
 Thu, 21 Jan 2021 14:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LQypYJU7QQfNLIjMpe0ACD2LECqAVbbVWOCOEkL2EsE=;
 b=LGYBDp6LeaTMiKdyEkP57IL0HH+RXVrSOq511bBSH1DgNZ/bPdYTDIFDthCpyG4+DY
 uHR0R5btgEItuxKj8tI+tt7/80oEV5yTp0jZHjs6tYj4th6lTE9gLAc2ZSrVQ5XlYZDa
 dyRO+DD2Q2TklGzKS2mqwD5+qxuCnjgRGazev3EQ41apl/0GDEY6sN3srEXjYIGaH1Od
 N6EetSPbU35dUJ1eZ+2QC66AYqxgdyjxh68+lZf5eYhO27BM0kNcuIQ2m9a7arXRc0FW
 5GyfsLczqPXscoxcBqFbD/DbfBl6S6+05jjK7EymF0HAmYX8oG3pI+ozwVEHd8zEhyrl
 f8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LQypYJU7QQfNLIjMpe0ACD2LECqAVbbVWOCOEkL2EsE=;
 b=PNAIcuSqEA3OUsN6Eu/br93SOXSrmE/y522ko1dTdRv8PqTay3/TTXweXVuZY5L3ZT
 QxkP75Qy9sB+WTQvezmc7bqKeA/4zpqUPJSrXB1PDPBNeqe8u3+2hOJZnkv3hod1SlNk
 Pm0GguzN+DAB8ILTmlY95KQImZ87CHoc+8RXnVIYFcai4mNpF0z1iohkdFfwEj2MyDr4
 5U7NNF91z6J9Xzop73KLD/duvK5pijnVLNPQz7T38vLWNasPc07cBwriLdNHQClQaNz9
 QEE5+Nw/itZq66tC4Bw/WWIrspwMR80jGfERUEGyFGTFqW3pCcZ3m3YBuhFsl9lGlrqS
 mbJA==
X-Gm-Message-State: AOAM533re4x/PTzrAONt5wodAstvqiq5ispahfjNraNQwreYAJ/iaBtE
 U+rKxuUlNa5Lv3R1rSpfXzU=
X-Google-Smtp-Source: ABdhPJwmV0uws8hf0OBey5BHS4pe2pVNIh9d0bYO9jfBfX858WHGUnu4cv07AHdGY9rBrgXuJrYDNw==
X-Received: by 2002:a17:906:a48:: with SMTP id
 x8mr1012469ejf.444.1611266948537; 
 Thu, 21 Jan 2021 14:09:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k6sm2818481ejb.84.2021.01.21.14.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:09:07 -0800 (PST)
Subject: Re: [PATCH 24/25] arm: Remove frq properties on CMSDK timer,
 dualtimer, watchdog, ARMSSE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-25-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2e0d6341-0e62-4d4c-6ffd-4dbd5895f918@amsat.org>
Date: Thu, 21 Jan 2021 23:09:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Now no users are setting the frq properties on the CMSDK timer,

"Now that no ..."? No clue, double "no*" sounds odd to me :)

> dualtimer, watchdog or ARMSSE SoC devices, we can remove the
> properties and the struct fields that back them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h                  | 2 --
>  include/hw/timer/cmsdk-apb-dualtimer.h   | 2 --
>  include/hw/timer/cmsdk-apb-timer.h       | 2 --
>  include/hw/watchdog/cmsdk-apb-watchdog.h | 2 --
>  hw/arm/armsse.c                          | 2 --
>  hw/timer/cmsdk-apb-dualtimer.c           | 6 ------
>  hw/timer/cmsdk-apb-timer.c               | 6 ------
>  hw/watchdog/cmsdk-apb-watchdog.c         | 6 ------
>  8 files changed, 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

