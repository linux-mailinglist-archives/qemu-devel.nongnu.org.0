Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA76E8DD2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:20:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQRj-0006V4-QM; Thu, 20 Apr 2023 05:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppQRh-0006TZ-NN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:19:17 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppQRg-0006FO-15
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:19:17 -0400
Received: by mail-ej1-x631.google.com with SMTP id kt6so5047842ejb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681982354; x=1684574354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYM4RVcFKPlxn/tACnJdYH+I7CL3Z+D4adHtjgUL9Ow=;
 b=NOXglNxphp1j23naeOlr0T20fGSkq9h90P/bHCWb0RHBY/tNt1Sbnlmqj6SDLTnE9z
 K+vXozk6A+ZuEDZbYB8MsvXH5AVfnSQ25OFvkGegrF2emnR4uJcmTtY0D4x3e8eM8MbN
 Mx9Mpw/oi8RZMfdHiiEbCkZjZUhCL53hSwDbLUi3iqshF62excvNMcPxHcFYaWTSoAvR
 yWQG3A1ILshzfOOjZzrj1jXt9KkObd6gt/UndqfMm+/vOFfzwcENZmEEt7z22Qbg1or8
 veeCHK3nPcmlV+PV+7+Y6e7DmwAlU5tAz+QN7MO51ZMM+qCUfhiPzNAed5Uq566Hs9oX
 mDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982354; x=1684574354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RYM4RVcFKPlxn/tACnJdYH+I7CL3Z+D4adHtjgUL9Ow=;
 b=XaQOe9XVkLMnNVoUnxmsI1hYkzq0psuKQJTr2o0tvOm8b4DGqKqjFtWY7veTYDrluI
 qis0I794+6uzaTVOQL0vffGx+7OiTBoVmCys373D2MksxqDGOrduyy/0wuksKOE4JGf8
 T4R5JXZz3uxnXn7Zl0Oh7JDjn/3Z8KHnRp4Xw+gBGYyRgTNJfugnqcbByLGRFLcPbrOM
 VfZSohSSfZxZkw+xRAVrq1KeyVXhDGy74Z4hehuLvNeGqTFpDIuxjMZXiBYBXSqWVP8g
 zEb9netQuY46sMHbjOQ4yoratWPCWAu8H2pqzktsBMs76oVVaoVWFLXNYRKJo7uSeNfw
 fZ2A==
X-Gm-Message-State: AAQBX9eQfV5sdC5/dhBAxIa0WXdU1xKJyYlWfoe0cpO9IK8oIbdTeYRP
 F3MM0hsEGWGPdXjz7zBXLeo5pBHAk7UVH/A2Ue181w==
X-Google-Smtp-Source: AKy350ZK3Ko1HTW+bF7nluU24FVPHCwY1kjqkyd9enQO7OWVIVGr73xTDc4zDoquhAwe2kwWzNLAPbShXvfhaRx2knM=
X-Received: by 2002:a17:906:c216:b0:94e:e494:13b8 with SMTP id
 d22-20020a170906c21600b0094ee49413b8mr384324ejz.6.1681982354365; Thu, 20 Apr
 2023 02:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-5-peter.maydell@linaro.org>
 <eae62bb6-7c94-21be-f69e-8dc90c254297@linaro.org>
In-Reply-To: <eae62bb6-7c94-21be-f69e-8dc90c254297@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2023 10:19:03 +0100
Message-ID: <CAFEAcA_Xq1ZS05UL6O+VEMC_P+TF+_-aPmwy-cHVR93mmVndqA@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] linux-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 10:13, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 17/4/23 18:40, Peter Maydell wrote:
> > The '-singlestep' option is confusing, because it doesn't actually
> > have anything to do with single-stepping the CPU. What it does do
> > is force TCG emulation to put one guest instruction in each TB,
> > which can be useful in some situations.
> >
> > Create a new command line argument -one-insn-per-tb, so we can
> > document that -singlestep is just a deprecated synonym for it,
> > and eventually perhaps drop it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   docs/user/main.rst | 7 ++++++-
> >   linux-user/main.c  | 9 ++++++---
> >   2 files changed, 12 insertions(+), 4 deletions(-)
>
>
> > @@ -500,8 +500,11 @@ static const struct qemu_argument arg_table[] =3D =
{
> >        "logfile",     "write logs to 'logfile' (default stderr)"},
> >       {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
> >        "pagesize",   "set the host page size to 'pagesize'"},
> > -    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
> > -     "",           "run in singlestep mode"},
> > +    {"one-insn-per-tb",
> > +                   "QEMU_ONE_INSN_PER_TB",  false, handle_arg_one_insn=
_per_tb,
> > +     "",           "run with one guest instruction per emulated TB"},
> > +    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_one_insn_per_=
tb,
> > +     "",           "deprecated synonym for -one-insn-per-tb"},
>
> Maybe worth mentioning QEMU_ONE_INSN_PER_TB too here:
>
>    "deprecated synonyms for -one-insn-per-tb and QEMU_ONE_INSN_PER_TB"

There's not a lot of space in the -help output, and I think in
context it's clear enough without.

thanks
-- PMM

