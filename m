Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E701B4D75AA
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 15:00:58 +0100 (CET)
Received: from localhost ([::1]:35500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTOmI-0006gE-1S
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 10:00:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOkw-0005x4-Mj
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:59:34 -0400
Received: from [2a00:1450:4864:20::32c] (port=41668
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOkv-0000cG-3Z
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:59:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so8109862wmf.0
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ydm/hIY9fgL0lBHIvZUc7H/fC76AYz2SKiJ1sy0qrnc=;
 b=kLpahL7HsHp4VKKNm/Po10MjMb+8X/+J5yJArWqcWksdElswTGQyXxPCrmPX9CwVGh
 KJbSTMz/XgllFKcfNyPoz46UM3Uq26pkJP+ORcHAPIKXET5qKu67v9azGDWAAiAKb3u3
 9huXLPurcuz8iMaY2IOxlo4bphtcVIKtfyqOleBFFnvHvV6zFjf21aYR0BIEiC6F5gPu
 Yn2T4Wp+SD6vt/OVXGatJoZBWUD+eiQQEKmmIKkxjk6GMUoFLkGki+p0ITk73gqAvViS
 yZ/hjsEITjK5N9bepCS2pvAcQt8/cIWTyUsH9I/IW52lK7dDiBqLmivcGFYnMxkVljCz
 p8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ydm/hIY9fgL0lBHIvZUc7H/fC76AYz2SKiJ1sy0qrnc=;
 b=fopoWuKZQRk04b2Iqxo0N01XQNp/1VRDVyr44j3Gjdwk4ejnRywxzQv1tvhMpxPNAX
 x1lAc7mKJOdIk8xDS3QYSTeVoiHB4s8twtkBbJYUzmvpAHq4Z4bHtKuTBwXuIhOfoZ0m
 i+MhBKBxnofdnUxg5myJEcMtf+GUiBxI8IpeRWw5YOWkTXYgUeAJtpJnlNPfE86lA5Wd
 xnWkQ8QF+3XHoVpghKwnkmkYUCQ8yk8lJvaepX6mCKz9CkGPMrG0dZQj6DXVa+ir2Eol
 Kb5V9IH9rkH1/zuY/ldCwM1R4WgWthLzYMtTUeiWP8Yw2b/3piL17KYXeM9S3LEJgTTJ
 AG/w==
X-Gm-Message-State: AOAM5308toKnBUUlZ1y4dJLBuTAq1MM2dYhjWEgrTr1dEjM4XnPVj46m
 FCkVzkK5JcVl8zgbZ4y6jvU=
X-Google-Smtp-Source: ABdhPJyzP5djRdvczlZw+usjky5Zbg0NwjyccuaDBYwFCN8qBJBw5+Mlf5Jn2OroDSJs2G47sGGxtg==
X-Received: by 2002:a1c:4b04:0:b0:389:a498:3820 with SMTP id
 y4-20020a1c4b04000000b00389a4983820mr14033268wma.50.1647179971614; 
 Sun, 13 Mar 2022 06:59:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm11138111wrv.79.2022.03.13.06.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 06:59:31 -0700 (PDT)
Message-ID: <bf77a623-3915-d3bc-2837-998ecb636a65@gmail.com>
Date: Sun, 13 Mar 2022 14:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [RFC PATCH] mailmap/gitdm: more fixes for bad tags and authors
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220311135200.680127-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220311135200.680127-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Michael Ellerman <michael@ellerman.id.au>, Jason Wang <jasowang@redhat.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <andreas.faerber@web.de>,
 Aaron Larson <alarson@ddci.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/22 14:52, Alex Bennée wrote:
> I was running some historical tags for the last 10 years and got the
> following warnings:
> 
>    git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/gitdm -n -l 5
>    alarson@ddci.com is an author name, probably not what you want
>    bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 552: invalid continuation byte) in patchm skipping
>    bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 342: invalid continuation byte) in patchm skipping
>    michael@ozlabs.org  is an author name, probably not what you want
>    Oops...funky email nicta.com.au
>    bad utf-8 ('utf-8' codec can't decode byte 0xe9 in position 232: invalid continuation byte) in patchm skipping
>    Oops...funky email andreas.faerber
>    Grabbing changesets...done
>    Processed 76422 csets from 1902 developers
> 
> The following fixes try and alleviate that although I still get a
> warning for Aaron which I think is from 9743cd5736.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Aaron Larson <alarson@ddci.com>
> Cc: Andreas Färber <andreas.faerber@web.de>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael Ellerman <michael@ellerman.id.au>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> ---
>   .mailmap              | 6 ++++++
>   contrib/gitdm/aliases | 5 ++++-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
> index 4792413ce7..5b31635c15 100644
> --- a/contrib/gitdm/aliases
> +++ b/contrib/gitdm/aliases
> @@ -34,8 +34,11 @@ malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
>   # canonical emails
>   liq3ea@163.com liq3ea@gmail.com
>   
> -# some broken tags
> +# some broken DCO tags

> +alarson@ddci.com alarson@ddci.com

Is this one useful? Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

