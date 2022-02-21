Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DAC4BDEF7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:49:21 +0100 (CET)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCoK-0003mX-Hg
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:49:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCZR-0006ZS-9P; Mon, 21 Feb 2022 12:33:57 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:52967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCZP-0000xP-2C; Mon, 21 Feb 2022 12:33:56 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mq2Sa-1nzAGy20Nm-00n6yb; Mon, 21 Feb 2022 18:33:50 +0100
Message-ID: <0e043ab9-aa37-14df-8c50-57f88e7332da@vivier.eu>
Date: Mon, 21 Feb 2022 18:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] qemu-options: fix incorrect description for '-drive
 index='
Content-Language: fr
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20220202143422.912070-1-lvivier@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220202143422.912070-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W73+MlIOhlNCuyGtOq7KmRSbvq0+aEUw4D5kDg4FM7Rwe6kgDvP
 NJdpX/hi62j19Y3SjCBzLqck6WwRJv4LDFDDGnfwnFEfF5sbUQCk0UcguPfuCygsLxGr55v
 Qk0h44/77/NXnAQfTffs3Cbi5AbfwTsYLNZqua9AW5qKIQFAlHIYATCnPiBoUHamiwBcTs7
 drN2Zs/Lekf65rnEzICqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+7qsJakQtrs=:zBGEVGRpMduFcePsCyIrO0
 Btnbt9++R3/bEw+W9wINc5kwDKlOCfCcYFqgmXJy0C4aDAKjzGYzC0cqw4s3MqjNUPuk3aMrG
 z9FVJE+b8vigDZ2m6Bvt4umb7Itu4Y85YhPhmsrgLW3P2CaYExfOahEag3oAeD3OWgSGqCLuD
 +e5ZOU45d0CxBtUKomEZRYQBQyAxgVfwp5zVIP+ovKazcU1WL5NsPL5tl+1FBlSVwfw22HCm6
 fUJSPxABmkNpGJoioaaOLrAZ7NAsV3Gd4UUVslO6NiRYhz11Zrd1bSJQhr5h2LJpoSz7uMX10
 hXlTivG2oyQKYFA0hhtBgNAXHXH5ffD58CsF685OqAJU3hwe3RTsTxd3SlBd6KXNHSf+nhTLp
 87kiB8YH09kQqQ+yjV0BiCY4QvRFpprKvyptUyg0zgU3vlSBBJaoV4KjfpdLOww3vnAVgHX4Z
 xHZ+bmlUJdb7AZ15IdrdNqjvaCfaHLjiY+MqEw1MJnW4OF0qw+0L8Hgm4F5bx8mSaQvk8YzOt
 3Yn3ADWRmB8RBDDke5ItLVCa1IBt97dWLI9MT/+A+Q3C9IyhYlRqNBZWl5Ty9VtFPRVnrMgFQ
 qfAS0ygXTYtg7wVWfSvLWkZ4C4PF046XNssI0n0SrT6jnxoqhGSD2AYOsUIxKRQoe0z0nTXVE
 ITV0TkH8VaQr72cGUQZ+yfDVzkVfbM79j2p0ilWQzIWQyyNdQx6J7bFIduUzZOFABb8I=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/02/2022 à 15:34, Laurent Vivier a écrit :
> qemu-options.hx contains grammar that a native English-speaking
> person would never use.
> 
> Replace "This option defines where is connected the drive" by
> "This option defines where the drive is connected".
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/853
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ba3ae6a42aa3..094a6c1d7c28 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1377,7 +1377,7 @@ SRST
>           the bus number and the unit id.
>   
>       ``index=index``
> -        This option defines where is connected the drive by using an
> +        This option defines where the drive is connected by using an
>           index in the list of available connectors of a given interface
>           type.
>   

Applied to my trivial-patches branch.

Thanks,
Laurent


