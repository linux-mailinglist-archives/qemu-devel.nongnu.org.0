Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D7D6460F4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:24:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2z52-0006b7-Dp; Wed, 07 Dec 2022 13:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2z50-0006ae-LG
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:23:38 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2z4y-0000SX-FV
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:23:38 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g1so10161948pfk.2
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/7sR0KWABaIvyN1+eXWgaZ/CDtMv+88zrfwwy8vOjU=;
 b=aPgvoXb0UYoHbIZJ/mpyDneC2XnzhOPf8lAu+JP9VO4GPcAJVJ8aCeZcOmo82G+Z2u
 MtWEKcrNulpboTOPV9QRtHzBnVJnpkcXiIyB3pUFf6UC8iGkALHGPypq0ao4+eFMJVOZ
 loyFjGGIb97qsOPPpqYL2cNmMBd1SjFRSNgrjofvWhznn4a5chqLvioDlDBJ41mcdJdf
 6GCMJdOStpfbBXXLlsEFscaajr85gkQMSxcar6N8XG25N9HD3JpDP3pK1q47J4LxPC39
 gPeSQXG2Cv0L1BaR5N6WwdaqhttjGhAeHnJwMhgJpanW129wVvDzcZvDxPGZzfomraBi
 JbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/7sR0KWABaIvyN1+eXWgaZ/CDtMv+88zrfwwy8vOjU=;
 b=MrW1WXeeVRutD2bOZxs4ZDfqIoWaCNQ6llXLYRkWauWBpHCGwMq4Us45JEtcR67tat
 NrylaE/llPj4rlYMXYgzzQSo6XnEERcSE1JpytlUcKiAQFhZMq7zvhhEVMeJTzyiMHgT
 Rff6FZb6laswzl2i5XDJnbEpEzHJWD2lmiMhCxPfEvX8rb9GfS8OaYpJBOFadSTswyXy
 INe1m5tCMwS/PlMFOenwrojXha7baVPTKBpBSCGPW3BVTWfNW6t4mbwu+D3CnlyGt6Fg
 0j510tPjEfYqiHrNQjk6PxrfbChODb0AKxDhtgqOkhexZIIxKEZQANtHu8OTPI4i/gpK
 7GfA==
X-Gm-Message-State: ANoB5pnG8JTMI2qB71ZakEXsp8rnb1dxK9M+Y55SgQTI3E4DQ+Wkt+4R
 viWjiSqUY2y8CsCIoY5VZInA+F9TvPt8qkBpaMAjsA==
X-Google-Smtp-Source: AA0mqf7qmVSRevFMlnmyXcC66IxwCY7A0ybvFWuPHwLYpSEDqwzhsE3rbmuq+wzp8imcqpRo4n1tmrTRB8e5ZQTCOlg=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr67820677pgr.192.1670437414578; Wed, 07
 Dec 2022 10:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-3-philmd@linaro.org>
In-Reply-To: <20221207174129.77593-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Dec 2022 18:23:22 +0000
Message-ID: <CAFEAcA_DwMB7CZERo3EG2wRAQp6ugiikxhqtMxOaWS+dd8tn3g@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Marek Vasut <marex@denx.de>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>, 
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 7 Dec 2022 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Both insert/remove_breakpoint() handlers are used in system and
> user emulation. We can not use the 'hwaddr' type on user emulation,
> we have to use 'vaddr' which is defined as "wide enough to contain
> any #target_ulong virtual address".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  gdbstub/internals.h        | 6 ++++--
>  include/sysemu/accel-ops.h | 6 +++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index eabb0341d1..b23999f951 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -9,9 +9,11 @@
>  #ifndef _INTERNALS_H_
>  #define _INTERNALS_H_
>
> +#include "exec/cpu-common.h"
> +
>  bool gdb_supports_guest_debug(void);
> -int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr le=
n);
> -int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr le=
n);
> +int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)=
;
> +int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len)=
;
>  void gdb_breakpoint_remove_all(CPUState *cs);
>
>  #endif /* _INTERNALS_H_ */
> diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
> index 8cc7996def..30690c71bd 100644
> --- a/include/sysemu/accel-ops.h
> +++ b/include/sysemu/accel-ops.h
> @@ -10,7 +10,7 @@
>  #ifndef ACCEL_OPS_H
>  #define ACCEL_OPS_H
>
> -#include "exec/hwaddr.h"
> +#include "exec/cpu-common.h"
>  #include "qom/object.h"
>
>  #define ACCEL_OPS_SUFFIX "-ops"
> @@ -48,8 +48,8 @@ struct AccelOpsClass {
>
>      /* gdbstub hooks */
>      bool (*supports_guest_debug)(void);
> -    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
> -    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwadd=
r len);
> +    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr =
len);
> +    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr =
len);
>      void (*remove_all_breakpoints)(CPUState *cpu);
>  };

If you're changing the prototype of these methods on AccelOpsClass
don't you also want to change the implementations, eg tcg_breakpoint_insert=
()?
Interestingly that function calls cpu_breakpoint_insert() which
already takes a 'vaddr' rather than a 'hwaddr'.

In looking at this I discovered some rather confusing gdbstub behaviour:
if you use the qemu.PhyMemMode custom gdb flag to put the stub into
"physical memory mode", data reads and writes are done on physical
addresses, but breakpoints and watchpoints continue to take virtual
addresses.

But at any rate given that currently breakpoints are always on virtual
addresses, vaddr is definitely the right type here and probably all
the way down through the callstack.

thanks
-- PMM

