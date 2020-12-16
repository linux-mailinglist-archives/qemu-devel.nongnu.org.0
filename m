Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51E42DC45A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:34:44 +0100 (CET)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZlD-0001sU-Vc
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpZcx-0001Dd-1o
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:26:11 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpZct-0007LE-MP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:26:10 -0500
Received: by mail-ej1-x634.google.com with SMTP id lt17so33612322ejb.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/NLiolnWHs6Xq0qrTQhQW1wLBzm/9WZKzF/l0vH2pBI=;
 b=xCMU2Pa9zbgftYy/nzKTHjZfE2bn2dkCUhzG97gcoPTI4KqXhO/xYGwMBd2R266HHI
 Zyyu9rdNm9spfXFwBJUd5YtBLY+aRwtlDISwcSmzgFdNbTy4EIuIjCxiAdgHN8FVTyxW
 JK4KBkC1NNyzE1N4ayFXrnhjdJEE/Cj+jJnF1FXllYChRbVsLpTF272NcfnxN+xedX46
 8vmjAJajCycR7L3ecwsPVgElwfWAHUKW+F42Lt4GXYsYfwzSFstvB1PvotwakvWnf1tg
 XNnbqs3LCbooCP2qEgXSXvSYTruCfXZOl5c7CZpv8pRHWDPuKdxEHB+Y8LAwltU4ltmt
 7Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NLiolnWHs6Xq0qrTQhQW1wLBzm/9WZKzF/l0vH2pBI=;
 b=OcuxSo+8z9SUyw89xpJkBRrgnV19nkXVdbBAcmqMOLN5AWLC6p+AdGs4QsirDwODpt
 a0uE0GRfb+uAvA03D79dLQnBsyyjvokEVBgxiotoBy+GPekSkDqizC8VIOMO0NySNTfV
 RC6MIj1XRXwGtzQ2dhOMbNcD+f5iPBUHqYPyOVtr9BGF8b9dmJHlYfxb68W1+XQr4o5S
 +chQY8x94IAuosAqyZ26T7pkITS1igTNOmmlfcE8IcANMQgkjMwZ8dzW7gfaJ66YNwYN
 w/l162a8TniK53PJSipnEO8VwN0GdspDBytv4ahBWzI/LnTaupUhlmoweuOZ0vUCqXEI
 5Nfw==
X-Gm-Message-State: AOAM531e8Ej+u7dEyjQPra+NcJTZJx6dOJWEguvypjaHSQQMmFiWHMiu
 gf0hyLFQfFZoB7qGrGVlioZ+g+lv0kfFkEknJlkFaQ==
X-Google-Smtp-Source: ABdhPJxoOE0N/QVdMKvABSVAY+qgZacbvdMAwAbi/Z/esIDBOHj9rHg74dqDfyFfYl6i6oKiuNRqpOzcwZx4hcxeBrA=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr32084860eja.250.1608135966144; 
 Wed, 16 Dec 2020 08:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20201209103802.350848-1-stefanha@redhat.com>
 <20201209103802.350848-2-stefanha@redhat.com>
 <20201215161106.GJ8185@merkur.fritz.box>
 <20201216162142.GB707467@stefanha-x1.localdomain>
In-Reply-To: <20201216162142.GB707467@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 16:25:55 +0000
Message-ID: <CAFEAcA9J4Dp8s6YhQBfrcr1N9=OeDX8+9sCeXLZ5VhdvnyYzjg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] docs: generate qemu-storage-daemon-qmp-ref(7) man
 page
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 16:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Dec 15, 2020 at 05:11:06PM +0100, Kevin Wolf wrote:
> > > diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/interop/qemu-storage-daemon-qmp-ref.rst
> > > new file mode 100644
> > > index 0000000000..caf9dad23a
> > > --- /dev/null
> > > +++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
> > > @@ -0,0 +1,13 @@
> > > +QEMU Storage Daemon QMP Reference Manual
> > > +========================================
> > > +
> > > +..
> > > +   TODO: the old Texinfo manual used to note that this manual
> > > +   is GPL-v2-or-later. We should make that reader-visible
> > > +   both here and in our Sphinx manuals more generally.
> > > +
> > > +..
> > > +   TODO: display the QEMU version, both here and in our Sphinx manuals
> > > +   more generally.
> > > +
> > > +.. qapi-doc:: storage-daemon/qapi/qapi-schema.json
> >
> > Did you intend to actually merge the TODO comments like this into master
> > or was this meant to be resolved before you send the series?
>
> Thanks for pointing this out. Both qemu-qmp-ref.rst and qemu-ga-ref.rst
> have these comments and I copied them when creating the file. I don't
> intend to try to solve that in this series.
>
> Would you like to keep the comments or should I drop them?

FWIW, the ones in those two docs are the result of a request
from Markus when we were doing the conversion of QAPI generated
docs from Texinfo to rST -- the old separate Texinfo-generated
docs ended up with a version/license statement in the generated
docs. Fixing this depends I think on the "merge the 5 manuals
into one single manual" patch; once that's done then it should
be easier to have one consistent place to note license, copyright,
version, etc.

thanks
-- PMM

