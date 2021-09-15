Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7EC40C673
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:31:01 +0200 (CEST)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQV08-0006VT-R3
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUxE-0003C4-H1; Wed, 15 Sep 2021 09:28:00 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUxC-0000T5-PU; Wed, 15 Sep 2021 09:28:00 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MQusJ-1mEaR32tV9-00O0EO; Wed, 15 Sep 2021 15:27:54 +0200
Subject: Re: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
To: John Arbuckle <programmingkidx@gmail.com>
References: <20210901121620.1320-1-programmingkidx@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9c8e7273-6b28-8598-f679-92c467fff06a@vivier.eu>
Date: Wed, 15 Sep 2021 15:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901121620.1320-1-programmingkidx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:t84YECzovwTIM0wNAfY6S46QQjrTFrY/H2AIQbdwbU0P8p+jC3h
 lU3PvE7ldS9jvICbP5XWpEVv7BfY/WshNyfHUqyUfNdq9sR4Xe2ChJzKikyJRBhwDbp3avM
 Ce4sbMvt8OjlfYFz1GMOT/mMKPSOefnQymFgxYQF27MsMKMjEzTcSRwO8lgoDb0c5PJ7R4N
 nTHFQDCkeeiW2H1mRbuxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:afhAxt42Zrs=:c9nRSshTF1VK1s02W8tQcN
 p2/iGAtG+Han9l1N4FeKcD51IZHY/DeAHuFJcluMYW2OnRwPi6qB10ugmCx4ktl9Hv2kgRsn3
 KCtUhuhZPfs0WI9ZYwWQb6cUwv0QPohbsiYywvcSLG0wsffhpUs1iCVYjTjXF8PXQgtsqa/A/
 kgCYuEqNNRfOIvK0fZpCjDu12DlKN4UEScyOsqEEsvMR8iluCYowcEoPWO89/CskXh2onx2lg
 gMKsBXuQ64XFDeRfIk1rLmXrrcD/UqW7D+ZFHepye56x6IgbOi/mkWGNwxgDRoBmhnrAqDJZq
 ypp3w25Kby7mmdzqN8ZD0rQUBYaF467ef0CFyEfuO8FIwQWkJK2AO6vip0pxSqkO6VrxfmvuP
 b3nEe3+kz36b3P7sHnfDWcUkJQNunmL7PyX57CVcxdafDmm9VfmxQGn3qSwtS+1N2mcXj6akI
 m9FwvPryIl946iRtR4QNkxc0dRXSEN8xhSLubzEP6p5X+AqCGpep7PFyTNT40T2rNipceg5M1
 kt0XiYRL2mpQ/7UNuZ6yA1W8JYzJ2uFTRsMJfwwyefQTOyhpmnp/XPCFhvLs8P3YvxEZsoijZ
 H7um37o7XQACoRexk2NLfbXmT247bXPnJenaXHAt0xGmd0AHBtdqL38QFyXsxh53l1i2i2iJr
 rjqNaSAeqZwq2QzWet35dLkepyqx7Y+U/qO/12Vd4PcTaYoSDNpHj4CQokZ63GMet9BFVXJaX
 nxHo+Hx98qS0neXGCJW7IyHcTFM3YgMqYyiSlA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 mjt@tls.msk.ru, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC Mark
CC qemu-devel

Le 01/09/2021 à 14:16, John Arbuckle a écrit :
> Currently the file qemu_vga.ndrv is not copied into the /build/pc-bios folder. This makes all video resolution choices disappear from a PowerPC Mac OS guest. This patch has the qemu_vga.ndrv file copied into the build/pc-bios folder giving users back their video resolution choices.
> 
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
>  configure | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 9a79a004d7..281577e46f 100755
> --- a/configure
> +++ b/configure
> @@ -5056,7 +5056,9 @@ for bios_file in \
>      $source_path/pc-bios/openbios-* \
>      $source_path/pc-bios/u-boot.* \
>      $source_path/pc-bios/edk2-*.fd.bz2 \
> -    $source_path/pc-bios/palcode-*
> +    $source_path/pc-bios/palcode-* \
> +    $source_path/pc-bios/qemu_vga.ndrv
> +
>  do
>      LINKS="$LINKS pc-bios/$(basename $bios_file)"
>  done
> 


