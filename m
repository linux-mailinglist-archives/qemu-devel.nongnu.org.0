Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E248642AFAA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:33:46 +0200 (CEST)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQLB-0004hb-UP
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQJn-0002qr-ED
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:32:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQJk-0006VW-2U
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:32:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id v17so1752984wrv.9
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 15:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PLhuDI3JBrAQr7zZ6sptI5KjH+F7mlhDUtMdi8wPBeM=;
 b=a00CA4TnuWCrRejRgQ/lsM6PL+ekZFQXlgtZ4pYnURmnE/bDruN3+6rn6Ua1c5r9dV
 961FXIK0Gn/LhCq06P8PikewBW7vhl7PbxQ5ODgBG637UWWLGN8xlHGDImUa783eT0jZ
 ilg2lRs7J3k6Q3e00dZUJ1vhI6HYuTq4Y1WT9YSkEs/yqoPxCxlM6y+PJIjJijOh5lZ3
 IIzGO9N9Yux96vlw9nQuzg2lPIYHhhs2ewR2HhuU6jfUJnU7P0i0cPL4xCrYsBnu1dw8
 ZQd24DT9zQWRq2fNmDeJqRTHhJdITtCj+8CffKBG7coZeCGYcbu3jiBnLR4iK9IjdK70
 ZkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PLhuDI3JBrAQr7zZ6sptI5KjH+F7mlhDUtMdi8wPBeM=;
 b=kJWgL9a6uxAOHg35nbsh70HZfP1nKtqLkefiECD1xFbMVg+eWkaVMWdJyNPzPUWxsg
 6nF9KIJfu8Ij4BjA7SjoL/ZEl+oAm0zIzmdUtJXu4uMOAvtJeM+HmKWK0FeiownhRwqk
 74GU1ABkKbFU4OK0F0clgCmClf0SwBhm/6ifKa6QEp02eoif8pTdfFEyCUtVLFvuFPkN
 h45PAGZCOPDY3REXP013DPbMI5tXoUJEu/w6HeySEHfSDwxn89YcwAakU5CpUgziOkiW
 zX7XFhjjFvdTE55PbhEmXoGb1yXUlsw2oaNGF9kEpPxEV7f6l93DWY5ubJLpnuQN39NY
 po0g==
X-Gm-Message-State: AOAM531yx4DElf+RaeSjN1x81KTMsDpRQdxotehPdkF06AJgDmjvsHsA
 ymB9ijUWjBdOZpN74Jd2qpcJzEYwjE0=
X-Google-Smtp-Source: ABdhPJxdmG2Anhkn+rgLGFgdPhUCLt27dURtK56mDz55mZ4nBxtlP2dTn5eHoY2gMVdAmK8EnOjE4g==
X-Received: by 2002:a1c:f201:: with SMTP id s1mr8683045wmc.101.1634077934188; 
 Tue, 12 Oct 2021 15:32:14 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id m15sm3892769wmq.0.2021.10.12.15.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:32:13 -0700 (PDT)
Message-ID: <cf606e40-d9c3-4212-c723-4a414eb66344@amsat.org>
Date: Wed, 13 Oct 2021 00:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 02/23] target/alpha: Drop checks for singlestep_enabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211012162159.471406-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 18:21, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

