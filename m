Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD6351AD1E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 20:43:49 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmJyW-00049b-Io
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 14:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmJwF-0002yo-I4
 for qemu-devel@nongnu.org; Wed, 04 May 2022 14:41:27 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmJwD-0007gI-Of
 for qemu-devel@nongnu.org; Wed, 04 May 2022 14:41:27 -0400
Received: by mail-yb1-xb33.google.com with SMTP id w187so3929913ybe.2
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+NgjoxqoMRPPN/t1Jfz/WgPOAt4WVF2cSQIPiuGiaak=;
 b=Uzhphv3iBAvEbtqF2anrdtKXNvcduOsD42qe6gAlMgIa6KNQm2yzjgHkwUBrEiUflx
 F9BAXKZb/jDLPQ0KqqzXcJX12V9lpsCDN6yHMY85S3wLRZSYqFU+zpbDGRMje7J35yA+
 Wh+Zv+MK1QCIc7lzkmYUxcGiP1OzCn0qSjFEVMnkbdfsBzCYRyeAp86T9EBLqQkjvpLP
 3PZB9iPiGs3s/9RcIsL/G/nz0NIT8PcbiqfjlqHg4rQ213zUlAQ41O5uRhclNp9gqRkk
 wOZ0o4f2oTP48nUAXrhipIt5/Q5pAZ7ACeUh0Bj1/UuoJWkZ/qznDZOrBgWSYw09T7Y2
 1cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+NgjoxqoMRPPN/t1Jfz/WgPOAt4WVF2cSQIPiuGiaak=;
 b=25TreHK2cgMYxaRcy4sHEpj6EUO/Hkmyxo7bik8hmM4ApnCiMp/Yg3Hcjw+ytNEZmm
 kQozJRXmFaH2SiH/cKTUCxKzzQC+hmv58gC8mCamlCbWdlGMr2NT2ElYE+1kHJRJGj2C
 Ys+tZCQAkFNtJrbfdJ7zYHvkS1tWyk7FiKc/Ew6jLaFRWwWLgyy0/vmfzUsVlWnzubC5
 7SFGMo+z2AkPQn0FUoJFs+UDkFcD0Q+gr9uBsyrkaZAbK9lbAx9nysPQctxiZQpA7UG9
 csqw6Ch383LFK+7OZipzpyZ5vT3I5Q/lgYTQXOMp5TKDcYP73tyxB5EpnBR2VnwJznVq
 e0QA==
X-Gm-Message-State: AOAM5319iZjeImxBKF2lJ+0wKzVoXoCGqaTdM5Z53dg7lcQsLGEJe5tJ
 p97Mauu1G+fpesywS+ce/Bn7/ak8tx7Z0DM9ahP0NA==
X-Google-Smtp-Source: ABdhPJy2I825qfv4LbXQBJ35YHjz4bhIg39c8SUNf777wcumJnKxVBmMRBE0Vl5goMBOM2+3NHkmz4y8D7PnFyTnFa4=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr19175942ybu.39.1651689684339; Wed, 04
 May 2022 11:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220504173025.650167-1-marcandre.lureau@redhat.com>
 <20220504173025.650167-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220504173025.650167-5-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2022 19:41:13 +0100
Message-ID: <CAFEAcA8F2+_K9+3-S=cb0TuDEw0GrdZrL2v47sc64uZTpR6_jw@mail.gmail.com>
Subject: Re: [PATCH 04/16] compiler.h: add QEMU_{BEGIN,
 END}_IGNORE_INITIALIZER_OVERRIDES
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bandan Das <bsd@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Darren Kenny <darren.kenny@oracle.com>, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Wed, 4 May 2022 at 18:36, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> clang has this default warning which QEMU codes triggers in many
> situations. However, other projects in general may not want to disable
> globally the warning but only in limited specific code blocks.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> +#if defined (__clang__)
> +#define QEMU_BEGIN_IGNORE_INITIALIZER_OVERRIDES                     \
> +    _Pragma("clang diagnostic push")                                \
> +    _Pragma("clang diagnostic ignored \"-Winitializer-overrides\"")
> +#define QEMU_END_IGNORE_INITIALIZER_OVERRIDES \
> +    _Pragma("clang diagnostic pop")
> +#else
> +#define QEMU_BEGIN_IGNORE_INITIALIZER_OVERRIDES
> +#define QEMU_END_IGNORE_INITIALIZER_OVERRIDES
> +#endif

We use pragma diagnostic controls generally sparingly and
only when we need to briefly disable an otherwise widely
useful warning. In this case the clang warning is just
broken (because it doesn't correctly handle the array
range initializer extension we use), and so we turn off
the warning altogether in configure, so that we get the
behaviour we want everywhere in the source tree, not just
if we mark it up with special macros.

If other projects want to borrow bits of QEMU code then
they need to either (a) abide by our conventions for
what compiler warnings to enable or disable, or else
(b) fork the code and fiddle with their own copy.

I don't really want to see QEMU's source code get littered
with a pile of extra macros hiding diagnostic pragmas.
(If we stop passing -Wno-initializer-overrides to the
compiler then we set a bunch of new "built on gcc on the
developer's machine but fails to build on clang in the
CI jobs" traps for ourselves, and if we don't stop passing
that then the places that should be marked up with the
macros won't reliably be marked up.)

thanks
-- PMM

