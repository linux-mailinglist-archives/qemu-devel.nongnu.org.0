Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02936664503
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFBa-0005O2-JJ; Tue, 10 Jan 2023 09:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFFBO-0005KB-FR
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:01:01 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFFBD-0003X8-AU
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:00:51 -0500
Received: by mail-pj1-x1036.google.com with SMTP id v23so12460827pju.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DMe7RbaSJgZe9w623NlnNt2u89RwUee6aXRdGZn6u68=;
 b=nB8UN+d0FTA8nZ2nPBX5r1yYRY0ODU42OIbACFuyGN4iT3WxumrGCn917M/CtJC0SM
 Qx9W6LpXjgKUTTwMfEfV+2uP+1tJJSsm8vmnfXkjldY11WLAYHnw5BzvxsTgVwlUyR/b
 e6Rx4dLPpKoVN/7dEcEKhYaF0697vhb+s5lg2ES48Y5vMNXxiEujPVx5xuhy6ZsgTqye
 +x99V2vPiXH7ApprPNDcrR5Qa9zXPX3bnFgIXfnj6YHH/wOLLesS9zScyISSpJSTV+ZL
 KU14KMm668eHahXOU2uVnkR55IUY3jbdcw8lTiRiRXxnbYZemMoCiquHo16Xv2+20hcx
 tF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DMe7RbaSJgZe9w623NlnNt2u89RwUee6aXRdGZn6u68=;
 b=SAMXsofld+2ig9WJk5VApD73VuvdcDyZR9rLPyvd2dnUDwE7sxzkIZCgEYxEzgG3ur
 QtobS6qQdjA5i7y4I1qT+NFMlj5LR2KXFGEt2WFaowQ+qafxX/DlqrbYNlR33LmxwIZV
 zyX0OHjJL6/jf4xxnXi1APa+e5XmnGKbtPM74y7DqAIXRPme1TC0JSqoLGG8vw1mjmc6
 iAo5vrHVIjjAzWdIs4VdyiJ+T4p70+lwIB6Q293rrqU0m0SaldwaN/xKyQ95q9HmjSLW
 1xbhP3yOLeFIuo5iQLMJ4BNIP+Nk/sxWXpYfU/GJO0AqGigfs9zPZqhSfDNxa7RWHckS
 c+RA==
X-Gm-Message-State: AFqh2koP+PNxudvX8CTIPdwXMt/aDUVDp9OaOfDNnKafpqiloPzwAvVg
 JFKpK94koDFVx4tzBxvRJu9L5DO8pewGXpCrmKfTOw==
X-Google-Smtp-Source: AMrXdXvJhwsj1XZA/WWJ1qxaLRBPx96Pk/M9XC2XXMRS5QU8oh8JeWU8kSP/UogbhvGsnFww38EE/dVKDxklDM3aMdU=
X-Received: by 2002:a17:90b:30ce:b0:228:dac2:3704 with SMTP id
 hi14-20020a17090b30ce00b00228dac23704mr70836pjb.221.1673359241260; Tue, 10
 Jan 2023 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-8-farosas@suse.de>
 <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org> <87v8lea5n7.fsf@suse.de>
In-Reply-To: <87v8lea5n7.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 14:00:30 +0000
Message-ID: <CAFEAcA_422_D4bCxO-_v8omMa4VRSwUwDaY3JHuhPDs6PCh3fg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
To: Fabiano Rosas <farosas@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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

On Tue, 10 Jan 2023 at 13:19, Fabiano Rosas <farosas@suse.de> wrote:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > On 1/9/23 14:42, Fabiano Rosas wrote:
> >> We want to move sme_helper into the tcg directory, but the cpregs
> >> accessor functions cannot go along, otherwise they would be separate
> >> from the respective ARMCPRegInfo definition which needs to be compiled
> >> with CONFIG_TCG=n as well.
> >
> > Hmm.  I would have hoped these could stay tcg-only, somehow.
> > I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.
>
> In general, what characterizes as "special" for a register to use
> ARM_CP_SPECIAL_MASK?

It means that the register has special-case handling code
in the translate.c/translate-a64.c TCG codegen functions.
Non-special registers can be handled all in the same way
(load a constant, read a field from the CPU state struct,
or call a read/write function); the special cases directly
emit code to handle whatever they are doing. See the switch
commented "Handle special cases first" in target/arm/translate-a64.c
function handle_sys().

-- PMM

