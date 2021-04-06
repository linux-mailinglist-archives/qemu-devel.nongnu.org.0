Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0493554C8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:17:50 +0200 (CEST)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTlaX-0004N1-12
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lTlZN-0003wk-DB
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:16:37 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lTlZL-0001hq-Fx
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:16:37 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id z1so16162843ybf.6
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 06:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xnccHitF5s1R2nstd9rc2AMT7MS7Bd75pScEp1+RthI=;
 b=apmGFKw9Ood+V7hisXxD/zMhVz+sRkX38uRK/STKCbdqPSEJerTunbK0bBvRR7ceil
 Hr5/+wKQmj7rQKN9Cgvq0umllBOfnUEdJFUZE5CoF4XvvkJmsGF/b46X13TUouSw5pL/
 52b68ohnnnNZhfBuJTQw+SRQMhUg9RRBnUgm+rWpa0D2Al/Qpk0QOrkl/a6Ui7/8eT0x
 m8PEqomD3yWTk9rCjzv/JOhGYRwCXDl5+dGbiRabGDU+w7nnF0dKQN4i0oxbK/CpPhRY
 1Fuh6ml4SY9xkUM0N7Vdv2u61ZZnYzxqaogOVeKVVh8PQ+WFrlgKD75zjQ1F7Q4OZoA6
 f3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xnccHitF5s1R2nstd9rc2AMT7MS7Bd75pScEp1+RthI=;
 b=A+PYR0I/Bn/4ggdj5/kGkJEp0A21bQCgV6KaxfsZT1qNP+E4Ww5e76CPLE/AgI6Bi6
 9dWR/14zXMm5ZaLevwS9xSq5y1PdyhoEijefzTLq2LfDRrXeERaHb410eXzPaLHvGTRn
 ecLVYhFuHTKtlvCtqmE3Z9HGR14mPa6Z92gsDnFgwSU0Zl9XfAb5dOFiyOxH549bDL7M
 od6YafKzr6KiDpHPI8os09NsY+5G2ccNcl1kwGu2HATL6+AI031dcoc6O1gOTfqUsjiy
 Y489X+zlLkjSL/MKTWtXOkZ+KyxhpAaBsE1KKI50GQxSd/1ozNtxPkUnaZgTu+p25A/F
 jLSw==
X-Gm-Message-State: AOAM532d19haHTO/XZjEkMaU9f5UCL0YFnHgqW1pYWD6TMvlWQdR/6AM
 FKgpbv3ClIXqzSng2VCB8Gun06fNxt38QPQ6SRE=
X-Google-Smtp-Source: ABdhPJy8NHAbakxKmi1z6Atoiqr+/wEiu/SNJZsT3xc3OJkPK1dJzEFoDnV8HTnqXZSME5F38Uvkxs95bpW6ehcZU1w=
X-Received: by 2002:a25:7d81:: with SMTP id
 y123mr41791506ybc.294.1617714993811; 
 Tue, 06 Apr 2021 06:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAM0BWNCTD_oe3BgKQUqG41fgFqGCXVh1gaiMqJpvXbR4Fh5vHg@mail.gmail.com>
 <7c63e938-2482-3150-7cfb-1459c132fda6@redhat.com>
 <CAFEAcA95MnVMqt+BWN=TbNfkZDiHPqN2hNRNerAxM3TptfzP9g@mail.gmail.com>
In-Reply-To: <CAFEAcA95MnVMqt+BWN=TbNfkZDiHPqN2hNRNerAxM3TptfzP9g@mail.gmail.com>
From: Ziqiao Kong <ziqiaokong@gmail.com>
Date: Tue, 6 Apr 2021 21:16:23 +0800
Message-ID: <CAM0BWNC2JrsUCjMBeTcH2tS06O5Pyk46sggMbr=DGxbsG=EKcQ@mail.gmail.com>
Subject: Re: Bug: fstenv is wrongly implemented
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=ziqiaokong@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

I checked that bug and list discussion and it indeed was the bug I
referred to. It seems that the patch should be quite straightforward
but no idea why the review of the patch was stalled at that time. I
would try to draft an updated patch these days.

Ziqiao

On Fri, Apr 2, 2021 at 6:49 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 2 Apr 2021 at 09:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 02/04/21 10:29, Ziqiao Kong wrote:
> > >
> > > According to git blame, this bug is introduced about 13 years ago:
> > > https://github.com/qemu/qemu/blame/633decd71119a4293e5e53e6059026c517a8bef0/target-i386/fpu_helper.c#L997.
> > >
> > > We also had a patch for this bug:
> > > https://github.com/unicorn-engine/unicorn/commit/59b09a71bfc6fd8b95357944f6be9aa54f424421
> > > which you may refer to. I can also help draft a patch if necessary.
> >
> > Hi!
> >
> > Unfortunately the patch is incorrect, because fpu_update_ip is called
> > only at translation time and not at run-time.  If more than one x87
> > instruction is present in the same translation block, or if a
> > translation block has been compiled after the one that is executing,
> > env->fpip will be incorrect.
>
> I think this is https://bugs.launchpad.net/qemu/+bug/661696 ?
> That had a patch attached which got some on-list discussion
> back in 2010:
> https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html
> The review comments may be of help in coming up with an updated patch.
>
> thanks
> -- PMM

