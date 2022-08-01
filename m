Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3858670B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 11:46:33 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIS0O-0002Ey-V4
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 05:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIRxM-0008Hq-Qm
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:43:24 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:41615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIRxL-00059p-7M
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:43:24 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id y127so18053390yby.8
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=qR6tRBTaaRAKnyMjBddWtNhlPnIys1iteLawwgtWFIg=;
 b=eFY3JG+G6MA2kSBd1m4BBdr9QHDcN9VUQ5+y0fRt1xnJMgrC5WXv0a5VpYBkNHPA7s
 t4XpXVDaeQU2/+eGIe4BgAUb7Xv1/p/jVmEfCmgxrWEENQL+IIXyC232o5BJjF+qZo9Y
 35fo+P1oMV+hSOqPsvGOsKmX0Jrm/cWTWDw+IN6D0gcEs2NpsmexYnOG91OPUalBgltk
 vuhnJDMSkF4Up/v96S+lXFYplpBLDw4YMGR4V7WASgBlscco31r8vEkxd+V0CeK0dQQT
 26HBPs/8vtE/PNPq04v5xxk5owpaZ4/2qbxVJxYNKiElZAxnc6LWpOkkxeIm/DZkiq7u
 Sz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qR6tRBTaaRAKnyMjBddWtNhlPnIys1iteLawwgtWFIg=;
 b=zEiI+Z449a8tmeknk6RYYwkgDVo8tulVdKcIL85Xk8sJFXdIOJhwOBH5h9cqjx6oT2
 HNf959pS7bhsHN4W7m4p8yt4V6QtkY0KQocluJmGPOjnwt/a8jPwjxbU7UdIieqMRMre
 VYueNflujr9r9OG7oNwdtUjT9dAsJdO9hIzqsnaWPy7bt7LYfjXCuNwAgMtchTIJvPw0
 Cyqz+HJ0X5HJOsAykX2vwBFxh1rxuYOsHYz8s2zcBlWAeb1pG4zm0hxMK7DO+cu2rz/H
 fjxNi2EOWsL9D9sjefa4lhQepqEYDB18IeE1uR8u+ukNITNd8VYWqy6mG2cnDUJNk5cd
 xBLA==
X-Gm-Message-State: ACgBeo2woZtuZBRCJ3QyMXpjQd1KTkdUKTCIW8kiFVtmpzwLzA8Df6N8
 WUd17lPBtcXtUxUR5cBKf1oMwvGYVzWljlITlU4NdA==
X-Google-Smtp-Source: AA6agR74r9CyZXWl4dUqqI7/lASzKfRqgxNIUTjdDtTc/J3gD8/eA/a68APIf2Xo+pKTYMdGov0aE61lDGqW5fmCmCU=
X-Received: by 2002:a25:820b:0:b0:677:3a88:48ff with SMTP id
 q11-20020a25820b000000b006773a8848ffmr2223727ybk.39.1659347002112; Mon, 01
 Aug 2022 02:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm>
 <20220728165411.5701befb@redhat.com> <YuKmuvgqMQtTXVjX@work-vm>
 <CAFEAcA-H=P44_e9qbKiGiCXjs9JPCmhEK5qp23TLX229G=Y6rg@mail.gmail.com>
 <20220729115753.60d99772@redhat.com>
 <CAFEAcA_Xa68t7N1MgCy6=xYvE9Cr6SM2xZp-iDdx_e8+tFwpCw@mail.gmail.com>
 <YueaDxgaMNGLezQd@work-vm>
In-Reply-To: <YueaDxgaMNGLezQd@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 10:43:10 +0100
Message-ID: <CAFEAcA9sbQQMW3LKdGSCcbX1UoAgS6FcP3gc4nGPwcbvuGHv5w@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, ani@anisinha.ca, 
 mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Mon, 1 Aug 2022 at 10:17, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Fri, 29 Jul 2022 at 10:57, Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > On Thu, 28 Jul 2022 16:12:34 +0100
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > Either:
> > > >  (1) we should be sure the vmstate struct does not get used if the
> > > >      compile-time config has ended up with the stub
> > > > or
> > >
> > > >  (2) it needs to actually match the real vmstate struct, otherwise
> > > >      migration between a QEMU built with a config that just got the
> > > >      stub version and a QEMU built with a config that got the full
> > > >      version will break
> > > >
> > > > This patch does the former. Segfaulting if we got something wrong
> > > > and tried to use the vmstate when we weren't expecting to is
> > > > arguably better than producing an incompatible migration stream.
> > >
> > > > (Better still would be if we caught this on machine startup rather
> > > > than only when savevm was invoked.)
> > > Theoretically possible with a bunch of mips and x86 stubs, but ...
> > > we typically don't do this kind of checks for migration sake
> > > as that complicates things a lot in general.
> > > i.e. it's common to let migration fail in case of incompatible
> > > migration stream. It's not exactly friendly to user but it's
> > > graceful failure (assuming code is correct and not crashes QEMU)
> >
> > The point here is that if we ever try to do a migrate with the
> > stub vmstate struct then that's a bug in QEMU. We should prefer
> > to catch those early and clearly.
>
> I'd rather have something that was explicitly poisoned rather than just
> walking off the end of an uninitialised array and having to break out
> gdb.

It doesn't walk off the end of the array -- it segfaults because
it wants to dereference vmsd->name, which is NULL.

If we want to have a more obvious and concrete way to mark "this
vmsd is bad and should never be actively used" that's fine, but it
seems like a separate patch from this one, which is just fixing
the problem that we use a vmsd that we should not be using.

-- PMM

