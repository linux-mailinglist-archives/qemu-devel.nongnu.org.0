Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90C31AD08
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:17:17 +0100 (CET)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAxbg-0002M4-LE
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxaT-0001vJ-01
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:16:01 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxYW-0002bI-FN
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:16:00 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1McGxG-1ll7BP3E1k-00cdo9; Sat, 13 Feb 2021 17:13:47 +0100
Subject: Re: [PATCH] linux-user: Add missing TARGET___O_TMPFILE for hppa and
 alpha
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20210201155922.GA18291@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <193a1b39-e574-c76d-f330-ffd9e2388542@vivier.eu>
Date: Sat, 13 Feb 2021 17:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201155922.GA18291@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VdCC4VKgz/vjNDLyepbHmhjkigMw7IqGGFpehcD+kkbP8mJi8t/
 kF3adwufzNyL+66Ij0/VdXlw0XfWhIzdDeFefxywAaXUUise1Scxg33Iku6W4DaeqN4Lwwh
 HD0U59iVvs3Stm3nOeifctjil31ECESZF/C1FoiJdl8PRMZNv5bknbkCEwWqx31O3RRuAPR
 LKZV+zwHZMMnMK9yiyjCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oBT+C/yFDgw=:JWY48NEr93e5MQTQz8xfQf
 xZJEDevyd7OqEPMps/gDoWXO1sgiHMLB9V1s4i3P92UuDXp17bAI78USi28/3km/mgDsrSCv5
 ZjX9D4kRxYE3tcGMXNIEyXuU8V3XYKEvAw3zyFCMyfXU4v8xivm14X6ecPf+LgK37u+O/iBS1
 QRTgpQPULUM2ca0cZqkmQLgYvVhUwcWWbte6fyz6UTHhujy6t9Et8Pvusd08O+ZA1hCc45+1s
 yAHJ7l4Qgyh0u8JCWnSarcUcaSs3JLf/Zj9QBNnnEmQ1vh8fqxVRLe7Glzrq+I5d2wMleyDjH
 BIQAjj4qYu7rjxlgJkmzdaUalY49iEDMMczkOqGcNzz2WRFUbORFVbcehF++Wx9X1VOuoqwuQ
 IpnfRSwi6R4N+HUP74Swva9iwm21MQQ6F4UCtTmSyA/GORv3OFcVah6nzEjTSyddAcpUL9y3C
 BYTS0WyZFQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/02/2021 à 16:59, Helge Deller a écrit :
> The hppa and alpha targets miss the #define of the TARGET___O_TMPFILE
> and as such fail to run a trivial symlink command like
> 
>     ln -s /bin/bash /tmp
> 
> which results in an -EINVAL return code.
> 
> Adding the define fixes the problem.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> 
> diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
> index 2617e73472..0a74807a8b 100644
> --- a/linux-user/alpha/target_fcntl.h
> +++ b/linux-user/alpha/target_fcntl.h
> @@ -23,6 +23,7 @@
>  #define TARGET_O_CLOEXEC     010000000
>  #define TARGET___O_SYNC      020000000
>  #define TARGET_O_PATH        040000000
> +#define TARGET___O_TMPFILE  0100000000
> 
>  #define TARGET_F_GETLK         7
>  #define TARGET_F_SETLK         8
> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
> index bd966a59b8..08e3a4fcb0 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -21,6 +21,7 @@
>  #define TARGET_O_CLOEXEC     010000000
>  #define TARGET___O_SYNC      000100000
>  #define TARGET_O_PATH        020000000
> +#define TARGET___O_TMPFILE   040000000
> 
>  #define TARGET_F_RDLCK         1
>  #define TARGET_F_WRLCK         2
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

