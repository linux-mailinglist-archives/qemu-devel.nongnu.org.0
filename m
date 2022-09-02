Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C685AB4E8
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 17:20:05 +0200 (CEST)
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU8Si-00050H-CX
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 11:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU8RQ-0003In-6Y; Fri, 02 Sep 2022 11:18:44 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU8RO-0005IX-LG; Fri, 02 Sep 2022 11:18:43 -0400
Received: by mail-qk1-x735.google.com with SMTP id b9so1962457qka.2;
 Fri, 02 Sep 2022 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Xb4lhFuyKb9lLoLyPjPUUtV5NVRgLJfiBQ86BA28lMo=;
 b=ZbGN+YgrspHKduOnqW2k2ypQoxH48//wdB/uKvKeEhxe1akRhA84iITc+hBmRYOFaQ
 qfFHopZRW0mEKh6bF5yAzT0jt5VO3gwc30jlhRBQdveKl/2mnjtCuloqVPVMmu0my+Y6
 J3n7SqsLQDotiZps/BsHjDjku0T9uxy4hLyf6G1HLvT3dQZnoilJtn7v9LDYvBAF19a1
 1O0BKDyXqKQj650IoGRGiFem/Tj9YwmUG0geeyLc40wlbxYGISU3ufaqHiJfCH0EP0DK
 AxpscaZ0A4XJIOgl5QS7EG3tGkICY9fA2Mvzs1qCDzowHA3UO/vRYtFEJrxSNweDqOxe
 U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Xb4lhFuyKb9lLoLyPjPUUtV5NVRgLJfiBQ86BA28lMo=;
 b=vCC/1oC6S2Z7AUNSaDy+rgokefkYWGNSWyv/7G3SGvKD7YDpCigTXDAtu65fcz/LFo
 JsYuS5X2xajx2j/cpO1sYKx9KUcJoTcxO78yHNSGTWa+1oXLxUdhgkxrjuR2HX09Wd53
 CK99FKDG5H3/IcZxj75hbWvB7Vr8JV7WjQT4/lKdJEgfcCzZWCf6uYQJuPWeAV4hS0GL
 jMo0QfzIuqQFaGQaDNeA2NzAP2y0jOk/kFNi7KBZU8dOVhTZI/q7xZY0tLkXQ7FRr24j
 NPkMct2gzZ+F5jIauaAMHOT94aD/YNFC9IrBLRt478LBRiD9peAnZ5oz1J/BhMfO3VDC
 ViWA==
X-Gm-Message-State: ACgBeo3pAgccQYlti15JD9spWdBxKvhd19gTGhbQ4nhL+V/Pk7nc/Rb3
 fNtrrdi4RY8agc4OCwyABtLbPfn3stUqtvu37bo=
X-Google-Smtp-Source: AA6agR5Vl1/yY/UH/J0i1FtrMyWc00TKMAL0GdXAQ/gExcG07aE/h2mC2RS6cMgRftHsue01ceA4sNOIB10qMV/SadM=
X-Received: by 2002:a05:620a:56b:b0:6bc:58c2:657d with SMTP id
 p11-20020a05620a056b00b006bc58c2657dmr23349472qkp.94.1662131921281; Fri, 02
 Sep 2022 08:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-31-bmeng.cn@gmail.com>
 <77ca7370-4cb5-b393-f7fb-2a01ec644285@redhat.com>
In-Reply-To: <77ca7370-4cb5-b393-f7fb-2a01ec644285@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 23:18:30 +0800
Message-ID: <CAEUhbmU-ZS9Q99SHOEPuBXiz-MJZYOf4=LJ=G_bscT7zV5Xd3A@mail.gmail.com>
Subject: Re: [PATCH 30/51] tests: Skip iotests and qtest when
 '--without-default-devices'
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x735.google.com
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

On Thu, Aug 25, 2022 at 8:04 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/08/2022 11.40, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > When QEMU is configured with '--without-default-devices', we should
> > not build and run iotests and qtest because devices used by these
> > test cases are not built in.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   tests/qemu-iotests/meson.build | 5 +++++
> >   tests/qtest/meson.build        | 5 +++++
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> > index 323a4acb6a..38d9a874d2 100644
> > --- a/tests/qemu-iotests/meson.build
> > +++ b/tests/qemu-iotests/meson.build
> > @@ -2,6 +2,11 @@ if not have_tools or targetos == 'windows' or get_option('gprof')
> >     subdir_done()
> >   endif
> >
> > +# Skip iotests if configured without a default selection of devices
> > +if not get_option('default_devices')
> > +  subdir_done()
> > +endif
> > +
> >   foreach cflag: config_host['QEMU_CFLAGS'].split()
> >     if cflag.startswith('-fsanitize') and \
> >        not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index c97da5a062..0291b3966c 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -4,6 +4,11 @@ if not config_host.has_key('CONFIG_POSIX')
> >     subdir_done()
> >   endif
> >
> > +# Skip QTests if configured without a default selection of devices
> > +if not get_option('default_devices')
> > +  subdir_done()
> > +endif
> > +
> >   slow_qtests = {
> >     'ahci-test' : 60,
> >     'bios-tables-test' : 120,
>
> That's a very big hammer already ... I'd prefer if we could work on the
> tests instead to adapt for the availability of devices instead (we've done
> quite a lot of work in this area in the past already, but apparently still
> not enough yet ...)

Adapting tests for the availability of devices is a large scope. I may
not have time to work on this.

I will have to drop this patch in v2, and adjust the patches in the
series to keep bisectability then.

Regards,
Bin

