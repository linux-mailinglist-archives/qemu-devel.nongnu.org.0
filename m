Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EDF35DCD3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:51:18 +0200 (CEST)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWGdY-0002up-4B
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kernellwp@gmail.com>)
 id 1lWGat-0002Rt-5c
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:48:31 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:33441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kernellwp@gmail.com>)
 id 1lWGar-0002K0-Cz
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:48:30 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 i25-20020a4aa1190000b02901bbd9429832so3732204ool.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yxLJ4jx8zwDk/l6JxSedZpECocVz8godYHUHDpr6FEA=;
 b=RENUxgHAdiSY76wYt4rOshQmzTHere3sPQ5GTz5/bulLKvJbyQmdA3CRegxOjjVv9/
 54U0GoEyUibq3V1RI5RxChEL5w/Qnm37BdG3DIaWcxL4d7jzRkORs9V2ZMNZA1Toa4jw
 h2XSHxiih4HD7oDxISlhVBhLrMXX6Tji6XdjKQ/eDkCQ1ictH1WPSOCBa37hp2yXAq1L
 Nvj4pPVYZo8l6wWP54fwWlYx04Onn7nRS6YwVlu4Tb1wKbkYlaf5D0DEXwizY11nqOoj
 SUlfMPshSNyMt5jFr5oPQmey0A0joR76RSGBY3jAYGZlMqSkjzRoqlsnCajyezCvm8ue
 2VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxLJ4jx8zwDk/l6JxSedZpECocVz8godYHUHDpr6FEA=;
 b=rQQvxMFthS8/b5vL+EIdu65nOftKTKqmtYCRHASshkoz+N6NHCLOCVXebnXRaGNP0W
 7P1w/ta1uuAYWpDE9jsyB47pGXN3tYuWaMnvQWE5+0aI6xyd7CpdEzcj0SuCQpOxPn/f
 KCw7o+izv3bB4sHBG8ZmzSmdR/hidXsLfxyhRJm1DLNdM68QqYXqebvaSL0uKa1TzUuq
 X3acmH6L/D+pxVq1/GHJpKsqY2hcMEFZVL76Oa+cS8iRsGouiIOm11pi3+cLt/FRPwKA
 4RaAKonEMclXjcVbSu52FG4ELDaen5wjrSWgbuKMmkvOhVZR5faZ54RJkPmeEuo61zYM
 kEBA==
X-Gm-Message-State: AOAM531WEiBu3NSYlFU+CY0JX5ZOvYpn3V47UbyXwn5fBRgePTxCMYEY
 CipbeTDmZ6e5+qQ721+u6q1jWCxxhXDeF0en2QQ=
X-Google-Smtp-Source: ABdhPJwvMJbyzQjQhXqYPrCYTGKf70zatUrhdhepuSnzn+uhQzUd3m0nXe/dXVKuIIvIPGKMVSpttbAOkiPQEbFq4sk=
X-Received: by 2002:a4a:e615:: with SMTP id f21mr4324558oot.41.1618310907968; 
 Tue, 13 Apr 2021 03:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <36088364-0b3d-d492-0aa4-59ea8f1d1632@msgid.tls.msk.ru>
In-Reply-To: <36088364-0b3d-d492-0aa4-59ea8f1d1632@msgid.tls.msk.ru>
From: Wanpeng Li <kernellwp@gmail.com>
Date: Tue, 13 Apr 2021 18:48:15 +0800
Message-ID: <CANRm+CyMpNS2OAC8CKGb9HUQe3v180e6gHOZYmVZ8gw=XQKYKw@mail.gmail.com>
Subject: Re: Commit "x86/kvm: Move context tracking where it belongs" broke
 guest time accounting
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=kernellwp@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 18:55, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Hi!
>
> It looks like this commit:
>
> commit 87fa7f3e98a1310ef1ac1900e7ee7f9610a038bc
> Author: Thomas Gleixner <tglx@linutronix.de>
> Date:   Wed Jul 8 21:51:54 2020 +0200
>
>      x86/kvm: Move context tracking where it belongs
>
>      Context tracking for KVM happens way too early in the vcpu_run()
>      code. Anything after guest_enter_irqoff() and before guest_exit_irqoff()
>      cannot use RCU and should also be not instrumented.
>
>      The current way of doing this covers way too much code. Move it closer to
>      the actual vmenter/exit code.
>
> broke kvm guest cpu time accounting - after this commit, when running
> qemu-system-x86_64 -enable-kvm, the guest time (in /proc/stat and
> elsewhere) is always 0.
>
> I dunno why it happened, but it happened, and all kernels after 5.9
> are affected by this.
>
> This commit is found in a (painful) git bisect between kernel 5.8 and 5.10.

Hi Michael,

Please have a try.
https://lore.kernel.org/kvm/1618298169-3831-1-git-send-email-wanpengli@tencent.com/

    Wanpeng

