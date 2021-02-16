Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9231D028
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:23:23 +0100 (CET)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC50M-00015x-32
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC4yi-0000Qq-MM
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:21:40 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC4yh-0006uG-7u
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:21:40 -0500
Received: by mail-ej1-x62c.google.com with SMTP id n13so11498226ejx.12
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 10:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dV4AiGpKRHbQ44elFAEmOGZxzbFj2njRzLNiN9yuzKs=;
 b=eU8SVgvLQwnZ1TE1K8+yHo82rwlkrQXTmGlul2QdfzZx4rhwwzRkgJyT3N9t7TMN7M
 07lT0+pjfETR1bX0mF3NA02F5QW3Q32qL+PyAT6lOEPUVak+004hSXtX6vLeURLQi8e+
 2lRWsyjsE7tgzQKJhslHbVCQchNn2RtwyQIRk6kIUo+Cbfulx6p13A8eNRAYjlW+WhT3
 erLSXgFLFojl0ArCPxXJT427kJHa37iZBK/Cul1IHwoC2GlX+TXmyVu6NQtlKGvkEsim
 UHL5stSyf1HcDMqz+wMOSowkGlW8VSg5cg3Ut/dUhlajukViPaHJusvoq9nQpQ9fSaJJ
 JJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV4AiGpKRHbQ44elFAEmOGZxzbFj2njRzLNiN9yuzKs=;
 b=jw/avoedNqUFfSu840zjSqQrWHfIOAxpouutIkwvQypAcOb+nzCKBJo+u4xjt43zdS
 CQ9L2myuww+FDLGej/QeI81gKQWrwFQhzu/60zmZ6i9mzCBd+Lcj5F+w71TBdjYzKCIV
 ezOXNA0l7wIgLaNdUYpBsYSRa++Ex0404OrGMdWEO+SdqUTxXZzqRqJtQFYt2nCeCJ0F
 mGuIZc4Vkb1RbNYR9xRuy7TcztfQjdVNrBfF0L6OpppmaSiCxAT3KF6Fbha8308/tyDG
 s9nCeCYXi6m+/4LqxfQQ1ALFwHLvTAD4MGVH3djIYeDJQ29t1siWQj+gmrRyyVjGczvb
 qMkQ==
X-Gm-Message-State: AOAM530oyhkYX9mWzt9f0atJOlL+Awf9mpwGjXunRTuVUjCjqZVBTIAN
 7Fnno97+ri1UgGWpexl7fDZ0N/xFPWxw5+PKgBJGhg==
X-Google-Smtp-Source: ABdhPJzu7KCt/LDIUqvD4WSSaPiYwBGQFCPUjJ2E0WuHgl9x605IYTX/T7g1uCJnvfUu4rR03YTqvmFKRBC675uJitw=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr21894564ejh.85.1613499697158; 
 Tue, 16 Feb 2021 10:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20210216181316.794276-1-alxndr@bu.edu>
In-Reply-To: <20210216181316.794276-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 18:21:25 +0000
Message-ID: <CAFEAcA_reLPQzjN9PJOC3n=iC0W96aF0qzPZtcO3xpCt_1kOKw@mail.gmail.com>
Subject: Re: [PATCH] fuzz-test: remove unneccessary debugging flags
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 18:13, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> These flags cause the output to look strange for 'make check', and
> they aren't needed to reproduce bugs, if they reappear.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz-test.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

