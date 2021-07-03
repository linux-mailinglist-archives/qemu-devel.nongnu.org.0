Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CF3BA7CF
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 10:42:42 +0200 (CEST)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzbEX-0001Tp-2k
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 04:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzbDg-0000gZ-JF; Sat, 03 Jul 2021 04:41:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzbDe-00078C-SS; Sat, 03 Jul 2021 04:41:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i94so15458185wri.4;
 Sat, 03 Jul 2021 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VyuJAMU0VqR7rM8NOxMI2ejwVrFx6et7EOBukDoDuX0=;
 b=s91R+OEFSFQfGCS4K3nHSB8EVzxm+XYpYF+Xd0eQcnMaK8uqoVXgboIzvkGGuEOipC
 8L1Z4LNbOTtxxOu4nGwLaFtqHP6nD2DJpZR4QrsZ8T592Ar6FHDkQTKXUGTy8SOFGStD
 C4vhEoF7GAxjxfFqkFdNcj/N67xiiqzh3CXghYeL2IOQSUEkqfA8AX9p3vbgm7OK7Ddh
 iMtavyEvzfi0h7XvtQUE9jfj/F3FlIPnPFFbXix4GVr5vnWqCartPDLvFb4RwcZAsyXz
 4N4RRyVc3ALPDPC6mBxxQEaeJOPHSJALUN2mEk6BA9eiYqOSXq1ZasffF3zyZXF5SfzT
 jmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VyuJAMU0VqR7rM8NOxMI2ejwVrFx6et7EOBukDoDuX0=;
 b=rJvqNfGmA6vy/syBFyUlHZSdsnGkqxOGy28M57rpphbqNB+kYBITj9c7aJ00M6Dyg1
 AvnOWf/pzzfsCZyx88UYxdb8tizmrlTBfGAx9hlTcFT6uvUcdj3aaqthrIotHgYXPSMP
 woLXoW4MXtqUrTTWhN5cgLRSaBgNbVVtrSQNUgmG9K2XGz6oD/Wn24Vdcw3NXi3w7q2e
 14QICvGIHuReeYRdtsaCuJFKZGPF6c34VL1QxkfA41O94vyT9IHlKzJjbuxiYtinvjWi
 oxlCg6Frea/FyW6VkAkRsef3ud/8ZdRHxYdRX4nknjvRxpRaUCL4mb7TXUayUsUq/yLK
 J+DQ==
X-Gm-Message-State: AOAM532AaykQjJ8x+BDpDOjrIyBJt8UrAP3d5vqZpOttkOZEo9k7uSJx
 qU6KH6TzFNhndrvUichL8tM=
X-Google-Smtp-Source: ABdhPJxtmugf6Vl+vlRcF3sbVwdL/wn69VRGCRklQyOXdVNyYr8EbZRzqDwF70zqZtaoOMuCD2EWWA==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr4123603wry.299.1625301704511; 
 Sat, 03 Jul 2021 01:41:44 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-110-177.mobile.abo.orange.fr.
 [92.184.110.177])
 by smtp.gmail.com with ESMTPSA id f6sm5683531wrs.13.2021.07.03.01.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 01:41:43 -0700 (PDT)
Subject: Re: [PATCH 3/9] tests/acceptance: Tag NetBSD tests as 'os:netbsd'
To: qemu-devel@nongnu.org
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6dc3fe10-924f-9f3d-baea-90e2539f58ee@amsat.org>
Date: Sat, 3 Jul 2021 10:41:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623180021.898286-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Tom Yan <tom.ty89@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC'ing NetBSD maintainers.

On 6/23/21 8:00 PM, Philippe Mathieu-Daudé wrote:
> Avocado allows us to select set of tests using tags.
> When wanting to run all tests using a NetBSD guest OS,
> it is convenient to have them tagged, add the 'os:netbsd'
> tag.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 1 +
>  tests/acceptance/ppc_prep_40p.py       | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index cded547d1d4..20d57c1a8c6 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -862,6 +862,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:orangepi-pc
>          :avocado: tags=device:sd
> +        :avocado: tags=os:netbsd
>          """
>          # This test download a 304MB compressed image and expand it to 2GB
>          deb_url = ('http://snapshot.debian.org/archive/debian/'
> diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
> index 96ba13b8943..2993ee3b078 100644
> --- a/tests/acceptance/ppc_prep_40p.py
> +++ b/tests/acceptance/ppc_prep_40p.py
> @@ -27,6 +27,7 @@ def test_factory_firmware_and_netbsd(self):
>          """
>          :avocado: tags=arch:ppc
>          :avocado: tags=machine:40p
> +        :avocado: tags=os:netbsd
>          :avocado: tags=slowness:high
>          """
>          bios_url = ('http://ftpmirror.your.org/pub/misc/'
> @@ -64,6 +65,7 @@ def test_openbios_and_netbsd(self):
>          """
>          :avocado: tags=arch:ppc
>          :avocado: tags=machine:40p
> +        :avocado: tags=os:netbsd
>          """
>          drive_url = ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/'
>                       'NetBSD-7.1.2-prep.iso')
> 


