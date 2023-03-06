Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BEF6AC183
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:39:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZB3Q-0002ab-DD; Mon, 06 Mar 2023 08:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZB3N-0002Ws-5c
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:39:01 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZB3L-0000lt-Eg
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:39:00 -0500
Received: by mail-pf1-x435.google.com with SMTP id c4so5813900pfl.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678109937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DxcxRpUrayxebnylx2THurk6JYrzNXj7/xB/q63oNR4=;
 b=vqlhjmpHH+PbiO5rb/3Nwd15Tqu+KJD2Uz/2gjMDkcG2zxWgYBf72Nkn6AX3RJgAHS
 VxUNrZ9ipVEck0Fch9ATU1b5QZowIpU0cz9uO244M+1DM7BVjVFQ0ELIhmlOGtPnlKYM
 vXS3lb9hKyJ3WIsJ3RmV7rKzDRPx+lmK3Jy8ddD7NTZ/w48RbmlEbjpC4Kbf66/t/tX1
 kZqTkJzdAM4jo65mTflc+WI0NTJg37xMyiUlFlW2LtZCZcAhn/7JUy3VJBZzce6DhE8V
 ekuVBhV7c68AAIYxm0+a9yYZA/7BtOIjLzvV3KT+IhXK8yUwPAzITKcluHExzGK+j8dT
 Ye+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DxcxRpUrayxebnylx2THurk6JYrzNXj7/xB/q63oNR4=;
 b=2yQndmIIGJNCkic1g/A6jZt1kZAHV1KGpqbiy6KkfnaQkdTX4YdAUzeb7wLHfXUg/c
 VEC3ZcvW74/AQHCniLPADYo+gj95gMgENw3s9rpYy5WGTpa0twCEIYebf+6IiwyHXwRf
 gRs5f3gmik8HyFFyqDk451nqyZ0UBMbAu3zL0xe4d4b5a+3+UaOV59DmV0UYxmUSnfuU
 7x14Hy+n8RbaaFP2dT88mJmMA+y7GSpNI7mc3oIHwlWuza8L82Kmq51MxNGyN8az2PNk
 XsG5+NzJ2+z8S+W1RhgILiXeAoE2TwvQjLMBuZ/Zk6JaEQ/kgD1rDk1ol6QJeKRi4qhG
 jeTw==
X-Gm-Message-State: AO0yUKWt3Lkt3+bFn/ZYMU/z4W89C76N4crul20SpPuwkg3DlbCSjvZ0
 6sL+fJ7BLPJqgrlYVidQk1s6z6gyG8F0+kgdScE7Wg==
X-Google-Smtp-Source: AK7set/Vb65Dp5PBFQKD5EfPhz8zR8jbwUWeG5AvvaxhdBGohCKElokdlGEQ8qDj6a0m/yZtQMeWEybBEEbYLHrW7Sw=
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr4619661pfe.5.1678109936948; Mon, 06 Mar
 2023 05:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-5-pbonzini@redhat.com>
In-Reply-To: <20230303171939.237819-5-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 13:38:45 +0000
Message-ID: <CAFEAcA961ZHCLAp2ZiZZ2iURFt7_FdcN_1rFtzJNdHs-sesHFg@mail.gmail.com>
Subject: Re: [PATCH 4/8] edu: add smp_mb__after_rmw()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, gshan@redhat.com, eesposit@redhat.com, 
 david@redhat.com, stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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

On Fri, 3 Mar 2023 at 17:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Ensure ordering between clearing the COMPUTING flag and checking
> IRQFACT, and between setting the IRQFACT flag and checking
> COMPUTING.  This ensures that no wakeups are lost.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Why is this device even messing around with multiple
threads and atomics anyway ??

I'm quite tempted to suggest we should deprecate-and-drop
this; it's not real hardware, it doesn't do anything
useful, and it's not a good model to follow if you're
implementing some other device.

thanks
-- PMM

