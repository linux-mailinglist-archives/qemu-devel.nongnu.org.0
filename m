Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F72D608E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:55:30 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOHw-0005dY-Mp
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1knOGE-0004r3-Qy; Thu, 10 Dec 2020 10:53:42 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1knOGC-0003Dh-3N; Thu, 10 Dec 2020 10:53:42 -0500
Received: by mail-pg1-x543.google.com with SMTP id e2so4587318pgi.5;
 Thu, 10 Dec 2020 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z6LCL5YezncQLOwI/CeU3wOqyfo9UOgOWChVxPyPp5g=;
 b=QSl64IV4HBHSXxmxdHZXJ1aUtV3+E+AtFHQgGERKlAnGcJ+04iYLVRl2wdRR57cJvz
 C9F+3H95MJxL3Z4N7eTWy0kxwdW0yKj5TB90memmTGsS4v4TGbT26UdNE7ZCr7SXR0l1
 1dWFE9Z5w3MLeIcPru3ioESBRmFMLSEbmRBYUwI/dJPpMp4Ti8K2BRMsJmh2Nu5uqi+J
 GCvFYoJhWBvo9hg92MsXuc1XDrte0f2pmRVy9guqok5flkq4IqOdudj1ro5uKJDsFCOF
 bWOYJj3B4rfcW6D+QiEcofqjBHnn4TcP0ticKPLI1Wku7kHLARdeWcvXd0Qe5ANzC3rP
 lWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z6LCL5YezncQLOwI/CeU3wOqyfo9UOgOWChVxPyPp5g=;
 b=XB3B8945fheL59mj3/8kQW+FmTEjfPmRBtGhHOheCsP+rX9E+sf+aTH2uRgxMV6NpY
 pEWDhUasHzmwCZaUoMwQPqpGASCHtVQCx44jwSWQtZ4AGCloIoPm3AZXXs0ufnrChMFM
 /h/HaiWumGPA9ycYlcxxh6JpJyzR1q9Vj2KVzoqeSGPGpl0r8Yt5PB8ChZSxPkdN781c
 2SpSFWTc91G4Yphj0j1qm0Om6lWkwPZx+lEmYHXv7aR/rMpwcoqf9l+M/sb0I2TcUdxF
 BU3VZKqWBdb+64nfZIfALldRNmxiG9FMU7W1S2kKJqGmCfmaHXJIKGJKCw/uDAd9v4Ka
 XhXQ==
X-Gm-Message-State: AOAM533LhgBHWM/TCFKwaAjJtu2V6f9aHiBxvdHQWuR2TRw0YuySfvU2
 zPGdWz1lNy1roZ3Dc8QZIEO59yRdXddlZUUlHRQ=
X-Google-Smtp-Source: ABdhPJyHeerYp8zldaLosjAwy7PDZctYFCoh8XXI65QR2IZw8y8J5j6XnPLk6+rmvkFW7XWTWLcH+aqQUAZop5MpTYs=
X-Received: by 2002:a65:6109:: with SMTP id z9mr7241494pgu.190.1607615616811; 
 Thu, 10 Dec 2020 07:53:36 -0800 (PST)
MIME-Version: 1.0
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
 <20201208143822.GA6392@merkur.fritz.box> <20201209093326.GD3214234@redhat.com>
 <20201209174338.GB6660@merkur.fritz.box>
 <CAHckoCxunkqV6=-KKwbcB9_hbY0HUV7k+syHnHvwKnqXx6FDtw@mail.gmail.com>
 <20201210152730.GK24855@redhat.com>
In-Reply-To: <20201210152730.GK24855@redhat.com>
From: Feng Li <lifeng1519@gmail.com>
Date: Thu, 10 Dec 2020 23:53:09 +0800
Message-ID: <CAEK8JBCOqMBFz2GfGwfwxSkVJ9RZq0o565vb2gfiN5sJR1j6hQ@mail.gmail.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=lifeng1519@gmail.com; helo=mail-pg1-x543.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Kyle Zhang <kyle@smartx.com>,
 Li Feng <fengli@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My mistake, you are not on the receiver list of my v2.
I use the get_maintainer.sh to generate the cc list.
I will resend it to you.

Daniel P. Berrang=C3=A9 <berrange@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8811:29=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On Thu, Dec 10, 2020 at 10:56:59PM +0800, Li Feng wrote:
> > Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=8810=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=881:43=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > Am 09.12.2020 um 10:33 hat Daniel P. Berrang=C3=A9 geschrieben:
> > > > On Tue, Dec 08, 2020 at 03:38:22PM +0100, Kevin Wolf wrote:
> > > > > Am 08.12.2020 um 13:59 hat Li Feng geschrieben:
> > > > > > This patch addresses this issue:
> > > > > > When accessing a volume on an NFS filesystem without supporting=
 the file lock,
> > > > > > tools, like qemu-img, will complain "Failed to lock byte 100".
> > > > > >
> > > > > > In the original code, the qemu_has_ofd_lock will test the lock =
on the
> > > > > > "/dev/null" pseudo-file. Actually, the file.locking is per-driv=
e property,
> > > > > > which depends on the underlay filesystem.
> > > > > >
> > > > > > In this patch, make the 'qemu_has_ofd_lock' with a filename be =
more generic
> > > > > > and reasonable.
> > > > > >
> > > > > > Signed-off-by: Li Feng <fengli@smartx.com>
> > > > >
> > > > > Do you know any way how I could configure either the NFS server o=
r the
> > > > > NFS client such that locking would fail? For any patch related to=
 this,
> > > > > it would be good if I could even test the scenario.
> > > >
> > > > One could write a qtest that uses an LD_PRELOAD to replace the stan=
dard
> > > > glibc fcntl() function with one that returns an error for locking c=
ommands.
> > >
> > > Sounds a bit ugly, but for regression testing it could make sense.
> > >
> > > However, part of the testing would be to verify that we our checks
> > > actually match the kernel code, which this approach couldn't solve.
> > >
> > Hi, Kevin and Daniel.
> >
> > How about this patch? I think it's very straightforward.
> > Except we need a mock syscall test case.
>
> You don't seem to have attached any patch here.
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

