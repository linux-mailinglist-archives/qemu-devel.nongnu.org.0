Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E260D485
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 21:16:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onPNW-0006WM-B0; Tue, 25 Oct 2022 15:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPNQ-0005kx-KU; Tue, 25 Oct 2022 15:14:19 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPNJ-0000AT-6J; Tue, 25 Oct 2022 15:14:15 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 16-20020a9d0490000000b0066938311495so79933otm.4; 
 Tue, 25 Oct 2022 12:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gI6h13DNRRrX99jAUiSrfhgbvx9qwkbm+6A5mIID3/Y=;
 b=bPK0/h1LX0ObAyeOmo5r2xLmddV6QjQkLZvyO5M0VxRJd7yPtzOCREILX4sP0cn31C
 gGGbY8cLhE4lpotuI2m7CjZCTVvK+aQZ3KNMp4gVmfC/9ikAHwS5ga4Go8KRXDG2wQFk
 x/9IEnEqrE1PK2CHkA6QO1iR+SuWAh/pgWJj9IUWHYHSoRaoZoVIq3S9lIz0kp4DUio2
 UEkzF77EV6VFHd2pxP8EYZrp66oBBtKDAZjYIcEdhLBIQ9Dp2E5BPHuDzlGdYl+ALgn1
 TqD+5XvmvBo/6TPFMFNodQ7sm3wmQ/UFrTUMGxLjRfVWycuV70m+n44ubPwjL7B761nK
 bG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gI6h13DNRRrX99jAUiSrfhgbvx9qwkbm+6A5mIID3/Y=;
 b=JDIwAt3TdK+y2Kys/TnywmBWsaDbw/LUMP+tGRZpiVoz9kYvhC7bI2SYQjHGJ5iF30
 oDITVabYqmnH1fwMyaVsh/rFOaMNTBUGaoHDGEJ2dYaJqnWvoLxCp0ueGSqaGb2lFgB1
 cgcxx1ux4mXdF7K4TLhuMug373gFCl1Fv7xQOJQ10dBAk9R72LsTDngJ7o8Zcg83VHKB
 4UWd3/HBNDAypmT6dkqpSmltXAPB/CqkdOfXKYZoSLz4KOxIqhtuiXSW9L6ZlOsWKeoE
 N09o80T5rkOIcM6dMoIQRFfs8MsOfA141KPgp9baZ+BtrGFcU1rsOhNmt8MwkIPOE2ff
 Xz5w==
X-Gm-Message-State: ACrzQf3s/dXgbJqQaDonyRsk18AzPt6GNxOHxDGkFtzNl9vaIsYGiyJV
 Y1KlF9/+Mq7rv0PDsUaosVg=
X-Google-Smtp-Source: AMsMyM430C0Y2kskBH+fc2NXtleH+XgdB7o2+ctgJ/AvnC2/ZWzqczVw4yGuB3ldyIvtUw8vgeGM0A==
X-Received: by 2002:a05:6830:3156:b0:661:e5d1:725d with SMTP id
 c22-20020a056830315600b00661e5d1725dmr20612439ots.312.1666725245731; 
 Tue, 25 Oct 2022 12:14:05 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a9d7d12000000b006690f65a830sm85507otn.14.2022.10.25.12.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 12:14:05 -0700 (PDT)
Message-ID: <f0832120-3890-58a1-e4d9-01c33c7cfa2c@gmail.com>
Date: Tue, 25 Oct 2022 16:14:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 0/8] ppc4xx_sdram QOMify and clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org
References: <cover.1666194485.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <cover.1666194485.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued in gitlab.com/danielhb/qemu/tree/ppc-next.


Phil, your acks for these patches are using the f4bug@amsat.org email.
Let me know if you want to use your new work address instead.


Thanks,


Daniel

On 10/19/22 13:02, BALATON Zoltan wrote:
> This is the end of the QOMify series originially started by Cédric
> rebased on master now only including patches not yet merged. Patches
> that still need review are 1-3 (these only move code to
> ppc4xx_sdram.c) and 6-7 (unify DDR and DDR2 models to share code where
> possible).
> 
> Regards,
> BALATON Zoltan
> 
> v7: Rebase on master after merge of first part of the series
> v6: Split patch moving sdram controller models together into smaller steps
> v5: Add functions the enable sdram controller and call it from boards
> v4: address more review comments
> v3: Fix patches that got squashed during rebase
> v2: address some review comments and try to avoid compile problem with
> gcc 12.2 (untested)
> 
> 
> BALATON Zoltan (8):
>    ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
>    ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
>    ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
>    ppc4xx_sdram: Use hwaddr for memory bank size
>    ppc4xx_sdram: Rename local state variable for brevity
>    ppc4xx_sdram: Generalise bank setup
>    ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>    ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()
> 
>   hw/ppc/meson.build      |   3 +-
>   hw/ppc/ppc440_uc.c      | 332 ------------------
>   hw/ppc/ppc4xx_devs.c    | 414 ----------------------
>   hw/ppc/ppc4xx_sdram.c   | 757 ++++++++++++++++++++++++++++++++++++++++
>   hw/ppc/trace-events     |   1 +
>   include/hw/ppc/ppc4xx.h |  20 +-
>   6 files changed, 768 insertions(+), 759 deletions(-)
>   create mode 100644 hw/ppc/ppc4xx_sdram.c
> 

