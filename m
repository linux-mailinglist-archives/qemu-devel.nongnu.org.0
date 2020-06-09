Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45B21F43FF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 20:00:32 +0200 (CEST)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiiY3-0007zi-Gc
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 14:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jiiCu-0005or-1y; Tue, 09 Jun 2020 13:38:40 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:43265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jiiCq-00053I-2P; Tue, 09 Jun 2020 13:38:38 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmQUL-1jHw2Z0izh-00iTtW; Tue, 09 Jun 2020 19:38:22 +0200
Subject: Re: [PATCH 2/3] target/unicore32: Replace DPRINTF() by
 qemu_log_mask(GUEST_ERROR)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200603123754.19059-1-f4bug@amsat.org>
 <20200603123754.19059-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <99447f43-e4ef-27f9-5b50-d0946bc28482@vivier.eu>
Date: Tue, 9 Jun 2020 19:38:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603123754.19059-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pyQ5wz+gzvZswqm25WIMduKI/jAFjW8qN7LX4yC9bGEvovUDixU
 8DukJJAcXUlfJXBeXiW1OhofK7pngq9vRWKxfbEb8UjUmYLMttO1j2K0h6Ng4ZYKV70ryRA
 y+wXV8CcEUXuI5fXqNX0rbsUL8tM1tFe+P5z/YVxnD82ePgQwdsMWAFY2cPGNYZB+xfZhup
 wstQeaBN0VSKFpt+YAA9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oq6rjQid0oE=:p78oS9eHGZ9SoHNtzY0JEn
 Yc2Y4duekgCJOZY9oiziUFnPwQOOQcACY1WOVXD3wHNIWTIOzpJhx5Tg42XvGqr6jYV8z76N0
 IpTrx63GdvvGcGDoa2LHceLoR7g+DYNtomcHYqZRDkyVnX4SqGFHwyvbJTQ2/lHFO5h1lGiUc
 dtdYQZixEhaO3yUHqXoA8C3D6MPCfGjgbxiaRVeywvXjVWfrEMwDgm8eGT0v/imqonXorxKOs
 ZMoA1UfjrSChsvaIdwlFVfDpB60xowAOF9vANmhv1Ee7rcfADbDQTJQDv1uQhjDtZddJexDNp
 ncb+7Hh0EyI5aFAYGnDZDMa80RKLQMJSwbV9h10kE/IlUlPPACbK9S1jJvROVu+2FTxi0hoHv
 RAUvf982c2okmJ3UYakIm+AEYzdZ+SU7M8ojXj5Vebw2IKV7QCyOJ1iObjkOvLglN+vpDDRZj
 /fWyGLrgVQgwpyQIQ0Be3y8WDbUjdsn+DpVWGjfkqnmDbPzsDeVaVtD2NXHVbmNyMKe3GPsLx
 4oc71gAP10A9c+J1MvmXvUZGHKQvu1UR3iNZC/EaQm9V5XabijZm6Zi9HspaUPwZc8SgagcBw
 w2lGSlyiuGY6GJKLVl7ym0quzy+b1EbWBuo2/MMPQUeg3wdushsk8u+b0ms783uhbP2VzhN1W
 +aacvGtTc0cP8biV+QTxgK2ZLuEaXCxYLd/vaCrW9ovzV9Yg+6G6vR4vHEKvaZeD6cqeEZPbi
 pb7FRcD1OZjeplASul+ywfwyeVGZD1R1oGwDLQrwT+aS/twjTtuonIls/+o29IIRpBrNG6v2s
 xbMkuw2Tx54dRl602bgI99Q45dsx8D/QFjJOL0VV/BWMBaubmBPKCXAJMdBWkcWJGyRudx/
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 12:38:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/06/2020 à 14:37, Philippe Mathieu-Daudé a écrit :
> Replace disabled DPRINTF() by qemu_log_mask(GUEST_ERROR).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/unicore32/helper.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/target/unicore32/helper.c b/target/unicore32/helper.c
> index 53292ae311..00371a7da6 100644
> --- a/target/unicore32/helper.c
> +++ b/target/unicore32/helper.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
> @@ -106,8 +107,9 @@ void helper_cp0_set(CPUUniCore32State *env, uint32_t val, uint32_t creg,
>      }
>      return;
>  unrecognized:
> -    DPRINTF("Wrong register (%d) or wrong operation (%d) in cp0_set!\n",
> -            creg, cop);
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "Wrong register (%d) or wrong operation (%d) in cp0_set!\n",
> +                  creg, cop);
>  }
>  
>  uint32_t helper_cp0_get(CPUUniCore32State *env, uint32_t creg, uint32_t cop)
> @@ -153,8 +155,9 @@ uint32_t helper_cp0_get(CPUUniCore32State *env, uint32_t creg, uint32_t cop)
>          }
>          break;
>      }
> -    DPRINTF("Wrong register (%d) or wrong operation (%d) in cp0_set!\n",
> -            creg, cop);
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "Wrong register (%d) or wrong operation (%d) in cp0_set!\n",
> +                  creg, cop);
>      return 0;
>  }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


