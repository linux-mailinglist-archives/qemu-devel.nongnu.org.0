Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7E4CEEB7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:43:46 +0100 (CET)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0XR-0002lt-SY
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0W3-0001Mz-MZ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:42:19 -0500
Received: from [2a00:1450:4864:20::335] (port=46901
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0W2-0002im-AZ
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:42:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so8308721wmp.5
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 15:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ziz+2vI4sD+m5MPFcedhJiReduIqpsXELpubZetZoas=;
 b=aE6YPGX98lhpuKRtIKwnbdO4gOMTqBfG+IPNWBdYCsLh6T+DZcR0Nq6o7/noU/UPqS
 LLtejrB7wR2VBRZ/sxANmUwCT2wbYjWLcCE0UnnQQmQziGEju5O5k/cyGVrRuher92c+
 xakRT8vD18Bc+0gOWoKIcDrYD8gVonqk+rYDAWKxH491Cap/2ysKwR+kGstWJ4zfZfsw
 yfpJDC6zCpw+NisHh/dvd5RpQ8DDoRwwxFvsZKs0mc4caUvJggl9HC7hCMdqkdqih5fC
 EwF/No7CdXR4P2DnPju3Ta5GL8Gv7brCE4p9Y/6+LKiA4MRjC6lqJYoC4TqnDsrkdYfb
 ccYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ziz+2vI4sD+m5MPFcedhJiReduIqpsXELpubZetZoas=;
 b=ZnUfxr0sMUzLl703MhnOtSOejBKAu+Uq7n6LnaF2+C7m3coGhe/hFtEook6KYonc5h
 BP4pYRkASFXXHFXQ3aD5FY4i3cgIuCcc7ZhOzojHaWw75H7eXR4W6UZMESD4TtpuADNa
 bt2e4bAf0W48KzVqwl55CRkvVTozxfilk73ZTkCjWw0HWk9KQo8PUHObZtcGkw2LKAqT
 z0NXWNmSioYd5EKsucPbenuqmnVh2A7b5hjvF6SS/1elj1HD5Fko76A3up+2gdlchGsx
 AuKn7LsWfTlRzdrycVakoyQoorqguETxOoZArOaEvR2/otTZ51w53JceeW5DfQsd1vqP
 Jtfw==
X-Gm-Message-State: AOAM532MAAZ0b8YooyC0hy4dqvip6ba5uSIGuzkG7zji3JFwhh16QWBf
 k37tLP0MiRDyi4EIa9KxpQVm1x/2TwI=
X-Google-Smtp-Source: ABdhPJwPYaj35r1IOx/iyJebmeuLzDNGN0cILT9VqgtKwi+ewJdjdom08rMgNtBGzTC4xZOAHtT7Vw==
X-Received: by 2002:a7b:c40b:0:b0:389:7a39:549c with SMTP id
 k11-20020a7bc40b000000b003897a39549cmr6938591wmi.75.1646610136747; 
 Sun, 06 Mar 2022 15:42:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm13746233wmp.44.2022.03.06.15.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 15:42:16 -0800 (PST)
Message-ID: <b9e9d1ea-cff7-7d1d-a2e2-b16046091683@gmail.com>
Date: Mon, 7 Mar 2022 00:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] linux-user/elfload: Remove pointless CPUArchState cast
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220306234005.52511-1-philippe.mathieu.daude@gmail.com>
 <20220306234005.52511-2-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306234005.52511-2-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 00:40, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Not sure if "Remove pointless non-const CPUArchState cast"
as subject is clearer?

> fill_thread_info() takes a pointer to const.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 9628a38361..d3d1d9acae 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -3972,7 +3972,7 @@ static int fill_note_info(struct elf_note_info *info,
>           if (cpu == thread_cpu) {
>               continue;
>           }
> -        fill_thread_info(info, (CPUArchState *)cpu->env_ptr);
> +        fill_thread_info(info, cpu->env_ptr);
>       }
>       cpu_list_unlock();
>   


