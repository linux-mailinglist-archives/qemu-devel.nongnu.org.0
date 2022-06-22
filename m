Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553EE55541C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:16:03 +0200 (CEST)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45pa-0007le-DV
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o45k1-0001j5-Gk
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:10:20 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o45jy-0006sP-Iz
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:10:16 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id i15so26981243ybp.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ak9sN1BAn4FVJM2F3FhYCLi35aKf+SYvy9iT3y/iS6o=;
 b=EC6xjxXit2GlcKSvaK6rUL04N5NUNXHs96SOUtfDUbdLVpppd6eLHDHP+SYIdMdELh
 uJumYyTeaQxs12guhWa10BpUP4Jy9sd0ZyBU+tz+x1zlNNmBwdz1gDVg4mtWrj6deMAU
 YcbehYkhMU+iZVIhzGaWwYQUJtOXXZnLQRClIyykBJwnkY6SUmU+vq0z2RgUzYUPOhbX
 DVWKF6gQ/Lr1K2MD8IN8XD4eVXdP4j461+Cgr+nVVUnIuvRquSPyI7yGNwlElUg6JPZr
 N55t6Z0/4Z8wup1nJz8LenLKixgRO7CVQn367oAAm0wi64dJ/4cm8oeehzi1MT3ct9QV
 goUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ak9sN1BAn4FVJM2F3FhYCLi35aKf+SYvy9iT3y/iS6o=;
 b=ava0kmAFN2Rc1VMZ8RKOP4AsAYNw+K3mqDr2vOymR7T9vdfpdcbO/PDnO78KlwQLxV
 7KH3sqeJDCL0mD4w1tKwHW957A2hYgQBOjlQc1p2uQSYldTCJdHloESioog7etR3MDkD
 PjKI54OT+ivaHEr0icuGtPCIAMU3rYibesrO27sJo/e3TG+uLMuCT74qukUvULMnK13E
 gRATQUzWJmAKySTuwl3Sj0UcthLzhx32uMJ/PRaIawi5QPBCMFonmzJ+Ze7dpBwqgye3
 cM1ydw0QlKmFyupxrIT1QP2ZJZ4qIGj6sYz8G9PrUtbP94wLlueAmuSPG1jZg0aAFbdO
 9S1A==
X-Gm-Message-State: AJIora//0gYX4n8p5dNg7FIegbF9ypHV7xek9zA70NhDg74MN0rARQf4
 CEn0h5oh1nrrrVXOiLVHbM3IbuX7dU5vgSmgHv3aLA==
X-Google-Smtp-Source: AGRyM1s9EXyoYOtovHtyxZ3goS8y4/YUZ2u4lASC9JkVdJoeaPbZ6mKB/p0rG0RI3/flluWqGTATBsLvyJ43zzwzsts=
X-Received: by 2002:a25:d9c3:0:b0:668:cd48:e56 with SMTP id
 q186-20020a25d9c3000000b00668cd480e56mr5369439ybg.288.1655925011787; Wed, 22
 Jun 2022 12:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <20220621125916.25257-3-lmichel@kalray.eu>
In-Reply-To: <20220621125916.25257-3-lmichel@kalray.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jun 2022 20:09:34 +0100
Message-ID: <CAFEAcA-Z=rYWnpceM-Ojvi2QoxkmZzSZqnjKgH1WFdwCDi9O3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] semihosting: add the semihosting_exit_request
 function
To: Luc Michel <lmichel@kalray.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jun 2022 at 13:59, Luc Michel <lmichel@kalray.eu> wrote:
>
> Add the semihosting_exit_request function to be used by targets when
> handling an `exit' semihosted syscall. This function calls gdb_exit to
> close existing GDB connections, and qemu_system_shutdown_request with
> the new `guest-semi-exit' exit reason. It sets the QEMU exit status
> given by the exit syscall parameter. Finally it stops the CPU to prevent
> further execution, and exit the CPU loop as the syscall caller expects
> this syscall to not return.
>
> This function is meant to be used in place of a raw exit() call when
> handling semihosted `exit' syscalls. Such a call is not safe because
> it does not allow other CPU threads to exit properly, leading to e.g.
> at_exit callbacks being called while other CPUs still run. This can lead
> to strange bugs, especially in plugins with a registered at_exit function.

This is mixing up two things:
 (1) fixing bugs with the plugin code when code (semihosting or
     otherwise) calls exit()
 (2) reporting to the monitor when the guest exits because it
     asked to via semihosting

I remain unconvinced that this series is actually fixing (1),
I think it's just working around the most common cause of it.
For (2), maybe we want it, but that should I think be a
separate patchset with justification of why it's useful to
tell the monitor about it. I think on balance it probably
is a good idea, but I disagree about (1) and would like to
see these two things not tangled up in the same series.

thanks
-- PMM

