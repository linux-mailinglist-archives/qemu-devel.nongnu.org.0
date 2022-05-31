Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8753901C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:54:45 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0SR-000657-Vj
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nw0OY-0004AI-4a
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:50:42 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:40895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nw0OU-0007wp-Ol
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:50:41 -0400
Received: by mail-oi1-x22c.google.com with SMTP id t144so17084692oie.7
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4hYITiYKW2ZuM7e/hsRBhkWX/HRyxowl9lsYAKahB7w=;
 b=cJEC4QmEIB+lEv3NdrCDhLkwYR17HCP84yoOymYcz9IrY0l+ZVh0SUmsi3chP6t7KD
 S94EE/+TouigTADR4o9aNxDaYWwcOv5fE0s9CEnO46Sz+Bh7epG4e+2jUOpHt2Reknq2
 uBUj4XLjj2wwwB3kOpGdwvmLaKbw/iqdSbJfIG07aA7TDdpbHqzM/mN93JBiqTMIIL5k
 hxAQwDBZ9FrK0RhiK1FBeuP2bmU/fCkFWNqkiqdso4kA355ycz3lbFc8UHxwfZolSYJd
 +3A/SWWxL5mjMqqkSZrQbZxTY9fuLpklAs5XT/CVb4kHu3pRE8fnY4NpziuriW3SwZkE
 I7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4hYITiYKW2ZuM7e/hsRBhkWX/HRyxowl9lsYAKahB7w=;
 b=H8mpuILvltVpF2Tf7DeQkPDLMQC2wCb15tDw/Wx5EgTgf3jP5d1zF2vtWvOXvO8gL1
 q8WAhjb+Lmsaj3xRfM5uycVpxTkITVB/Y4bHB4mgALIER6KdOcZqCdIkAYAaPem+4oEi
 D4DcNKhexqMDvs1CS5pZ6yvUMyVJgtd6IHUi+d3jvUefl5kybgdNWiYHGlrjxnvBL4V+
 TLPT3Ke7TNGDuPDp8Nl99dIfXPorMPYMqhzNzvWmUWkzv8GC8JKkeLdmBMB4Ufh7Nl1+
 uX+VjQhIi+DBw6vjWsIOlbM2bLxArVMVMbvlY0BQE/N4d8WfrpPacnJ4pCKybfdhhOSm
 jbGw==
X-Gm-Message-State: AOAM5307R61a2hn6sUzP/iHlytc5tce4aUvthfkDxHRATiAPWYGpXn3F
 9vMxRqoEKXUIsJa8lUGsyUxvS4PJJRop68RHXz4=
X-Google-Smtp-Source: ABdhPJyF9utnFIgRV7o41VDnNCI3F/OpuOpUOG9iqXu/A0GZmlt6TwvalaM1iSkxWO2IMzd2NI5eoTDsX+r7TGQZzYg=
X-Received: by 2002:a05:6808:3099:b0:32b:30de:d14e with SMTP id
 bl25-20020a056808309900b0032b30ded14emr11125548oib.212.1653997837560; Tue, 31
 May 2022 04:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220531105011.111082-1-faithilikerun@gmail.com>
 <YpX8q9XrnTehFu7N@stefanha-x1.localdomain>
 <CAAAx-8KBk2tzaJRfYtAbsAGSAvY4z+SsV2BxtRBO7mqVvmLW_w@mail.gmail.com>
In-Reply-To: <CAAAx-8KBk2tzaJRfYtAbsAGSAvY4z+SsV2BxtRBO7mqVvmLW_w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 May 2022 12:50:25 +0100
Message-ID: <CAJSP0QX-HDee_mDxSF_vgPrUBVFUP0gj+SUECQW+dqrXywR2Yg@mail.gmail.com>
Subject: Re: [PATCH v6] Use io_uring_register_ring_fd() to skip fd operations
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x22c.google.com
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

On Tue, 31 May 2022 at 12:34, Sam Li <faithilikerun@gmail.com> wrote:
>
> Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=8831=
=E6=97=A5=E5=91=A8=E4=BA=8C 19:31=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, May 31, 2022 at 06:50:11PM +0800, Sam Li wrote:
> > > Linux recently added a new io_uring(7) optimization API that QEMU
> > > doesn't take advantage of yet. The liburing library that QEMU uses
> > > has added a corresponding new API calling io_uring_register_ring_fd()=
.
> > > When this API is called after creating the ring, the io_uring_submit(=
)
> > > library function passes a flag to the io_uring_enter(2) syscall
> > > allowing it to skip the ring file descriptor fdget()/fdput()
> > > operations. This saves some CPU cycles.
> > >
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > ---
> > >  block/io_uring.c | 12 +++++++++++-
> > >  meson.build      |  1 +
> > >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > Thanks, applied to my block tree:
> > https://gitlab.com/stefanha/qemu/commits/block
> >
>
> Great! Sorry about the mistake before. I'm flushed.

Don't worry, it's easy for #ifdef issues to slip through. Two
techniques for testing #ifdefs:
1. To check whether compilation works both when the macro is defined
and also when it is undefined, edit the #ifdef to force the compiler
to take or not take the #ifdef. For example, if #ifdef FOO is compiled
but you want to test the case where FOO is undefined, temporarily
change it to #ifdef FOOX.
2. Add "#error foo" inside the #ifdef to test whether the compiler is
parsing the code. If you expect the #ifdef to be compiled but there is
no compilation error then there is a problem.

Stefan

