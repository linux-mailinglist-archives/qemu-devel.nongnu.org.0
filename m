Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E295BA4BE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 04:45:32 +0200 (CEST)
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ1MB-0007YP-Bn
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 22:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ1Kd-0005NT-Mb; Thu, 15 Sep 2022 22:43:55 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:39642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ1Kc-0006eh-7m; Thu, 15 Sep 2022 22:43:55 -0400
Received: by mail-qv1-xf33.google.com with SMTP id c6so15680471qvn.6;
 Thu, 15 Sep 2022 19:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=I9ZERo7y7f6YRPFNcDCOCFd7Q0B+xYbihDf5xlttotU=;
 b=h3AbMxFPHV0XT+4oy3wtGv5PE7JVB2fGZEDyEen9nCXU3vsCXgEm1CdemSZGfWDUrb
 BPyXhoroUw4gQ508fRVXsx5h0PuFrNA7Iarlaor8sD1t1JAILCoM7aBziXhCHeNSYexN
 Sjn/RAGIjq48dUxDUUqoYoqiG/Ca9rJ4YGqR+zP1oXgo0+MtSFGXVLe1PymbrvEvfJlT
 XE2W3IvkoEDeRgttvsXZUdhtTvGROcqFGH3Xr4mstaSOPZB/ACK7jwPrDoNXETi6iHY6
 ijsqlT8RroNSq1hcdj3sRYpA/2ieY2VTA1crapr+2zC4HJjZcONkHJ5wi/qXeAjV+oDQ
 lCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=I9ZERo7y7f6YRPFNcDCOCFd7Q0B+xYbihDf5xlttotU=;
 b=o203bUsCisAzAEjxmDzJudht9XL/8bO7Hx7EU2V0G+P0rzLzo4Mhn99gTxhU2UJG91
 5VwhpJxumgKfXh9LlFHc14Ob6imOlZXt4Qyj8m7abiuaV5WTKTsIc6aXFi27A7ayu9lr
 fgpHt7c/G3Ap8DIzNyCTBLX4Rt+jSFfAG9ZSJPWtTuDyVrO0NkRwCdq+SEahbTMJQeIb
 V/uj6rQsAENSxwfp5VPTUV0IGPdA11IKkLsdfMusbV3WQHJdjE4Jk+cyuoY49r5vDOxt
 1IerWtxJY1DEGDYbG4I4r9Lchd5R690Y72wEDcxF8b61MocjR533GODckeEev4a6EAOl
 6D4w==
X-Gm-Message-State: ACrzQf2S7Y6O3vpqWRO6KDc33K+4jab65CglU8xKuvQZkoZ7ppp8jiJY
 7J5pP+n/68RksH0J0Wq//hFe1DCUhMuVElusviY=
X-Google-Smtp-Source: AMsMyM5AsyyzC4OixJKgTBoWCtLl29ZmzIbkgTgkeMH8+XkfYukT630j/tbApld7DdSUBMc7nsNTyx4QiD7Gx4d2XSw=
X-Received: by 2002:a05:6214:20a8:b0:4ac:b917:ccae with SMTP id
 8-20020a05621420a800b004acb917ccaemr2149226qvd.85.1663296232037; Thu, 15 Sep
 2022 19:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-4-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-4-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 10:43:40 +0800
Message-ID: <CAEUhbmU0vM1ezkMnbU=X80TCz6v0rq8SiyjPRY_EYHsNYO1e6A@mail.gmail.com>
Subject: Re: [PATCH 03/11] docs/system/ppc/ppce500: Add heading for networking
 chapter
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf33.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 11:29 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> The sudden change of topics is slightly confusing and makes the
> networking information less visible. So separate the networking chapter
> to improve comprehensibility.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/ppc/ppce500.rst | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

