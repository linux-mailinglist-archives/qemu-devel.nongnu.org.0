Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0BB41FC5C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:45:50 +0200 (CEST)
Received: from localhost ([::1]:50416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfKn-0006V0-CG
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfIe-00050S-Dw
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:43:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfIc-0008Eh-RS
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 09:43:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id m22so14798230wrb.0
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 06:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2AKw5o1q7rAfLoZ/NxvDeBIlks4rubVJZzqNStCcNHw=;
 b=LuIaVy8btQGLevmxdcZDmf8D6P5ix/j2aQ5Ust4TgJ3aFLqwn51KL0Z6JNYeSl1mze
 +PBJJK/2OZnRXpJcDF8Jn/2O4JKO7DlHiwKdClRN32ekjRzfyUirvpB/H8rbuAbHpDxh
 Qpj6EDhYS0vYaX15GPRl7+wdxWN7YJuxqlLA0k7U0nUsodiUYnazFkWEfRADjekfCfaN
 esOmalJ3zVa+LV0xSaBYKRezF33hmSkd2oTq6UtpbK8OKkZdgo/aHo+h1X/LE0VA0uiN
 W5suElc7S+da6GzOT2+gfoZL7pKLn2kjxH1nn5RRglL/t3TSxFnjjQ8wp6btBGj2SmX4
 59ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2AKw5o1q7rAfLoZ/NxvDeBIlks4rubVJZzqNStCcNHw=;
 b=3cpQsWIdCJbdYfnFTnfUBZKxRANzlXvl0gEcTdETftpAyAZIrG8rguCUwz4xhM6OoP
 CW0FRUm9ey/7zkdJ0WV6II3Em0IubePP9VxDz+HF9/5FDZMxd7KFTMDphYyuBUFSHZQ6
 MAYrCVpx0YBn11b0dcLlMEMK7NVkUXjiO3AJEPco4XsKNYMzduYGsbBfsV6Mn8wL14re
 YgxZirbMA6etrXhgY9EQKUfJ6MZiwP6kT5vQEOKvi+pOVaXSoOf+WlOG6aP9vqUy/9Ek
 9AoCLbmNokN+HhedGaEJUo+gdCYSQFU17yljklClRz/VZ1tlT6MHFNHY42XDNKHsej9/
 /qxg==
X-Gm-Message-State: AOAM5305pdRl7RdYeEoLxmAEJLnByMCWyE8Jex2SCq/gb05eml5ayHHY
 1i+GiVc6hNj6J1etA5dGvSs=
X-Google-Smtp-Source: ABdhPJx1DKYtGrSpqftQNi4gwrWpKjGDTG3CPUn+KjKhvAwI369H63fHnmLYV1pK6MEjDBG4bL38Jw==
X-Received: by 2002:a05:6000:1786:: with SMTP id
 e6mr3695149wrg.344.1633182213481; 
 Sat, 02 Oct 2021 06:43:33 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m29sm8875717wrb.89.2021.10.02.06.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 06:43:32 -0700 (PDT)
Message-ID: <c47a3765-20e6-3291-ef11-92c851aa4565@amsat.org>
Date: Sat, 2 Oct 2021 15:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] nubus-device: ensure that name is freed after use in
 nubus_device_realize()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, laurent@vivier.eu, qemu-devel@nongnu.org
References: <20211002123101.14675-1-mark.cave-ayland@ilande.co.uk>
 <20211002123101.14675-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002123101.14675-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 14:31, Mark Cave-Ayland wrote:
> Coverity points out that there is memory leak because name is never freed after
> use in nubus_device_realize().
> 
> Fixes: Coverity CID 1464062
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

