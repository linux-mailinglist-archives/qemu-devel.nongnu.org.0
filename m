Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ACC4F6406
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:58:49 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc83U-0002LR-7y
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc82b-0001gj-Re
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:57:54 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc82a-0008Mc-4N
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:57:53 -0400
Received: by mail-yb1-xb34.google.com with SMTP id j2so4898732ybu.0
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XSSoGDVgvlpNgFevnBmRLEyBEL6P0tm8J3ikDeJ7XUo=;
 b=Fn77xjKQXkW5qAIKzf9MJAfx0yEN50/XdFmSsC3Rkr494eu7pmQAKyyITib1GBYkUb
 Lh0q5SQW2mW/AEEwpEaWdF/qVz/oDKeuS7iJLt3+HYK5MAbT7cqfwTl201ehr5b3KgE7
 +0MbpRpWbm7cX+E9RV8A/1vw6iFsOukuhf0VC6KiawdXj8G+KVLOKG0RzmhvjNp9BLzO
 EHSFKEXFPYUZSUbvTfyZZhJ7kkLPzRZ4cnLoyE77XmCdcash/9XzXqbPaWHKv19BMRwQ
 l1Y/i5yoArLvsmycXZHB8BQxsi1FnuyNUq0SifzKChlQeHnih0IjeUECvHpAF8bvGh0K
 jvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSSoGDVgvlpNgFevnBmRLEyBEL6P0tm8J3ikDeJ7XUo=;
 b=bALtcv1AysuYzn5h/1JFHTyPWpaEJ5JSByZDUf3HcGYswLDCI534FRkGIm/1Nwcwaq
 8QqlW7mLhBsRMawSBbJHep8q5gq1AmaYHpjMLfbguP5N4o8I/uAQ7Q+zJO/ImDYZwPRp
 96JHyZy8P4P7yZIdzWNC73FR2zGzUNv5ZLWhinYoIKjnkbDiDM1FnZD3B5a99uoUrB9U
 gBRXmXWer/L15khKRhwxbuvG107r3vqvAUEyCfr+rAai271/4+oi3fVmXNVpAN0cOZ+U
 D0bZ/E3902uDjLN9rOKRG0BW0x6C1pX30tKViSSZXCYQ7FIWEdYCUB0gnc4AFZz7G9Mk
 GzOg==
X-Gm-Message-State: AOAM530LSyqkzYj0yyo6EdRKSPTZb0r7nVj/hmBJCpSShFYNGxrDbaU7
 qM0ojC9txFQIV7SW1cnK7o1r9AIb02+pIGYKRQ2FKQ==
X-Google-Smtp-Source: ABdhPJzi7Vo6ctVbGX23+5CXoEOlAPGql46eTMhzBS5qQlYnX1SMHrn3+ARSU3P66oSihEMBj6DO4fkpgyfWEy+9Wgw=
X-Received: by 2002:a25:3d0:0:b0:63d:c88a:fafa with SMTP id
 199-20020a2503d0000000b0063dc88afafamr6698555ybd.479.1649260670852; Wed, 06
 Apr 2022 08:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220405134819.3644952-1-qtxuning1999@sjtu.edu.cn>
 <Yk2zDBemx2i5yfT8@stefanha-x1.localdomain>
In-Reply-To: <Yk2zDBemx2i5yfT8@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 16:57:39 +0100
Message-ID: <CAFEAcA_TboHFH3s_u+YJ6monhvD_fkBzz1fnMLybeiiBWva9WQ@mail.gmail.com>
Subject: Re: [PATCH v1] configure: judge build dir permission
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Cc: Guo Zhi <qtxuning1999@sjtu.edu.cn>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 16:37, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, Apr 05, 2022 at 09:48:20PM +0800, Guo Zhi wrote:
> > If this patch is applied, issue:
> >
> > https://gitlab.com/qemu-project/qemu/-/issues/321
> >
> > can be closed.
> >
> > Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> > ---
> >  configure | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index 7c08c18358..9cfa78efd2 100755
> > --- a/configure
> > +++ b/configure
> > @@ -24,7 +24,13 @@ then
> >      then
> >          if test -f $MARKER
> >          then
> > -           rm -rf build
> > +            if test -w $MARKER
> > +            then
> > +                rm -rf build
> > +            else
> > +                echo "ERROR: ./build dir already exists and can not be removed due to permission"
> > +                exit 1
> > +            fi
>
> Other cases where "rm -rf build" fails are ignored. The script will keep
> running and produce confusing output.
>
> Maybe the script should check if rm(1) failed so that all possible cases
> where the build directory is broken produce reasonable error messages?
>
> Then there is also no need to check $MARKER explicitly.

That isn't sufficient for the situation described in the
issue (and nor is this patch, I think) -- there what
happens is that because the source directory tree is not
owned by the user running configure, the "mkdir build"
command fails. Execution never goes into the "then"
that this patch is changing.

If we check that the mkdir succeeds then we don't really
need to check whether the rm -rf succeeded (though it
might be nice to do so anyway), because if the rm fails
then so will the mkdir (because the directory already
exists).

We should also test whether we handle the "build directory
not writeable" case for when we're not doing this
"create ./build because the user ran configure in the
source directory" thing (ie when configure is run
from a separate builddir).

-- PMM

