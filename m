Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC363B36A4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 21:12:04 +0200 (CEST)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUlf-0005I8-DF
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 15:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwUk6-0004Vd-Dv
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:10:26 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwUk4-0006ZL-I1
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 15:10:26 -0400
Received: by mail-ej1-x636.google.com with SMTP id he7so11093635ejc.13
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 12:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DbHvkppu+97FbpBb0VXK5wlxp5KpaH8UUFaQb7qmItc=;
 b=QH93G3luBzsXXUqcu02MaU/IQK65spQ8fufRP4rK3SN0O1KMFvrVJzmzc+aX5TUCav
 SrX8USQOV6EWXivH5tc5o3KQhwEZBICNKCj5jIS3Qvfq3nS72c5DVJPJcbMzQeedgMcM
 Zlc3BwRrG8JZ62SiUoEHsDktWSrkWRKZDLJ5pR3s1CtsibVqFYNCVxX2qC3AsqFOk7PM
 pBaGCn57jwP0FG31owox78XdlAx6dOg0lBBKhbvjLY3TgmQQjWwoByOXkQfozcbATU7n
 ed3PdH87Ugj1rR2hlYTgrqEArHUpFH6xCtCeP7d9TmJ8tZ2o1Bl3Rx8IjXC1mtO+r1MR
 SipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbHvkppu+97FbpBb0VXK5wlxp5KpaH8UUFaQb7qmItc=;
 b=iVtXZL8rzrM+ssp1LR6E5egt1jF8ps6+YsV976MHvV7YSj+pN9ddXC5CePI+g43AMG
 akodSJ92Auq2fN0xOi3AVAJR3nTC4ZX8WmVYV9Ko4rHnRdZWIo7bnz1u5BqEyXzGiWE+
 7GKY03otid0MEihuPeQ5WA6bEPF3ScQA33SbNDSFUOdBuljFwignkRdk4OCrdDk9jtki
 zwPMQivkQwLGNz9lLjDuo5A2QIqIsN0+Xa+2ypv6EYjK6ZYbA3NFl5HYlizR4xYVUcwr
 7U69CQi/5qFDi7K5iLAQkdGAFwW8AYSR49C34vFY5mQJba5itPcfdJePbs0rIuR8j0g+
 v3Fw==
X-Gm-Message-State: AOAM530RrrEByj+YEZzgXiD5Q0JJ/b/9y9etZ62JJSb8du/JAGxZM2Rp
 MDsr1ivTt7A8bGRzsWwf/Xi125ReOBXUw9oM/vCj4A==
X-Google-Smtp-Source: ABdhPJzIqg5CQs5kdYS8x/4ZNTD9vKrmpRP/3mUHAOEBhJS/j6kC62G+k2Zx6LBv3y2tQsaPQqvkEL7CSb7rbVUvd2M=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr6659092ejy.407.1624561822007; 
 Thu, 24 Jun 2021 12:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210623121424.1259496-1-pbonzini@redhat.com>
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 20:09:45 +0100
Message-ID: <CAFEAcA8kr5sn-jQ_wLa6a-m0DmbWPh1v6YuHQK74dy8pp01-Vw@mail.gmail.com>
Subject: Re: [PULL 00/12] Misc, mostly meson patches for 2021-06-23
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 at 13:16, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-06-22 16:07:53 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 0f38448da7ab61a23fc35f57276a7272d6e4d984:
>
>   KVM: Fix dirty ring mmap incorrect size due to renaming accident (2021-06-23 12:20:59 +0200)
>
> ----------------------------------------------------------------
> * Some Meson test conversions
> * KVM dirty page ring buffer fix
> * KVM TSC scaling support
>

This generates a new warning on one of my boxes:

[...]
Has header "sasl/sasl.h" : YES (cached)
Library sasl2 found: YES
Has header "security/pam_appl.h" : YES
Library pam found: YES
../meson.build:926: WARNING: could not link libpam, disabling

-- PMM

