Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50DB482CBD
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 21:58:39 +0100 (CET)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n47w6-0002CQ-Ig
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 15:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n47uq-0001Q0-Dc; Sun, 02 Jan 2022 15:57:20 -0500
Received: from [2a00:1450:4864:20::432] (port=34320
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n47uo-0005La-AA; Sun, 02 Jan 2022 15:57:20 -0500
Received: by mail-wr1-x432.google.com with SMTP id s1so66504506wrg.1;
 Sun, 02 Jan 2022 12:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=umm/5+Wu6oMls5tZiZay6ebKUYbgdNSnoLvBnbhiaWI=;
 b=QVvZ7yU8GMIy/wcLEm2wff9H9uiqYDXu/K5r+hUaco2uOlO9DKqrBp+yisd4pK4tjU
 LLH4dMCEUxIAQGxXDN2z0N49wthB4eWebrs764RswL3sqb97yL0/Sfb5O4eKOWwKX2xR
 N+v8cqLYHXvocE//UKIbyEhTK4Ldblot6RrB9Rx0iEer6olNfRyozCllAvHuzPsrbCKL
 uIY7K3D9NmpoGw/Y+CBp0J91bz70kEKB1H/V12mMnw6lEJhKXANoH8TlRTwRZsKaKBaL
 Q1fDrbpF60xEU3l0NTdC8jTZ0mNB6brOH4xgbjXy9bSWA/A1NBRa7UoFAWPZc70w8VeW
 TaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=umm/5+Wu6oMls5tZiZay6ebKUYbgdNSnoLvBnbhiaWI=;
 b=YrYUbQq6ZPDYcIUzHVZaaUq5hbC6tU5tulCLuGWCWps6k+kVQ7EjJ6yMxXhIKzVSPF
 bTllxDkyOYr7A0SDgBeiGcDu/S4korBku/E21u7I6GHTnfnkWw87QVP504sSu89g1LzK
 9z3SFAu2cfk5scAcVr+yr06xh7S6UZv923qoBqJ4xWp0LbS17gpeNqUsZpHAzGJQZqKz
 kAuzqGA3aQz96JBWmzwBpH34Uf7KQNzX74dnHCmcK4utkT+BU5VYzHskxgDz4FtfflGT
 SucxtwZgFLD4rZdIVlWmZadu42280GMhn8C/yyDrBqsBibXAstISCxJWe744+meiRLix
 H2dg==
X-Gm-Message-State: AOAM532oYfSAX4LF7czepGdQ1ki+zD06/r/66WnokU9f7QHR8/0vhIaM
 LxCfhckaPR6ba4FbbQw2DYw=
X-Google-Smtp-Source: ABdhPJwDRCrmPVkIgSmni8h2E3qXiS1ZhIw7wzof9ee4C6czi04EcWI8ObCzRMyedqtIdXHM6Lvjzw==
X-Received: by 2002:a05:6000:1684:: with SMTP id
 y4mr35152283wrd.26.1641157035851; 
 Sun, 02 Jan 2022 12:57:15 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id c8sm34750240wmq.34.2022.01.02.12.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jan 2022 12:57:15 -0800 (PST)
Message-ID: <99e369be-ac50-5076-ee32-27576040806a@amsat.org>
Date: Sun, 2 Jan 2022 21:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] hw/sd: Add SDHC support for SD card SPI-mode
Content-Language: en-US
To: frank.chang@sifive.com, qemu-devel@nongnu.org
References: <20211228125719.14712-1-frank.chang@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211228125719.14712-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>,
 Alexander Bulekov <alxndr@bu.edu>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 13:57, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> In SPI-mode, SD card's OCR register: Card Capacity Status (CCS) bit
> is not set to 1 correclty when the assigned SD image size is larger
> than 2GB (SDHC). This will cause the SD card to be indentified as SDSC
> incorrectly. CCS bit should be set to 1 if we are using SDHC.
> 
> Also, as there's no power up emulation in SPI-mode.
> The OCR register: Card power up status bit bit (busy) should also
> be set to 1 when reset. (busy bit is set to LOW if the card has not
> finished the power up routine.)
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)

Thanks, queued to sdmmc-next.

