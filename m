Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF65E9400
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:37:54 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocThZ-0007iP-V9
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTgV-0006Jl-4v
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:36:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTgT-0008EG-E3
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:36:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7KKA-1obMgw1ZEq-007lEg; Sun, 25 Sep 2022 17:36:42 +0200
Message-ID: <082f3586-f737-428a-ebe1-abca3b91c410@vivier.eu>
Date: Sun, 25 Sep 2022 17:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 09/12] linux-user: Add strace for clock_nanosleep()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-10-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-10-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YH7AVf5LSLgcKL0ggSz+C7d6x2njmFRlCI41wCRBoa/zl7oA690
 /8ZHD6LNNXwRD/gACsVRD1PgYbNYxjNriAdQB6EW7u+EBhczAy5gpIpIVdzQb7FPPudSz6C
 d4N1Hx4jE3Tg2/I1u/sBukSg9s2L9cJptAdPRRfOgKfy1BjRwcEVkvL3mvIVJtecJR1wARq
 DjVzsBFy2sRNV/ash5MYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sLBiC6DxtdE=:YrgJtMUJjHr6rAa5Qgxw3v
 jNP2ERij+2OtQ8ln+MhsVbCQvCiEw0nSlYvJRib0EhyhZCieBowvdvb653gWJUXZnmGQHUlt+
 1/ylyc0uY92svZLTeqcWiWF73GRCSlAE/bOZ89W6LwclfJThsj6Wt0VxbMhKNk0tAxMcSpATW
 Ygt1m3YPJsFv+g3bDY7kc5hHziRhI1Vgr1AU80KsoQ8ozCciVB/t/Hl+NN2w8wqMEENDhdRF0
 p/NMWjWiQT8XK5d3JelnDZ1jG3/9Mskw/9u8suTilL0mFmmz3P7EZTeWbQdrEPtngqIGjuUzU
 UoESi4ZtbvulzgAowlNOiAXK4+cu2h5bcvrqOfGQGPg0JEX0juJjo4zOvmcBMxKAQ2pPLh6EB
 mN7Jyo8dl1uCi0ho3lgwTSjVjFJcphsPHYZxR6A6k/toNKoT9gqgekSsq7g+xt4qJUcuZy85/
 F6T+KIJuOvlh0TtqnuQ8x2D9F3YyDJsJ1uIRhFIU6e7xzTmNQZsI4JfkxY7vv8zvNmJEHHAsU
 33s1N3OCMtzdkgPi0WC38c7ApXM7KmqAx78whGRtzc0KCie8ZgX/18thZ84qNG9uKnoc6njof
 c/WatJj+OdN1kkMmUh7MVinG0t6DsKYOukUHxXJRR70xPq8HB60a2I6XTykoKxiAx/ESVAF5x
 t1ecBmFUgSxuw14YAoSJi2vpqAtxTPSTqyz0T//YmSZgM+uG+CUtQbyZZcJO7D/oiYBFRMOHD
 wplrwiiyA9+b0GRCvt4iqv1lW2FIkXof9WP4p98wxfahHK7d6Lvb6Z+uv/R3/dHbzPQEYK/WN
 pSOpUh9
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c    | 15 +++++++++++++++
>   linux-user/strace.list |  3 ++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


