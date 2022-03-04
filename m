Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB954CD25C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:26:48 +0100 (CET)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ595-0002eh-IM
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:26:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ577-0008OZ-JU
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:24:49 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ576-0006Bj-2E
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:24:45 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N3sRi-1o7pxb0yzg-00znyW; Fri, 04 Mar 2022 11:24:35 +0100
Message-ID: <31c83083-5bb9-81be-a361-bfd9b5ef07d2@vivier.eu>
Date: Fri, 4 Mar 2022 11:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 03/10] macfb: increase number of registers saved in
 MacfbState
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qoxB280yy3T7+c2sfbCORCWY0wYzl8K9RFKWxc2TFo/aSN/Ztcp
 Ed18n1Aeu/XmxhvBVnysowNdWfJplFfXJq2rLoAjcrTx/YQ91+JRumM1/2hDVv5HPIxOJ+5
 D2Xffg2wQ5/9CaOOndnC2dI2wrCWlhlpWRk9B7emgz7x5yZdlmpQomK31MzOQAuQTzFWjY2
 h/DgQY6+xmimCGqTWHmLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:29fXH0IOch0=:/tDBdjcjHfQAIJ+Kvp3HPH
 CJkWBKVVzyaKrUJajuSNTXCBY9e+Zq+cC31TbpOEwQ4LViiaZYEsNt/yZfvNJO3rRXHPlEhdb
 muyke0epahAI1yYtt4ywuH0mmS40w67/SMnors8XQuurU1g/XzDHutvTBEUMlr2DILbg93bJr
 vNw7XeS1NTQr8JiWd/JyPu+wxVbQy7numgJMr5IGZj7lpqHLuFAXyOs+vqHFiqIVuGvrZ9jK7
 ijWAJ3/6pJZ0oFb3xF9yRwHQrJt1KKC4ihGvtyLbr0IXXfLXXlbw+30zDkoEw2+ZjlAhaN01K
 psD41gvM9+3nav5sa9+uoWI5C+k7F6S5ZPId/6gSsmOPjG5Hwayl3mw3lpVmoR0w3A+wYaxy9
 itZ4QuT7aNglxYVrw8KMZ86eNdPLHCz3slnH3lrYaQyD6/J7Obbp0s7Fo/LpMcLalxdMsziVD
 09AHorANM7RZdQzsvCS/Mba+geTTfrEY/bal1kABvKf3b0nZm2Ec5f3q6VhGrRxzXn/IuUx0b
 3ekCnWwJTx1UTLfQPBdLyKipff0uyayhT0YUVqtlsXDWW5u3/Avx9WrymRomYkzNwgcvIPtHc
 h+/vWHD9ixle8Y7az4KjHh9R7vfFOt2Erkoe1rlCKkq6hQoxh/8bJeZmXtgSRFtV9p4HHpbvg
 x1/4HvTXyh09ZbL8ejykuRXjLh1TIJX1g3nIOYV8XWVJ9VVo/7A3apHiI8lJQhYoxZDU=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> The MacOS toolbox ROM accesses a number of addresses between 0x0 and 0x200 during
> initialisation and resolution changes. Whilst the function of many of these
> registers is unknown, it is worth the minimal cost of saving these extra values as
> part of migration to help future-proof the migration stream for the q800 machine
> as it starts to stabilise.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/display/macfb.c         | 8 ++++++++
>   include/hw/display/macfb.h | 3 ++-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


