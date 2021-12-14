Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B399F4743C5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:45:17 +0100 (CET)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx87I-00016E-Fj
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:45:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7fD-00026F-Sb
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:16:16 -0500
Received: from [2a00:1450:4864:20::334] (port=36645
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7fB-0001Z2-OD
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:16:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso16232617wml.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x4v7b+UE6i/tHnxqiTRptrUzRckMbXu2pGnIBL4gVlQ=;
 b=nia0Iy8oWbbJf+ZZXNrsNQZUBUvgxqEqPSOLxX2KfNtQhci03rXoZRNlEuZFgWzybh
 UHWmoTWkPgp/BBs6wlb46EaQPAKEmWFAqkX27wqdykatdHEvnFembch+Fms2QG9/P8bq
 Zj7v434zVIa26XeDM5OufXSjlBJg/JgYrovwaQLWqa8m8HsJ6Rsy/f8mKx+9nL7/q3DH
 yAQr4wtZvKOdaMQHGt9jQotM1KJ8m8FUkq2Zi2zOyf4LXi7mUwh0WJLgyJcLKTHrLywN
 7mng8s/eFWj2IeWtqeETKDPuJjvH7V239aleDQ5mHYyxEfmwWPcYlWn9SnSDTw34Amky
 uyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x4v7b+UE6i/tHnxqiTRptrUzRckMbXu2pGnIBL4gVlQ=;
 b=Ctqw/hDsUsPm4QOXCD/3YqGofikix3YtzWpvCr9a7Le4qFX14Ci1h19duwlw3owyqY
 Nf8/amDRAPw6UzvrkuaI/jYO+1ig6+yKkQl1jRrmPJWJsG0crxxJwtV8OJQI7aBKIVZN
 i5I+LsLru44gkFnVHihFMNyS7N0fBXoLm5txE/sl7icMcipe0fiHcEafU3PYo+nMBVXz
 VO8dOv/MfI9UFxWHxOBOUSgyjYf9unN29cDdUAyoH42QZsbaCoci0DHKw3UNXlJBxNjk
 /a3dcAHfC1TZjw+AtbIx//HsOOhmKWDXoI+PnGHTlyGK5oDLEgR/3AWX7baPIZsA3jkN
 TjKQ==
X-Gm-Message-State: AOAM532bxBdUaj/g1tl6XjDvlNHFJnxuwdvvEQcJ+ZTvK0FhJBKf91UR
 4jt86o85ecmOL0xiz1e0sHM=
X-Google-Smtp-Source: ABdhPJzqLCVNoI62dBfnG8dVETtmdgTialHtChUiBAHu+Nn+vlduR62g+611hbMSPdtjdrBDfhY/7g==
X-Received: by 2002:a05:600c:22d9:: with SMTP id
 25mr45727907wmg.71.1639487772362; 
 Tue, 14 Dec 2021 05:16:12 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id p62sm2062125wmp.10.2021.12.14.05.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:16:11 -0800 (PST)
Message-ID: <d209d973-54b4-20d0-a370-adc5ca96f4dc@amsat.org>
Date: Tue, 14 Dec 2021 14:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 04/31] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-5-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214080154.196350-5-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 09:01, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-insn-defs.c.inc | 979 ++++++++++++++++++++++++++++
>  1 file changed, 979 insertions(+)
>  create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

