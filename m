Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B063CC817
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:43:46 +0200 (CEST)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51Sj-0001Oi-2G
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51RK-0008FB-F8
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:42:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m51RJ-0007U1-50
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:42:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so10778104wmb.3
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BtTaYFomwkrsiyT+y4W5xncpBpFH8YCH7CO60zg3+0g=;
 b=Td1yrkI4nIO8UAenXqTTvMDKHYoO2Tr7nb9bll8T2F33t3BaaQHox/BLNJ499YcFAa
 +lW5To2TQIOpkPjKyfoiursAuhJenBdkRg2crFjEVrUmghWKf3PUS+xF2dCHWmNZFZWW
 oX79cOBuVS8WC3LVBZ5zSosVXTLGQpAoqDqMT5mcPpbKGaICh8m/Y/oUwwiV+L+f4pNj
 2ciytVpKcLUl/2vEV/jgvTO7nbkjyOnLtMazWfCJQ8NfMtMucjZ+VI+n2E6s8detPaJL
 O0LeObweU16Ok6diqhXAIkFEE34kBHa56reLu/f7tiWYXhEWu6YiPMhHjpSG3WpULke1
 FwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BtTaYFomwkrsiyT+y4W5xncpBpFH8YCH7CO60zg3+0g=;
 b=eI8wWJ54pYTnrVUcIEdayghRRDkYdM5VqvxBZrlwpFuAtF3kB8FDIBpaR8lOsjCkU5
 c73m2Wcn/1zn+kSJ5KIiJVQ91yPTgxHwj8mcjwfqHhTkYPp/CSHVQ6PKTKG9thZjvn6Y
 7SCb7ucsgSQNnVqXO9qvF+nCmCbXFJ+65WcWg7/h/D8uWa20CCDshdO3qfxpOdjBhwJr
 Qlp8kCl3ui7OhXGUHuHmyvqUhwGiL50d6ybPYBwdzC7korPnZ5Ko3IJptF7l5rrfgxO0
 L33H/L/M6P7GsjcN6EnhtKJ1LgQORiw9R7D4gDpLpq/4t0/RvwANTs4I74Lzg8v72r6O
 lkvA==
X-Gm-Message-State: AOAM5331KPoRVGhpgzoUL00kI4gF8GGbv2G6Om0mFZsQi8Y+5jRRdM8e
 tMDIEPQklXEFPzxEq+oreRw=
X-Google-Smtp-Source: ABdhPJyR2Jrksi7DzuGCygrsQ7j1Us1NcMnERol9T5HU2KAf0NofRNqCouRT8EtQF6qfZa5SXD+HCg==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr26345305wmi.187.1626594135886; 
 Sun, 18 Jul 2021 00:42:15 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id v9sm13275509wml.36.2021.07.18.00.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 00:42:15 -0700 (PDT)
Subject: Re: [PATCH for-6.2 02/10] linux-user: Split strace prototypes into
 strace.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65e307a0-6e7e-ef49-19f3-fd6c05ed8d25@amsat.org>
Date: Sun, 18 Jul 2021 09:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717232103.18047-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 1:20 AM, Peter Maydell wrote:
> The functions implemented in strace.c are only used in a few files in
> linux-user; split them out of qemu.h and into a new strace.h header
> which we include in the places that need it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h    | 18 ------------------
>  linux-user/strace.h  | 38 ++++++++++++++++++++++++++++++++++++++
>  linux-user/signal.c  |  1 +
>  linux-user/strace.c  |  2 ++
>  linux-user/syscall.c |  1 +
>  5 files changed, 42 insertions(+), 18 deletions(-)
>  create mode 100644 linux-user/strace.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

