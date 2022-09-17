Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA75BBAD5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:19:01 +0200 (CEST)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZg9M-0002pN-G5
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg5y-00081q-Kz; Sat, 17 Sep 2022 18:15:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg5w-0004fk-Pc; Sat, 17 Sep 2022 18:15:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h8so34490318wrf.3;
 Sat, 17 Sep 2022 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=W6jgjxBpnCyBFVRFK68LgfCmjwdVmJOWD8h1L0SiT9c=;
 b=qdvLKyNKS4wZ24n3+wzxKOsVwed3WDXB4noP5auaX/0HEhgJATpUGphjN+kSXcJLY2
 /5XLk9X0Xsphd4N1iZhTAt9yUEy+Rs8TjnmthEplIvj6DWT6zpnuJ2HpZo7S4eak4Tb5
 l2U8WHZI2HrVlbYn/MskCFqQZdw8r+ARKkkANk43CmDwGzS0l9BRYJPjxvbn+NkstVKq
 te/ATOXzT7bU0mZDSvHB80Ix2n2JLqEc/CoqfTCztKm/pTABBiFd1b+QzAtRCKEdGdbW
 N4K33pB8GcNX7286L2MAFxDTMh0fQB4QSk2JNCJNyfllA5mFe/JRhb8AD3DnekNuoOyc
 PVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=W6jgjxBpnCyBFVRFK68LgfCmjwdVmJOWD8h1L0SiT9c=;
 b=2kvUrhDhWbrFvGILNKAMD0cnrTuLL8kygU9G7gpMgXXQurWV+rOm+5bPw/PIwbar2g
 8gxPkJh604gGEAHxX9Y6DyNSWaaoTNt86YxwVF/LJqk8CBZxsnF5KKeM6FbcvPXPtgBd
 QP3wPM0qO08IuVuGXzsMuKduX4Aoc0O7bpnw++uoGjQ4uFq67tMYbk3p//3wNa1CVX7W
 y4e9C2ewDqROfW87ej2zuMXn8kr+TTw6Xogq6eN9B3kUcGD07ERESaDj4Q59ZacANKlY
 nEgERdSGG/4obCFpEJ/GaXDq3o/kM1cDdF1lhIOlh2dNS+NI5AnB7L8zv/utJwJC7ibO
 vXGg==
X-Gm-Message-State: ACrzQf2ky2Nu4gac8A1PLGvbQEFMVC1v5T607bR1RLq3V6w1iQ4t468N
 /6qXn0lv+T9b/1ML8RgxXiw=
X-Google-Smtp-Source: AMsMyM5P4ph858Dx+g43kATJftG9WsAHty/YNhoYWTFI+0x3CsqYOa5ujfXiDUHOeNgZyB4gijandA==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr6549457wrr.26.1663452926951; 
 Sat, 17 Sep 2022 15:15:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1c5448000000b003b486027c8asm7154808wmi.20.2022.09.17.15.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:15:26 -0700 (PDT)
Message-ID: <abbd7fd7-f758-a6b3-d8b8-196ab520a9e6@amsat.org>
Date: Sun, 18 Sep 2022 00:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 13/21] ppc4xx_sdram: Rename functions to prevent name
 clashes
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663154398.git.balaton@eik.bme.hu>
 <7997a8a82f43c124f8435b81332b9812e1ea19ce.1663154398.git.balaton@eik.bme.hu>
In-Reply-To: <7997a8a82f43c124f8435b81332b9812e1ea19ce.1663154398.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

On 14/9/22 13:34, BALATON Zoltan wrote:
> Rename functions to avoid name clashes when moving the DDR2 controller
> model currently called ppc440_sdram to ppc4xx_devs. This also more
> clearly shows which function belongs to which model.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c   | 69 ++++++++++++++++++++++----------------------
>   hw/ppc/ppc4xx_devs.c | 44 ++++++++++++++--------------
>   2 files changed, 57 insertions(+), 56 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

