Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786BE4D0423
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:29:00 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGEF-00043T-4f
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRGDG-0003Mw-BC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:27:58 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=43889
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRGDE-0004PD-Ny
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:27:58 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so18377554ooa.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+oQLo2rPUSjg2ghZUzvgZNYArZoHNkLI4hxtOLxVSf0=;
 b=QEzPmJyMbLKbDcDR1xNuDIBdVAao83U6j4Yhvkxgbzv+T9DNQQhk7gAOraxKiWLU4E
 FEyMSR5ENxUUo7F+mCz1JIVcug8ZA8BNBpQpV52wysDE2NXAApsJTH1TSQ2qpjjCVmX5
 Bs/kf16b7O5HJllCemtwc32z2EaEIo+RkPHFprVJ5M9G9TIdVwn4xbMyVeR7+Jwb4p1S
 Ii/gPziBLo2E5TexFYOALE4tu25QjPNkG8RQ4fX8lQYN7dzNjRTZGZ3pnCY1WgFwFgHO
 fxCvAks38Ibf5la5/9ZTl6WUeoylEoEgzk3iEvIBuyV5A+sBnpgu6Kuz5eQ4JaAiA91m
 Z7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+oQLo2rPUSjg2ghZUzvgZNYArZoHNkLI4hxtOLxVSf0=;
 b=f4cyYS1LYXURCa7mmlp4dNNGrh5q2mUQ742SUPyCZ5DfmN8EFG+DlBMddu/h6lFuSG
 aUNTbdc860DOz53Ag7/PvOtFFNYJeVip7/9tpNGGXoRlimZ/KFRxCWcmDidoMw7tBR+r
 v3MoIQLd5HcjqLRT8zyJfTaIfQs9KjgJV9cjV8ncbvuI57DTPQP2nkIKXK6Uj02AF007
 MU15xW5UUNJpa2mdP5qNd7mMQ7E+gVE2yDpQKYyklJWB8C/QqjhUFroMYUlweI2nJiy+
 wIf7MaHbVGIJGl4Nvdiytxo4Fr5OBxXNrBCegEp8BF6y0fU6X1P2eu5FQlOwK8f5WXda
 KWag==
X-Gm-Message-State: AOAM533lFM9wRa29vqYKeGrmpbuPIdT5qNCLXRXTsXAlx9qc8+iSA4JK
 3bYEkoTj9TaW2os3jBFBmpDYYZaw2QVrPm+7cvM=
X-Google-Smtp-Source: ABdhPJx8CxYpqwJOff+jVtUn+PiRYAYydQmzZQrZgQpc2lQL3wYljHeoBblhjSYdsmzXSZkIS8av4dTF1J+9A+NHcC4=
X-Received: by 2002:a05:6870:3816:b0:d2:c31e:cb8c with SMTP id
 y22-20020a056870381600b000d2c31ecb8cmr5982489oal.172.1646670475559; Mon, 07
 Mar 2022 08:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
 <CAFEAcA8XshU90eKJM_4+_mLRhUCN+ExWzCkPTveLht0bWBb8=w@mail.gmail.com>
In-Reply-To: <CAFEAcA8XshU90eKJM_4+_mLRhUCN+ExWzCkPTveLht0bWBb8=w@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 8 Mar 2022 01:27:44 +0900
Message-ID: <CAMVc7JU=easTepCd=j0QHWBcFrry7iYXgX1BbQjs27fmxZGXrA@mail.gmail.com>
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 1:14 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 7 Mar 2022 at 15:34, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > On 2022/03/08 0:10, Paolo Bonzini wrote:
> > > Simplify the initialization dance by running qemu_init() in the main
> > > thread before the Cocoa event loop starts.  The cocoa_display_init()
> > > code that is post-applicationDidFinishLaunching: moves to the
> > > application delegate itself, and the secondary thread only runs
> > > the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().
> > >
> > > This fixes a case where addRemovableDevicesMenuItems() calls
> > > qmp_query_block() while expecting the main thread to still hold
> > > the BQL.  The newly-introduced assertions in the block layer
> > > complain about this.
> >
> > Hi,
> >
> > Thanks for this interesting suggestion. However I don't think this
> > improves the situation much. The main contribution of this change is
> > that elimination of display_init_sem but it is still necessary for
> > command line usage of the executable.
>
> The main benefit of Paolo's suggestion from my point of view is
> that it entirely eliminates the odd situation where cocoa.m wants to
> make calls back into QEMU code where it does not itself hold
> the iothread lock in the current thread, but instead knows that
> some other thread does and is waiting for it. Instead we end up
> with a much more straightforward situation of "every time we
> call into QEMU code we hold the iothread lock directly ourselves".
>
> thanks
> -- PMM

The current cocoa.m somehows calls back into QEMU code in main, but
that is not necessary as demonstrated in:
https://patchew.org/QEMU/20220307134946.61407-1-akihiko.odaki@gmail.com/

With the code is moved, it becomes only a difference of the place
where the code without iothread is located, in main or in
[-QemuCocoaAppController applicationDidFinishLaunching:].

Regards,
Akihiko Odaki

