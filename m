Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9E3F93C7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:49:25 +0200 (CEST)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTnr-00071F-Ge
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTmk-0005gQ-Ia
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:48:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTmi-0006uL-Qq
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:48:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t15so2200128wrg.7
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wetfHbrkehj1BaalQQo3IWR4ynj/p8M7X2nh/wNre8U=;
 b=PINsz99H8XnXkSc3b8d/YFOyGzw2Gyqj/s6IAk052/+5OOz4VONtHUJcH0R+MLpxP6
 TizkfZY78eJrntLG6eDkkIsBv6W4wcZy+ax1vipxwHWb930Lh/YRjvsGvBbsnIYy+YD8
 HQyRBZF6KEi38duVQcD612a/CaNrPp4hZUZ1Lw2EEyIQBNLmUMAoTOIlDWup9H6jeatj
 0T5J5W9esgnUyOUHGQjWjSznno2WqOo5n/eF+PKsELsoOpAvd5nanDXILozE4bpfYCRq
 Nf4KRI414RuQGgJy8q8OjInlMsbg3tCh1Qh3CG82p+mZ7ypwwH75TuZSZQW2u9ZKcpNc
 1NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wetfHbrkehj1BaalQQo3IWR4ynj/p8M7X2nh/wNre8U=;
 b=YQB/rjpwpHGi/Yxof9YcJ5GERLwZedRXJqj1pTRF3Uqo4HF7D6qxf1NaE8rHyofE95
 zLm/U1uE/8Z4Bke4wyyrMWD2tTIHfa1cOJ9/PIIsnjS2kqoBaTzzF8XTPSjMSmnK11d4
 m6nWzyPIa5Lw/kNZrYnR5L+5t61amqyfwz6Ryr/C/YRoSKf0oS178HKCbmVATK0Wblik
 aXWeKzi1/X2neQDy5olBI/CBtvJZK28x0NOciu2JB1ovmBVe1QEO6Sm8QsCGrG+sBs0J
 6TuS3Pufs+jclR+pXiViUJwxnuHrCXCeoJleAvZ2sANAjGe7YHbSppw841fCAkZDevr7
 7lmQ==
X-Gm-Message-State: AOAM530AiYwVgl79hbwW3PdwdwXYZVVpy8cZEqFfQNjU/IFikJ6hNhmt
 9RYfsyg24wxqdGNAHZmZEc0=
X-Google-Smtp-Source: ABdhPJzZd1h3LMCkPp/8r0kKDLw8IS7gakZGLep3jMCzChXuqC19A07GEZHGvw6mfeu0VNokE0lWFQ==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr5764518wrl.65.1630039687452;
 Thu, 26 Aug 2021 21:48:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o34sm10205228wms.10.2021.08.26.21.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:48:06 -0700 (PDT)
Subject: Re: [PATCH v2 42/43] bsd-user: Add '-0 argv0' option to
 bsd-user/main.c
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-43-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <afd0da77-a175-63c7-7ff8-9b4a298e5db1@amsat.org>
Date: Fri, 27 Aug 2021 06:48:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-43-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: Colin Percival <cperciva@tarsnap.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:12 PM, imp@bsdimp.com wrote:
> From: Colin Percival <cperciva@tarsnap.com>
> 
> Previously it was impossible to emulate a program with a file name
> different from its argv[0].  With this change, you can run
>     qemu -0 fakename realname args
> which runs the program "realname" with an argv of "fakename args".
> 
> Signed-off-by: Colin Percival <cperciva@tarsnap.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index b35bcf4d1e..ae25f4c773 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -268,6 +268,7 @@ int main(int argc, char **argv)
>      char **target_environ, **wrk;
>      envlist_t *envlist = NULL;
>      bsd_type = HOST_DEFAULT_BSD_TYPE;
> +    char * argv0 = NULL;
>  
>      adjust_ssize();
>  
> @@ -390,6 +391,8 @@ int main(int argc, char **argv)
>              do_strace = 1;
>          } else if (!strcmp(r, "trace")) {
>              trace_opt_parse(optarg);
> +        } else if (!strcmp(r, "0")) {
> +            argv0 = argv[optind++];
>          } else {
>              usage();
>          }
> @@ -413,6 +416,8 @@ int main(int argc, char **argv)
>          usage();
>      }
>      filename = argv[optind];
> +    if (argv0)

Style:

{

> +        argv[optind] = argv0;

}

>  
>      if (!trace_init_backends()) {
>          exit(1);
> 


