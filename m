Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B698E40071F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:51:40 +0200 (CEST)
Received: from localhost ([::1]:48196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG9z-0007UH-Pe
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMFyG-0001fL-F5; Fri, 03 Sep 2021 16:39:32 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMFyE-0007xp-Pk; Fri, 03 Sep 2021 16:39:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g18so356817wrc.11;
 Fri, 03 Sep 2021 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FSC52cfTSIfXDGRWYhYTacJxpB23J3QvzHWPVbQlWfk=;
 b=AAyk3XqOhZC3s4vKXaFGW+r4VzefUAMUf8IbKBF+dkMkaHFgTCuqaEF6Yr/MgrdGz6
 mGFAxUikoZardlHq2GZDyjgA6mTMS2J8y8RDdNFe6d0xBCjyxg13bqmMiXOLdI13Sh3W
 Sqgxemhia5ail/s02c+RwdwNbBHaWV2C+fW6yh0pe+vsHkHeXAxGvf6E1NyAGPO3lftW
 7jkT0sIw1LbhCE8QwaOp1tlfXpPG/PlFeMrufmSD8GHPxaML4ox+yyIV5UN2LhWthzWy
 bcBQHLMizUOFUxsmYok2AhOaQXMYaEQMucvVFOjIPV4S2IQ7Ku3rB0QbNlDVFtUyN36V
 rreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FSC52cfTSIfXDGRWYhYTacJxpB23J3QvzHWPVbQlWfk=;
 b=bke7LMSivYmjs5hL61mmvf+tU1X8dsMLQZL2seR0UYgfxV61yQy9ps2Ljq9p+k2dPI
 Wg4XA5KdOGPEcGQgaTuaKKghrnSI4UtKPv/VFamSFH5tTggBZRO0GHmP6jOuoFImJ7PG
 6Ha13Odnu8o9oGDB/vzXZumsYuKdKxRvU7qADD0Pg9SHhGYeXFR0+u8mg9Od21lxXb0G
 s0ve9p6R9umQDI/hYLM5Mi/B2pdHTHtpGs9md7I8IDRt7pRnlRIoAL7D90SK4iZ8wNS2
 8/tWPVoJcAQgINC3F92Yx/6F8SuH2hHgaRUxT0FY5x6JPwaG8OVag3ITvH4uS18C0Sdb
 fIhw==
X-Gm-Message-State: AOAM533qTMMXOOW98UPTiqc8HkLPEr2r189msAmgRZZLr0lNTGltQeNf
 66ezlXmsHUUdOrM2T8BPS2c=
X-Google-Smtp-Source: ABdhPJxnVJC0pLukgB8iqzE0sk2LbQHt1+xKlUmf5yW69LrVf24+bxqoMhx1IhvlAtAsNjuRna05TQ==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr893540wrv.402.1630701569255;
 Fri, 03 Sep 2021 13:39:29 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m30sm284571wrb.3.2021.09.03.13.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:39:28 -0700 (PDT)
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210903194108.131403-1-clg@kaod.org>
 <20210903194108.131403-15-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b71cadd6-779e-f89d-5122-a1db2f43bbc3@amsat.org>
Date: Fri, 3 Sep 2021 22:39:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903194108.131403-15-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 9:41 PM, Cédric Le Goater wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This adds a new machine type "fuji-bmc" based on the following device tree:
> 
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
> 
> Most of the i2c devices are not there, they're added here:
> 
> https://github.com/facebook/openbmc/blob/helium/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh
> 
> I tested this by building a Fuji image from Facebook's OpenBMC repo,
> booting, and ssh'ing from host-to-guest.
> 
> git clone https://github.com/facebook/openbmc
> cd openbmc
> ./sync_yocto.sh
> source openbmc-init-build-env fuji build-fuji
> bitbake fuji-image
> dd if=/dev/zero of=/tmp/fuji.mtd bs=1M count=128
> dd if=./tmp/deploy/images/fuji/flash-fuji of=/tmp/fuji.mtd \
>     bs=1k conv=notrunc
> 
> git clone --branch aspeed-next https://github.com/peterdelevoryas/qemu

I made a comment on this line:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg01064.html

> cd qemu
> ./configure --target-list=arm-softmmu --disable-vnc
> make -j $(nproc)
> ./build/arm-softmmu/qemu-system-arm \
>     -machine fuji-bmc \
>     -drive file=/tmp/fuji.mtd,format=raw,if=mtd \
>     -serial stdio \
>     -nic user,hostfwd=::2222-:22
> sshpass -p 0penBmc ssh root@localhost -p 2222
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> [ clg: checkpatch fixes ]
> Message-Id: <20210903082027.704397-2-pdel@fb.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)

