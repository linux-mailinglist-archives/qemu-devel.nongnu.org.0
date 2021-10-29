Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B034405C9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:29:19 +0200 (CEST)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbJG-0003sH-UB
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbI0-0003Am-5D
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:28:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbHy-0001KE-Cq
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:27:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b12so14743023wrh.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PNOAHlSnvyicwW3/WKj85oc5BhFfYCmBQKZgmXELCgc=;
 b=iq9jhJNe0268/rhRUWbAxMdD0qehaLFtO5ZQ19I2oJSyRqjVtNCQwUi9RXTrkrwiCl
 rSnv3sPC0M5ATM7AnScuiPNKuoTZpJru8NDTVpr8seGZYJz/WihwwDGn2o4+8QupE5qU
 //T0AKrNpdWqsoW7IPoPYguwWo1nUk6jqayas9NDTNR2XN2GeqP7Q/bhxLfs03Iec78y
 0oQJyvn3goI0yJAO5iw9exFTZdrMnsRg9pwz4xIlPWr2u55YcIvD3jrpCAhnUaTe1VAy
 sC/OP5YIrapSQCHSD6g4Ckjn5b9bRVcwpX9efHzzPJpHMe51k6Ua5bKoFar4JgzPbLsG
 MEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PNOAHlSnvyicwW3/WKj85oc5BhFfYCmBQKZgmXELCgc=;
 b=vEftAQhqyikB7hGjtw+mkM8eDkSU5XX+TDub5dAObIX9daDRbWxAYuSf9Pw0zD1Baj
 QlWYb0LVdwRxZulfmO9Q5X2AhCp7fnpNBPUZRomZi/v+ap9IgJ99dB8T+DgTwpxyUVZw
 o0+IndlWWfDYGdP+Ki3WfXGihdmbMwPjr0NaZjxhsnOgCBJxbL6/c+LeJcPMoMLc1/AP
 7MNgBSkHaoFJtECDDzPgg6hpbGWatU/h2b3WEYXTbFubnU/6asOODqYafovuLnTB7Pu1
 pQQUJuNPLVGuE0u1K8u7TVPZwFvgOX8fEPYRH4lVeHaUWn7/Vg61aZyjpKW/Z+n7mUwx
 RPkw==
X-Gm-Message-State: AOAM533pKqt6vVzEFd4aPHta+sc8P3So67boip+JuJ1hkRZWVaOlOkBL
 RPjI2SGh0G+CahsiIrpsvHc=
X-Google-Smtp-Source: ABdhPJycKggSed/y69tM0PmoxNyzfWQVG93655vc4aM9quTGzAywGaKWIcq4BG2/MmoRi8Bc+M3I3g==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr9798326wru.239.1635550076356; 
 Fri, 29 Oct 2021 16:27:56 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l9sm546093wms.16.2021.10.29.16.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:27:55 -0700 (PDT)
Message-ID: <fad06cc3-49de-b8ba-4f9e-3b81ff3d5a7e@amsat.org>
Date: Sat, 30 Oct 2021 01:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 16/67] target/arm: Fixup comment re handle_cpu_signal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
> The named function no longer exists.

It seems to be declared inlined since QEMU v0.1.0 in 2003!

So it was likely a typo.

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Refer to host_signal_handler instead.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index dab5f1d1cd..07be55b7e1 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
>   * linux-user/ in its get_user/put_user macros.
>   *
>   * TODO: Construct some helpers, written in assembly, that interact with
> - * handle_cpu_signal to produce memory ops which can properly report errors
> + * host_signal_handler to produce memory ops which can properly report errors
>   * without racing.
>   */
>  
> 


