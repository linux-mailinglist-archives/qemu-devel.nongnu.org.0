Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B889603E50
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 11:12:49 +0200 (CEST)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol583-0005hQ-6i
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 05:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol53X-00020Q-5L
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:08:08 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol53V-0007kX-BX
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:08:06 -0400
Received: by mail-qk1-x72b.google.com with SMTP id o2so10268335qkk.10
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8R2M0tPCBM/zTVFE934OLB4QLkRxnohGIkXqMU0LYc=;
 b=LPy1yVV4a6j1ndp9jKYQpmC4GJrge+UfDuq6gk/jQGV1Sf4rMu2e3nB7QUAzVWg1o0
 A1nh/qty6qDBibfUCbShvJ9PgqnbtU2zKZqUA1Y//QyAxv5L/9YIbprE8KL35mOwtWPA
 gEC3g/kRx7j5k+jT9Z6DXQqm0jNoLgvrorfjN5HSh+ofyQeDVso8hskO84y9r2pdoKLB
 gTf6d1WyCzFk3EMR5xZwif4Wxg9P7V7kMLGbdMkPrXKpB0urKUsMJwOAFHaFlqDuIGcG
 v+vtVhN9YIgvB2mPwAiWhYRMIttkAPU2RdTVi7sa/P/JCfEBLic894dmnIjV4sT0+SUa
 FuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q8R2M0tPCBM/zTVFE934OLB4QLkRxnohGIkXqMU0LYc=;
 b=4/xemgOQ2yRF/JkzOci/h1EQpnvFT/sKByisTOYtAalO7AEcVF5PYn8mSUtaEiA9M8
 AlQdf9PuJvntqfrG74fdEupkZ7WIiYYiMfoe5bV/RP6+1v7isO3on8BO4eBz7tSySOr1
 bY9krmMQuh3Uf7blSv0Ez4C618oDJU9eE6CLjvrbjHUPh6Ju272uG/6CLP1R4XdXnOrW
 GysIo88bqo10FW0MLtTLGPhqrKFFZrGS7C2vQab47f5pX0tExvnNZHss6ZryrpFIFLQz
 U7Y8v6ZWC8qA5cM/O/UKkcXecIheG3OCbtvwDYvRSWpNjxwFSaH21cRwoJXWe2l3oXfF
 +qgA==
X-Gm-Message-State: ACrzQf0+HrlJPgX1nzC6CkEjoxrhAmBYL5kF+1TJFLV0D/XLe7u2B/VP
 HkQbrPyq7pn5HNq+99To/7RuI4TXPJLzLHHUiBA=
X-Google-Smtp-Source: AMsMyM7ox6t1BbGO/wIfBre2c5KfV1OsDA4l3oOiFETXOPpEDk+4Q33/5PWXCIUu6G9i70rKxgH4V2rp40q6imeG1uc=
X-Received: by 2002:a05:620a:304:b0:6ee:77f1:ecf9 with SMTP id
 s4-20020a05620a030400b006ee77f1ecf9mr4732481qkm.94.1666170481212; Wed, 19 Oct
 2022 02:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <20220824085231.1630804-2-bmeng.cn@gmail.com>
 <Y0+2LOluAkuIN0BF@redhat.com>
In-Reply-To: <Y0+2LOluAkuIN0BF@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Oct 2022 17:07:49 +0800
Message-ID: <CAEUhbmUBSzFayXjERJoGmo0d0aK69ZO+9wROPq4oYd1OrjrEEQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] util/main-loop: Avoid adding the same HANDLE twice
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Wed, Oct 19, 2022 at 4:32 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Aug 24, 2022 at 04:52:30PM +0800, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Fix the logic in qemu_add_wait_object() to avoid adding the same
> > HANDLE twice, as the behavior is undefined when passing an array
> > that contains same HANDLEs to WaitForMultipleObjects() API.
>
> Have you encountered this problem in the real world, or is this
> just a flaw you spotted through code inspection ?

No. This was noticed as part of debugging [1] and code inspection was
done for all possible suspicious places.

[1] https://lore.kernel.org/qemu-devel/20221006151927.2079583-17-bmeng.cn@g=
mail.com/

>
> Essentially I'm wondering if there's any known caller that is
> making this mistake of adding it twice ?

No known caller at this call chain. But there is another in the QIO
socket channel APIs that may add the same handle twice, fortunately
that scenario is handled properly in the GLib internally.

>
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v3:
> > - new patch: avoid adding the same HANDLE twice
> >
> >  include/qemu/main-loop.h |  2 ++
> >  util/main-loop.c         | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> >

Regards,
Bin

