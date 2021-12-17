Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C8347880A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:48:09 +0100 (CET)
Received: from localhost ([::1]:55516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9qS-0000HQ-CY
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9mM-0004GT-VS; Fri, 17 Dec 2021 04:43:54 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:41157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9mL-0000wh-6R; Fri, 17 Dec 2021 04:43:54 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHWvH-1mlFUH1nEH-00DZpF; Fri, 17 Dec 2021 10:43:36 +0100
Message-ID: <156581e6-9aad-779b-d2e8-a66da3e705d5@vivier.eu>
Date: Fri, 17 Dec 2021 10:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/avr: Realize AVRCPU qdev object using qdev_realize()
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211205224109.322152-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211205224109.322152-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FvYxKTKG+l9tP8PpefJKJxUGC6no5h0DpuwUsMm8vlvnTKHPDo0
 scwUDp6C1VHLzimqkgpfRdZTw27go9+ylJ8L9Zpt6ZiPKp1vSYmfSUtb2qYuUNJgMqxBuwP
 Dxm6prGCQ7WMJLIaP76DVhrFceG6z1bv8/QSfm4IKOSzx23mWNOujoVvHen561LySrDC+gD
 ddnO5JeY7bx92kaL5lE4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eat4JgH8Zeo=:srgfm7SBtg0Hc6xAoWdYbt
 zeCpang6PduF/TUW/mvO0t6WffIK3cIX+c05rVZCSMMwOGkCvWppZid+U7eF2L8A5KT3iMubp
 IRwzNNe5XJ8LwMfQE4ZxYSEjF5rB6S0sKWXusCT0C5H9KMhvTf2/sDckovV/4ceEdIle6p+Kk
 BbL/sZ5/DPOM3nO1jCNHnGbyCnaEIDjR1RiVgY2q5Vcrg1oZNwCkfs4CzxHF7ho3ng21UPUAw
 tiFzHxGtuNGynm+wkYZqjwTr6Mz8upFHcV+nVZAzmJINnpFkwliDNuzP9AToVJJmluuhi2enj
 ZYa5GQ6zygqNVvV1jUNxDVNK+5dlZcu8fWTSE7ct0m96TnFlTK6evQqfT0TC70Q0S85Lu7RTs
 gysdwKI4UWBRMPUFsQAzzAd2GRuPZfxAuJQ/V0qJjKGTheXhSdqSzuuFVyRaVvLYkepnKGKnr
 ayPOZWYnnVmdbrfw9iA6VxidYwvCmedtOZVeLrhagJt0hNy9OHfsQ/Hy004mVlQoUUpPI3RR2
 1skhIqg15NZi6nNjtabzkYSKhuHAL4FaMdytTH0u2AkNaa2C9dsFfZGt+zKZluKS5q78673Wt
 6cufIX+HGSO80w6znZwnBOOwjNMRboNu741xMvKPtPVIUyP2VK5aa7fDtsiKn77rp45ueC5U/
 PZglXXEpSSx/RQ7QHi0FHXEPjiXoT2m2EMB9zm5tB3XEpUZK644yQUlJ2l1RipzDpgoA=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/12/2021 à 23:41, Philippe Mathieu-Daudé a écrit :
> TYPE_AVR_CPU inherits TYPE_CPU, which itself inherits TYPE_DEVICE.
> TYPE_DEVICE instances are realized using qdev_realize(), we don't
> need to access QOM internal values.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/avr/atmega.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 0608e2d475e..a34803e6427 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -233,7 +233,7 @@ static void atmega_realize(DeviceState *dev, Error **errp)
>   
>       /* CPU */
>       object_initialize_child(OBJECT(dev), "cpu", &s->cpu, mc->cpu_type);
> -    object_property_set_bool(OBJECT(&s->cpu), "realized", true, &error_abort);
> +    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
>       cpudev = DEVICE(&s->cpu);
>   
>       /* SRAM */
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

