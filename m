Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663155BBAA3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:17:00 +0200 (CEST)
Received: from localhost ([::1]:39092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfBL-0003AL-6r
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf9c-0001L0-8l; Sat, 17 Sep 2022 17:15:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf9Z-000561-Pg; Sat, 17 Sep 2022 17:15:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id az6so18231495wmb.4;
 Sat, 17 Sep 2022 14:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=DFnaGpq2WRe3GPcq1QyKdbML3fSSKCqYgJgE9HK47No=;
 b=Kd/NP0wWgNhD5RxSa8095Lq2Vp8FHpWjGihOTWpeGtHy310gUNPGhJfCHI0zHRxkq2
 ibqlQ3rFqX2hP4rTld6L72k4I5ED6LgDXHlgB7eJwOOvPK64DeJ0Euf5siH7L/91R3cA
 4qbe7nwyMMwfhuHG7OTiNa3U+CCbQkvP2DGOmGNDSB0Lur7OaTZrQ8KWOo4RW718aMkl
 wGDbXH4Pe1u9jQ5oN6JRf4U6AQunJzeHQSK2HS6w1NVwZUTzNpyqeBfOurIHR7kZJW8z
 74rWS+vnO/XfTh/IBZJh39Pfnatl5V86lgvuT3MA+XjagdUeqAWH2NM9qlIk493tD0bC
 AI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=DFnaGpq2WRe3GPcq1QyKdbML3fSSKCqYgJgE9HK47No=;
 b=3FFRKTxaL2zK4716Tuv2QHuAByA4asyWHxEndoqgfIT1C/+CGWPtlWxjRuOeB8jJz6
 s7nDMa0LmIbOMcXLIUkfKl7J6LcyIhXK/O0gQsNdxn5Dszmlcvnuo9QL0Y12xa3Pw6Qp
 vM/mHpnS44RUg71xXEBzCJahCECCK3qjOtiZEaQw2WeVRUdVZ816PrJIjhTU+v2DyHel
 4Gnkz1dpZSVMK8v3qBwjYheKHiq8nLIjHfh6oWA5iV7MIHn7uPOMYeldUfB2me3JbAWC
 pwUdafSqxOKiA8O+j3T9J/guX9nZvsrhOJTUnCq+0grpa0DnZF5Ey+jW4OdtqD53HC8T
 MSfw==
X-Gm-Message-State: ACrzQf0Ygo3Od6iEz3HPwrWg+BMbZ7QPkeXO3PXn5D3txNzmwT9G74Hr
 hwVsRNRkEP6VZMSzdvja5+E=
X-Google-Smtp-Source: AMsMyM6pCh94heR++1DQzc7jS+3w18jtt1r0AB5ahqlAo65S7qufCVxdGHuslgp16ITp+H0RlF0drw==
X-Received: by 2002:a05:600c:2253:b0:3b4:61f2:3bba with SMTP id
 a19-20020a05600c225300b003b461f23bbamr7566199wmm.112.1663449307848; 
 Sat, 17 Sep 2022 14:15:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003b33de17577sm6829198wmj.13.2022.09.17.14.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:15:07 -0700 (PDT)
Message-ID: <51f5218b-80be-5927-4bce-ddf0bf59c188@amsat.org>
Date: Sat, 17 Sep 2022 23:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 09/10] hw/ppc/mac.h: Move PROM and KERNEL defines to board
 code
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <f8554a36947fc60caf104deffc6cfa5c4f244ae5.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <f8554a36947fc60caf104deffc6cfa5c4f244ae5.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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

On 17/9/22 01:07, BALATON Zoltan wrote:
> The PROM_FILENAME and KERNEL_* defines are used by mac_oldworld and
> mac_newworld but they don't have to be identical so these could be
> moved to the individual boards. The NVRAM_SIZE define is not used so
> it can be dropped. This further reduces the mac.h header.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac.h          | 6 ------
>   hw/ppc/mac_newworld.c | 4 ++++
>   hw/ppc/mac_oldworld.c | 7 ++++++-
>   3 files changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

