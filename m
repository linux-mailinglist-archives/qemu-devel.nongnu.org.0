Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68E6A1E06
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:08:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZgS-0007C5-8O; Fri, 24 Feb 2023 10:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZgF-0006wI-42
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:08:22 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZgA-0006SV-LU
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:08:14 -0500
Received: by mail-pg1-x536.google.com with SMTP id z10so7628178pgr.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bE22RS3TybS8ZaA4i42aziraDDdofhkpgmXVb70mn+c=;
 b=ZmWMsWp3yaK30NUQhBdWcLNvybBN6lT/jMIN1usBA5RtH1YBbmxVbWd+URGS890yNf
 pmoNIYI0i0n0k/sl/7vk7c9L5TSZp3w91tSgg0NRPKpSWpLBpXn9yhAy4ycFGzKyPD7w
 W9vVAUzLlFY3BFck2RaUaO3NvtaIcp3g/8I9ew51e5TX4Y0+AwqLETkDLPufOMPMKP8a
 ysNDv9wlUq1Z7tLxCZzdwLxdsJrqMBQ7t/Jo/1bv+JOJeszCeCrr0Ui+pH+i3DG7jZSp
 lBF0D8EXOs/Vcd5+KfZu5Kgi92N+6sOnHRHvr8/XaIGqoVYM8pcPk6oq1v2Hn4Anphif
 +pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bE22RS3TybS8ZaA4i42aziraDDdofhkpgmXVb70mn+c=;
 b=LueP+tdDJHQ1WU0eVus7vl9+uOnRFhmjhBN+5WDOa8B/CEC4v/CpWTCvvvfa/TW1kb
 Lz3/kwXRjkGHOV7WaoTNGse6dhsBtkXgSaYSaL56qhPYbZrzHNJBGWT0kL9r9JIF0A1A
 JYYc4jaquVnilkj5S4fxkR5ftR+T4/EN3zLPeri2mD+cHGdwCcVN6PJKwy24wRDqNR2N
 bgkdDQQGOlRo6OD2FhbMRmLIq6Y5lsgNtnILItV1SgdCjFnhJY+qF8OVTE+SPoYS5wL2
 xed5isMwVwjKJFEcdwZQn7hppQ9OHt1WX6J7NzsDQHMaFHnzllI/1ME9MXPsbc6vTDpc
 y1hw==
X-Gm-Message-State: AO0yUKUNvXBESMtvDj2bIbjJO6o48AqE+RgUamT8UAR04Xcq47MzodwY
 TCma9CyIo3OJ0ssMxKWAUcKr+rrJUm7/dZjeUhefAw==
X-Google-Smtp-Source: AK7set/ZKxyGL6QZN3mMK9aJY2KWCLdRvfQBQALU6BMJ13VWsCSfkXxPUXxSjkfkKk/NEcQeV/sdHnPe57doNykzTCQ=
X-Received: by 2002:a63:b959:0:b0:4fc:7e60:d09 with SMTP id
 v25-20020a63b959000000b004fc7e600d09mr3036985pgo.9.1677251288104; Fri, 24 Feb
 2023 07:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20230222144103.467002-1-pbonzini@redhat.com>
In-Reply-To: <20230222144103.467002-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 15:07:57 +0000
Message-ID: <CAFEAcA-n2hND0SoUviYWtQnTcPs1f-w2crjYk7Rn-Yq+nKd3Zg@mail.gmail.com>
Subject: Re: [PULL 0/4] Misc + target/i386 pull request for 2023-02-22
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 22 Feb 2023 at 14:41, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 003ba52a8b327180e284630b289c6ece5a3e08b9:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-02-16 11:16:39 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 49be78ca02a687ea00ad7534254217b479a4e92d:
>
>   target/i386/gdbstub: Fix a bug about order of FPU stack in 'g' packets. (2023-02-21 13:46:49 +0100)
>
> ----------------------------------------------------------------
> * x86 bugfixes
> * OpenBSD support for naming threads
> * Refined Python support policy
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

