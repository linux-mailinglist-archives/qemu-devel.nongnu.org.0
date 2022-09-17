Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE825BBA80
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:00:24 +0200 (CEST)
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZevG-0007e0-Sr
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZetm-00066V-6V; Sat, 17 Sep 2022 16:58:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZetk-0001hz-Ja; Sat, 17 Sep 2022 16:58:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id r7so225172wrm.2;
 Sat, 17 Sep 2022 13:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=dnf4eUs3pZxk7IcwGW0mR7AHnN8n8Xj1qhIRg9s63VI=;
 b=S80StgW0nO7cOtiId7MfDwYZKNUOAnYowuh/F7vbFsqWIEJfLWcK4kE9tCTOr03rm7
 2ReFpZpQ/M+LHXGbzR78y22t5tefsDOHt7IxvAkISNf8ZIRqQzWUSqHSj9BY/PrCnEnr
 ZE79g7lOxfv4Jy0iz+YrgeRAZvrlaV6pN1MVAKCCFTeMSm7U60xTCw+WXImmSFZys0vF
 C/aLt2/RLj5lBssqJ6OlsO5rEyqTxVFOUrg0+VNesSE4VmVsEbWfcWVfw4lnzS4OpQG6
 GMDBsMfK3AFPrg66yIf96qW3K4q4VVaBO5Wmlaz6o0A8FGlR6AVAcgi64S3bLWLeOqtE
 k/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=dnf4eUs3pZxk7IcwGW0mR7AHnN8n8Xj1qhIRg9s63VI=;
 b=gxoBvv+OFKx7FUOZ5VmvdzByml2UXB2fZQ+Ex9S3bf41VcS+ao0+/LSQPLPEKIhedG
 /HDCGvDfgcMgICHe22RlDPRjhbK4ezwk5hFlQTFdjeDIJ4FjDg3+RgsCoE1vS0Ikowwi
 H6Z42aImB0bbAF31HDxOR5f1JhE0myBjpdkxuUlocNPx/mwZME0aHh+k/XpSEJmD9vDc
 elvAHdgFQjDHKiisKmWH0S6p7wp3JkatfSLTM1xBX437SIjga/ZHJHPf8/ZPYMeA7qki
 YKXI06k0bS7H/qxSAqFkJalqmAD3cssf7iVdInzTyC8ux72tahpyc2Ge2CUvEj21x7TG
 YtnA==
X-Gm-Message-State: ACrzQf1EAp2CHALYD0VgmexwFAME48gn48XnXfFV7hBr6vNozEPyRzUI
 LMMH1XGukXXRG0ywUYRtmoo=
X-Google-Smtp-Source: AMsMyM4TKM+3rZWRGPoqtULpVUPpMz0Q1tRR0u10zz2j95/FvtFY//9vHxqJeCONBs8dnxJc0VMGmQ==
X-Received: by 2002:a5d:6986:0:b0:228:60f9:b013 with SMTP id
 g6-20020a5d6986000000b0022860f9b013mr6252100wru.102.1663448326762; 
 Sat, 17 Sep 2022 13:58:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b00228d6bc8450sm9871486wrs.108.2022.09.17.13.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:58:46 -0700 (PDT)
Message-ID: <ab441386-9fee-1463-5c34-293160c64465@amsat.org>
Date: Sat, 17 Sep 2022 22:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] Remove unused MAX_IDE_BUS define
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: richard.henderson@linaro.org, deller@gmx.de, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, aurelien@aurel32.net, hpoussin@reactos.org,
 mark.cave-ayland@ilande.co.uk
References: <20220917115136.A32EF746E06@zero.eik.bme.hu>
In-Reply-To: <20220917115136.A32EF746E06@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

On 17/9/22 13:51, BALATON Zoltan wrote:
> Several machines have an unused MAX_IDE_BUS define. Remove it from
> these machines that don't need it.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/alpha/dp264.c    | 2 --
>   hw/hppa/machine.c   | 2 --
>   hw/mips/fuloong2e.c | 1 -
>   hw/mips/malta.c     | 2 --
>   hw/ppc/prep.c       | 2 --
>   hw/sparc64/sun4u.c  | 1 -
>   6 files changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And queued to mips-next, thanks!

