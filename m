Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D15E93F4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:27:51 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTXq-0000Zh-Ab
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTWR-0006Ed-ES
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:26:23 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTWP-0006Sa-Vl
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:26:23 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDyoU-1oUkIR0oYW-009z57; Sun, 25 Sep 2022 17:26:19 +0200
Message-ID: <b4c93b03-fce6-1107-b945-3739158eaf63@vivier.eu>
Date: Sun, 25 Sep 2022 17:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 04/12] linux-user: Log failing executable in EXCP_DUMP()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-5-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-5-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xvvgYIl5vAAdcUDUgQc72H3uL59CP7zAQOAMF0kkqGGtNPe3f33
 2OU5kBFGEkdQEdf1AoULDweKOEL6nJfOv+q4wjHyM+2kO1uvpeT5NignvMSsPyqjjXajU9W
 SMX+xeLH4Z1KLzvKn45jygEkq7j373XF7YQwEVcgGi17TMubf+YYO3/v8znU5lsZk/aZLd9
 2C2/IOvuLZy/c04vyOLgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qSSORcxQF1I=:R0yzxaKbbJJkyULRwFHTGq
 ZCNyODwVfSAKHHeuOhj2yPS++9829dhAemgPoBXGvkR5Yikr3jxPJgh4ZAsHIOGt4wWHGFM2z
 Qdz/PK4jHLzE5eHeeHLlBOzXzWmgRJelZHeKvxWK3UlCusOx4nGc/LklN8VnbcrF+NIRMgyQy
 /JJLzg/qOTyhlgRbeP+tQH5PCOo0s8rdx3qrAxTfwPDo6jrKbSGGPNHY3FVu0j/q8hk0dHbLK
 53fv5KAO/2g2Mw4chRP4mJDDJhQZLNrl5B+BMJ4ht7e6daS2AIvqsoL9b8vkh8z1iB0qwS5qd
 28zp/JcMCcw5KCJQWtkCMRE88SoYzrFSROWvHx5DeZnazh1Ew7TPpnKTzEIoTcGvZxERAjnAQ
 8M0Gq2Z0I8hlj3K5vKJAH+bvpFJ6iTCdyYiLsII7sTqRzx3HFHqhiNL0/GDvlMynNOZN6fvYa
 f+vxqNaqYY2t5nGQwPZ00hLoz0NqgSKeCE7Zanw65IvBcc6P+w3B4Vbpj+B9KRCNW2x1EEgnt
 TQg83eJfDHdBrC4++Vybwyt2r8kydkzx6pHYiqSh7RtKTSgTt9kIbaTs9RhDIZGY4dtkg0434
 11EacRmMtrYMomV+aY4wsSDkQ7GMa11yHKljiuqg1qNAu04Km/61T0lr+v2mX/NJeebVxkaZ8
 6WGDD4Ns33zXAxT+sefk3gPs+B3jnzcLOaq2KXUfKpHyf9e2CBhYFlAP6KR/e7P0LzBTNH6FX
 Tvlag6njb+iZ7gvKkjHbY7D0Emo4HN9rdZqtclvzUgpT49/M+D09sarBp6WNJAh+8ZBw3WJcw
 uvQhHtj
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Enhance the EXCP_DUMP() macro to print out the failing program too.
> During debugging it's sometimes hard to track down the actual failing
> program if you are e.g. building a whole debian package.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/cpu_loop-common.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



