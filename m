Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C23D5C4F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 09:26:51 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJukj-0000Ev-VC
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 03:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iJujw-0008Ee-4x
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 03:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iJujs-0007Dx-LW
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 03:25:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57564)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iJujs-0007Dn-GP
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 03:25:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9F92281DE3;
 Mon, 14 Oct 2019 07:25:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A0E519C58;
 Mon, 14 Oct 2019 07:25:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 928E61138619; Mon, 14 Oct 2019 09:25:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: Re: [PATCH v3 1/6] target/mips: Clean up helper.c
References: <1570901866-9548-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1570901866-9548-2-git-send-email-aleksandar.markovic@rt-rk.com>
Date: Mon, 14 Oct 2019 09:25:52 +0200
In-Reply-To: <1570901866-9548-2-git-send-email-aleksandar.markovic@rt-rk.com>
 (Aleksandar Markovic's message of "Sat, 12 Oct 2019 19:37:41 +0200")
Message-ID: <87eezf6b5r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 14 Oct 2019 07:25:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: aleksandar.rikalo@rt-rk.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aleksandar Markovic <aleksandar.markovic@rt-rk.com> writes:

> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> Mostly fix errors and warnings reported by 'checkpatch.pl -f'.
>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  target/mips/helper.c | 128 +++++++++++++++++++++++++++++++--------------------
>  1 file changed, 78 insertions(+), 50 deletions(-)
>
> diff --git a/target/mips/helper.c b/target/mips/helper.c
> index a2b6459..2411a2c 100644
> --- a/target/mips/helper.c
> +++ b/target/mips/helper.c
[...]
> @@ -130,8 +133,11 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
>      int32_t adetlb_mask;
>  
>      switch (mmu_idx) {
> -    case 3 /* ERL */:
> -        /* If EU is set, always unmapped */
> +    case 3:
> +        /*
> +         * ERL
> +         * If EU is set, always unmapped
> +         */
>          if (eu) {
>              return 0;
>          }

Did you miss my review comment?

Message-ID: <874l0ydk00.fsf@dusky.pond.sub.org>
https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg06719.html

[...]

