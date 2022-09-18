Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BFB5BBFF2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:52:56 +0200 (CEST)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1Hb-0002iJ-2e
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1Ea-0005ni-Aa
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:49:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa1EY-000878-Lv
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:49:47 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f23so9952572plr.6
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=N9JTATzlCsEgrLq76l3tsn14CuDb3U+/zLaABl+4if8=;
 b=effMpwZIXe+X9B46a3oA8vHaJtcmP3ToANM9C3/i8m4tkJwkSDT1+JFCwtXsv5tPpm
 8MkFLppadysXZzaUOxjj4pNMWZk48bjOFu/YxjZ54S37/uiLp2hcYXtkka6EoQDNty3+
 4AX+FpDFBxkma0V58wL09gZ7+XEEvrX9hFYX+YMuDtyQizhC1sxP5AAUoYi/iUOeR0Ly
 l56bwJW1SslDpgKgvzsZvs5TCeOwrFepSed41aINVYcGyzrX8CCblIDERIghdEmB94rr
 JToGV+jp71a6dsYExxY8hzV01Uf9n+xmwDVFP4BRFmC0eIGjvTQ05FzUVH9Bzc+pXJ4p
 SYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=N9JTATzlCsEgrLq76l3tsn14CuDb3U+/zLaABl+4if8=;
 b=Xyxqs/knZKrk1Sz8AQbMBblO1DlppCJjMbvUYjhBIFLLLQjuaQrTzACbgL+PBOy6ti
 MxWyVs5+8J+yDCu8ad9nfmRQuH6vQErKobzdQ80XxSrOdw8gBRUTP0dAlO3aU3uzPQPt
 IwbjQ3GalMytlm6V/3AeAUkU4cEK2QqPOf67ePNuSIo1wnB3IYs/M3QPRwe+BQOxJ5vW
 z3SrXwIuritK71/I6tLmVDRjJy3LjXWkLk3fOjHYC0Tzu3x+JwK46x0/nX47WxHC0ofX
 r34ZTZmAK6g0TnkbVYN2YxAZYv0qxPewFRHpfWFn0afEmiGhXm43TorkSR50UquOYsGe
 w17Q==
X-Gm-Message-State: ACrzQf1Ziax8eJnwLnEUH2+f/59guBk7xuZ83eViifbHSzWBrRdRlXcM
 da62wn2mVbm2Bnjfs2u5CBQ=
X-Google-Smtp-Source: AMsMyM4ni8xV3vzVRbys+NAwBlHt+5c+aFF3G3MZojdi4fUFc/anKoTP6wRLBFT3Tg3rOzh05bwI3Q==
X-Received: by 2002:a17:90a:804a:b0:203:3947:1a9e with SMTP id
 e10-20020a17090a804a00b0020339471a9emr19600417pjw.118.1663534185175; 
 Sun, 18 Sep 2022 13:49:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa7952c000000b0052e987c64efsm19120146pfp.174.2022.09.18.13.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 13:49:44 -0700 (PDT)
Message-ID: <02090880-0db6-0a6b-60b0-b3313566b962@amsat.org>
Date: Sun, 18 Sep 2022 22:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 12/12] linux-user: Add parameters of getrandom()
 syscall for strace
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-13-deller@gmx.de>
In-Reply-To: <20220918194555.83535-13-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
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
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index ad9ef94689..97d8ccadac 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -355,7 +355,7 @@
>   { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getrandom
> -{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
> +{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%d)", NULL, NULL },

The last argument is unsigned.

Conditional to using "%s(%p,%u,%u)":
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>   #endif
>   #ifdef TARGET_NR_getresgid
>   { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
> --
> 2.37.3
> 
> 


