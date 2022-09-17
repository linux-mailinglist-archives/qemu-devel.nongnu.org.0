Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C105BBA8F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:07:45 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZf2O-0007OP-4e
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf1A-0004oT-QX; Sat, 17 Sep 2022 17:06:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZf19-0003Kh-4c; Sat, 17 Sep 2022 17:06:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so1901952wmq.1; 
 Sat, 17 Sep 2022 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=dTuTT7rmRwzyu+V2rL6jM9SN6gSybaMWIrPLdoZawq4=;
 b=dRA66mQFgQKNASIUU2jiVq0fGqQrCt0nJI/Iac3LhEOha5a5O0JoopLTQN4G70rydg
 xGcoJx0BBnQw79w1lw0HSA2WiAhHbkEfIjQSnKPlEOZWksz+V9z5T196xwyNNAO2n+Fr
 FUBWXWZPxXfl37DJSU472fwqa9pADxwmWHqCMFE5p18s5YyOhKv4nUqV4lmE1ORFHO4Y
 /+OXBgyr3qNTx2v4ooduBITHefI12uW79qlvcsk0zxb6yWQHQx1ReMhLTSNFFj9mgK2l
 GnOqe9s0jqlvjrGpfYKZAkaMlPoqFXBpWdzFBC0QrEvfZu4JKZt14Cmt3LqsmPvqt8NJ
 uQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=dTuTT7rmRwzyu+V2rL6jM9SN6gSybaMWIrPLdoZawq4=;
 b=1BzV5PQ9QuXTyh8OjmvR0ANW1/hsrROf0F0HYGvPSPK3Cq18QAQVl9mbw1DacJ6M+n
 2lq8cxrZr/RHWpBmhPHnMjluPnnYaSgb3zPUnVOL9fnFqwtwu2Sx4GvHoGkGlxq/gBQh
 umECiF/NaOUfImJha+90iqDPCcS3MSUHJVarOhx+Ptb7mfMfT7CdCmgnSP8TZ34yrF8Q
 HhiiWCD4RWGss3HUZ3VzpXSOV0LHPWRC/sWeWar26AECtoXIYBw0nHhfFdTOuuMei2vJ
 9NW6HyWqubKY+PSP11ZUiP1zkpQS9wbWnAWjQYs4LefqevEAchoOZioZThQqtDHNqcng
 BRtw==
X-Gm-Message-State: ACrzQf2CEfwU7/lMXP7g8q91FXVu09aMHk3B2kvqQO/ASdi9lY47G/YB
 BxoL4vfcGglJtURPenRJHwI=
X-Google-Smtp-Source: AMsMyM7YVmDgu7BHpXuZAVfbml+Oq9+zNKdagZMbh/CyNHA5+QOExNoJ1Nv5L1ZMJcRcTNYxnyubNw==
X-Received: by 2002:a05:600c:3ba6:b0:3b4:9894:d482 with SMTP id
 n38-20020a05600c3ba600b003b49894d482mr7469975wms.120.1663448785324; 
 Sat, 17 Sep 2022 14:06:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a7bc402000000b003a5c999cd1asm8471392wmi.14.2022.09.17.14.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:06:24 -0700 (PDT)
Message-ID: <6f9f9eb2-cc1c-b799-022a-be6f4abe9e5c@amsat.org>
Date: Sat, 17 Sep 2022 23:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 02/10] mac_oldworld: Drop some more variables
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <e58a3c14ae73d40629a3dd8b9b542a69fe86b07f.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <e58a3c14ae73d40629a3dd8b9b542a69fe86b07f.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
> Drop some more local variables additionally to commit b8df32555ce5 to
> match clean ups done to mac_newwold in previous patch.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_oldworld.c | 43 +++++++++++++++++++++----------------------
>   1 file changed, 21 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

