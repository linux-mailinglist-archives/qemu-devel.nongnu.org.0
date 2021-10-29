Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C34405E1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:51:02 +0200 (CEST)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbeH-0007hb-PR
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbZr-0004zD-94
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:46:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbZp-0007G5-Aa
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:46:26 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso4753606wmd.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N6B+gK+TX6iOT+A8IekjAASefkwIdpdIE33iZUw7jz0=;
 b=CqXmhPvVCD4kBASMCCSWi+GwmNoTOGG5FIyl8gH3w9TY5cxZB2u8Hi4vDhV5qMrsgq
 n2A9PEaB3n42iEMxVPzNp48Dhhkypy1Dzv6TLF78tt3UlN6atKv0nhnzjoh+HQrLW5Zd
 ZY/m4uxed7I220lbF5tLeOewxD4xdqoBkg7J1N6iut2L48Ug54zlTzixAkn2UhLvYxG0
 Mng245Si+hQA2o6E/GSYcKySIWuSvCS0OFAetxiqdL/1WvH602GYjhT5H6HuJ7TdUu3A
 yEkZgzrna8wn876CpRFG3AXj6KTt6KeElv3mltuXLDziD5V3DaK/kEmN3NVUX5ao0lL6
 Ammw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N6B+gK+TX6iOT+A8IekjAASefkwIdpdIE33iZUw7jz0=;
 b=ptTLpYxS95IXIIdbor4INsUBs9ImyQrrhg5FA9CwGKOhb1VaiLXIfN8OuZ6hAlAs9G
 BWgW8ysaagysEZCIrXobmfYZKW10tMwHagoZZSPj25xn8PRQl2obXlj/L3wZEu44elv5
 WBfhjaXXYAcTfy0k3JhxbJmrkEFiGk8Lycdcxjb+v0s5It+3WzQ7H38jpcocxLWirKLC
 LVO467pVXoMa0HT8vqxjdJuGOKXEDddlUQQHK4GkrZ1oytMQA8hvBzHcTV5MmTVLMGs3
 4g6lqgjUXI1mLQZ6m8RAl2G2y59POSqtvCWu1VKIwwVs4q8X/HJXGNNmXr5kdtdhHjS+
 RNhQ==
X-Gm-Message-State: AOAM532KIt9P6g3eR3o3zIEx4piMRfBrgtsKjEEPubVgn1mmOdJ8VNqD
 rSlnvBKXUopFciv9W8eyjTQ=
X-Google-Smtp-Source: ABdhPJwimD80tgtrhlII+tZRuOVgEkb64zWXPar9urhJFPNb6JvLbFo/M+sLySMK8/3lv99xFsPn0A==
X-Received: by 2002:a1c:a904:: with SMTP id s4mr6848524wme.163.1635551183705; 
 Fri, 29 Oct 2021 16:46:23 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i3sm9490722wmq.18.2021.10.29.16.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:46:23 -0700 (PDT)
Message-ID: <0c1b0d9c-5635-cc9b-283f-a226cf16f4bf@amsat.org>
Date: Sat, 30 Oct 2021 01:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 61/67] linux-user: Handle BUS_ADRALN in
 host_signal_handler
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-62-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-62-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 06:10, Richard Henderson wrote:
> Handle BUS_ADRALN via cpu_loop_exit_sigbus, but allow other SIGBUS
> si_codes to continue into the host-to-guest signal coversion code.

Typo "conversion".

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index df2c8678d0..81c45bfce9 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -860,6 +860,9 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>              cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr, pc);
>          } else {
>              sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +            if (info->si_code == BUS_ADRALN) {
> +                cpu_loop_exit_sigbus(cpu, guest_addr, access_type, pc);
> +            }
>          }

To the best of my knowledge,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

