Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73D64726C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:04:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IQm-0008Uj-QB; Thu, 08 Dec 2022 10:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3IQg-0008Qn-Qp
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:03:18 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3IQd-0006eZ-SR
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:03:17 -0500
Received: by mail-yb1-xb34.google.com with SMTP id b16so2004573yba.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=flfiLbJM7qjiZpJjrpqyyocw7MjwMrHpZSmnTSjSzus=;
 b=nEZLNuFlE41CERBY5yysXAFZ8joKbpSQMV3ymMMIHL8mPC4O6N0ZbDsv3wvkgVDdbG
 2i8JRw+L4rZBDbtJ+XsfievCamhDMbwYsJJFaVdtpqfneC7Cqniy7sNIRILhqQWD1OiN
 z+1kAbVKStDWQ9bEacFc5E7UK+r7ALQ8vxrse9Di56FV442iBLg9civJk4dS5WuuRiUY
 sypAYS3+dSPwgPphwA6sw7mM6U7sVu1dFAmMHhvMYuQw8jLafy2ZV64tONaDjXZq31nx
 B456Gag91/YNfmPL6qdQ6Rzt/qdyMdCgQ+uHmJYf3rvrwiWl3Nppk7QyRQoT9/s7uATS
 wMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flfiLbJM7qjiZpJjrpqyyocw7MjwMrHpZSmnTSjSzus=;
 b=hOY2v1WPbzfKCqY0ozOkIUxvB7p1Xt0TuvhzDKYuuDiKCbuHmyWQ3kAgEST7kpPrif
 OT0Ihs+pGSv0HgK9S4KarJzzP7Te+L4qnX3h6oS1wnRlCicriK37Sply/T1RvW5/FvoC
 OTZWUIA9Jmy6biy6ugCdyz3bCAKK8uUvRNA/R+M8c6Xq2DqkPsONHUblXVb98kyq1bXJ
 KKIVkrPyWAFAChlLPuGelSfJKDKqydJ/ah1Grs9fWblIn/SV7paqJQbvaiMByKqrKX3Z
 O1KeidPiaWjdaNLEViu6rsKQ8TnQHLiS8KYxyHzE6UVkfKRSvRNY8cCCxN+4xQ5DMXjr
 /pJQ==
X-Gm-Message-State: ANoB5pmb5hkdHyTS8LCVOelq4ZP5YfeK/3eDfgpGATBf4StJOkJ/725u
 c4Mwfnx8pm8PDPtxFFd5yDYEUSZIaB1H9f4yLbM=
X-Google-Smtp-Source: AA0mqf6NvlBXyvMXJJ0X/VZTLi8LMqoWBr8l4b9mK/kf+38VMDC7H2HZRK29SgVBN6JDpze8D+X70l++yTryQD+drm4=
X-Received: by 2002:a25:a189:0:b0:6ee:f3dc:b8d0 with SMTP id
 a9-20020a25a189000000b006eef3dcb8d0mr71294033ybi.642.1670511794039; Thu, 08
 Dec 2022 07:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-3-armbru@redhat.com>
In-Reply-To: <20221208142306.2642640-3-armbru@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 8 Dec 2022 10:03:02 -0500
Message-ID: <CAJSP0QWfZ11aoMEGH3NXa2bNi9K9xLxKPF_aJ0isSejiq2UAvg@mail.gmail.com>
Subject: Re: [PATCH 2/4] coroutine: Move coroutine_fn to qemu/osdep.h,
 trim includes
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 8 Dec 2022 at 09:25, Markus Armbruster <armbru@redhat.com> wrote:
>
> block/block-hmp-cmds.h and qemu/co-shared-resource.h use coroutine_fn
> without including qemu/coroutine.h.  They compile only if it's already
> included from elsewhere.
>
> I could fix that, but pulling in qemu/coroutine.h and everything it
> includes just for a macro that expands into nothing feels silly.
> Instead, move the macro to qemu/osdep.h.
>
> Inclusions of qemu/coroutine.h just for coroutine_fn become
> superfluous.  Drop them.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/block/aio_task.h     |  2 --
>  include/block/block-common.h |  1 -
>  include/monitor/hmp.h        |  1 -
>  include/qemu/coroutine.h     | 18 +++++++-----------
>  include/qemu/osdep.h         | 16 ++++++++++++++++
>  5 files changed, 23 insertions(+), 15 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

