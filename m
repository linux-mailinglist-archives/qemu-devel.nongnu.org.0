Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8852764C4FB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Meu-0000XY-6K; Wed, 14 Dec 2022 02:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Mep-0000We-RN
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:58:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Meo-0000yg-25
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuh3l87vIWevyM8qXH4Kl0V4EZBv5MQzVjFu8r/Ht1c=;
 b=Ra5GHN0ucDtEVLJdD+IMj4cHpzbjDz4+vh7DTwat3HyZipuUDPbZlofCpnlqt4AP2UUX/y
 1w0FMwche8MofG+B57uVoCbXrlT9LurYKxTVrKz0CFZB0mIxILgiDVXRq2See2bMToCTh6
 69dunsFP3ftaJjEYRuhfeXvN6qBbVak=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-YQINMu_sO2qGW92QYdM5pw-1; Wed, 14 Dec 2022 02:58:23 -0500
X-MC-Unique: YQINMu_sO2qGW92QYdM5pw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4027629A9D36;
 Wed, 14 Dec 2022 07:58:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14F1C40C2064;
 Wed, 14 Dec 2022 07:58:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E960821E6900; Wed, 14 Dec 2022 08:58:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Stefan Hajnoczi <stefanha@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> include
References: <20221125175532.48858-1-philmd@linaro.org>
Date: Wed, 14 Dec 2022 08:58:19 +0100
In-Reply-To: <20221125175532.48858-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 25 Nov 2022 18:55:32
 +0100")
Message-ID: <87mt7qmn6s.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> qemu_co_mutex_assert_locked() calls qatomic_read(), which
> is declared in <qemu/atomic.h>. This fixes when refactoring:
>
>   In file included from include/qemu/osdep.h:113,
>                    from ../../util/error-report.c:13:
>   include/qemu/coroutine.h: In function 'qemu_co_mutex_assert_locked':
>   include/qemu/coroutine.h:182:12: error: implicit declaration of functio=
n 'qatomic_read' [-Werror=3Dimplicit-function-declaration]
>     182 |     assert(qatomic_read(&mutex->locked) &&
>         |            ^~~~~~~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/qemu/coroutine.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 89650a2d7f..1750c30d8e 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -17,6 +17,7 @@
>=20=20
>  #include "qemu/queue.h"
>  #include "qemu/timer.h"
> +#include "qemu/atomic.h"
>=20=20
>  /**
>   * Coroutines are a mechanism for stack switching and can be used for

I think this papers over the actual problem.

Compiling qemu/coroutine.h by itself succeeds for me.  Printing headers
with -H shows:

    [osdep.h and everything it includes elided...]
    . ../include/qemu/coroutine.h
    .. /work/armbru/qemu/include/qemu/queue.h
    .. /work/armbru/qemu/include/qemu/timer.h
    ... /work/armbru/qemu/include/qemu/bitops.h
    .... /work/armbru/qemu/include/qemu/host-utils.h
    ..... /work/armbru/qemu/include/qemu/bswap.h
    ...... /usr/include/byteswap.h
    ....... /usr/include/bits/byteswap.h
    ..... /work/armbru/qemu/include/qemu/int128.h
    .... /work/armbru/qemu/include/qemu/atomic.h
    [more...]

So, qemu/coroutine.h *already* includes qemu/atomic.h, via qemu/timer.h
and qemu/bitops.h.

I suspect the actual problem is an inclusion loop: qemu/coroutine.h and
qemu/lockable.h include each other.  See my

    Subject: [PATCH 4/4] coroutine: Break inclusion loop
    Message-Id: <20221208142306.2642640-5-armbru@redhat.com>

and Paolo's review.


