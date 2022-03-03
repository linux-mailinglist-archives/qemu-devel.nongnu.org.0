Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655444CC448
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:48:39 +0100 (CET)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpZ7-0005AF-Ty
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:48:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpXy-0003hQ-Nt
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:47:26 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpXx-0003yh-69
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:47:26 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MYNW8-1ndSPY3bGM-00VTWs; Thu, 03 Mar 2022 18:47:22 +0100
Message-ID: <eeca5c7d-188c-ff1f-ac6e-ea8220059506@vivier.eu>
Date: Thu, 3 Mar 2022 18:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/12] mos6522: remove update_irq() and set_sr_int()
 methods from MOS6522DeviceClass
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jk/gYHtGjDnE2GsH0y5/ersBouJgE8XAW43D6/pdHjTLow9ONpB
 fzHpGKfkEOh/EYo2x/mgwVnEuw4ss+yz3n5/KpGTMCDbp10YNtO1m/VkiwkHfYaPp02gklf
 yPpwAhjUBBQCOk8KKR64eKO/L2LBXFAOo4QC72odQTqHoCaixr2ESmZ0Ol8ndqPgszhIYvA
 +N+GeQbsxDVTju9xOhcKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/F+4Hk84yv8=:uWNGCsSSVp+kiFPSc8d5HR
 RH4bvNnubqk3u3vxbstUlDkRbKW118gbS3G49sUrhbKK1MwNt+zDpMl66iH/hmp5EMhDR63bV
 T+GL6K3cx4x5PySo0rYJV/M1knqDl83KwLH8Fj1W2L2KWiQZGnaD+yERgf6vbcDTksdaKNlor
 yqYmPW5qVwfo8antTh/00VNXVWJaRjM2RtfVhYmDO09X37zv4BB/8ZzWT7fN7JXA2VWf4dnU0
 xB5lSSNO2QDLDYflYKL+zw9KgIU7UyZ6b4WBpxZV0rt1yblHg6M16qH8qex870GfI9W60qJbU
 G7sonLf6iQaUyeQUGEnHccbldMMggSZHusZmTXtfYTagzh+a/T/Znva+LMcUmPtOh6SpvAID7
 Ijc+L+XMar9O9bQHLp5PWKm/BDB/cKBwYZN6+jJKKZb5o6kMUKGwbEow9YiENankeeB3hMjSi
 hu185FJ+cWEH6lrwx3pVyFQ4g0Hd4U+15nAgVocPvLwq8Fn+0pa/8moFVC8x1AR5Jz2rEKkw3
 NqgDp6mNhDr32zK1Y4K+uv4adiu7tmARMaJ7XjwKtE3zqV+QzlPg/b5OKZ6X9ALF257JoLD8V
 +Jh0jtxsOnOsKfXw1XRyFK1KDXLEy9Y/t32m0Z1vWCQTuXY93l5cEvB8o20H3h5FH7/epSQhd
 8nLDntdgCOvrNWH6IOYEqxKU/MHmtRWZe4LDvZotaV/OdQIE+RrPQZs/ZTlp4MQ05nuc=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> Now that the mos6522 IRQs are managed using standard qdev gpios these methods
> are no longer required.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mos6522.c         | 9 ---------
>   include/hw/misc/mos6522.h | 2 --
>   2 files changed, 11 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



