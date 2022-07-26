Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5683580924
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 03:41:07 +0200 (CEST)
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG9ZK-0008Bk-Ge
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 21:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oG9XD-0006fl-2N
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 21:38:56 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oG9XA-0000ai-Mw
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 21:38:54 -0400
Received: by mail-qv1-xf35.google.com with SMTP id x6so246946qvu.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 18:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mhjx9RorWkqidavlQthUFEPVOYIpqiJgrM886b/nnFg=;
 b=n4Ymy39RejRNVNwm8qBZjE5ZuNftN542ZowDGXUIme5cE6HcE7oAm6UwXGWQDK0Z2C
 i4bz7Sc54BxvC8W99vjVkoTfh3ua5j7TYA9AKKWtzZbuGaNU9gbasgMqRDb9p1zEmOpA
 Xaj5RZhWTvy6jpRxgIfmfztBP+t3zP7j7KWTdUOEzyyA+CeO0tPhSy49YbLH5EaWtSRH
 aH9kJw6UvfLOD4wz5VUvjbpxbndjyDHSMlVDLIypvwGNi8dhuqepl0hsgAQzWCQWnb3B
 irJlTSzihnWBKIJFaiizBPsGx5aVbt5u2l+vnyMRy3WGsE64g1GLv2ExppmQ3shJ/GQ+
 dBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mhjx9RorWkqidavlQthUFEPVOYIpqiJgrM886b/nnFg=;
 b=NVO1Ck1mspPlMlZiEQPv5xd0EAoObSnS0p9SPWo9Ou7W+0jm7r+QoOhrXfT78asGBQ
 rauYYNEAtWnWbCx3IWn5Nlcy29o7dY2t3RyozV1KC/Cns3nHOfOqeSiI0JZXfGsvtgy8
 mlhwuD/yKehIZXGKsr4K+9AUlICHIxmPOo6vNhb+XZbBsydeWqsanU7mRR+xTO+JhJRu
 y9stGNVOA5gUm9ITj3HbdUdv8XrYY46iK1i67YWEnJyrnhPWy8n4UjvHBYAIcX9al3mT
 aM+4/uWnNGr4k6TGOgzygxti3DcLAGWf+4y9gvihMC4PrJaSFxX+aKZyQTQMG7nW/AeO
 T5bg==
X-Gm-Message-State: AJIora8QhQF+0yOZjD3fN1IO3kXslXWO3W5hz7pH5m5EwWRKybqYFTCT
 iErOqjIg0vPkjbyvH4dzGLCz2DjTPNhxAq4d3Cw=
X-Google-Smtp-Source: AGRyM1tF7+o4YQpmz5WRK2obq7mIp4TLGNTM4u9ICtuyQcIjcq8w8hyi3QNDbZuX4yCLkfqHmfy6ED/e6WXctUGzGKk=
X-Received: by 2002:a0c:a947:0:b0:474:55c3:21bb with SMTP id
 z7-20020a0ca947000000b0047455c321bbmr3786892qva.51.1658799531441; Mon, 25 Jul
 2022 18:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
 <874jz5i9qr.fsf@linaro.org>
In-Reply-To: <874jz5i9qr.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 26 Jul 2022 09:38:40 +0800
Message-ID: <CAEUhbmWBaCrODGY_KMncAmTy53gmid4R=OKDMTi1T1fR0PUBMw@mail.gmail.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Jul 25, 2022 at 9:48 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The following error message was seen during the configure:
> >
> >   "ln: failed to create symbolic link
> >   'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
> >
> > By default the MSYS environment variable is not defined, so the runtime
> > behavior of winsymlinks is: if <target> does not exist, 'ln -s' fails.
> > At the configure phase, the qemu-system-x86_64.exe has not been built
> > so creation of the symbolic link fails hence the error message.
> >
> > Set winsymlinks to 'native' whose behavior is most similar to the
> > behavior of 'ln -s' on *nix, that is:
> >
> >   a) if native symlinks are enabled, and whether <target> exists
> >      or not, creates <destination> as a native Windows symlink;
> >   b) else if native symlinks are not enabled, and whether <target>
> >      exists or not, 'ln -s' creates as a Windows shortcut file.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> I'm still seeing Windows build failures such as:
>
>   https://gitlab.com/stsquad/qemu/-/jobs/2765579269

I've seen this one before. Looks like this one can be easily reproduced.

>
> and
>
>   https://gitlab.com/stsquad/qemu/-/jobs/2765579267

This one seems to be a random failure?

>
> Any idea what's falling over?
>

Regards,
Bin

