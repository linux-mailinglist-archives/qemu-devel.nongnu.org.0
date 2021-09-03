Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A8400267
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:35:48 +0200 (CEST)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBEJ-0002Kx-KY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMB9V-0003WF-3W; Fri, 03 Sep 2021 11:30:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMB9T-00047i-Cb; Fri, 03 Sep 2021 11:30:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id z4so8772241wrr.6;
 Fri, 03 Sep 2021 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6qjVWRrTOIpc0jZBsfpFUw+QNMArij8Cm1GJIvje1tk=;
 b=ohTcHbxUSlEUDSTWiGUsIv7u8gaM7VeAVoIYEGXvrqTLPRwvEHwZaFhfR8k4/gb0ox
 ruK0TnWmpAp2NYFjqy+tuxXVIv+upu3juPfOVBgY17x8ohmbZ3gt7wda+gr+svzI49DE
 hM5Zc81cslKXIVuUuOGpOcntzKbYIvc1G/WDYH2Pv0GYT0PKZbiAsOIbaXpnVA24OPPa
 z09vm8hA7Eu/wPDoEPVM3wG9bEx2dcpMpcYiAt6/tSRpKCMBFzrnnDQmYPwcOu9Zam61
 CJOUYo5he3UDXPomKfYfm/hTm811FONEjLcJiJwH2cuqwswofx4J6BS3ZqMD5GUodlAt
 XpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6qjVWRrTOIpc0jZBsfpFUw+QNMArij8Cm1GJIvje1tk=;
 b=etqpTHONMfbDlUUMrLMhtBfwjZwRl0sY+C8yoWEDEtfr/E3tJ9PHCLjalplKjVpNsU
 UgkSgO7uBc7CnQkky2A2EPDGXo8z6i0CAQM87ZZP+YnKhaQGQVYrlbqHujKTb0NbOCzL
 khyZnaUG0FslyLUadlceNM6ysili8K3vU12sJJTWINHxbjYbm9fjJwdv8qAyQkBSyM1d
 0BhPoiLZ/nETOLELq6eIWoSx5FMOH/kQvixDb9Q3ks51Sng5XljZSNZxpOkK4Nk3Od7t
 biPBG2d2t/dMuV0VK+5kTlFB+1kEgn4q+CZQhJwDzfC4Tplj9SPQw3lxAFjm2h/mWwj7
 lGcQ==
X-Gm-Message-State: AOAM5314N5OQGETbQhvmc+GmRvVDn1bzg+rTb9to9CH6uGAwh+oVx6/m
 K3jjn7i4sU236kF1Sm5wvhlZHoupyHQ=
X-Google-Smtp-Source: ABdhPJwImiDNdU5AYQxye0xWCAi5vmxx5UDxTYeaME2q33h56T1UoYPfjzUyVtKi6LpOm/Wed65iKg==
X-Received: by 2002:adf:80eb:: with SMTP id 98mr4819453wrl.370.1630683045053; 
 Fri, 03 Sep 2021 08:30:45 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d145sm4529446wmd.3.2021.09.03.08.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:30:44 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add Fuji machine type
To: pdel@fb.com
References: <20210903082027.704397-1-pdel@fb.com>
 <20210903082027.704397-2-pdel@fb.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7dc54057-0303-6c68-041a-2bcc60e93e6a@amsat.org>
Date: Fri, 3 Sep 2021 10:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903082027.704397-2-pdel@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) DATE_IN_PAST_06_12=1.543, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, patrick@stwcx.xyz, qemu-arm@nongnu.org, clg@kaod.org,
 joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 10:20 AM, pdel@fb.com wrote:
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

Please don't bury this in the mainstream repository, since the
commit description might be read and tested during years.

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
> ---
>  hw/arm/aspeed.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)

