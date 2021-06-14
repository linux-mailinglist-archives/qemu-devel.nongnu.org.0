Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30223A6B82
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:18:47 +0200 (CEST)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspIU-0007fv-RN
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspHh-0006tY-Cc; Mon, 14 Jun 2021 12:17:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspHf-0006rX-Q8; Mon, 14 Jun 2021 12:17:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so306253wms.3; 
 Mon, 14 Jun 2021 09:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qW2zdQ0yTiW4Ze8fmbW6APx/542OARHW3E/IgGMiw2A=;
 b=Btos46QuwMhf4JxPwDWmhHVdT+geZa4jaQPnLdG226O6e0IK5zA6zV0CfIPLD1Uuh0
 eKc6DMltn0oTjI2iGpbtMQrGOqp12lc/eHl8iH8FfdOPXq5Ravm7IVS5iFuzhhVKznWz
 306WnL0UY2KIWUPxcehVdXQhCeXoB6QkmBUI+g8+uQBwxIyWO61ARelLN4SrrQjQ0r4s
 3JwIMpCEaeccmAPK2rm7fstzhxUZrHEbF/sFdSZhlNCMh6LPaLZyvor9Mj0uxaUCShoP
 lC+p0UuxcyK6qMA6TSSSwCO+EURVIsgJFDu/kr0vCMb2wRFlCXPxj8ERf6c0VR7f4XWE
 C/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qW2zdQ0yTiW4Ze8fmbW6APx/542OARHW3E/IgGMiw2A=;
 b=BnoNk6hbzQkEP0DRedc3pymLSGSQqu+vBDj/nb8ECY7JAhNJha9vuYIUMyjRFmBnvd
 hlZtkJDP2OBNJ5sMwfUfODvL6c4i7dcZ565UraipHonZ8OILEZwdyLK3B6MOXoJtn1oX
 8PhoHMV1kxeOFrg0VFg52wuJkbT+xMCn7GY+KDFcN4IL6YlkR+XTZq771dwCXMlJKohL
 IkCSjI/8CtgtUVQFDxTSFp+IuCbkDJmugO315jPZ/NQIzikwb+6eKfF4QIPiX9GHhEJq
 npE0A/5UMFMDJYw/l43LceS21lAA4SdnuXJwd5SqmRy7QRd0qomREeLEnLqghSzURr4x
 qqrA==
X-Gm-Message-State: AOAM531+V0LYPdrcVg3zKrBZSRLahPTA3kTv18ZjMbUPUYnfxcxl6B51
 WtEKUNUKSyB8hKSxUZdLj7B0SLUSWkOeJQ==
X-Google-Smtp-Source: ABdhPJxLVGMapU7MMUpPJm0kvzwleaw/nfLhhlwHhkFjYVbtio8uo4B645f8QwlyT/mijpUdpe1d7Q==
X-Received: by 2002:a05:600c:d0:: with SMTP id
 u16mr33392894wmm.155.1623687473512; 
 Mon, 14 Jun 2021 09:17:53 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p12sm18750863wme.43.2021.06.14.09.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 09:17:53 -0700 (PDT)
Subject: Re: [PATCH] hw/intc/armv7m_nvic: Remove stale comment
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614161243.14211-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1269afbe-34e2-47f4-08be-c7cd418c2d3c@amsat.org>
Date: Mon, 14 Jun 2021 18:17:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614161243.14211-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
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

On 6/14/21 6:12 PM, Peter Maydell wrote:
> In commit da6d674e509f0939b we split the NVIC code out from the GIC.
> This allowed us to specify the NVIC's default value for the num-irq
> property (64) in the usual way in its property list, and we deleted
> the previous hack where we updated the value in the state struct in
> the instance init function.  Remove a stale comment about that hack
> which we forgot to delete at that time.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

