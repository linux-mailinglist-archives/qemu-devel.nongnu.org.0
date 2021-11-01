Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0AD4423A2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:59:55 +0100 (CET)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhgHS-0007fk-Ni
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mhgEI-0005bJ-Me; Mon, 01 Nov 2021 18:56:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mhgEG-0001Ex-3H; Mon, 01 Nov 2021 18:56:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 94712748F58;
 Mon,  1 Nov 2021 23:56:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7713C746333; Mon,  1 Nov 2021 23:56:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 752B77462D3;
 Mon,  1 Nov 2021 23:56:32 +0100 (CET)
Date: Mon, 1 Nov 2021 23:56:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hmp: Add shortcut to stop command to match cont
In-Reply-To: <20211030095225.513D4748F48@zero.eik.bme.hu>
Message-ID: <dcb85274-cc53-f5c9-2975-184229cc78d@eik.bme.hu>
References: <20211030095225.513D4748F48@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping? This is really simple addition that sholdn't take long to review.

On Sat, 30 Oct 2021, BALATON Zoltan wrote:
> Some commands such as quit or cont have one letter alternatives but
> stop is missing that. Add stop|s to match cont|c for consistency and
> convenience.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> c2: Fixed typo in commit title
>
> hmp-commands.hx | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index cf723c69ac..07a738a8e2 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -382,7 +382,7 @@ SRST
> ERST
>
>     {
> -        .name       = "stop",
> +        .name       = "stop|s",
>         .args_type  = "",
>         .params     = "",
>         .help       = "stop emulation",
> @@ -390,7 +390,7 @@ ERST
>     },
>
> SRST
> -``stop``
> +``stop`` or ``s``
>   Stop emulation.
> ERST
>
>

