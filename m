Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9948E84A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:23:53 +0100 (CET)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8JkO-0004eS-3I
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Jiv-0003wp-Hk
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:22:21 -0500
Received: from [2a00:1450:4864:20::330] (port=53977
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Jit-0005Mf-Ph
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:22:20 -0500
Received: by mail-wm1-x330.google.com with SMTP id l4so5668573wmq.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+m4kae7mKXYjETUkZiDiL1ZtEQSVHNcLRKY7Lg2piE=;
 b=uSOZgt03h47eqBoDpOb8Y8B0PvjZpPuBMV/JcyTKZ+XnghBSm2iwt+RFdIje4Jr7ip
 T1x6bjoyD0VdEFAPnWS6vxbZ2lTY+3RioRu+hKdqu4HhXt6Hm5cXQb3a9GeA26Vf3IqX
 sviPTb54POV+iRoszODSxC1mLeD/NM/z7Cl3398DdCwTEdltBUABlbvtJOUGfVY8AI8P
 efAyGM88pXeW3itNfqRJaKPtBzBIV5iojnEWQkAUmlSNDYhehOJPNDBsdQxdAOWDH1lu
 OsxUEHogW4jdlgsFSA27SlxZXkMtGbDJV2DeBbFCdPgsS09VhdfvDQv57hEHURDxMd0P
 AUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+m4kae7mKXYjETUkZiDiL1ZtEQSVHNcLRKY7Lg2piE=;
 b=AOQkUsu9XshOTXEsbHIP6g2W6VseOo0CYDz/fciedxJQbsZZ/twDr7Ejp279JzDMaB
 mCpYgK2r0oBl/Y0/cCYfeYK2+BrHOuNDQKo/uBWmjOg8lNQqPFUDm6DQTxFmENVImFpJ
 RNSO8X6DXCY6Abo3nA4pW25KH1FzTrGoNW3sEyIUg/hLuU+M/m2HfgpfZ4yal1DsggGr
 C5PAxMGlFngVtoIcU9tgcm77pNjJ6tck567Hl4PmdKYAosgfPz0IBoewKTNeGhtfGn4V
 ddeuBj937VyU+EBDu5Qlrfn+1O3tAEDIKQ/q7d7KdCaVcE/RrcrIj9LZz1lYd/IJhEBv
 sSmQ==
X-Gm-Message-State: AOAM532I5Kzrd1oO0RUwCjGYsNbtx2moZs4RRN/G8l9eh6ywDxyjgbkI
 RAeLsVHyhfhBmFUl6+RDUYYhhiAZa0UfJdd0nDW0iQ==
X-Google-Smtp-Source: ABdhPJzE4q01WWEQih5dhnGCf/s8jRkLA+3jIHJUkLsW6BMoMzuiJZ82TICx0GeaKcbzhB6bIo9YK249qqvxqzm95VM=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr14842841wmq.21.1642155737622; 
 Fri, 14 Jan 2022 02:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-7-imp@bsdimp.com>
 <CAFEAcA8rsxYLs-VjJF+efK=PEQrEh3mn3pTfEyVXz014CmHfqQ@mail.gmail.com>
 <CANCZdfqcik=SkyS9TOUp_Nuu2oSatDmeYU4n0pnRx=ghiytymw@mail.gmail.com>
In-Reply-To: <CANCZdfqcik=SkyS9TOUp_Nuu2oSatDmeYU4n0pnRx=ghiytymw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 10:22:06 +0000
Message-ID: <CAFEAcA-dSiEh0QsadkRL=00_ZxJ9H+sSpdK3z71As-fcQ9ZL1g@mail.gmail.com>
Subject: Re: [PATCH 06/30] bsd-user/arm/target_arch_cpu.h: Correct code pointer
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 06:38, Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Thu, Jan 13, 2022 at 10:15 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 9 Jan 2022 at 16:26, Warner Losh <imp@bsdimp.com> wrote:
>> >
>> > The code has moved in FreeBSD since the emulator was started, update the
>> > comment to reflect that change. Remove now-redundant comment saying the
>> > same thing (but incorrectly).
>> >
>> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>> > ---
>> >  bsd-user/arm/target_arch_cpu.h | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
>> > index 05b19ce6119..905f13aa1b9 100644
>> > --- a/bsd-user/arm/target_arch_cpu.h
>> > +++ b/bsd-user/arm/target_arch_cpu.h
>> > @@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMState *env)
>> >                      int32_t syscall_nr = n;
>> >                      int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
>> >
>> > -                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
>> > +                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
>> >                      if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
>> >                          syscall_nr = env->regs[0];
>> >                          arg1 = env->regs[1];
>>
>> Commit message says we're updating one comment and deleting a
>> second one; code only does an update, no delete ?
>
>
> Commit is right, commit message is wrong. I'll fix the commit message. I got
> this confused with part 8 where I kinda sorta did something similar (but not
> that similar).

(Maybe you had in mind the similar comment that used to be a few lines
above this one and which you removed in patch 5?)

With a fixed commit message:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

