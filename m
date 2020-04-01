Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8B019A9EA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 13:03:22 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJb9V-0000Bu-Vp
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 07:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frederic.konrad@adacore.com>) id 1jJb5y-0006df-Lu
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frederic.konrad@adacore.com>) id 1jJb5x-00024M-Iz
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:59:42 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:46127
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
 id 1jJb5x-00022i-Ch
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:59:41 -0400
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 9D12681387;
 Wed,  1 Apr 2020 12:59:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KALbQw33jB9L; Wed,  1 Apr 2020 12:59:40 +0200 (CEST)
Received: from localhost.localdomain (lfbn-tou-1-1471-22.w90-89.abo.wanadoo.fr
 [90.89.4.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id 5E5E181385;
 Wed,  1 Apr 2020 12:59:40 +0200 (CEST)
Subject: Re: [PATCH-for-5.1 5/7] hw/timer/grlib_gptimer: Display frequency in
 decimal
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200331105048.27989-1-f4bug@amsat.org>
 <20200331105048.27989-6-f4bug@amsat.org>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <965a3560-e4b7-0b77-88d0-01acbcaf94c2@adacore.com>
Date: Wed, 1 Apr 2020 12:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331105048.27989-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
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
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiri Gaisler <jiri@gaisler.se>, Fabien Chouteau <chouteau@adacore.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 3/31/20 =C3=A0 12:50 PM, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=A0=
:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   hw/timer/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index 29fda7870e..96a6c9138c 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -19,7 +19,7 @@ slavio_timer_mem_writel_invalid(uint64_t addr) "inval=
id write address 0x%"PRIx64
>   grlib_gptimer_enable(int id, uint32_t count) "timer:%d set count 0x%x=
 and run"
>   grlib_gptimer_disabled(int id, uint32_t config) "timer:%d Timer disab=
le config 0x%x"
>   grlib_gptimer_restart(int id, uint32_t reload) "timer:%d reload val: =
0x%x"
> -grlib_gptimer_set_scaler(uint32_t scaler, uint32_t freq) "scaler:0x%x =
freq: 0x%x"
> +grlib_gptimer_set_scaler(uint32_t scaler, uint32_t freq) "scaler:0x%x =
freq:%uHz"
>   grlib_gptimer_hit(int id) "timer:%d HIT"
>   grlib_gptimer_readl(int id, uint64_t addr, uint32_t val) "timer:%d ad=
dr 0x%"PRIx64" 0x%x"
>   grlib_gptimer_writel(int id, uint64_t addr, uint32_t val) "timer:%d a=
ddr 0x%"PRIx64" 0x%x"
>=20

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

