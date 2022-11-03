Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3D617365
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 01:34:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqOAl-0005eE-Cw; Wed, 02 Nov 2022 20:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqOAi-0005dU-B6; Wed, 02 Nov 2022 20:33:28 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oqOAg-0001jN-NR; Wed, 02 Nov 2022 20:33:28 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13d604e207aso490372fac.11; 
 Wed, 02 Nov 2022 17:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iEQCKeaqZTGSAVYfhPJTed4AYk1XHZNIBmkEan06obA=;
 b=dsTC7ZqbclBWo2zllA/S5WebMl2IT/AN7DzrhNmqCVO3Ds5mBwSPaXCH6m3hAEEHri
 vNW/MLw9ol5e354zK8t86K6gW84ctNzNBMTXsM/TZDHpndfgzINTL3aqzod9NfvHmupL
 PRNfjEU5/hXtGI6QarQTAKiPvT9pOpUid1aPCZq+ALosE53I2+rBrxaeGyjCqXo3q86y
 8JaV+Y+3wFXkq1nakma+nU5ZmLNDQ/upqafxFNhtF9Ng+01DjofzvqyGPKkXXu8Thbdd
 n+APKFR8oRT7VDS+ItFfkI07bKaJuFd9BzzzKiRDynJLty4a1LDfzqPaZlWeWD6JKToC
 yJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iEQCKeaqZTGSAVYfhPJTed4AYk1XHZNIBmkEan06obA=;
 b=ZPoFEDmGJMEAN/D0pJ0bKsQXcbXA/w6R3JrGWhRF+pSzaM721nsbjTkJPr6nIbPsOb
 NvGuA995TB+h2gS7tnCx1JB1yPpNMLXsT0EL4hkeJrCJ3WlhJxVEryuOjAzRZc6X+bAY
 cw0z7cgd4XcugwXW69z+fZLrpWX3HtL0rDcHHI+iQcLOAbbnu5B6aUefIghG3fb0ehJu
 eNnAvhwci6QK9YNV0UTwaM28Rt+3PN9I/dN6fesP//3Xq0MI0YFUKL1emed2b1xdEGHf
 4O1UHS9Rjj/bBzLsrhnPhDItcrE+Ki1SJO+oEcCN+f+zc4c5vvdO0QIwtgABDFllYHXr
 t5lw==
X-Gm-Message-State: ACrzQf2TlsNR4kB5j/CdwYkvvB2/G3U0Yv4WV+sRwjt5Dadu1binoB9S
 XSiSpFlBplp6IfnAnswe4OQ=
X-Google-Smtp-Source: AMsMyM7UC3/oNqnph3nSeYOOVc5PuuzRDRCA5nbPwt+QSzHdDSV8Hdr5IEGTgl1dGeIk2PINp2SXZw==
X-Received: by 2002:a05:6870:e3d1:b0:13c:9dbb:7e95 with SMTP id
 y17-20020a056870e3d100b0013c9dbb7e95mr16902806oad.43.1667435604778; 
 Wed, 02 Nov 2022 17:33:24 -0700 (PDT)
Received: from [192.168.10.102] ([177.189.35.250])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a4acb07000000b00494ed04f500sm4987440ooq.27.2022.11.02.17.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 17:33:24 -0700 (PDT)
Message-ID: <72e7c23d-5a07-8d51-2bdb-cf957b84ac2f@gmail.com>
Date: Wed, 2 Nov 2022 21:33:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 0/3] ppc/e500: Add support for eSDHC
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
References: <20221101222934.52444-1-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221101222934.52444-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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



On 11/1/22 19:29, Philippe Mathieu-Daudé wrote:
> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
> as an 'UNIMP' region. See v4 cover here:
> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/
> 
> Since v5:
> - Rebased (ppc-next merged)
> - Properly handle big-endian
> 
> Since v4:
> - Do not rename ESDHC_* definitions to USDHC_*
> - Do not modify SDHCIState structure
> 
> Supersedes: <20221031115402.91912-1-philmd@linaro.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-8.0 (since we missed the
freeze for 7.2).


BTW, checkpatch complained about this line being too long (83 chars):


3/3 Checking commit bc7b8cc88560 (hw/ppc/e500: Add Freescale eSDHC to e500plat)
WARNING: line over 80 characters
#150: FILE: hw/ppc/e500.c:1024:
+                                    pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,


The code except is this:

     if (pmc->has_esdhc) {
         create_unimplemented_device("esdhc",
                                     pmc->ccsrbar_base + MPC85XX_ESDHC_REGS_OFFSET,
                                     MPC85XX_ESDHC_REGS_SIZE);


To get rid of the warning we would need to make a python-esque identation (line
break after "(" ) or create a new variable to hold the sum. Both seems overkill
so I'll ignore the warning. Phil is welcome to re-send if he thinks it's worth
it.


And I'll follow it up with my usual plea in these cases: can we move the line size
warning to 100 chars? For QEMU 8.0? Pretty please?


Daniel


> 
> Philippe Mathieu-Daudé (3):
>    hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
>    hw/sd/sdhci: Support big endian SD host controller interfaces
>    hw/ppc/e500: Add Freescale eSDHC to e500plat
> 
>   docs/system/ppc/ppce500.rst | 13 ++++++++++
>   hw/ppc/Kconfig              |  2 ++
>   hw/ppc/e500.c               | 48 ++++++++++++++++++++++++++++++++++++-
>   hw/ppc/e500.h               |  1 +
>   hw/ppc/e500plat.c           |  1 +
>   hw/sd/sdhci-internal.h      |  1 +
>   hw/sd/sdhci.c               | 36 +++++++++++++++++++++++++---
>   include/hw/sd/sdhci.h       |  1 +
>   8 files changed, 99 insertions(+), 4 deletions(-)
> 

