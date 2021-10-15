Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9AD42E8CB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:16:49 +0200 (CEST)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGWO-0001oD-VR
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbGU9-00006J-Co
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:14:29 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:42155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbGU7-0003yy-KN
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:14:29 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MF3U0-1mUfrE1Crw-00FUTd; Fri, 15 Oct 2021 08:14:24 +0200
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 1/8] mac_via: update comment for VIA1B_vMystery bit
Message-ID: <ffd52b20-c812-b58f-370b-ca3a81bb4eb2@vivier.eu>
Date: Fri, 15 Oct 2021 08:14:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fyLvoj1QIeE2XuRycFRfxYAvov+SnSsMliXw9/j7yXoI93ToE2P
 WcH+BP5umVNio4ZUKYGyFUfnDkhI3FxemhVKjD+P7SUdt3CouoObWDFAhjzYVVPmJ6RdMoV
 W+Bv8FpMNtmLUURj7vrXZi9YD7FG9f0r5o/DkvI7bSjIInLSurWYLcraAXyTGwFKdVMBhVA
 lZx8W26V0qKOmBKW3m8tQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:noA0P1ntZEE=:41Mh3VDdmxQdUV1HKyWsml
 2kWt4LUesDANgAlnXQERMp7t7rN4mdhpt3mcnKG2/zutjV/6yCbN/Ds4Rtfnbhmj6ZUsi29+M
 eQcnqkmKp9dl6bygxN4Kdls4nFGG619UKgKcofzH326zLGhzkwAa9vMnVKYyQjyyae+JkFNaS
 7fXukIa0HsesP4TMR07dRXBllNPyYIHd8Ykc0fi30HWsiG167VsrT4QSnFYUTWztQMz3lJclQ
 FlgxBFSOfNpIS6HoBTbXaRo1RFJquHACrI7Jc6VZvtYvJJ2PlSBbZJGIXtJhJx1W0QB19I/aN
 6iduqHCRzzKih5skZa7lTabhdYW4l8sFhzduU4ctr98764Vvp3Ivp48bdElEOFeDCE1/4o3OL
 QH9Fbxm95eb+5mHieGmcHCZOz+ci9ez85HeWGl/IdqUp5eW7jAreuhEEU4D0o5nof9p08/viZ
 BI6vNf5C5JcF3OghLZYsTMkzz9PE7fVFeQ/zKiszdv5MwTjgSgc5oHgVhqk/NE06v5V1pGYBA
 LuKQQNaII2P5Pf3tvm8V+5VDLUVT3Lt3y+5y1VHQHiYobcEenPB5TF38rDV/0thQt5ohfmiGP
 GtgRSwBoxZIrIVrFZ5UEc74JsotxQ46xEi+3voE+qEQHYIwjV4LfCKIcrHE4EuWaSy/p2YnxC
 XOMe3xIhmvFZF+Dyq/hVQfYr9HywDSrWO5O/kqIEvaBrba2C9QzaQr0xwjg33qDgO2yTe14gY
 lo5mIjf8jNanpUFb+oycU3Gk5KfcgHQfpXDpLA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
> According to both Linux and NetBSD, port B bit 6 is used on the Quadra 800 to
> configure the GLUE logic in A/UX mode. Whilst the name VIA1B_vMystery isn't
> particularly descriptive, the patch leaves this to ensure that the constants
> in mac_via.c remain in sync with Linux's mac_via.h.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index 993bac017d..7a53a8b4c0 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -130,6 +130,10 @@
>                                  * On SE/30, vertical sync interrupt enable.
>                                  * 0=enabled. This vSync interrupt shows up
>                                  * as a slot $E interrupt.
> +                                * On Quadra 800 this bit toggles A/UX mode which
> +                                * configures the glue logic to deliver some IRQs
> +                                * at different levels compared to a classic
> +                                * Mac.
>                                  */
>  #define VIA1B_vADBS2   0x20    /* ADB state input bit 1 (unused on IIfx) */
>  #define VIA1B_vADBS1   0x10    /* ADB state input bit 0 (unused on IIfx) */
> 

I'm not sure we need to keep in sync a word that neither used by linux or qemu (for now).

Perhaps you can put a word from where it is (NetBSD)?

It seems it's supported by all Quadra, not only Quadra 800 (see NetBSD comment in mac68k/machdep.c

Anyway:

Reviewed-by: Laurent Vivier <laurent@vivier.Eu>

