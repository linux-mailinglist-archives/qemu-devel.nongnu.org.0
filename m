Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D396A85BA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:01:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlMT-0001Wf-Ub; Thu, 02 Mar 2023 11:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXlMJ-0001Ug-DW
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:00:43 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXlMH-0000r4-RQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:00:43 -0500
Received: by mail-pf1-x431.google.com with SMTP id n5so10375749pfv.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677772840;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+n7+f74EnVFCcHgcGtgX5vTUUV3I+JQc1+ADtcVp6/U=;
 b=HEbbJ8jEIaxHHVU/1ku69muhqUjhzqfva6ClGyoPAPPJ3bBgMu+ZAM5VjpeVj0L35i
 typM3nlHCyHHbyE73JuAAix3JMiVQE2TZpvJQpqft31CA6lRQQzf3TXWd3oXaVpwWTNu
 bDKt2FBVxVrdwGQFcmQkSTIpsjyMw++Hz3O0Jfzf7+TAyodureJkx1NKZX/E30Q5H+pB
 gOC80DAjMM6vN8TTXIXa32+YIW0a0C3cwTHJ244us5paBpVvKoAODtiu+jHpxUUcog+I
 /08myzzKe8GSsJCRU+TurrhAdbEmdIyOP3EN+KDiNnGdtbQ6HXL2g2jSW7SmWbDHmLLI
 Mbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677772840;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+n7+f74EnVFCcHgcGtgX5vTUUV3I+JQc1+ADtcVp6/U=;
 b=N7VokU+VWC07X4b9oIaqUj8a7kD0tEa38c4WO6C/GPlgUHhMuSvaDldKAo2FVfLiaq
 dAE6J7DdnQKxyaP+4HZ/VZXX0/M3rOYxV1QEgG+CE3GR0M+OrNqRX6tY8qFrxXnSlacC
 jYeuKF7oCZwCKXdnzCpek60UyAAVaur8gnw9zPpXC7xBsTaXHCZbJ+7Uu7QnTG3X/i1b
 obZf7h8Ltoneal0cuRAEflrAfnjJXJldZ+mwFzSp2hwpLwxAQqfLfYhr499xVzA6KIiO
 33k7e0r0Kk2vEx13r6qzcDU83ny/KJwbsewnV8YCY2xlRKUtXvfQGpZl5HyhsXbUgVXp
 V87A==
X-Gm-Message-State: AO0yUKWTrnB3wdfp9V/sbw1zwP6M0vVV4KEA23jhzq5mq2As8Qhr0KpT
 7QkI6Y1LMbfSpmC0bmKB8W2dwMDtA+N7Je8yTYumCw==
X-Google-Smtp-Source: AK7set8ms42GRJLYAmW5KSqRIj71kNl1rvKyCQyTWudRVQehdEEOxD2WaSzIwLb3DrjqRLymBnY9dsYEJbWBnm6p1Jc=
X-Received: by 2002:a63:3347:0:b0:503:7cc9:3f8d with SMTP id
 z68-20020a633347000000b005037cc93f8dmr3395682pgz.9.1677772840177; Thu, 02 Mar
 2023 08:00:40 -0800 (PST)
MIME-Version: 1.0
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
 <CAFEAcA8z9mS55oBySDYA6PHB=qcRQRH1Aa4WJidG8B=n+6CyEQ@mail.gmail.com>
 <87cz5rmdlg.fsf@redhat.com>
In-Reply-To: <87cz5rmdlg.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 16:00:28 +0000
Message-ID: <CAFEAcA-Q6hzgW-B52X5XEtZsvBX64qSr9wSKizLVYu58mPdXKw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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

On Thu, 2 Mar 2023 at 14:29, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Mar 02 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
> > I think having MTE in the specific case of KVM behave differently
> > to how we've done all these existing properties and how we've
> > done MTE for TCG would be confusing. The simplest thing is to just
> > follow the existing UI for TCG MTE.
> >
> > The underlying reason for this is that MTE in general is not a feature
> > only of the CPU, but also of the whole system design. It happens
> > that KVM gives us tagged RAM "for free" but that's an oddity
> > of the KVM implementation -- in real hardware there needs to
> > be system level support for tagging.
>
> Hm... the Linux kernel actually seems to consider MTE to be a cpu
> feature (at least, it lists it in the cpu features).
>
> So, is your suggestion to use the 'mte' prop of the virt machine to mean
> "enable all prereqs for MTE, i.e. allocate tag memory for TCG and enable
> MTE in the kernel for KVM"? For TCG, we'll get MTE for the max cpu
> model; for KVM, we'd get MTE for host (== max), but I'm wondering what
> should happen if we get named cpu models and the user specifies one
> where we won't have MTE (i.e. some pre-8.5 one)?

I think we can probably cross that bridge when we get to it,
but I imagine the semantics would be "cortex-foo plus MTE"
(in the same way that -cpu cortex-foo,+x,-y can add and
subtract features from a baseline).

thanks
-- PMM

