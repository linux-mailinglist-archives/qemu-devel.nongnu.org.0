Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414A5BBA8E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:07:29 +0200 (CEST)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZf27-0006xg-VQ
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf0a-00043j-VW; Sat, 17 Sep 2022 17:05:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf0Z-0003Fw-DB; Sat, 17 Sep 2022 17:05:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id cc5so31476080wrb.6;
 Sat, 17 Sep 2022 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=p0fEsCiK1XZG4Wgc8vSaa2WkdAXnmUmEgv3zd2J2l5g=;
 b=U7rKIpOnJrW1pOmqK2hdwPOKQ+sJOcoYcmQis8GzFqETlOttLIl4FaemeA0a8rVx/a
 t9WjSYqSG0Gsk+2lFLWjGFceZHxbmhc0HmBfbUUgrvDqX4px52aPNlBlDwvq67CvHvxL
 K9/w1av6AwvYueknS16FHrp1Mjogj/WMX/Neqw5cvY7FRlxFUIO031l00/h6wKYZaEXB
 w14oisrLMxjCENZ5HH4+V5VGuJ1JJhocaeqpZcroKUrMYXE28f6yevXV+fctPrGLjvTN
 Z0MBmf3bMMFvkXvtqKN1VUcsfDNPUmhaN7ZLY7Zcp5UvUsQd06r8VjI5xw+k6DRvnRha
 gKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=p0fEsCiK1XZG4Wgc8vSaa2WkdAXnmUmEgv3zd2J2l5g=;
 b=Y0My8RbkWocE9efTTlSKZ9qh2HFazok+oDtqsFQe6jcp0meycZ7vzFg/eMeoB+3cY3
 ykvkxnZ28c5dR3RTxXh7DQQocgNL58IdQhBoL85s7gpjqDj25G8qvdtEvRgo+S7P7aHk
 jzw4KeBoesVxRERA4+fwJeWVfY1BiMPDqtlrht3UYve05MUPN0OF138F6YXwbDt05RcX
 5FIt8YEAubV7YIR4FdM8DjW8R1Qz7q+j0/e9d8W8Q1JQH1HpTLvoScKF8dftblGlymZA
 55xX3lejmjGvQPZsVjPZ+uao6zOJtRdTrDQNSYGD/TPSsa4NxJeXxbWqUq5QBYfrczsG
 2ECw==
X-Gm-Message-State: ACrzQf1bxTW0X2DS7iMsIfYLYpZWD9X9s7qh68zOlyqL8uOIlZvpUyy9
 6hWZ25lzVOX4O/QEw/aRR3DPkf4WEBU=
X-Google-Smtp-Source: AMsMyM4p4TmRanJt1SZmrr+bfAvXLItnAi7x18lLAMZch9OnbOzR/vE45IkkAHBFxXO8l4NeVHEXiw==
X-Received: by 2002:a05:6000:188a:b0:22a:e4b7:c2f4 with SMTP id
 a10-20020a056000188a00b0022ae4b7c2f4mr3772480wri.446.1663448749373; 
 Sat, 17 Sep 2022 14:05:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b00228d67db06esm8642349wrt.21.2022.09.17.14.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:05:48 -0700 (PDT)
Message-ID: <ce894f78-b55b-caec-ed6a-9da96e55587a@amsat.org>
Date: Sat, 17 Sep 2022 23:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 01/10] mac_newworld: Drop some variables
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <2f35db85d9f817a2e7c9d994bd8906bc8ec16945.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <2f35db85d9f817a2e7c9d994bd8906bc8ec16945.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
> Values not used frequently enough may not worth putting in a local
> variable, especially with names almost as long as the original value
> because that does not improve readability, to the contrary it makes it
> harder to see what value is used. Drop a few such variables. This is
> the same clean up that was done for mac_oldworld in commit b8df32555ce5.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 65 +++++++++++++++++++------------------------
>   1 file changed, 29 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

