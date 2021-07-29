Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B93DA0C1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:00:27 +0200 (CEST)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92q2-0005GH-Fh
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m92ou-0003r1-8k
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:59:16 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m92os-0005uO-RP
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:59:16 -0400
Received: from [192.168.100.1] ([82.142.21.182]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N0o3X-1n5fa13NMz-00wlBJ; Thu, 29 Jul 2021 11:59:12 +0200
Subject: Re: [PATCH 2/3] ui/input-barrier: Move TODOs from barrier.txt to a
 comment
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210727204112.12579-1-peter.maydell@linaro.org>
 <20210727204112.12579-3-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e7b9e5f6-8eb0-1a3f-7457-959f5b011c29@vivier.eu>
Date: Thu, 29 Jul 2021 11:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727204112.12579-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cwS5TQSHeuiz+FWyyp2RiswfPB/26Gp++bRecan3JzDR6QrB2aF
 mzCPBpXxvWlaa7vmzzI0T/YkhOcstHMoepMIEgx+Q/JD+DpAJdxf8tCQapC2CXCblBJFp7L
 7PZFFPTgLAtfBxle07ieQNuYOlqqAhl5Lf1XZ6dI7+6JUPTi4BxVi+qBdO6R9TdOYQ9PCed
 m4mRgyQieAXWXxtGyDV9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:olDCK1ULP3M=:zumRNCHhUmX4OFDYwBOGqp
 5d9+MMGXe+K+dVNXbEto8y5rq5OQ2eNCNyB+7SGOgnJ9BorCG4yEfih4zd7CWOdAfR3I3yVF+
 ykl/4uAZKksiEfMRCqqPFf8HnAetz0T062WfdXSyR8asYr7NAZTz2hiDH9Otd8xsReDrKft5w
 roZlf9Ielnj/HNEXGMztk2njplAvz9wiyW//NK5SSsST2CMg2U/Q/MUf7U+SxHqEgRvMpFCXu
 rtMPeM+g6gk33LXVgO9+anCjFm2101rbqegKgfGrmD6IKLrnKli1i0eTy4Brz8/WzzWcTEbas
 F0JLGWa04aCRIZj9kHnGPxu2xGC/FhLjhAJYclvVxKzmKhyypourVQxFKCkIh5idnxmPXVcNw
 aRh9Xd2t7os1p3YcFnX38Kev7jr6Qj5XSnDIpYNbXpmIz0KAj59pgrhmt6Zv0LZvrQsllFg5B
 Lx4pVsYFkvD1RsNkC4fQTDvEQ9J0BN6MzI/kUUg7ByXpd9CiFm+SoWhKaERqveydqTZgcGLYC
 etzZm6Lrbph1e49f+WxX7smC1Kfd5n7qWv0+bIL0wHWGUG5Rcp7eSte15VERC1OYCNB0XFViM
 15TqIaRafJ7exfg/zQhYSCDqL85T8QZ39zNAB46PWPLOUs9AzkQce/ggAPd+GQSH/ZIvM3Z8U
 0fO/tzxWZMTvrY9vpbbRoIiqUBHjnPo4VFBff/ACxOjq3jEHwt4zw37WFVMY3syL1dGd9VRh4
 JHH65KUxYKe9UMfTCSAytlk8y2qx30nzWWCz5V4E3OCMmwy0a6roHt5L6uP31aJOkLKnkknc9
 dlHOq4QaKnKuW0krO334AnjR3pusJoiq4E1t3FU4QMqAIWJDMDTiu2nk5wak0FOdhc5Dlek
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.277,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/07/2021 à 22:41, Peter Maydell a écrit :
> docs/barrier.txt has a couple of TODO notes about things to be
> implemented in this device; move them into a comment in the
> source code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/barrier.txt   | 4 ----
>  ui/input-barrier.c | 5 +++++
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/barrier.txt b/docs/barrier.txt
> index 376d0b2d709..54cb5fd8efc 100644
> --- a/docs/barrier.txt
> +++ b/docs/barrier.txt
> @@ -45,8 +45,4 @@
>  
>          (qemu) object_del barrier0
>          (qemu) object_add input-barrier,id=barrier0,name=VM-1
> -* TO DO
> -
> -    - Enable SSL
> -    - Manage SetOptions/ResetOptions commands
>  
> diff --git a/ui/input-barrier.c b/ui/input-barrier.c
> index 81b8d04ec8d..2d57ca70791 100644
> --- a/ui/input-barrier.c
> +++ b/ui/input-barrier.c
> @@ -3,6 +3,11 @@
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
> + *
> + * TODO:
> + *
> + *  - Enable SSL
> + *  - Manage SetOptions/ResetOptions commands
>   */
>  
>  #include "qemu/osdep.h"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

