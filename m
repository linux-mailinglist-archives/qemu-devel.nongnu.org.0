Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A84BBECB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:56:26 +0100 (CET)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7UX-0002M3-Ay
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7SB-0000Vg-Gw; Fri, 18 Feb 2022 12:53:59 -0500
Received: from [2607:f8b0:4864:20::1032] (port=40575
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7SA-0000S8-38; Fri, 18 Feb 2022 12:53:59 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so12989015pjv.5; 
 Fri, 18 Feb 2022 09:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hd8HmaCVE496gy7VXq5twOnCgGTThaFR4iMq2E+A5VU=;
 b=o+RM3s8lZFPFiFyHz+34rwI4CQcU81ant4xuGCrV6u8dyKMPeAUm9Xz+q+tGWt/733
 ooYxk3tPFMhyjLM5TNMr+oXewqA49l+qeqKUJRfWL5RiF8PE1Fla34QXsYgBjh0iOtsl
 VIML9ju4fueKzd0oHQp97EwpiaLFBDLx7jGlTFxrpA+/ZQhyX2S8VvG9SfMtquf6lARG
 ej7uJwF7qlwxEaAohQ5cdRGIoABhDAmLiJDLyjAxVMte6xPXpt5TCC9tZoRsSsYlvn7N
 aInnz6YTzy2S145A2brHxsyYw0ZCd3IPQflOt90DFYgTVGMQ14YbaX9LMwIHiImGLiBP
 Uzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hd8HmaCVE496gy7VXq5twOnCgGTThaFR4iMq2E+A5VU=;
 b=azyDajVnSJT66jIjS58M/qBIBfStHPSgRuRJHdQP1StuC3zkGuINuDQwlyA1P91Ugz
 LNQHhCXcIy7vnA9jTWgwsHB94riTek8PmrWoCrP6U5t7OzSGYwc2L+45HQs9TowmUo26
 FEq1k9qRvleF3HHo6NNVQ9ejAIa5mM+XXrgDaF1YEPWyh8D+rXK/8IdUtiYTuXv5nxqq
 roManhlOkucYNIi0MT+qhn9lxt0E6ARwpTwE5TfAzMHMrNM38w9c3N6XHmdy/M4r0n3u
 ZQVCfQ89h3Q5bn7Zh7Qa7itqwc7870Cy9YHym1By0WaPW/ek7YSzQcOb5w8xJ2IfsjVT
 6rAw==
X-Gm-Message-State: AOAM531uEqHOK1V76m2kTh5XFolqfNq7SjvYk+zl+IDneTu2SRfel48Q
 UR4sS11kyrR3P/kAggyJHao+nPMZNKI=
X-Google-Smtp-Source: ABdhPJzrAA9M8p/As3+EfNA9R/S+dIxGwih1wwI8S6jQxLIJ9C07MuEsUiBwChrG8Jt6FzpeTI84mQ==
X-Received: by 2002:a17:902:7285:b0:14d:7f5b:94d0 with SMTP id
 d5-20020a170902728500b0014d7f5b94d0mr8325206pll.25.1645206835512; 
 Fri, 18 Feb 2022 09:53:55 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id l21sm3927617pfu.120.2022.02.18.09.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 09:53:54 -0800 (PST)
Message-ID: <7947da5e-b703-f18f-f8a0-3f4253de1e76@amsat.org>
Date: Fri, 18 Feb 2022 18:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/7] aspeed: Introduce a create_pca9552() helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20220218081815.641169-1-clg@kaod.org>
 <20220218081815.641169-6-clg@kaod.org>
In-Reply-To: <20220218081815.641169-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 18/2/22 09:18, Cédric Le Goater wrote:
> This unifies the way we create the pca9552 devices on the different boards.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++----------------------
>   1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index f71a5d87473f..11558b327bc9 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -533,6 +533,12 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
>   }
>   
> +static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
> +{
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, bus_id),
> +                            TYPE_PCA9552, addr);
> +}

Hmm in case you respin, this is an opportunity to return the I2CSlave*
pointer here.

