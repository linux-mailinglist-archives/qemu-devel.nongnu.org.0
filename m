Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD0475663
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:29:38 +0100 (CET)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRXV-0006dV-6r
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:29:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRSs-0000jg-M6; Wed, 15 Dec 2021 05:24:50 -0500
Received: from [2a00:1450:4864:20::335] (port=43581
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRSq-00062D-VP; Wed, 15 Dec 2021 05:24:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so15600278wmc.2; 
 Wed, 15 Dec 2021 02:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8l9DEKZEeBSB3HzgDS7e/xqnm2n2oYtGvqgXIqm6dPU=;
 b=Y5Ftyt9JKwhcHR/i+0gJDq6PRL56pxz7k6FN/r+FruVyMNR+gQxYzoa1SXrbwfusVr
 gW4L5TE0EPLdu+ayXFjYelE+khWnm4T5Uj4H4Z5kZPOFbfnDkWFtFahUSOt2TVjjg/iW
 y8CVhhBjntW/AunKMCksTItEhe7FmdJQWgvEzN99WCP91bBcI34inRHWdTCzhVSCMLcW
 cuYhCKRLTO9lEH6Mpncp3VZsAtD+g6PLF1MY783HksYl9Fsut2izF5c+wfKy+U1jS0CR
 N5Ouh9elqeSY8SZcKOGIHln9MyV1NCyEB577stA8LytCM3UyYELgarE4ofSInC4z57IH
 FuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8l9DEKZEeBSB3HzgDS7e/xqnm2n2oYtGvqgXIqm6dPU=;
 b=BOS0M7Nt2Nta8ZEaNmGizNdtZnZbI+x6k2LGEF4rfzESPjAYYmxrJ+LOXcP5HZxxpZ
 zvREAadLbJ9/MkPEnbfXkhzSez6P5vLNdvqLopwy2znZwP4X+cWxgqmWlQ68H30CE7Ks
 c/9ERmnCuLseAaixMeYVpt+MiO0nt7EIwaloKqymwhUUWz+0X3yfFQAVvmkCwaWqFDsI
 lCTSC2kITiSrFS/oVv2KZNhcbL0Qe9ioeiht4RHIteFPciJYRrC8rKdW2S4GDGfVNWFG
 w6yNPtdxNc97RhO8vTtjIsSWKQp9ajp4cA+oa5DRhLY0FMMiPiZoNNWPbOdCEGhhKIgJ
 looQ==
X-Gm-Message-State: AOAM533pq5vyJo9USltCkPPfF/DylkNdEGj5lUDX3ZhkHc7UPZgamV1X
 wEI4IsYTbQmpQZlaYJrglw/GYE6sgX4=
X-Google-Smtp-Source: ABdhPJzc1At7Vt2AVvfpir/btkWzGI2o2dB6O/X9yPdd6BfcEv26QCe10wHALHz84yHYpV2BGyRcDA==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr1175262wmb.38.1639563886092; 
 Wed, 15 Dec 2021 02:24:46 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id i17sm1577005wmq.48.2021.12.15.02.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:24:45 -0800 (PST)
Message-ID: <60230067-bf75-0352-d5d6-93529c03aa24@amsat.org>
Date: Wed, 15 Dec 2021 11:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/net/allwinner_emac: Replace MII_ANAR_TX ->
 MII_ANLPAR_TX definition
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211122105145.1053455-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211122105145.1053455-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On 11/22/21 11:51, Philippe Mathieu-Daudé wrote:
> While both MII_ANAR_TX / MII_ANLPAR_TX have the same value,
> the ANAR and ANLPAR registers are different, so technically
> the ANLPAR register have to use the MII_ANLPAR_TX definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/net/allwinner_emac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
> index ddddf35c45d..3aed92b8f1a 100644
> --- a/hw/net/allwinner_emac.c
> +++ b/hw/net/allwinner_emac.c
> @@ -50,7 +50,7 @@ static void mii_reset(RTL8201CPState *mii, bool link_ok)
>                  MII_BMSR_10T_HD | MII_BMSR_MFPS | MII_BMSR_AUTONEG;
>      mii->anar = MII_ANAR_TXFD | MII_ANAR_TX | MII_ANAR_10FD | MII_ANAR_10 |
>                  MII_ANAR_CSMACD;
> -    mii->anlpar = MII_ANAR_TX;
> +    mii->anlpar = MII_ANLPAR_TX;
>  
>      mii_set_link(mii, link_ok);
>  }
> 

