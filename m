Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CC75AC430
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 13:59:40 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUoHr-0007GF-NV
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 07:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUoFq-0004yt-Ar; Sun, 04 Sep 2022 07:57:34 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUoFo-0007IF-Tx; Sun, 04 Sep 2022 07:57:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id j26so3930061wms.0;
 Sun, 04 Sep 2022 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=AaGGv8r3e9qFOKYTVtkRmGQtcfCtNMOxy84vqf0W42I=;
 b=IJCXIRKG5tP270aAxy/QP96jpuWl3Arn3fAxPtWEVAzSv5y5p24Z3TmvaWaJMGVdiv
 48MpQCMsbIx+3Z/vKHSxhwC+5X5KGtTLl1GRNT+DBeH0jP3n6fahv7YyThpzj7NVEptw
 3476pUslyg5wY2Olncbd9dCpTKVQa+xp3ES9l09fRQBTASCBPOOxBXjb/laeTCb/WqiM
 5b8CR+7WEtblzuy/DUw4lxr3Ga8PH/vgdIFOHPuYBrNX4anQozqTHIvPF9aVlRWNkgYN
 7+VnWvSlNSFH0bM1WOSjXNEZ7nlL4Atp3Uf/ngzOkJVFtxklbJaQhCao9slAhsQOhqXs
 unUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=AaGGv8r3e9qFOKYTVtkRmGQtcfCtNMOxy84vqf0W42I=;
 b=fXZOPKAbYOZMBBv7jdZxyeyK3qs0uEhDCGU7pP6AFeSFuI6BhOPldHHVOVoblctLjt
 FmZiRpVmH3ED7aHj7G1eWxbKBA920IXA+Aw7DR80Nuc1aDbrsSkc3fSUWBkI7IuBF9zI
 Cji6Fi7pcHBJO7IX+wvKNx4QHOVVTVLtKEVWJ7+NbsfcmtiDpo3uklGDraE2zInYIMgF
 s2yu1OBRGbtdTQqQ9WI6bFQjr0Z/6JjXAXUqM3UyZJS2cYQ4T51BVy71+t4XIpn1gjL4
 HK6/RiQKXTsTwMHmjfaMgZrKCaIZGViI93T6LGJPwiUFHdmNjr1wbs7Nva/nfPAH6ilA
 mkbA==
X-Gm-Message-State: ACgBeo3JR/JPKoIPzL1XS53umfDI+uRPSM21yQASBZCI1ygOOFjaWyQS
 vL686MUL8ws5ErgbNNT5/ro=
X-Google-Smtp-Source: AA6agR6tvn8ucxtigQy25O6xumma0f2mvJal/HDuog6wZPAt0rDBk6uibDCIsyFbWvDRYQOXxANb9A==
X-Received: by 2002:a05:600c:3c94:b0:3ae:ca8c:acfb with SMTP id
 bg20-20020a05600c3c9400b003aeca8cacfbmr1413793wmb.199.1662292651070; 
 Sun, 04 Sep 2022 04:57:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y10-20020adfe6ca000000b002250fa18eb6sm5864838wrm.71.2022.09.04.04.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 04:57:30 -0700 (PDT)
Message-ID: <373d9a43-cd32-5c50-d296-9fa1657dfeeb@amsat.org>
Date: Sun, 4 Sep 2022 13:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 17/20] ppc4xx_sdram: Use hwaddr for memory bank size
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <26a79f2074b7a5543be4d3a77ad190b9d16b4612.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <26a79f2074b7a5543be4d3a77ad190b9d16b4612.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/8/22 18:55, BALATON Zoltan wrote:
> This resolves the target_ulong dependency that's clearly wrong and was
> also noted in a fixme comment.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc4xx_sdram.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

