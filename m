Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CD3567BE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 11:10:40 +0200 (CEST)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU4Cs-0002la-8d
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 05:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lU4BP-0001v5-Fa
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 05:09:08 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lU4BI-0002aH-Ie
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 05:09:06 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8XHb-1lh0aW2HJZ-014PmG; Wed, 07 Apr 2021 11:08:49 +0200
Subject: Re: trace_FOO_tcg bit-rotted?
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Llu=c3=ads_Vilanova?=
 <vilanova@ac.upc.edu>
References: <87eefnwd0l.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
Date: Wed, 7 Apr 2021 11:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eefnwd0l.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f+HeAdJ5A+tWKKPiFwECw542gihSrN5h6jnjK3TmmUQKx8ZftrR
 M2pHD47VSazayFZDE61puFCmoUqfkkl+7Y4XwQio25vrPh3EdSz+NlUFqQeT1FuElC8wcdy
 Ez9iby1JYB/SVPUBO4y3gd0WzSrwnyuawzWgs2Kph/4cTfd2CzYKyzSCV6aF6F5spuguE07
 LjlZDkATVmNbgHDPl9hLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OMTpB5pvUcc=:Oem4ntWv/zfgLEu/zk+Sxz
 pt29HoVm3rCSO8y4jMOVHeMJllBRmW03WV50RNvJzUs7uaAgvRV7HjutEYhXvLnrRbUVC/zM3
 /e63cFLCcX1vGdNSsUB9gclr19Xv0dYjShNCuGEG4nhnpwu4g8M1sZZQYX68A9xbD+ktI27to
 wMDr9+ewRWbXOpZVQaS7mRQLwuiZpPEsNHyjX53plCbZHZo6RgJY/MTUMMWdIPavVBmTsbgA/
 i8u/ssWTn1DB4ToMMAFYXWkr3uJj0Trx/BokwH4ZvQYcSc2dM1wahTBtSZ2QH8sOAmdVq91L9
 ZzHppmVe8H61ty4/5r/NoleSUOMtK3nvMYK4HXpLxG1WD16MkDp5TTq4XIfMzxRRNGBq8+Qjt
 NIBWhcnGsjT8IZuQNqLcZT0otxlzvZnaLOkSNCk/oKd477ClcTkFz1ooROxEra/DHQ8Z9JfCd
 +q3bIxem76f1f5/MEQILT1LxVU6BwJ/+m4w+E9NonqQrzJt/67Bj
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/04/2021 à 18:00, Alex Bennée a écrit :
> Hi,
> 
> It's been awhile since I last played with this but I think we are
> suffering from not having some test cases for tracing code
> generation/execution in the tree. I tried adding a simple trace point to
> see if I could track ERET calls:
> 
> --8<---------------cut here---------------start------------->8---
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 0b42e53500..0d643f78fe 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -36,6 +36,7 @@
>  #include "exec/log.h"
>  
>  #include "trace-tcg.h"
> +#include "trace.h"
>  #include "translate-a64.h"
>  #include "qemu/atomic128.h"
>  
> @@ -2302,6 +2303,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
>          default:
>              goto do_unallocated;
>          }
> +
> +        trace_eret_tcg(s->current_el, dst);
> +
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
>          }
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 41c63d7570..2d4fca16a1 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -1,5 +1,10 @@
>  # See docs/devel/tracing.txt for syntax documentation.
>  
> +# translate-a64.c
> +# Mode: softmmu
> +# Targets: TCG(aarch64-softmmu)
> +tcg eret(int current_el, TCGv target_el) "trans_eret: from EL%d", "exec_eret: EL%d to EL%"PRId64

If I read correctly, the name should be eret_tcg()
And I'm not sure TCGv will be accepted as a parameter type, use uint64_t instead (and %PRIu64)

Thanks,
Laurent

