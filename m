Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58513408661
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:23:39 +0200 (CEST)
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhFa-0000VB-EQ
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhD2-0007IZ-GZ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:21:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhD1-0006KB-0P
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:21:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so4718296wmh.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0Ck5E/rdRPu6fWEZJe1wM6qmLpFjHQreTU0cpUgtjn4=;
 b=bbPoFdgiLxWsBQ+6GM+16VUlK8/6jelwYHFy9kAxYke++MP8N5ZabF48fiAJT2hjHb
 papHW/vm4dATlkeCp+l95ffaawJNF52BteeaWUABcjvm9BJujAvEOFiz7vBkL6faXAM+
 f3CfRaM4aWOeboDshL2zJsbkvCDW2NvCa/xFQWg21bkErMey6DC74cRMjoYC/e4y819f
 fpiRdm8bltsFJ+Hx4GoPz7KNaH2A2D8nUDYIJ15aESsS0c0MVtULLWqvzmHmeSIPFyJR
 BfsQ4jfvMKfmaxjAjSKASE/Lu1v+yem6/mMn+EJSgCN6vMwb3GlyET3gafl9hfhIw6Ut
 rISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0Ck5E/rdRPu6fWEZJe1wM6qmLpFjHQreTU0cpUgtjn4=;
 b=UBBg3fx94WnGd9lXEWk2yPmVlbp6thxpijjdUXUdwxQPHqlUkchEVN6L2BgYEt/UvF
 jie5IaCkXcdMbVNlYP24M5R70AJn9L0gBw6c9PYy0oDdT8gYGSwJ3OEVbn4WddogwrjF
 cAYfDmd+Pvt2n/gVsesitrnru8zU9VmrwpZROeBDhx/o086jYUDeTJG3IcO9qBl1zKSn
 DHRn2cr9Eg6FnLTC5qJuckJ/xPw0GSfrzwWFeg45KGC6l9Cl+n1rDuN2yCiXFWWwOA+9
 QH5V4g+B3ppN4YkuSNTfaxxZuj3ayI4Fgh5D/kbAHgM+FWqEtjl1XVX5RJhiZEVhCB6Q
 wX7Q==
X-Gm-Message-State: AOAM530/GI7jis8MqdRtGBCoWxVzalXTPsSfsciS3OD270DVrLqTgLnk
 PFAhuPwRVT7W1hYuk6Ff3rF0RKJQGmru/RsrkkLjYw==
X-Google-Smtp-Source: ABdhPJwHjah58TtHRYvMNQ87lhcc0csRPmeS/8czqoVjDk70rW+ZCN333mQQ3IC7J2CEiO2j71+X5AHufa4//rRfslQ=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr9869655wmq.21.1631521254328; 
 Mon, 13 Sep 2021 01:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-7-peter.maydell@linaro.org>
 <b38d4f0b-4adb-ae02-c90a-83cf4b4a21d8@linaro.org>
In-Reply-To: <b38d4f0b-4adb-ae02-c90a-83cf4b4a21d8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:20:03 +0100
Message-ID: <CAFEAcA9CKg7-LfpiqLY4EsaPo3Vnu8gV-7buDoiyv7c+xB8R_w@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] linux-user: Split safe-syscall macro into its own
 header
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 12 Sept 2021 at 17:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/8/21 8:44 AM, Peter Maydell wrote:
> > Split the safe-syscall macro from qemu.h into a new safe-syscall.h.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9<f4bug@amsat.org>
> > ---
> >   linux-user/qemu.h         | 135 ---------------------------------
> >   linux-user/safe-syscall.h | 154 +++++++++++++++++++++++++++++++++++++=
+
> >   linux-user/syscall.c      |   1 +
> >   3 files changed, 155 insertions(+), 135 deletions(-)
> >   create mode 100644 linux-user/safe-syscall.h
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> > +#else
> > +
> > +/*
> > + * Fallback for architectures which don't yet provide a safe-syscall a=
ssembly
> > + * fragment; note that this is racy!
> > + * This should go away when all host architectures have been updated.
> > + */
> > +#define safe_syscall syscall
>
> All native tcg hosts have been updated.  All that is left are those for w=
hich we fall back
> to tci.  At what point do we drop the fallback and simply make this a bui=
ld error?

We should probably do that now, or at least once this cleanup has got into
master...

-- PMM

