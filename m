Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102205EBFEA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:39:50 +0200 (CEST)
Received: from localhost ([::1]:35140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od80D-0001zv-4C
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7qV-0006vR-BC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:29:47 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:50431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7qS-0005Yj-Jg
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:29:47 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNOZO-1ortq22QX4-00OqaE; Tue, 27 Sep 2022 12:29:40 +0200
Message-ID: <8b63f906-2550-28cf-75f2-8c8c2ae2acc6@vivier.eu>
Date: Tue, 27 Sep 2022 12:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 5/8] linux-user: Implement PI futexes
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-6-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BfAKKqPjHMtaAei+tbTxehoxUpnM8wCgxTycie38Csi990f8bkV
 Pg5Sv4DQehi1Sbr4rcbLmRepjjykVNHsRViS8ScCvyPSTfKWqzvXZgMjnb53WshrSALlkHp
 MfiZ5hbriVBCA5YXLeFU+qiiU5f7d9sg2f4Oa3GnEkyRAoH9esXz/1krJcdmIV/BAv39x2C
 UnfrKUxMYqDFbKuXXjsgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sc3pvOAf8X0=:mZGTskr4EpES2DJ/RP7QbJ
 SzPpfw9KEPWEkS2fo+TESU7j5he4sdKow9t41nC0+NBJp5BR3O1ZJ/7Hpnl/oNEswNgFXbyKK
 Hk0oYE+sVPzLRusD1+1cZ06cjoikuAJh2lTseoh0lmlFZp1baSAZmFPT1gxZ0PFhx05W45T2e
 MU7M2vGDhqulUpcSUiQzOkfFAYZ7nJauBPAxdWP9MIsMFIjxkZwL5lgwFvXyUm6dtufPjW/gG
 f5aXHKYygf/0bOJz96NHmlYF2ysm83vOfhJWX/SXXPH05tMKYOZxqMwW3OSjHpjpg781bMAvH
 CaWNCKiBbPG8D6ccIR5muM1fJKnxWXlfTwrMdokTI6Nwkk/6fPqASMXhsWHx1JvWXBe6/314S
 WuM8vVOIjfIwCFehjW4bqvLKWnJnZAfiQDsKeYYYaSB/E5Nu72sxoISsUNvy7B2cQTGakRTtq
 0748w/YkmA893t8iXmAw/02abUzRgD0RaPowRMdO9FNfrSw3mzGbio9esT7J2WsVk5LRxaLqu
 s7/mn5QebUADu873whx6BMGRyqZ2Mw7SF0RjJOE9BWU0/p3qG8dSybrWsBCHXkXB1LkgKkysP
 /PCqpi6D13HOnEJ8Cte93iy9DZQteNTkWMK2StH73Rf4+wC0xdIHryMwO5Fjc0mvIi0hyJZp2
 74GXsPJrPnLYKnhf1sJjnLa9oLyDWM+hO8bKKhjFXelH5bSS18UmLx2uGhLfELi1IDJAquGND
 KdELCP2kmKwf4/hOgMgcTaUzc17h6wMzblO7c+BolLGZzf7dSpmoBB2JlABkVl/VsHEZrK73X
 BkUZ2Pu
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> Define the missing FUTEX_* constants in syscall_defs.h
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall_defs.h |  3 +++
>   linux-user/syscall.c      | 10 ++++++++++
>   2 files changed, 13 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

