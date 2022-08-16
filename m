Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50764594BAF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:51:24 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNknj-0001Oz-DU
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkkT-0005YH-FU; Mon, 15 Aug 2022 20:48:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkkR-0005vp-Vu; Mon, 15 Aug 2022 20:48:01 -0400
Received: by mail-wm1-x329.google.com with SMTP id j26so2301245wms.0;
 Mon, 15 Aug 2022 17:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=vCn4l7p9cL0jvnptCofJVa03uiJKz2JPmTPVroKlhxU=;
 b=Vz83Mlf8Z/9i0hOVW1ZK4pp0TYqcZleT4GDiIofBtRlkJ0dgtnmbOHvvGI6jFtYFg6
 WK5pAG1bOiGJsWvzOIWABOvMIHX7Sv99aC7nG8254oMrm9VGolpoe39pqUUQjcDzljgy
 NbAUxQky/CY+MQ33Ss8hNVXYXgdgceVG6CGVV/tfA9Kbwesk64gmo/EF1RA00x1/5+vC
 sPJRRSJ2VT7Bkv6AwFyLAbxUdHuC2WLIaLDtspR532jea52OSHq/ONelUVgTmdFRrAnm
 WQU3g+1Z/O+fin+ASwBg3P6LCb4TnTQVyG2HEAhp8mg6f9G9mb/LqU6FYsqAP+C9FZnP
 Yiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=vCn4l7p9cL0jvnptCofJVa03uiJKz2JPmTPVroKlhxU=;
 b=h4zcxhAN+lK9jM3S3osc/F6ILUZdIGxM7pdheZ5r+A7I5PQTN/o8cnA7P4GM8QzS1k
 EjRlqRFT+zXEP0FionGcfc6wTDJDoggJyOG8fqJnhXEbI4CcXg40VwHzwyv+NQSWgkau
 TliOHu/fNGDG+wfWdzxRbFqgCCyTsdXArxUP8a2KFlENlHX6IKkypkRtyYqafqs2D2pf
 mb4gm/VaSYhvTzKafqTMzEpizssLADKT3mjh3FjPN++ifrkc3QvMwKXcHCPUlrerXP2p
 CowvjfA0CIy9/dNF+XBZmJOllObg1Wn45/dwBnz3d3W7TzH4imkEJGcu1dxAwnszjDe/
 V++Q==
X-Gm-Message-State: ACgBeo16kuWmvYrch+FJk6fn/U7svqAK6zWKXTXHWzc4f7++PuIjV5+/
 S+6iRj2Is25didtWRW2IboqjEEZbbDs=
X-Google-Smtp-Source: AA6agR4ghC8em+/R8ygGOjj0jkm9dXJvjNg5fa3qBht4ZOTYd1lTIzPepxx6hMDYUzjHF6TFfaOVpA==
X-Received: by 2002:a05:600c:358f:b0:3a6:145:3500 with SMTP id
 p15-20020a05600c358f00b003a601453500mr2332231wmq.64.1660610877389; 
 Mon, 15 Aug 2022 17:47:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c358b00b003a5ca627333sm11848270wmq.8.2022.08.15.17.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:47:56 -0700 (PDT)
Message-ID: <3ab9e0ee-725d-ed47-6b87-f694dc259025@amsat.org>
Date: Tue, 16 Aug 2022 02:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] target/arm: Rearrange cpu64.c so all the CPU initfns are
 together
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220812174156.1460714-1-peter.maydell@linaro.org>
In-Reply-To: <20220812174156.1460714-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 12/8/22 19:41, Peter Maydell wrote:
> cpu64.c has ended up in a slightly odd order -- it starts with the
> initfns for most of the models-real-hardware CPUs; after that comes a
> bunch of support code for SVE, SME, pauth and LPA2 properties.  Then
> come the initfns for the 'host' and 'max' CPU types, and then after
> that one more models-real-hardware CPU initfn, for a64fx.  (This
> ordering is partly historical and partly required because a64fx needs
> the SVE properties.)
> 
> Reorder the file into:
>   * CPU property support functions
>   * initfns for real hardware CPUs
>   * initfns for host and max
>   * class boilerplate
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I started off thinking this would be a relatively simple "move the
> a64fx initfn up to live with the others", but because we effectively
> have to move all the cpu initfns the diffstat has ended up quite big.
> On the other hand this patch is purely code motion, and the resulting
> order in the file does seem to me to be more sensible.
> ---
>   target/arm/cpu64.c | 712 ++++++++++++++++++++++-----------------------
>   1 file changed, 356 insertions(+), 356 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

