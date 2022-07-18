Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA15785C4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:50:43 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDS54-0003Dv-OL
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRol-0000k5-1f
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:33:51 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRoj-0008WD-8p
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:33:50 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31c86fe1dddso109388967b3.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=inxXj3u/yU71c01VVdxy+6yJF51PycB1Xy++4rUeqDU=;
 b=T61SGQlaBo/6tfTvq8WZWsc54huozXmEE5TfC2954VcPExmxyk6GxHYoJ1MomJ5Fhf
 O1RxRFkxXCO8XfGaJq6J4OYgnoaVF4LWt2c2twGXvgTKit96sqFRdyla416WsFbUkYoX
 ji2C1fkLPk3OZYP99r/ISOvEaQRVx9WG8gvuljZ0Z1/hUjbsNiKF0eMA71Qf2umz6+2t
 N8nScrkfz1NxtkLI5Ul4aYKrm0K49/2UsNdmfsSUbNFQRyLOi0IW+TMLff2uqNPdva9E
 0gbCkxoUeiA+9ja2PaLEE8b6v6SNjKfjc6rviEiG6UJ6XnCpd4trSbBnK7CI7Wfftk+F
 sTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=inxXj3u/yU71c01VVdxy+6yJF51PycB1Xy++4rUeqDU=;
 b=3tpwCJvuZT3exapADx6oo1Cs18f0qJPYL1QOXcMesfRLolw0Ai2orwIySBOscY06m7
 3HggvzjqlbCkfvnKZ1PBnzOc32pv36R7u9TbX3fmkSRGmNqGXZluxMUO45dhdT8oVaeF
 LFHnYzcIxaVWi3bbG4W7GmM7tnHrh2CJ8VQt2UNdb9v94lMq9Om+SUgwY2/TbG1xFOcU
 0kdj1IGOKdjWSu8T9iDxFADGt75MoiQFjyLgMU7XAUJsU4kq0rj+sbfCxcoPfF1f4WBC
 l8ykezP8hXgL70jj2YQtNtBY8DFV23hV55JiO5TCjOeGqTdW8pCxlit6/8TLzi8xu7I3
 bp1w==
X-Gm-Message-State: AJIora9eZM6kj8qOEThGFSXBU+eXiD3uY6qyfk3SZ84YRrKbzvV47ET9
 qhP82Ap4kf90TNBAX+mgt4n+pGUm38bjiQNtHSNhEQ==
X-Google-Smtp-Source: AGRyM1s8r4PGlM6XzI+RA1uhRQMF79S2q/NimaT2O//bQoTAo5h8S8d9Gz04s3TG4BDm64NrBiuphHXqP0FEKBfC6xA=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr30618822ywg.469.1658154828179; Mon, 18
 Jul 2022 07:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <YtQzMUuBOfBiMNlY@p100>
 <CAFEAcA9GzSJw4GpCkdOQPx7j24chp3WDq5tD=8FVkyYYtdrHuQ@mail.gmail.com>
 <273d6b49-332c-9563-a90f-4d1a889314d3@gmx.de>
In-Reply-To: <273d6b49-332c-9563-a90f-4d1a889314d3@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 15:33:37 +0100
Message-ID: <CAFEAcA_68kFSveyvJtwAb8XbsseDhepwXsPC6Bxe=Ha8-Kx3cw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix pipe() vs. pipe2() usage for ALPHA, MIPS, 
 SH4 and SPARC
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Mon, 18 Jul 2022 at 15:21, Helge Deller <deller@gmx.de> wrote:
> On 7/18/22 14:51, Peter Maydell wrote:
> > Why do we need to do this?
>
> Yep, we don't *need* to...
>
> > If the flags argument is 0,
> > then pipe2() is the same as pipe(), so we can safely
> > emulate it with the host pipe() call. It is, or at
> > least was, worth doing that, so that guests that use
> > pipe2(fds, 0) can still run on hosts that don't implement
> > the pipe2 syscall.
>
> True, but only for pipe2(fds,0), not e.g. for pipe2(fds,1).
> On the other side if a guest explicitly calls pipe2()
> and if it isn't available, then IMHO -ENOSYS should be returned.
> Let's assume userspace checks in configure/make scripts if pipe2()
> is available and succeeds due to pipe2(fds,0), it will assume pipe2()
> is generally available which isn't necessarily true.

Fair point. Did you run into this in practice, or is it just a
theoretical concern ?

NB that any probing code that does that will also get the wrong
answer on musl libc, though, because musl's pipe2() implementation
always calls pipe() for a zero-flags call:
https://git.musl-libc.org/cgit/musl/tree/src/unistd/pipe2.c

> > There's probably a reasonable argument to be made that we don't
> > care any more about hosts so old they don't have pipe2 and that
> > we could just dump do_pipe2() and the CONFIG_PIPE2 check, and
> > have do_pipe() unconditionally call pipe2(). Would just need
> > somebody to check what kernel/glibc versions pipe2() came in.
>
> Yes.

I just had a look, and the pipe2 syscall came in in Linux 2.6.27.
musl has implemented pipe2() since at least 2013, and glibc must
have had it for at least that long.

In fact current glibc always implements pipe() in terms of pipe2():
https://sourceware.org/git/?p=glibc.git;a=commit;h=efc6b2dbc47231dee7a7ac39beec808deb4e4d1f

So my preference would be that we should just say "we can assume
that pipe2 is always available and implemented on linux hosts" and
remove the code that handles the possibility that it isn't.

thanks
-- PMM

