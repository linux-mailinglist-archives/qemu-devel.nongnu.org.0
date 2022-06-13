Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2835A548582
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:49:21 +0200 (CEST)
Received: from localhost ([::1]:49468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kRT-0006EV-7n
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kLg-0001As-6D; Mon, 13 Jun 2022 09:43:20 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0kLe-0007sz-Jg; Mon, 13 Jun 2022 09:43:19 -0400
Received: by mail-ed1-x533.google.com with SMTP id v19so7225601edd.4;
 Mon, 13 Jun 2022 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0WlLB5paIPKn+53k0BbuwxiI0r6SCi0NjjKxnCbfPzk=;
 b=gRcZuZrxFKb1cZoey528EkFyFOGkjnafYJOouEv5YJuPLcTmBe6oRRjfy7GproMOPO
 gE06J/IM0mjSMJeWJsiFG8Pcq4tHs/dSkx0J9GwJYe7Gcr3E87HlgQnPqlDQkwI0OYQs
 zroayp741qGmmcVx0z0uyRXD7HSBemXMGv3hjChdS6FMZMxnrzrKYm++q26iRGrLfzE3
 /89MUveCR9U7uFS2hD99kyaWw9hRk35of22rDaZaGiJtA4QEa7gpRRb4boUUIx4kZHZ/
 dszfamRt+fqCq8r9x3sZsq7eXbVJFuba/IiS8PLMt8J5iZ/TtYeon0wDrLbY3Mm+VWhu
 fOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0WlLB5paIPKn+53k0BbuwxiI0r6SCi0NjjKxnCbfPzk=;
 b=VgHjLybCvh+/VV+Q6oFN7dLMNhl352nPvxb77lnau9KmmDxIhZOKf0fdahfSWAq4e+
 W9/81sT/EnWwKazsimL7XZ7ZQSP95zMHOcE5kMv21bdxRPYY3PKgBJA1S0A9/mSb7KYs
 rwmwt+n5UJN6Ms3oWKQs1o6zzAyCtBKZHvPl26c84w2xbTeRhXI89FbItneSdPlCFVnF
 MgHy6Z4qC64EFYPZM2H5d2zJ0dLd+XhDxB4oyF6VZE0kRScG3zQB1xjMPwNZncDO5MBq
 pkyWE0Nt8hDclYA521YTZDJ/uiaCLYxrDJ4itqJCGlIAyK3NKr2ey7hwVMOW0E5SByHX
 A8eA==
X-Gm-Message-State: AOAM533MgxXOvv4Q5ZxQ+Yajl8fWk8bdkG10N8oGXc6UJwRP8DUktn2K
 t4BZjCcAVsX605uNEqTq1Uw=
X-Google-Smtp-Source: ABdhPJw3vYst2TGVw4HSyQ2b3H9LmWUIq6XGUcU+WkBjVTnXCUaGC40aM3+sPpH1vDr+oEJXgJNgrA==
X-Received: by 2002:a05:6402:50d0:b0:431:70e1:956 with SMTP id
 h16-20020a05640250d000b0043170e10956mr40533473edb.205.1655127795719; 
 Mon, 13 Jun 2022 06:43:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05640217cd00b0042dd85bd23bsm4991270edy.55.2022.06.13.06.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 06:43:15 -0700 (PDT)
Message-ID: <9c50bbb9-d8da-acba-a725-1531f142cc43@amsat.org>
Date: Mon, 13 Jun 2022 15:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/5/22 20:18, Mark Cave-Ayland wrote:
> This enables the IRQ to be wired up using qdev_connect_gpio_out() in
> lasips2_initfn().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/input/lasips2.c         | 8 ++++----
>   include/hw/input/lasips2.h | 2 ++
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

