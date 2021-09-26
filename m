Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E890418740
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 10:02:20 +0200 (CEST)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUP72-0005uh-Ty
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 04:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUP4h-0004f2-KF
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:59:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUP4f-0006Gt-VZ
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:59:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so41203633wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=YRh7BdHpG10+BMnIaaVJeA3oOJMus5lCdg2+yQ2Xdlk=;
 b=P+oFcpBZtL1x4XlwoIvLgfqbCphRXTt3om7RWvnjIYiEIiQqds0/ERww6YOH+0EJ1O
 28pREnE9qpRRaLZc4WKy3GLWnP0V94Jzzx4vtNYg95elF6thrDZMI18GzfrFnOTY54fv
 iI1QJ62XhPB8RuVEJbR1Bim2vNRbV+ur9m2ntqygqvCZfIBf0Fmr/DCf6yBsG3A29emj
 Vg8G5Xv1zHxO1TzUTSUo5w4ritKF8tn1QKZ3EJmnZwKGYVGW/LwKqCEOXAYXMVsBpkOk
 Z9J4aDfIQPgAzazfKA71USVf+q7nDq0PHMpCvHL4ASS8efNITsfDbexEMa/TZPJT6M2A
 xqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=YRh7BdHpG10+BMnIaaVJeA3oOJMus5lCdg2+yQ2Xdlk=;
 b=FfRFUSHURTNLn//RZ9uDOXH4jeUHMdpKmkYLqomlgXDMdMYKL7RHvH+jiopuHHlICb
 ee4WOOiKJDdF8tI4tnlywQ6LiB4smtULKIR8mCCYwXgQe/jHIvte/kSkeONX6E3B/SgV
 TdJWyMqh1xv9qGVbjfxSVQD6mPFWQuesj96ATdlVHn78LIKQ6y10uKRRXBlMBclN3SL6
 P3AqJWyN1NV5iuRrCtkfjqxB+49ND2xQRsAfEn9v9Yid6fIbyEkJxn/YS3FjRBm0j4Hf
 nzsIfMGvRMzjt134hzXiYReXaEY8Q7x0vs1K/3i/XMv4c/3lixZJf4WIuyqJhCRvBNIq
 CJ7A==
X-Gm-Message-State: AOAM532fzDud9bT5And/MELAJAh39ik+tVa02q0DP08FOMey/vqmS6Qy
 uIWJa57bgMN4vOWuhbBb9Rw=
X-Google-Smtp-Source: ABdhPJzHjAg2Vh+Rg0YZ3dAP+a1sTAk5YDtoEJ+x/nOqfgsTQyTNCN8+VodBGvKkC4jdOsmd2xfnrg==
X-Received: by 2002:a05:6000:c3:: with SMTP id
 q3mr20646316wrx.361.1632643188534; 
 Sun, 26 Sep 2021 00:59:48 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i203sm17541516wma.7.2021.09.26.00.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 00:59:48 -0700 (PDT)
Message-ID: <38e08d56-00b2-8759-a729-4bb6a26e6cdd@amsat.org>
Date: Sun, 26 Sep 2021 09:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Content-Language: en-US
To: Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <SJ0PR20MB3643750F8FF71E838A750F9B9DA59@SJ0PR20MB3643.namprd20.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <SJ0PR20MB3643750F8FF71E838A750F9B9DA59@SJ0PR20MB3643.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/25/21 19:07, Shitalkumar Gandhi via wrote:
> Hi,
> 
> I am attaching a patch that will fix eMMC image booting on QEMU for
> AST2600 machine, without this patch it will be stuck after SPL saying,
> "booting from RAM".
> 
> Please review and merge, thanks.
> 
> Let me know in case of any concern.

Thanks for your patch.

Please look at how to submit patches here:
https://wiki.qemu.org/Contribute/SubmitAPatch#Submitting_your_Patches

> This patch has been added to boot eMMC image for AST2600 machine on
> QEMU.
>
> Run quemu as follows:
>
> ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
> file=mmc-evb-ast2600.img,format=raw,if=sd,index=2

What is index=2?

Is this mmc-evb-ast2600.img image publicly available?

> Tested: Booted AST2600 eMMC image on QEMU.
> Suggested-by:  <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20210416162426.3217033-1-venture@google.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ba5f1dc5af..6a890adb83 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -148,7 +148,7 @@ struct AspeedMachineState {
>          SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>
>  /* AST2600 evb hardware value */
> -#define AST2600_EVB_HW_STRAP1 0x000000C0
> +#define AST2600_EVB_HW_STRAP1 (0x000000C0 |
AST26500_HW_STRAP_BOOT_SRC_EMMC)

IIUC you are not implementing any eMMC code, simply faking the
controller can support eMMC, but the card is used in SD mode?

I'm surprised your guest is happy and boot that. If so, then
what is the point of announcing eMMC is supported if not used?

Regards,

Phil.

>  #define AST2600_EVB_HW_STRAP2 0x00000003
>
>  /* Tacoma hardware value */
> --
>

