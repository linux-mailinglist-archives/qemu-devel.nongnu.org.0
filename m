Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BDE6DBB4E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 15:53:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl8zY-0007Ls-9v; Sat, 08 Apr 2023 09:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pl8zR-0007L5-DL
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 09:52:25 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pl8zP-0003tI-Tj
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 09:52:25 -0400
Received: by mail-ej1-x62e.google.com with SMTP id sb12so2627168ejc.11
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680961942; x=1683553942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3CNDWoamjsf5MiGR8eh7cg7n+vECFA2qV3423wVkc4k=;
 b=OtafJBhLPaz0ogKwxqNhmXbocKtupWyhjUP0O+2CSMZPyZVbGozsZtp2tHnakTaVws
 vuXjjDcj2YDgKL3K6NaCzZTcCy7BU9NynX/e4vG8IxY9qZQbHbaKXE1LJyQCXNpy7Lpm
 AHgThlvI6q6HQ3h7lS6K8isSiZopMbQIUIsiuevEEQ7trhKnjT7og+S7lquNb7PFjTVq
 O8WaloZxhj5gQ1ZkztJvzYdQFa9U0eNlJVDm6iqwzvKkKHCKuRi1Nnt88UgW87lw93eI
 d8LkCRW+f1vADkOgHQVEpYC7pwtjr8soIrrbK4Y9PPr7Txq21e2Bfn6k+RmsvMJA16O5
 fibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680961942; x=1683553942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3CNDWoamjsf5MiGR8eh7cg7n+vECFA2qV3423wVkc4k=;
 b=INqpI4oL6w8wBFQvj7LYVcEwX9LLCZ6aIC6hDdwJ8Yv9WSP5Nb6f5Rrbar2diGIwRc
 8Nm6ya4oOJfBkR1hQhsT+qHvWr2VL0uKiAshlWZdN1rRk1cr/L/oaslu6yKofMD/TrKo
 Do23roXy1O9sVw0elAUpwNE7kRVdNXUZlx4nZJ8mve/qAIkHZhU3Wa9pFswRw6l9ZDqX
 mvEPJP5HxCmUUOdbwnIBASzKb+Ixqo1VwYJrCdsK0bUiyKH1YZBM1u24xa6BrRB85llb
 JC1RREcNh+baosDqaYYmvpgoP2bqP6a29xizi+U2BmEu/LK56wN4QHEGebufV7qfQg98
 345Q==
X-Gm-Message-State: AAQBX9clCrH6SucgxGMWib9zGktP7xwXtDaDFSSSeoDvOjvgr3jhczQ1
 Y/fHs+JhqKfpdXZurNYR2VKEQv2qgXqUK/rhDKP8yQ==
X-Google-Smtp-Source: AKy350aMt4kHcmpkLG3yGcpmMCfZWjQn89peUXp9DG7A3TxkgqH/QQmBSlEFNKseWw5c9NJ5K8Yt8FSVkZBRoVdYcao=
X-Received: by 2002:a17:907:8b99:b0:924:efbb:8a8b with SMTP id
 tb25-20020a1709078b9900b00924efbb8a8bmr1175693ejc.6.1680961941944; Sat, 08
 Apr 2023 06:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230407185149.3253946-1-richard.henderson@linaro.org>
In-Reply-To: <20230407185149.3253946-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 8 Apr 2023 14:52:11 +0100
Message-ID: <CAFEAcA89EfOzFdcvaxqzvbSTCgL3t7+Wsxqr=ON7onHJJVwutw@mail.gmail.com>
Subject: Re: [PATCH for-8.0? 0/2] target/arm: BTI guarded bit fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 7 Apr 2023 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> As reported by Coverity and triaged by Peter.
>
>
> r~
>
> Richard Henderson (2):
>   target/arm: PTE bit GP only applies to stage1
>   target/arm: Copy guarded bit in combine_cacheattrs
>
>  target/arm/ptw.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It looks like we'll need an rc4, so I guess these are safe enough
to go into it.

thanks
-- PMM

