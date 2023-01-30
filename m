Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8B68079C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:41:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPic-0005Md-HU; Mon, 30 Jan 2023 03:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPiW-0005MM-P6
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:40:44 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPiU-0006sO-Us
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:40:44 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPowd-1ozftT0ZFb-00Mw3E; Mon, 30 Jan 2023 09:40:24 +0100
Message-ID: <80d2a10b-838c-8787-d001-5f76df400d16@vivier.eu>
Date: Mon, 30 Jan 2023 09:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: move target_flat.h to target subdirs
Content-Language: fr
To: Mike Frysinger <vapier@gentoo.org>, qemu-devel@nongnu.org
References: <20230129004625.11228-1-vapier@gentoo.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230129004625.11228-1-vapier@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QyXhOa5kwAX4zI782P5d+xuevntw7Tsogpl1NKqyOR1aFXJPu34
 TMaVmLqocmcuqvZsfY6R+A0LsOs6mJkZle0BHuMxhQQYTVrGbRCnlyBo/3uet60w+xICEMr
 3sXsDnLSm13laqxpe8Hv+7i5yzrjJw8gi4ythQvQsWbRG+CGvJCYuVRmpn8gRkqlkUxne3T
 t8s9iarsyHdPz241toMNQ==
UI-OutboundReport: notjunk:1;M01:P0:kAP0B+tBONM=;QqlbkogDbpktQ1SxvxM1V1kNj1p
 R5l62tkLFqm9SywVO5tVGG8pF/A5gmuR6ZB0qq8geinR9sIgpafRndme2SLYdz1/jtY8whrQu
 8X7UqxIfsCdH/XL6j3c6VVaTfDLyXwXVs17RG9jl2WWWM9sZkemRyPFy7E8N3qz9EcmAoQW0l
 mAmTHJ5ZJ7xteCPAhuI+x3qoUvNIx5XzTmiRNwoB7CY0l3FKf5vjQtYfOT5eN5itvtA6trN1H
 RLs3nxyYjQr/Q43T+0OL7aS0CvYnuFC3K/wVsbeXFisAWo/x/xE5XF4aNI6xS/5fhqOd0+csS
 znE/SQ/KruINHV4QlDO9OYT467zmejl0lhFFDjm3D4sxch4m9A62wUEZYLbBREhseOv1H3sd2
 EZAGUMEvwDpzuoJAPWuw75070eFGdcnXKtfiHQQ2mNBLmdh23PD26+GK+JUgFxKhDdpGh7Boz
 +gwtItEjbnrNIWb+Cr+awKPwx4+SHOBH7r1GiArQLzcrIMyD7nRHbI/+b2tskAxSAJRT+2MET
 /JuN1KLr1vxAt4b7FF+RYs+B/6RsMOzfs1VpFHkAR6uoU7l4vYgqCGDNJBZFANeqlOVWjJmXw
 sxPIZMarlRbrpCFEE5mt/fElzrJEc2kPEghT5GdTNTSICoCHOopLhtaL/3cx/HaoXzh49iFLH
 LyJenXO0EgCdJhifm4z8GM/MufY5rXLWOBAOvbY2eg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 29/01/2023 à 01:46, Mike Frysinger a écrit :
> This makes target_flat.h behave like every other target_xxx.h header.
> It also makes it actually work -- while the current header says adding
> a header to the target subdir overrides the common one, it doesn't.
> This is for two reasons:
> * meson.build adds -Ilinux-user before -Ilinux-user/$arch
> * the compiler search path for "target_flat.h" looks in the same dir
>    as the source file before searching -I paths.
> 
> This can be seen with the xtensa port -- the subdir settings aren't
> used which breaks stack setup.
> 
> Move it to the generic/ subdir and add include stubs like every
> other target_xxx.h header is handled.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>   linux-user/aarch64/target_flat.h       | 1 +
>   linux-user/arm/target_flat.h           | 1 +
>   linux-user/{ => generic}/target_flat.h | 0
>   linux-user/m68k/target_flat.h          | 1 +
>   linux-user/microblaze/target_flat.h    | 1 +
>   linux-user/sh4/target_flat.h           | 1 +
>   6 files changed, 5 insertions(+)
>   create mode 100644 linux-user/aarch64/target_flat.h
>   create mode 100644 linux-user/arm/target_flat.h
>   rename linux-user/{ => generic}/target_flat.h (100%)
>   create mode 100644 linux-user/m68k/target_flat.h
>   create mode 100644 linux-user/microblaze/target_flat.h
>   create mode 100644 linux-user/sh4/target_flat.h
> 
> diff --git a/linux-user/aarch64/target_flat.h b/linux-user/aarch64/target_flat.h
> new file mode 100644
> index 000000000000..bc83224cea12
> --- /dev/null
> +++ b/linux-user/aarch64/target_flat.h
> @@ -0,0 +1 @@
> +#include "../generic/target_flat.h"
> diff --git a/linux-user/arm/target_flat.h b/linux-user/arm/target_flat.h
> new file mode 100644
> index 000000000000..bc83224cea12
> --- /dev/null
> +++ b/linux-user/arm/target_flat.h
> @@ -0,0 +1 @@
> +#include "../generic/target_flat.h"
> diff --git a/linux-user/target_flat.h b/linux-user/generic/target_flat.h
> similarity index 100%
> rename from linux-user/target_flat.h
> rename to linux-user/generic/target_flat.h
> diff --git a/linux-user/m68k/target_flat.h b/linux-user/m68k/target_flat.h
> new file mode 100644
> index 000000000000..bc83224cea12
> --- /dev/null
> +++ b/linux-user/m68k/target_flat.h
> @@ -0,0 +1 @@
> +#include "../generic/target_flat.h"
> diff --git a/linux-user/microblaze/target_flat.h b/linux-user/microblaze/target_flat.h
> new file mode 100644
> index 000000000000..bc83224cea12
> --- /dev/null
> +++ b/linux-user/microblaze/target_flat.h
> @@ -0,0 +1 @@
> +#include "../generic/target_flat.h"
> diff --git a/linux-user/sh4/target_flat.h b/linux-user/sh4/target_flat.h
> new file mode 100644
> index 000000000000..bc83224cea12
> --- /dev/null
> +++ b/linux-user/sh4/target_flat.h
> @@ -0,0 +1 @@
> +#include "../generic/target_flat.h"

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


