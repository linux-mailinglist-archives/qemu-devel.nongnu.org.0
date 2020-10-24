Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B832297CCD
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 16:27:08 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWKVe-0006pb-IC
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 10:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1kWGsl-00023B-BL
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 06:34:44 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:53783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1kWGsh-0005I6-Jj
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 06:34:43 -0400
X-Originating-IP: 82.252.129.128
Received: from [192.168.1.155] (lns-bzn-59-82-252-129-128.adsl.proxad.net
 [82.252.129.128]) (Authenticated sender: jcd@tribudubois.net)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9AD231BF206;
 Sat, 24 Oct 2020 10:34:33 +0000 (UTC)
Subject: Re: [RFC PATCH] contrib/gitdm: Add more individual contributors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20201004182506.2038515-1-f4bug@amsat.org>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <551cb720-ed81-e005-8c38-b2944375d7b1@tribudubois.net>
Date: Sat, 24 Oct 2020 12:34:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201004182506.2038515-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=217.70.183.201; envelope-from=jcd@tribudubois.net;
 helo=relay8-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 06:34:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.108,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 24 Oct 2020 10:25:02 -0400
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by Jean-Christophe Dubois <jcd@tribudubois.net>

On 04/10/2020 20:25, Philippe Mathieu-Daudé wrote:
> These individual contributors have a number of contributions,
> add them to the 'individual' group map.
>
> Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
> Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: David Carlier <devnexen@gmail.com>
> Cc: Finn Thain <fthain@telegraphics.com.au>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Hervé Poussineau <hpoussin@reactos.org>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Cc: Kővágó Zoltán <dirty.ice.hu@gmail.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael Rolnik <mrolnik@gmail.com>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Paul Zimmerman <pauldzim@gmail.com>
> Cc: Stefan Weil <sw@weilnetz.de>
> Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Cc: Sven Schnelle <svens@stackframe.org>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> To the developers Cc'ed: If you agree with your entry, please
> reply with a Reviewed-by/Acked-by tag. If you disagree or doesn't
> care, please either reply with Nack-by or ignore this patch.
> I'll repost in 2 weeks as formal patch (not RFC) with only the
> entries acked by their author.
> ---
>   contrib/gitdm/group-map-individuals | 22 ++++++++++++++++++++++
>   contrib/gitdm/group-map-redhat      |  1 -
>   2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
> index cf8a2ce367..b478fd4576 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -16,3 +16,25 @@ aurelien@aurel32.net
>   balaton@eik.bme.hu
>   e.emanuelegiuseppe@gmail.com
>   andrew.smirnov@gmail.com
> +sw@weilnetz.de
> +huth@tuxfamily.org
> +laurent@vivier.eu
> +atar4qemu@gmail.com
> +hpoussin@reactos.org
> +deller@gmx.de
> +alistair@alistair23.me
> +fthain@telegraphics.com.au
> +svens@stackframe.org
> +aleksandar.qemu.devel@gmail.com
> +jhogan@kernel.org
> +paulburton@kernel.org
> +vr_qemu@t-online.de
> +nieklinnenbank@gmail.com
> +devnexen@gmail.com
> +jcd@tribudubois.net
> +dirty.ice.hu@gmail.com
> +mrolnik@gmail.com
> +pauldzim@gmail.com
> +linux@roeck-us.net
> +sundeep.lkml@gmail.com
> +ahmedkhaledkaraman@gmail.com
> diff --git a/contrib/gitdm/group-map-redhat b/contrib/gitdm/group-map-redhat
> index d15db2d35e..4a8ca84b36 100644
> --- a/contrib/gitdm/group-map-redhat
> +++ b/contrib/gitdm/group-map-redhat
> @@ -3,6 +3,5 @@
>   #
>   
>   david@gibson.dropbear.id.au
> -laurent@vivier.eu
>   pjp@fedoraproject.org
>   armbru@pond.sub.org



