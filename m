Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843C5BBAD8
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:21:37 +0200 (CEST)
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZgBs-0005hX-B3
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg9A-0002sC-2b; Sat, 17 Sep 2022 18:18:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg8z-0004tc-8I; Sat, 17 Sep 2022 18:18:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r7so385023wrm.2;
 Sat, 17 Sep 2022 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=d1ZEJQBAGS/PFfCqSh2rV2YyF89AU2KYknkiStcF8+c=;
 b=FEatsyXGnWZozH4cGXm7IrmD8/eBNs9Of/PrIIqGcV7qn0UkPnFp5+dhhyNjQKB+4I
 dkLG1s1o4luSucTyAe+SMDG0KuzLWGPh1uZrG6pobv3D9uzeg+kl7jPWAL0FYAmdp7wc
 MnfnV2XoW9poeD1T6Z1cB9sbkTaMD34bQX/pIFaTvvbvNuE/MqD3DU7AIGSkINm0OS7Y
 vXNdHw+14KFvN6WZjLxeMgn4gvRAlMTKnU4oP3iKKH8O+9hVY7fShtPd3Jbw31pYqeVY
 A347goY6q+esa/cop76hWvI1x/atZEfLgwNJDGLZdsh8XFeuocWL22QvFlhqK0kzQEnN
 WOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=d1ZEJQBAGS/PFfCqSh2rV2YyF89AU2KYknkiStcF8+c=;
 b=OF0Fni9mkrVyEpSFaKUGSsCfzOeDbcei0ApzfiVxcddqk3suN0kCt/8cQCeqRvyNZX
 2aMQvyPszvWupXj1hn1Up6eTB3VFpzJ7IIvls4P4IUyLyIDPiYdkN8YNq0+ArsmeEfBS
 xRZ37/MhjLrxHCB+PTjB0AZG3+mMGpcxkFWxS+xTKxGHe3HW30VMCU9jjZYQt1zsMfPp
 JOijVdezJyRR6W0Nb2rvK4IffqQoYj1BmUvTfgCJDOwloWlGTh008kIzKbFxwM1NOYMK
 NQDM0wgX7LNhnjnY7TItY2FKbRh0TWnRVlOYP51ukDjjYcDHX8GcsjZ2WKNAKyZGl5mI
 sepQ==
X-Gm-Message-State: ACrzQf2/OEib11fBygpeDTcHqfCwCm2GugTdVq8RMSn58R8/wQ4/pKD9
 rrej2VXPRhKYKj+cy0d13As=
X-Google-Smtp-Source: AMsMyM5hr8+NECNHErHwEoN/bCHZ6AGfKNhSNwKK5t/Ez/qO5AJAfwQmCfdSu/eaqpv7W8QtFGAgng==
X-Received: by 2002:a5d:430d:0:b0:223:808f:19c6 with SMTP id
 h13-20020a5d430d000000b00223808f19c6mr6732709wrq.273.1663453115499; 
 Sat, 17 Sep 2022 15:18:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b003b4a68645e9sm7100860wmm.34.2022.09.17.15.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:18:35 -0700 (PDT)
Message-ID: <08844139-dade-45c5-ef71-10407358afce@amsat.org>
Date: Sun, 18 Sep 2022 00:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 21/21] ppc4xx_sdram: Add errp parameter to
 ppc4xx_sdram_banks()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663154398.git.balaton@eik.bme.hu>
 <61fd9fdf54885c68482f0eb15f67d8272e9a8594.1663154398.git.balaton@eik.bme.hu>
In-Reply-To: <61fd9fdf54885c68482f0eb15f67d8272e9a8594.1663154398.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Do not exit from ppc4xx_sdram_banks() but report error via an errp
> parameter instead.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc4xx_sdram.c | 28 +++++++++++++++++++---------
>   1 file changed, 19 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

