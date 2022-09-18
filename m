Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F75BBFF3
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:53:45 +0200 (CEST)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1IO-0004eB-6f
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1BQ-0001tC-QT
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:46:48 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1BP-0007on-0f
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:46:32 -0400
Received: by mail-pf1-x432.google.com with SMTP id 9so15120917pfz.12
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=fTSBV72Bz3G5ut9mMF0d4QVe+VZJTTFXukYx+DJB/yw=;
 b=RauuaqvXojh/YTs7CGOyGYqpOV8Qy7tuS8wljnEehDvIC7fLQKMvQ9xbtwdurLqh+A
 a+vg2ws3GOScWBfzCcbcbne+TrLS2Ahrjs9pjSPlLeyYDvG5bE7ePIpqUfVlHQ8WIezX
 u9Fv/fhRdAfyAi3EyWv0/XJWKNv0EGKAc8SXVFht2WXvI7B+tJYFw9hPmk4RkiU2AxUY
 l8CEyprz87vbqJemlOTordVS1IQfBhsjjboJpeOLQDO2MV/l3u6R4WwbBrFWKC0GYbue
 tMS/7ZvY9PBnEYjWSHJk4IbeZjtH7ATUaThAFxGN7dUtDqwQBvd9SXfiyBZWd408CGll
 7eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=fTSBV72Bz3G5ut9mMF0d4QVe+VZJTTFXukYx+DJB/yw=;
 b=37Wd3rs/wRHJ9QB2FanC0q57BoZAjn7WqZVHfJX+PC2Z8huVFLje9lvIktn10/U7ac
 6Dmc/ynwvOtOLXWLdMAGLBmEE0iB+wyTD17GlXzNKnllofuThc5iL235DzqhouDEe4kb
 6cCj6iLx6upsnMAqnnV/Yr729iU8IVtGKTnpQMutolulxqABSmx+EiuYO74CGhK5POee
 QwzLpRaf6EE9bT6rXw9Y3Y+EPaJELzY9bE81wuf43YyqtvcD6PXAF1xzcSoJxV+tt5LJ
 B+lW4QlEUalgkrp+K+dz7HHoGDP03jn68VawxIOTOKG7WJtCgCk8EtkaQ+7/JFmTTq5b
 5fEA==
X-Gm-Message-State: ACrzQf2c8KrwJmzToj50J0xvTkfzvSJohiPC+tXUXSidblxQ1EyeyCyY
 5D+gLyn8jcqW4H9ghFcUlIs=
X-Google-Smtp-Source: AMsMyM7awpGzx6o89cO+DYccrhM2/o+C/Qpe7IXXdEOj17JYAGVJ2jMilFyKPehqAIDKyaCI8tJk4g==
X-Received: by 2002:a63:564a:0:b0:439:3ab4:fdff with SMTP id
 g10-20020a63564a000000b004393ab4fdffmr13100954pgm.397.1663533989473; 
 Sun, 18 Sep 2022 13:46:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170903230100b00172c7dee22fsm18946621plh.236.2022.09.18.13.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 13:46:28 -0700 (PDT)
Message-ID: <e8bfd1ba-cec7-7c29-9319-eb013c14a237@amsat.org>
Date: Sun, 18 Sep 2022 22:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 07/12] linux-user: Fix strace of chmod() if mode == 0
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-8-deller@gmx.de>
In-Reply-To: <20220918194555.83535-8-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/9/22 21:45, Helge Deller wrote:
> If the mode parameter of chmod() is zero, this value isn't shown
> when stracing a program:
>      chmod("filename",)
> This patch fixes it up to show the zero-value as well:
>      chmod("filename",000)
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 5ac64df02b..2f539845bb 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1505,6 +1505,11 @@ print_file_mode(abi_long mode, int last)
>       const char *sep = "";
>       const struct flags *m;
> 
> +    if (mode == 0) {
> +        qemu_log("000%s", get_comma(last));

I'd use either 0 or 0000, not 000...

Preferably using a single 0:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


> +        return;
> +    }
> +
>       for (m = &mode_flags[0]; m->f_string != NULL; m++) {
>           if ((m->f_value & mode) == m->f_value) {
>               qemu_log("%s%s", m->f_string, sep);
> --
> 2.37.3
> 
> 


