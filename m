Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541F671503
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:21:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI2lS-0003ig-Qu; Wed, 18 Jan 2023 02:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2lO-0003iN-Kb
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:21:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2lM-0005rm-W5
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:21:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g10so23961153wmo.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 23:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x8L5AX2lofGdvb18vvWr5K0I96KDwPt93U9qiGEiyas=;
 b=rQm2vqazT12+qfon9xAtQmJm1xJBzTYn0N7jEKRMYUC2fLFhyGpFxlpTF07hI0u+z2
 eFuSf6ScKVXanEeY4DiVlkpjK58llqbLJ7NCOFK/y0ffAYaZRra/JqLA66489R/CQHbZ
 Skp2TEZbJodHNY9R7tcCqgS93q5pZ7mYrFdZUk3zTPuYi9G3nZf/kqILDSVMAaSdTJT0
 yR/lY44mOli1Os3rGmzh8Q73TA5R42q0D6O3M8jm6iJdU91SaWK46T7Nql/Aoni3F0B/
 lQeCC5U3oNs+Ls8y397NHPlrAolLSh6Cc8caL29foDaBy2jf38qZW0yIkh5V6jTCxkf/
 HCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x8L5AX2lofGdvb18vvWr5K0I96KDwPt93U9qiGEiyas=;
 b=sYf8BM80EmSatUtVtJbcUXGlptsAII4BpEmrtR9jojOHlQFN9gCNNtNhggJCZqYF3j
 2JXRH1Bi0a1sre9B/f9GCHFgPhJRMOibLDyY4HBhU5+y6GeV7uY64WcVZbkftYF1oPBz
 TwL/bQFDFX/RwWL2KL93nQXoRQ2o6lh9DtPvgf09Hfn7hICpb5gf3lEq5IA4A7zwSci4
 0K0m2v048sw8JBqJMQ0cs7Wh6qTKuqH4Y/W7MaeHgQIm5QUirCsIiO0VKgxT/xStm3Mf
 kPlFOhkX0OFMOsxkrlSX3RXTikg4NhHq0SPwWBabD6Glv+TLQtHSbQinmDzAPIbhMW31
 vDvA==
X-Gm-Message-State: AFqh2krSov87G0A9hLJnqh1xaa+mx74syx11DUsIWMPxOCY42p1pb6eC
 rZtoI6CksceKmky8/BKucZKzbQ==
X-Google-Smtp-Source: AMrXdXvS/vnq/DeAV/+VZfvtSs4rLhULApPnUdumVm/7BO13gsvl03XB7b15MMTYOOFKr6rUO3MW+w==
X-Received: by 2002:a05:600c:3c83:b0:3d9:e5d3:bf with SMTP id
 bg3-20020a05600c3c8300b003d9e5d300bfmr5566386wmb.32.1674026495605; 
 Tue, 17 Jan 2023 23:21:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c1d8400b003da286f8332sm1126793wms.18.2023.01.17.23.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 23:21:34 -0800 (PST)
Message-ID: <e57e474b-acbe-07ec-cf6a-84463e5883a7@linaro.org>
Date: Wed, 18 Jan 2023 08:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] linux-user: fix strace build w/out munlockall
Content-Language: en-US
To: Mike Frysinger <vapier@gentoo.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20230117233042.16897-1-vapier@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230117233042.16897-1-vapier@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/1/23 00:30, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>   linux-user/strace.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 9ae5a812cd71..f7912ad67f2b 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1380,6 +1380,7 @@ UNUSED static struct flags termios_lflags[] = {
>       FLAG_END,
>   };
>   
> +#ifdef TARGET_NR_mlockall
>   UNUSED static struct flags mlockall_flags[] = {

Removing the 'UNUSED' qualifier:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       FLAG_TARGET(MCL_CURRENT),
>       FLAG_TARGET(MCL_FUTURE),
> @@ -1388,6 +1389,7 @@ UNUSED static struct flags mlockall_flags[] = {
>   #endif
>       FLAG_END,
>   };
> +#endif
>   
>   /* IDs of the various system clocks */
>   #define TARGET_CLOCK_REALTIME              0


