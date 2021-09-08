Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D740348F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:53:25 +0200 (CEST)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrSW-0001Ek-PJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrQ5-0006aQ-B1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:50:53 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:36113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrQ2-0000ok-4M
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:50:53 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MowSu-1mjSCc1FZG-00qSDE; Wed, 08 Sep 2021 08:50:48 +0200
Subject: Re: [PATCH 06/12] mac_via: move q800 VIA1 timer variables to q800
 VIA1 VMStateDescription
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <469156b2-b161-644a-3123-850a5be15ae2@vivier.eu>
Date: Wed, 8 Sep 2021 08:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5D/OtQS+vTmkIOeGJQKaAmL50umVppyTeSs9VJQpTtLJX3OOFN9
 XPWprLYSPmsKy7Y/b8mAOQHFgTz6vcrEIThNiwV5nL62Uxku2EBDdsHp6JYn6vG81BdkHWj
 uzEWFAyykVzVYo1kDMPN9r14BBvNvNRWBBGqthhl4l6bgx45ZJzHCYeqPvcHrQg1siOyU5G
 8888RteJoH3+G/vbIYp6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TGkbD7wEXnM=:DBnkdEsytzlAkfp6wiQxKz
 ymCiZHtXTkMHLdN1hOLVlrPzsO5ETFACYP3cudGsfacvwYhdS97M0mMoE95USs/fpx5ZhrZqh
 hEXF+C2iLs0mzz4TD/jzOcdeBhBtRZMLOhSscr2v5cYOx66yKeqsZxBsua1Mv+2c6v3ms4oky
 d+G4kUVqGQsRvjUurP2yE7LV2d5Mc9LkvPEItwaTO1YXm36ZULhiRSO9ww72yepz+WYValAHy
 ZwN0fROJMAxUKRkRCRtMEtPfJ5+nUh5UEqxWSyzH0FikCsLXj7UqLpc2kSeYAAEJIkCZng+H2
 gsHvFdvnQM2ht1kRe7HU0msbgmRPVrYfvxJ8sQlKfq27vuFNlBgKSQ10hugeG6tUsXk7sDv6z
 W54JIWuAp7XjkKNGSmjgVB4SWotvswn0jRLTQ2654l0l8AbRXTSXsdpHkpYqWG5lGo/oAURW/
 1qn6KgzuZMiyQE+JmvtCYgMXB2mgrPJZTI4XIrttB4HN5tkkBLNmra1g9ZyAXJiUfjoLBRwWh
 5LSq1ohc7YZ85h/j8YGgsHM43Zb+QyGM492ZunH/oY/+eN+MpcjKGuFM0nXuMqKCPaR7bnkSA
 5btDDrgE1tflPSt6NP6SHtpJIaFjCL75xu4AQH7CG2116czOoqpFfDUztL9wtQgeG+xqaFJ5r
 h+fTZfKBrrQCDHGm4wR99MsrhgOjwg/5j6ifYBMVWkQXhFYJ1V03xV34TJn0QYxgVve6VbDYN
 sstP0aywz4b4q3IMmjQiROgoCsiayfOwtt9DRw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/08/2021 à 12:24, Mark Cave-Ayland a écrit :
> These variables are already present in MOS6522Q800VIA1State and so it is just
> the VMStateDescription move that is needed.
> 
> With this change the mac_via VMStateDescription is now empty and can be removed
> completely.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


