Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1004CC435
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:42:56 +0100 (CET)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpTb-0005Lp-Sl
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:42:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpQz-0003Bf-Gk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:40:30 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:40371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpQx-0002j8-8g
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:40:12 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGQax-1nOwD72HCX-00GqTu; Thu, 03 Mar 2022 18:40:08 +0100
Message-ID: <3bc38987-97c4-3bcb-09f8-771c8ba2ea91@vivier.eu>
Date: Thu, 3 Mar 2022 18:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 03/12] mac_via: use IFR bit flag constants for VIA2 IRQs
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jbiyslXKcSt6d+elrL+rTd7yVk+OKNcxbqDXGwlbp7WAZPv8MlW
 Zp3gByDYutkxPFHQlSCdCX6UgcNnDwWGKjJ+GecMLtUIlQeCuCAGtRq/0qlR52Qk/3U4koc
 W7VW0++8FBeTjBim7u8vIxs+Zs1IwseG/AWtoddN0nDrM+IbhV4j9310pgHqjezS5ncIZCq
 uqzb92cbYwV9hge7+yd8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PjzK+bc5O1k=:iYLU4Sg8dU9clLpngzWXgN
 2OVPiPALjNdHtfqMMsQnxTe0JKdCEVhYmjNMIQc5nEccnraphbLtmzrCRC2ktN13TsGXwWeHz
 PeI78leYiqkGnhSGaHA6yPgVbPXeMeE+4Mu1xr/VsRec0yZz+peTuHGohWTITHoek9rYDq0es
 /ounqA2LSbKQ1tC1F1teoOjESlmgpuO0KOWS9t8IBCrpvFDN+OOliEG9pwPiMslhcJ9rM0Vac
 kYkFqFN0mhif4d+5rFu7PU+S14YXnxmPF8aMPGB44+InY0hR1YhWRz2Te0pesgBuxvbjDk+y0
 /7ajBWZlEGxNSpRjZQFJeH5SbqvA3Yxed47n8wexZ2a7+HC44UYhuJ+SYhqBu2ju+tu3ZBBFs
 4PHMTxuZwbs5ui1G19O2iRrSzDr2979M3c8E8WMZfvmxYu+7w7j2zYLQThBqs44R4qUSKl0Ey
 D1SMOwv8zvB8zglrNCdyWWaJMDlyHCejl/Cx/kPcpDukXz/IBE0d0Dr6TeBRXFtp/UzSSXzwl
 nZa/p4Z0wtvkFaOTsbL/6x3o0qqrex0ve9etw77mf+IS38pApVx2r7oajFQLZOQLJlsCa6UG2
 jSpCitvqOiAmYwYSff+YVHW0Nr5Xkx/7rgdbaZokv7/NhGh6AZgJkBK+I46GWvq0qJczvfluf
 hDuYG6sxxgkxnOT5jsVh36JtD/GXJkDy/AukULmrnCDNYvjAvD/Q69za6G1ZMOO+YDbM=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> This allows us to easily see how the physical control lines are mapped to the
> IFR bit flags.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   include/hw/misc/mac_via.h | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


