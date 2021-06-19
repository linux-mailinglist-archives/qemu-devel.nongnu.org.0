Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5073ADAB9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:46:59 +0200 (CEST)
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ludBO-0003wy-Tz
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lud9y-0002x5-Pd
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:45:26 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lud9x-00078j-0L
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:45:26 -0400
Received: by mail-oi1-f176.google.com with SMTP id s23so14487618oiw.9
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 08:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0Ryyy75kU74FUt0K55PwHvc6fudc0X6WVaY70YBYULk=;
 b=lq4DgbGKa4to1I1BW+xGsS24Oy/ksCXMqmT3xQtVVtABWHskKVDI6CVFcflPDa7YVK
 IQ//v1qr9yFiuj+ETQQt+PDR3WEw9NBwxaTHH7wiwyr4v5mn7gjd5bdz+24xNy7O6ilC
 sRC+JPOdlVHilVR1LJYscCNUrBHDjnc8MK7cFRIS55KD0wpWSPruurQEJ1pflP4pAyJ2
 zdQKMOlK1n9vs4HQct27o4zRpz569nMkOendDX1Th03lRi0ujlYKw8xGq2XQrB1TO7kY
 4Z7Zj0fYG2iFINESPkwuQCC6VuTbu0TM45IFA8pOG6Tqpy0zVRahBxKFpUNUED5p0rWu
 FTJQ==
X-Gm-Message-State: AOAM532rftwvsAxbzf99utp7VsU/3YyqIkaSRdo9ejIKektocG+rQzHc
 aJNUibjQfXmQSf2Zrt3pqCi4QW64mfUzqRO8Aww=
X-Google-Smtp-Source: ABdhPJzIo0nx/++5iH1zZ/5yu1Y42sDhN/Zqtl4yPUElsjogOSZJHZeh5+sWdK828di728i1j/1uc2/ywsR2mJhHHbc=
X-Received: by 2002:aca:fd44:: with SMTP id b65mr18749184oii.175.1624117523819; 
 Sat, 19 Jun 2021 08:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210619154253.553446-1-sw@weilnetz.de>
In-Reply-To: <20210619154253.553446-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 19 Jun 2021 17:45:12 +0200
Message-ID: <CAAdtpL42eKATkE0UcjoKfJfKv=4a7e297bFdKv+9xGHsngKMRA@mail.gmail.com>
Subject: Re: [PATCH] Update documentation to refer to new location for issues
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 19, 2021 at 5:42 PM Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> Another update is needed for scripts/show-fixed-bugs.sh.

Good catch.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>  .github/lockdown.yml | 6 +++---
>  README.rst           | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

