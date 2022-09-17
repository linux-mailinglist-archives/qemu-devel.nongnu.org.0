Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966A5BBAA5
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:18:48 +0200 (CEST)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfD5-0005IV-3v
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfAa-0002EB-Pk; Sat, 17 Sep 2022 17:16:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfAZ-0005Hr-9X; Sat, 17 Sep 2022 17:16:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id l8so12828562wmi.2;
 Sat, 17 Sep 2022 14:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=zU3BiSFVn0EPNwQFd9qRzwJ53hSrD8kprTT79i2P1DI=;
 b=d7c8XhCfYeLsmjY7WRkPtPqHsoecfStoP6MLlU5vG/HkbYvy+AsL9zJkXNNxSBPJdC
 N/Jez7P19McSY5ljY2phySkkQytdP1BR3VtFzhnWUc46gHeE5G60lK9XuGIHw74CtE4I
 lvIUlqeZF/1Qz8N3ocdclvlKJnb1IGV8P8a+D26XY1leUKaE44VHThuG526s3+A0FQ6a
 rwiL2Gf0wo5JPQQEg1U4w806X5i9RA+4lfCN/fdGlc2JZPde6Ms8ihWCsEm9KbKGDwzS
 XGPB4PhTdUOQkxC2r0ljuMCcYCXJ5B/gNY3xVnlvA65ahCur2/Z1Ax1WoYwf7bM5l2Ka
 xV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=zU3BiSFVn0EPNwQFd9qRzwJ53hSrD8kprTT79i2P1DI=;
 b=TMbwxvjABOzBZ6ONBnWP6PpsiHqZaYjuIfLHCdaaPKLdLpgQPt0WK6L90eL5rm8Ucs
 KTXgNhbG58tHZhUdH5vJneYMt7yy06vt3r+iNiL6K1ixE7rrvDavlT0XEoSPvwhcnWHg
 qrQfnBCtD9k5HSzi4F0i4+6mhjP+OudOcDJlwstOWGGpmGgUoVIeV7YHNXVZ/JnyXnYx
 UWABHegPtzaJzYELZtYkGcjIyn9IUwawdIhGBiPBrI1kRfnuVeoG2jdrfKClMgIshRe5
 FTZHl7DlS9bPkgDNY3HmFvHW5FYVlbsB8wzFay7/M/czefk/ftsEAjSrjJ3FhIFpceAb
 eKTw==
X-Gm-Message-State: ACgBeo0rp/BKrQLbHvd8HQ7GZPrnEiN6AJgwHUc0NBZb9a0WIMxAgtpC
 5ulpOgxI16sQ2zzr2g9KSGo=
X-Google-Smtp-Source: AA6agR6Zrbt3CQYkpql3CR3jiARulR98rMV1tMnT7+bysHbVSmaB5HSfabqwgqbuwpdYP0sr1LwTDg==
X-Received: by 2002:a05:600c:b42:b0:3b4:7580:a995 with SMTP id
 k2-20020a05600c0b4200b003b47580a995mr14754560wmr.30.1663449369422; 
 Sat, 17 Sep 2022 14:16:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a05600c34c700b003b4ac05a8a4sm8386725wmq.27.2022.09.17.14.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:16:09 -0700 (PDT)
Message-ID: <2c9e2bfa-e252-3340-3e9e-bcf5423d2f6e@amsat.org>
Date: Sat, 17 Sep 2022 23:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 07/10] hw/ppc/mac.h: Move macio specific atuff out from
 shared header
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <3fd567b3162f70414fcbb7d074e3a7731360f6e4.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
> Move the parts specific to and only used by macio out from the shared
> mac.h into macio.c where they better belong.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 26 ++++++++++++++++++++++++--
>   hw/ppc/mac.h          | 23 -----------------------
>   2 files changed, 24 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

