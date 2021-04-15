Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F482360AA1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:39:31 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX2DS-0003Ef-5R
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX2CA-0002i4-Jx
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:38:10 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX2Bx-0005us-7j
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:38:10 -0400
Received: by mail-ed1-x536.google.com with SMTP id i3so2435877edt.1
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Er/HcVjZyqzfIgRYGh90o5eVKdKc0ns/rFVZvgYJ2ug=;
 b=ZeX2PXRLFmte7DuNGja87AcX6GR/kfZmGiI+aSOXEAf80a7lmR+SSl0tUyLfHRpfsO
 XWJ41/njivUiLcfmdLDEx6bNVr6I+EM/XBpeOyoNd9KxU656v9owrSRudjiYrONN3v6g
 ufs1w/h5HYJu5IugtHoXTLVe+OsDcFnvUEUUCtO9Zc+SWmWO5DW/K0dE6O53I7JXQkIi
 8s9s1FFG1iRdqJMVtkHoBFd907UntrvTcsq2XgJ3Po5saWls6Is1qV+qBrqHdc3mwU+3
 dUpEFykTscg8tJD1OXuk2LvWX2FLcxeR0UIHJTb1SLLNPVhZ3vASz67+qLvZ5FtdSpfv
 qfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Er/HcVjZyqzfIgRYGh90o5eVKdKc0ns/rFVZvgYJ2ug=;
 b=OS2Xv+9BJhgoIbxsYJUzf4IrAao7kqNbtSCQNDdDCVf23CgHpntchaGjwrdBkf4cFH
 E/Q42nwbKHP8s5M1YNTfuiIcgvTGZSnJdtpN+S5Wy8gg+bImJf299PKK2Vefd1W/pE1e
 Rk/LVyGO8m7+ZdP3UdbAdM+lDdpz3RvJPJHEe6pi0GVo7DTLmW8mmZsGqsPp90c9eDyk
 fQx2bVSb58tvGgbb4nqkvKypRtMVxzghlo+3M4NqUSls+qvW2Nzuva9zlQ5YZ2Iv7Wqn
 zfpASdlrbHQUwHIfExeXXXK4Dx+mttFCj/WpQod0/11cICC+QmJvXcci3Yp9TC0Cl6MR
 2CXw==
X-Gm-Message-State: AOAM530gEPLMIn6r6dncG3LjXgkusGomhY8DNh6BXG/FJe7eW8STwZHT
 w7nJ+4SRgB52jt9OHFnVVSt9zk27bUzxjouPyBpGNg==
X-Google-Smtp-Source: ABdhPJzDLBaw28GX7rXznBIYs9v8OzaCQNY63DT1/hagQDLkeFRGBTlaSYQK4MZi063PJsrXYV97UvKHTVXcd3wWHUw=
X-Received: by 2002:aa7:d28d:: with SMTP id w13mr4173646edq.251.1618493873950; 
 Thu, 15 Apr 2021 06:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
In-Reply-To: <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 14:37:06 +0100
Message-ID: <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
Subject: Re: [PULL 18/23] accel/tcg: re-factor non-RAM execution code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 14:18, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 18 Feb 2021 at 09:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> > There is no real need to use CF_NOCACHE here. As long as the TB isn't
> > linked to other TBs or included in the QHT or jump cache then it will
> > only get executed once.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Message-Id: <20210213130325.14781-19-alex.bennee@linaro.org>
>
> Hi; I've just noticed that this commit seems to break the case of:
>  * execution of code not from a RAM block
>  * when icount is enabled
>  * and an instruction is an IO insn that triggers io-recompile
>
> because:
>
> > @@ -2097,6 +2086,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
> >          tb_reset_jump(tb, 1);
> >      }
> >
> > +    /*
> > +     * If the TB is not associated with a physical RAM page then
> > +     * it must be a temporary one-insn TB, and we have nothing to do
> > +     * except fill in the page_addr[] fields. Return early before
> > +     * attempting to link to other TBs or add to the lookup table.
> > +     */
> > +    if (phys_pc =3D=3D -1) {
> > +        tb->page_addr[0] =3D tb->page_addr[1] =3D -1;
> > +        return tb;
> > +    }
>
> we used to fall through here, which meant we called
> tcg_tb_insert(tb). No we no longer do. That's bad, because
> cpu_io_recompile() does:
>
>     tb =3D tcg_tb_lookup(retaddr);
>     if (!tb) {
>         cpu_abort(cpu, "cpu_io_recompile: could not find TB for pc=3D%p",
>                   (void *)retaddr);
>     }
>
> and since it can no longer find the TB, QEMU aborts.

Adding the tcg_tb_insert() call to the early exit path:

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ba6ab09790e..6014285e4dc 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2081,6 +2081,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
      */
     if (phys_pc =3D=3D -1) {
         tb->page_addr[0] =3D tb->page_addr[1] =3D -1;
+        tcg_tb_insert(tb);
         return tb;
     }

seems to fix my test case, but I don't know enough about the new
design here to know if that has undesirable side effects.

-- PMM

