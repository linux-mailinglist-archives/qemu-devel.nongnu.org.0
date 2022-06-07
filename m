Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2253FC7B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:55:19 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWrg-00083b-Lk
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyW6Y-0001Rw-FF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:06:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyW6V-00070Q-Eo
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:06:29 -0400
Received: by mail-pf1-x435.google.com with SMTP id p8so15112971pfh.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ogDqkHA+XlFISxheyqYBn6UDl1KPFpYwCOAjWY/tlnc=;
 b=JjN20Rkg/9F8kCo23qLGGMqV2zNSmEvniStGUpvcRpdzTYIP9AxuIRc9pZE3jqM5c/
 OZHVMRYZrNgheeYMQRvP02AN8KQd/yJIGVvcOxR6eHFdadO0MqVFnPqyhp5BZgkb7fnN
 DpPdcBbxiKIhe/nnAivzhMNR+0F2QM31qVCup3OSgnwZPLMMlZ6urnzgLrqiyJErhaE+
 pyHDOhd0iAtnukzjxcNb9GJpGDJ+DKnoGU5pOIPqpWgHenVqd3PL8kGw/Lq/EfeWwc4V
 abiKy//UHLPW48ZaSjUfaa2HlNYt+2iIOwY36sefokrg9XoOvSyZY3MN42DK0N7IYFft
 5GOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ogDqkHA+XlFISxheyqYBn6UDl1KPFpYwCOAjWY/tlnc=;
 b=i2VwUFRZ/hwHWBRN1ayZO53a8UF/6UNBOcZ033Gnr306ncNkOIIjKx/J0/u7XFFkaE
 /uf7ApOH7SBsWKxNZvearNwYLVFLqq0UeC+ZV9WHIPqhU4E1dnba+H5x9cs9hDMFmqjw
 7Gwrsm9dHua4ah0aktl0OXdYFm4JRwFiV871xS/Ywq5fROwd9jOlvR7ZviJtiUx9hNyV
 YROa8/AT1irOtdr5yOC0W8WRj8/McZiLl9hzqF3Luic3D4E4/nVbDK4/BnUpzIoIbkXA
 Br9HQfQIVYE1rZGQHE9w3NSXIqUK3ytm+pkx/wriuaJKSvxuwoc7p0YVZwiY4G8d3y2C
 /0+Q==
X-Gm-Message-State: AOAM532RJzR6yTeZ0YZLXztYXmljPKMvNG6XRH2Y9wJc4XsIXHX2n9cF
 0TkwLyqdTaK7/3EDvyBnWCc=
X-Google-Smtp-Source: ABdhPJzSnB9lq4lXVBpBwWSKwbc99AWWDsjyVyTrSH/TU+2Ay/TcviN2OQoNTPUCTG9Ma/NSdy2iTg==
X-Received: by 2002:a65:4501:0:b0:3fc:4895:283b with SMTP id
 n1-20020a654501000000b003fc4895283bmr24884395pgq.231.1654596385655; 
 Tue, 07 Jun 2022 03:06:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ji18-20020a170903325200b001678dcb4c5asm1807670plb.100.2022.06.07.03.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:06:25 -0700 (PDT)
Message-ID: <f6070873-afab-f54a-057f-0e86a6c63cd5@amsat.org>
Date: Tue, 7 Jun 2022 12:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] avocado/boot_linux_console.py: Update ast2600 test
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220607011938.1676459-1-joel@jms.id.au>
In-Reply-To: <20220607011938.1676459-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/6/22 03:19, Joel Stanley wrote:
> Update the test_arm_ast2600_debian test to
> 
>   - the latest Debian kernel
>   - use the Rainier machine instead of Tacoma

Why can't we keep both?

> Both of which contains support for more hardware and thus exercises more
> of the hardware Qemu models.

"QEMU"

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   tests/avocado/boot_linux_console.py | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 6b1533c17c8b..477b9b887754 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -1046,18 +1046,18 @@ def test_arm_vexpressa9(self):
>       def test_arm_ast2600_debian(self):
>           """
>           :avocado: tags=arch:arm
> -        :avocado: tags=machine:tacoma-bmc
> +        :avocado: tags=machine:rainier-bmc
>           """
>           deb_url = ('http://snapshot.debian.org/archive/debian/'
> -                   '20210302T203551Z/'
> +                   '20220606T211338Z/'
>                      'pool/main/l/linux/'
> -                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
> -        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
> +                   'linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb')
> +        deb_hash = '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f660c8abe4dcdc0e'
>           deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
>                                       algorithm='sha256')
> -        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
> +        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.17.0-2-armmp')
>           dtb_path = self.extract_from_deb(deb_path,
> -                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
> +                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rainier.dtb')
>   
>           self.vm.set_console()
>           self.vm.add_args('-kernel', kernel_path,


