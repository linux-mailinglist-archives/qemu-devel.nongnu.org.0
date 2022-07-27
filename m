Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80AC581FBB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 08:06:25 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGaBc-0004kd-AD
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 02:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGa8N-00034X-Nm
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:03:06 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:42789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGa8L-0002y4-Uc
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:03:03 -0400
Received: by mail-qt1-x835.google.com with SMTP id w29so11990590qtv.9
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 23:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HTkIsO59++B9+B3TrPAA+CeT2rEJe+ATh5vGayG/LRU=;
 b=TiOjmhNGklDUoaA152723AKzt2zZyCPz8lG2kdlpe9okmZoiM/8iQGiAKub1AFVPcV
 CkqsqmUaZ4vg/AHcpJxBvJytK65v+cVlV8AVkVtIRG9T5VAsSI7m5/dWuyHzu4EI0LQC
 9s1osml7tNDr+B4c0DdiMdvXQPnbnWXJxJhnbbtNVL1kmR893dKvwjcZ3/kpuaTTgIMa
 epy5TDSHaKebjzt/KvThMY/sY/k9JgP0aZ/qjHtE0Qckt1lFjBJk5L++TRWQO4lFp/de
 dF2wHJPhiPrFb2T1flC6DxKbHJbksk5uuoyHuOR5u3OsZKWiGPLYMZM1JYmeaP0HRwjE
 lq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HTkIsO59++B9+B3TrPAA+CeT2rEJe+ATh5vGayG/LRU=;
 b=g/v6TKD3S60gYS9uQeq+11O80JUMK4d3ikN0lrukAbEAVzJy+ZuOx1b96upc1zDobQ
 9JmJSSWEaL+kY04qaDmwPpsuVii6XU8Jl3X/mbehBEokpuTGyuWaOrMR+I4OS7SRdHtU
 /kEiumaJN0rY4vofTFWpsP8R5kZK29kE+tC+Ep3vT49Wk8u2ap/g3hkIhP5tc2Xz0rJg
 pWPwLUA0LFmSj/1LI3UmUFvPgjAUO7CSLgMNHJXeHbkkhC2EhatX/XJnabN9aWk1JuL2
 xjf4f/Bi0s23ytBN8BivrvZrTwmb4FLOgjWKUtthwx86ip/NhanKhz7BfXHoMqMdnA86
 AsPQ==
X-Gm-Message-State: AJIora8pQfi+kqykwIDkytFYN8Yc+X3cawg06JXpH/YvaDOyIK6PHYeG
 w6qh6iQmve23CASDVYmtvVfEuFOQRUbBwPZrcSQ=
X-Google-Smtp-Source: AGRyM1tiR4MAV14z/t7ARaZiYy/kBfC9XVhLjg3AE81D2Ggf9IXOAp3W9nt24Vo4QkeVggsRX74ptLxEJgdDyTpKvHw=
X-Received: by 2002:a05:622a:100d:b0:31f:25e3:7a45 with SMTP id
 d13-20020a05622a100d00b0031f25e37a45mr17084515qte.365.1658901779642; Tue, 26
 Jul 2022 23:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
 <874jz5i9qr.fsf@linaro.org>
 <CAEUhbmWBaCrODGY_KMncAmTy53gmid4R=OKDMTi1T1fR0PUBMw@mail.gmail.com>
In-Reply-To: <CAEUhbmWBaCrODGY_KMncAmTy53gmid4R=OKDMTi1T1fR0PUBMw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 14:02:48 +0800
Message-ID: <CAEUhbmWkVfjEgkg6uQ8cVVO7ipdiKuKeuco+fGNQ4zZdCnrA4Q@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x835.google.com
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

On Tue, Jul 26, 2022 at 9:38 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jul 25, 2022 at 9:48 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > Bin Meng <bmeng.cn@gmail.com> writes:
> >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > The following error message was seen during the configure:
> > >
> > >   "ln: failed to create symbolic link
> > >   'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
> > >
> > > By default the MSYS environment variable is not defined, so the runti=
me
> > > behavior of winsymlinks is: if <target> does not exist, 'ln -s' fails=
.
> > > At the configure phase, the qemu-system-x86_64.exe has not been built
> > > so creation of the symbolic link fails hence the error message.
> > >
> > > Set winsymlinks to 'native' whose behavior is most similar to the
> > > behavior of 'ln -s' on *nix, that is:
> > >
> > >   a) if native symlinks are enabled, and whether <target> exists
> > >      or not, creates <destination> as a native Windows symlink;
> > >   b) else if native symlinks are not enabled, and whether <target>
> > >      exists or not, 'ln -s' creates as a Windows shortcut file.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > I'm still seeing Windows build failures such as:
> >
> >   https://gitlab.com/stsquad/qemu/-/jobs/2765579269
>
> I've seen this one before. Looks like this one can be easily reproduced.
>
> >
> > and
> >
> >   https://gitlab.com/stsquad/qemu/-/jobs/2765579267
>
> This one seems to be a random failure?
>

Saw another random failure today in the msys2-32bit build in CI.

[313/1788] Generating texture-blit-vert.h with a custom command
(wrapped by meson to capture output)
FAILED: ui/shader/texture-blit-vert.h
"C:/GitLab-Runner/builds/lbmeng/qemu/msys64/mingw32/bin/python3.exe"
"C:/GitLab-Runner/builds/lbmeng/qemu/meson/meson.py" "--internal"
"exe" "--capture" "ui/shader/texture-blit-vert.h" "--" "perl"
"C:/GitLab-Runner/builds/lbmeng/qemu/scripts/shaderinclude.pl"
"../ui/shader/texture-blit.vert"
[314/1788] Generating texture-blit-flip-vert.h with a custom command
(wrapped by meson to capture output)
ninja: build stopped: subcommand failed.
make: *** [Makefile:162: run-ninja] Error 1

Regards,
Bin

