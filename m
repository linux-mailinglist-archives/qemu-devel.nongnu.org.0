Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1623E09B0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:56:49 +0200 (CEST)
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNwW-00063x-Vu
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBNuu-0004vW-2x; Wed, 04 Aug 2021 16:55:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBNur-0003Re-Ja; Wed, 04 Aug 2021 16:55:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id p5so3669179wro.7;
 Wed, 04 Aug 2021 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iw7cKx9+VBTijDgp2fFG8zAtmwUud6IQbwKLh0PvOw4=;
 b=J14R3xKhXEhYrzF5bpdFNSpzVP812fu2iGP9gh0W2+l7fydG2ZWrL5OlcdRCcDCEzs
 yYkgzbF9HG+NUyeKUxv/DO99/qm+zGMoYZXjADnfQuJErfj0HG56wm+CL2OcvrkFyVkR
 beqx9bJXBfFrgoG7DrLuSK9PZlFhla0DUB1mti/TqjvODC+xK94cIZzg4PE/6yCni1Z8
 ecCN+sLlbWcc2ZwND0xSEjO+yn6Qh8Gd10EB/ZCnj8QRD93SkOY7y+eGuVQts2Eedf9d
 YobZ/n0uMBfS+1n2THwOh3Q2kw6esWARuDdbEYwUrdvqWJUy8oZV+UilmVePACgl/BUI
 YE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iw7cKx9+VBTijDgp2fFG8zAtmwUud6IQbwKLh0PvOw4=;
 b=gwyIOukydc5McvAB9LSh+qeWC43wlvTtajKN2KHFvZN9szfkpJiiEs2erTU0wIswae
 LLRmuEcuXWnruWmaG7thjhEqEoQD6+T74P3CLywEXBcKpUWaoSAion/WXr8TLzVhNUGI
 FMuZi+dK/ou0Q1D6rifZVpn7llsnWlqZ7BeKAHM3XWBSxVPm+2CmhJsxwWYVeoJ86waq
 yZy3b7H7cw9gVLWP39u52JJt8+gW9ChI5DcSbn2kPtM0DVCeRC5ESh5c56pCjKiuOFyj
 wBIgGgpkpXLqYIKb3sKbYuPwfuqZHjGtFSZPFYep6Pmw0/MG5z+4jfts78LA8LPm9cOi
 Eftw==
X-Gm-Message-State: AOAM532QxfiHiq/9COoEgGIGnf9vfp9/BaYzOfpdMphuIxGm+w2bVlLe
 VBuYinsJe6vHVw4oxslVcq8=
X-Google-Smtp-Source: ABdhPJy1FOTttev6gXb6efsPeNy+tfavUH4eo24LkbMzNG69EIwf/P7cWYI1VWPJDp8+FofvT7CzxA==
X-Received: by 2002:adf:ea52:: with SMTP id j18mr1226154wrn.294.1628110502478; 
 Wed, 04 Aug 2021 13:55:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id x16sm3844503wru.40.2021.08.04.13.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:55:01 -0700 (PDT)
Subject: Re: [PATCH 5/9] tests/acceptance: Use image_expand() in
 test_arm_orangepi_uboot_netbsd9
To: qemu-devel@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1507c8d3-e7ae-6dc4-2bb0-3b212f32edbf@amsat.org>
Date: Wed, 4 Aug 2021 22:54:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623180021.898286-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.132,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Niek,

On 6/23/21 8:00 PM, Philippe Mathieu-Daudé wrote:
> The NetBSD OrangePi image must be at least 2GiB, not less.
> Expand the SD card image to this size before using it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 61069f0064f..b10f7257503 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -868,7 +868,12 @@ def test_arm_orangepi_uboot_netbsd9(self):
>          :avocado: tags=device:sd
>          :avocado: tags=os:netbsd
>          """
> -        # This test download a 304MB compressed image and expand it to 2GB
> +        # This test download a 304MB compressed image and expand it to 2GB,
> +        # which is the minimum card size required by the NetBSD installer:
> +        # https://wiki.netbsd.org/ports/evbarm/raspberry_pi/#index7h2
> +        # "A 2 GB card is the smallest workable size that the installation
> +        # image will fit on."

Do you agree with this comment and the one in the next patch?

> +        NETBSD_SDCARD_MINSIZE = 2 * 1024 * 1024 * 1024
>          deb_url = ('http://snapshot.debian.org/archive/debian/'
>                     '20200108T145233Z/pool/main/u/u-boot/'
>                     'u-boot-sunxi_2020.01%2Bdfsg-1_armhf.deb')
> @@ -886,7 +891,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
>          image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash)
>          image_path = os.path.join(self.workdir, 'armv7.img')
>          archive.gzip_uncompress(image_path_gz, image_path)
> -        image_pow2ceil_expand(image_path)
> +        image_expand(image_path, NETBSD_SDCARD_MINSIZE)
>          image_drive_args = 'if=sd,format=raw,snapshot=on,file=' + image_path
>  
>          # dd if=u-boot-sunxi-with-spl.bin of=armv7.img bs=1K seek=8 conv=notrunc
> 


