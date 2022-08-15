Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E164592F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 15:05:52 +0200 (CEST)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNZmw-0007tz-PH
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 09:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNZki-00068a-Mf
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:03:36 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNZkg-0007hE-LP
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:03:32 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-32a09b909f6so70516747b3.0
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6PIcwyThYzZWWJhZ8a+KS1oyLUCBBpC6o5KnYAhvrZ8=;
 b=N1StCkieuaYUXjhPH2mLHiOopxHsR/DnadVrxt5A3VKq1Xlwz0Ew6Xw/WbWkx+QneA
 tvCk6ijwykPA4bpSRHFTMJ5sEMuSC0CG6BIMG6Bw/yICtZQkyrFItyBRm7/S8bPDt+9R
 pCvv3rYZ7a3aJtML/M/jcVF1LkJfdfrJXSqlRu8WIS2C3YyU3XSXCPl00nPDVHy6ijsK
 EKBPuHkXi/PeaBmphr7b8xIpEppONaULik7Ewxsav9ho9uoyBTg6dxR/Nmv0DFT78QFE
 XutUNufVfDlnzmf6KB8m1HsiDimECMB/e/y/mMsibA6QkeGyEl4PKINJ/lAUgO4gdr55
 gptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6PIcwyThYzZWWJhZ8a+KS1oyLUCBBpC6o5KnYAhvrZ8=;
 b=0Me6RwyTIuanJeQnno3bYaz7KLyTXTrFR56MJsMw35Kg5dIlTXi717xhbOLpj+M++6
 UhJ/pEiRCAES8orcJSGXMIFoGNTH7AvFAkxyIayxekgugV9h0nbJNJBPvlcGMF2RJqOI
 er/14j+Xs/cLwWCb017/G+6Olic8nepm+Vqx9jwXvuq8+7udLHb4mDs9rvNCednqdFui
 KOcmBUH4OUifzfeqe7HYX51/5GZMqfY0TaBlDL/Q99S9Q4cHXBWMzuPi1wfl/i1HfMn4
 r2SEr9UdoladF0XOgCoPctSh17WaMPpAYNMsARmicwqZTIbtiNBgk3fcH8aWhrIomvlH
 MqEQ==
X-Gm-Message-State: ACgBeo0k2Uqih9mj0FVg1mPPb7ymlq0u41HhGNiyZBDtnt1zJH/htXsb
 9gSqu9D8E5bYjVN6vOWKfqMca2hWzdTH/oDMsOa5mg==
X-Google-Smtp-Source: AA6agR6nn7MRM7SjSFFKB8iLMXIl5KjaY4mkgVaBitJuz36O0rnYgpgzeTce6P+LgBH/pSv+IhKbHvsc5NNsF0/4iAk=
X-Received: by 2002:a81:7bd6:0:b0:328:297a:f31f with SMTP id
 w205-20020a817bd6000000b00328297af31fmr12894601ywc.469.1660568608476; Mon, 15
 Aug 2022 06:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com>
 <20220815112239.37xm3zwbe5gd7trz@sirius.home.kraxel.org>
In-Reply-To: <20220815112239.37xm3zwbe5gd7trz@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2022 14:02:47 +0100
Message-ID: <CAFEAcA_vFUfGA+51YT-Up3GCVzQKPtpscXMncqiGd849oC9NkA@mail.gmail.com>
Subject: Re: race condition in display device caused by run_on_cpu() dropping
 the iothread lock
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Mon, 15 Aug 2022 at 12:22, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Aug 01, 2022 at 02:23:55PM +0100, Peter Maydell wrote:
> > I've been debugging a segfault in the raspi3b display device, and I've
> > tracked it down to a race condition, but I'm not sure what the right
> > way to fix it is...
> >
> > The race is that a vCPU thread is handling a guest register write that
> > says "resize the framebuffer", which it implements by calling
> > qemu_console_resize().
>
> [ back online after vacation ]
>
> Easiest is probably to not instantly resize the display surface but
> let the update handler do that on the next display refresh.

I feel like this will fix the immediate crash but isn't
addressing the wider underlying problem. (For instance, if the
user does something with the UI at just the wrong moment this
can probably get in during the we-dropped-the-iothread-lock window.)

> Many display devices do that anyway because often multiple register
> updates are needed to perform a resize and you don't want your ui
> window run through all the temporary states ...
>
> Alternative: The DisplaySurface is backed by pixman images which are
> reference counted.  Some qemu code which depends on the backing store
> staying around while not holding the iolock work with the pixman image
> directly because they can just take a reference then to avoid the image
> being freed while they use it.
>
> >  * memory_region_snapshot_and_clear_dirty() ends up calling run_on_cpu(),
> >    which briefly drops the iothread lock.
>
> Oh.  Is that new?

Since commit 9458a9a1df1a4 in 2018.

> > How is this intended to work? I feel like if run_on_cpu() silently
> > drops the iothread lock this probably invalidates a lot of assumptions
> > that QEMU code makes, especially in this kind of setup where
> > the code making the assumptions is several layers in the callstack
> > above whatever it is that ends up calling run_on_cpu()...
>
> Indeed.  The display update code paths using dirty bitmap snapshots
> certainly don't expect that.

Yeah. The problem is that to fix the bug that 9458a9a1df1a4 is
trying to fix we really do have to allow guest code to run,
because we need to make sure that the TCG CPU thread has
finished writing to RAM and got out of the generated code
block, otherwise the dirty flag won't be consistent.

-- PMM

