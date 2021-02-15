Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012331BAD4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:17:33 +0100 (CET)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBegu-0007FQ-EL
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBefD-0006KE-5V
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:15:47 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBefA-0005Ph-0G
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:15:46 -0500
Received: by mail-ed1-x529.google.com with SMTP id i20so6401897edv.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 06:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/2MY76GAmHikNHLstYvgXHRdDFxU5gfxHYXmF+QjyTA=;
 b=rV1k9TyHg4P45AJC9AU3AV+yOTNTzfp0MpVXBVpvWiH+qup1qLpUVkJgIDsBnUX2Tj
 Gj6oHyjSO7bdLAOSMKxAjnh+IsIrWWq7SXe4+9AY1vdwBaVNKMrSOAB66cHBPCuQu0wk
 HPWjFuxQlX8AONe6n3IXnRr7efTASbe0echvMpAlUfoZZry17jakdb/M/+uG9QMxBqBP
 otneeQzEsqK31A/GnKhtQm1Vy+NJy282QZ91zeCHTOBlXs/TZ4VFYHfsdX7g/AAdVXIg
 Xf+bUrhylAIFxwsOwvjCax6PIY4fd1AQwR64yzxQ0525x/LjY9EwRvSXnEppwOh8Pp10
 EBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/2MY76GAmHikNHLstYvgXHRdDFxU5gfxHYXmF+QjyTA=;
 b=BSi4vXrGNN8xeCvz4AX/BrAEch24ifNZVv0s9SEPulrU6tjgF4/paCSqoVNs5nk7On
 RF0qV9SzMqjJO8iwfMgP4ZB0qlX9oh22+WdT/UCUMRaI5NDvin9O+/EBn0+tym3/jTkI
 r7QqSlh3eOUVABtC46ZemyZiBFHc247ncWoagnxlT0j78/R28LAJXUOXhnoXIZAgck9z
 CGifBtLh3x6zliS4/t0+EoL0/aRMTFz/CIaqBxHSLDwibedVAYYV7HMNptjS/FhL04QW
 3m6om9Y4mbBsCaafbEApCfIx6lJIPBk8Z217/MYe+/osTwi+v56OD113hAeD6DBBNzOf
 LuEQ==
X-Gm-Message-State: AOAM533Mj+UAqWnpS3HNTD92qD8mHhqt9xTOM2Ol04xXeViq2ceL9wSp
 SPCBr4c+HgKLTMz58Zj8+eDYfj55iuKRihN7FIX54g==
X-Google-Smtp-Source: ABdhPJx8YID/GkT/GjaUbzqkPsD7+ieWF9F2ESiZi0Ysv6w1AgMuNd97b4ORo0F+uNoPSNjZC8HN2ICTAGnpzPzZna0=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr15722881edx.36.1613398542214; 
 Mon, 15 Feb 2021 06:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20210215124519.720265-1-laurent@vivier.eu>
 <813f55f9-5d45-28f5-3507-78872e1625ca@redhat.com>
In-Reply-To: <813f55f9-5d45-28f5-3507-78872e1625ca@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Feb 2021 14:15:31 +0000
Message-ID: <CAFEAcA82=i18DP3XoTE_UGqpFybKherwJEFBaC4+Cw8xrM3y8Q@mail.gmail.com>
Subject: Re: [PULL 00/13] Linux user for 6.0 patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Stefan <stefan-guix@vodafonemail.de>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 at 13:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 2/15/21 1:45 PM, Laurent Vivier wrote:
> > ----------------------------------------------------------------
> > Pull request linux-user 20210215
> >
> > mips o32 ABI update / R5900 update
> > Remove outdated info from docs
> > Add definitions of TARGET_SS_AUTODISARM, TARGET_SO_DOMAIN, TARGET_SO_PR=
OTOCOL
> > Fix ioctl(), waitid(), mremap(), signalfd4(), eventfd2()
> > Fix O_NONBLOCK (hppa), __O_TMPFILE (hppa/alpha)
> >
> > ----------------------------------------------------------------
> > Stefan (1):
> >   linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit targets.
>
> Not sure this is very important, but from the QEMU guidelines
> about submitting patches [*]: "Please use your real name to sign
> a patch (not an alias or acronym)."
>
> [*]
> https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a=
_Signed-off-by:_line

Yeah, that's not ideal. Unfortunately I just pushed this merge to
master about 5 seconds before I read this... In this specific case
this is only a two-line patch, so it's not a big deal, but in general,
yes, we require full names, because the signed-off-by tags are
part of the legal tracking of who has contributed. (Assuming Stefan
has a surname, of course; I have a coworker who only has a single
name.)

Anyway, applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

