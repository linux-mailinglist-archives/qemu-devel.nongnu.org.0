Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEA26E6CE7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 21:23:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poquF-000430-6d; Tue, 18 Apr 2023 15:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poquD-00042b-6T
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:22:21 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poqu7-0003WZ-7D
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:22:19 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54f6a796bd0so356797827b3.12
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681845734; x=1684437734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LRyV+cm/eNFY8MSXEeXxesokSKtjBfzuXhubu8O8K4Q=;
 b=YSy0LLj1f6oBLHy7UjyGwTH8bEL+kcolFw7wdkgYIAUNlqZNuMDbnhOz3cQ3JulROq
 p8YVmaXN0E1zAo6lg1ze4+K5y7TTBag5ccxGlqMMVSre9t1zA1IBfWoDyf4m9R8IiA+F
 k2gUksKj8yWKubiYl6TkugG+3h2UU4+ZQo97d7DBTgzfD7x8hulVG8ykkjoXosVUjqk2
 YrCmuYy4jbLCViMunqM9jI2putew1k2bFq5rUHr3w08NN1ovOzkGekFq893adob/Q2O3
 rVcUS1cFzt4jx1tfLxluVqSO7BxTyL9Fd4Fty88ooGrZn4pu+s85vCzeeNzW3d8e8lWR
 bmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681845734; x=1684437734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRyV+cm/eNFY8MSXEeXxesokSKtjBfzuXhubu8O8K4Q=;
 b=JjX6nHKhEFFXH01SiGlET5u39kpzbgqHLFFBNL23OP5dxp5Dt+rZJ8w+jmR89If+KA
 IHBR5JhlhEz2DmizUpPhrale1MLZAG8m5+QBRQNESIGe65dpRsSXxXCz2CH1Y0AI7ue9
 W50z2zGrogWSHYwW6x3/Msn2TjWOTyHg1SD0aooQJG4/ieUYqIF+rx7scLSXxROi7Ego
 zPAGDvElsDZfVjLSknhUi/aPaKngTdjLw6zWxGevqeIot9YoBEsHKbhD0NJtBRpNicOK
 pqgt4M2tlcc3ISb4BStWMM7IBSA9pvnTkU2lHPqGfR4UvC37oU3TS8o9WcPh+E/1MLso
 xmYA==
X-Gm-Message-State: AAQBX9dRX/zcQHmAKO1Kz2FUsmYebX+/x43QupTcENGjfaCjzC9m2yeI
 5023TK94fhqJ3mJBGKN7GGyuuMHOF+uvxQ3EH52kJVXGo7A=
X-Google-Smtp-Source: AKy350Yy6pJV3KxVVZKTIpVixE+qVPpr5U3BFGSQrlcqBANYzLR5oh99ucXfu0so/nUDvbhzIbQBbuRGqKoLDPDtQM8=
X-Received: by 2002:a0d:d283:0:b0:54f:d816:895d with SMTP id
 u125-20020a0dd283000000b0054fd816895dmr905322ywd.28.1681845733781; Tue, 18
 Apr 2023 12:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230408010410.281263-1-casantos@redhat.com>
In-Reply-To: <20230408010410.281263-1-casantos@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 18 Apr 2023 15:22:01 -0400
Message-ID: <CAJSP0QV=Tbtnv+Tmp5MXwBJn=YnATOSt6yTQgiSXo78uF1Cuiw@mail.gmail.com>
Subject: Re: [PATCH V4] tracing: install trace events file only if necessary
To: casantos@redhat.com
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 7 Apr 2023 at 21:05, <casantos@redhat.com> wrote:
>
> From: Carlos Santos <casantos@redhat.com>
>
> It is not useful when configuring with --enable-trace-backends=nop.
>
> Signed-off-by: Carlos Santos <casantos@redhat.com>
> ---
> Changes v1->v2:
>   Install based on chosen trace backend, not on chosen emulators.
> Changes v2->v3:
>   Add missing comma
> Changes v3->v4:
>   Fix array comparison:
>     get_option('trace_backends') != [ 'nop' ]
>   not
>     get_option('trace_backends') != 'nop'
> ---
>  trace/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/-/commit/d0380c64b4002e6da3b6e205468030d9e76dcc4a

Stefan

