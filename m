Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B32D5ED1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:00:25 +0100 (CET)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNQe-0002BO-N7
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1knNNb-0007dN-T7
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:57:16 -0500
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:39413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1knNNZ-0000oN-IP
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:57:15 -0500
Received: by mail-vs1-xe41.google.com with SMTP id h6so2981315vsr.6
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6lqDoCljvE1D6pOlrZhb5aTtQOpM/5JUBm2fDxC9WyY=;
 b=l4Jv2o3qTrGYeEpWWhXdB8JoY8tLb68MXmqGC6ZuUxunvobTQrWSqVf/S/pU/Q6p+4
 b4U8sYGALSF/bQ6R2bOzlKRyqztdrcTD49x4FTBHU6OeCiT+cMjJTYJ6CNT/kyyg85VW
 V0dgYe/WyyxRZ34sj2TtUAlJhpePLffnmXSXjqHmOwaU2ukKud5iR5FhenpmQnpEppUE
 3J9tyipVPSHMn+zvSxaUff+uKAtsfIHDIdmwe33WpP8e6xW1DL5zfCwOYYcBmP455HFJ
 lQQQcTfMHUD7omZDSDoimbbzdPIhwBqUSFKwD+0JxID0ubinTa/rTCiMOTsADCIQOr/m
 SmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6lqDoCljvE1D6pOlrZhb5aTtQOpM/5JUBm2fDxC9WyY=;
 b=GqpQBZEj24Wdm8ORtdsh4iG+5tZqOhnj9AZIAkyKQnnf/EoRGY0jpbVIDTMIgaxSjs
 JW1CTcz7/Qf5NfDMcciS3lYFynKBecpe2v3ArdwxP3uqAoOpvlVwtLmejtAjFcfbJH28
 OQMxr+MOAiXrFwjDKTLZ+HyVjY269cndvHvESAlyRG6FQNfkUk+Z/Poip8SMP4nF5egF
 Nr4kaMiLsC1TsksJIBh3Sw/A/sSOJVa6+b1fbDTJE8mHQb6Er1LLE2NkbfY/I8ul4ldO
 yhHAcfhxv+TUbfnELy0vx88SES6DyIUEsLLL7YJMKpgdCGn5TM/oSw0VssSMWSBNAgxu
 +8kQ==
X-Gm-Message-State: AOAM5327oMmvkLr/7Qqw8cQJ0PG50ISCKMA/D8RkwtVHZFtySZXsWPMJ
 Ez3h8FUMX6QkZTXYVi+6dy7A1PKsCo+HqKCNc+Ofjw==
X-Google-Smtp-Source: ABdhPJyjwAhiLeuuRqi0agCGqLtmd9ta8iIFui1tS/zHMMVP//SDe1ErAOwIK7YC/7fHOlHCER1AEB0snJy3uyrMRig=
X-Received: by 2002:a67:2287:: with SMTP id i129mr7513758vsi.15.1607612231034; 
 Thu, 10 Dec 2020 06:57:11 -0800 (PST)
MIME-Version: 1.0
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
 <20201208143822.GA6392@merkur.fritz.box> <20201209093326.GD3214234@redhat.com>
 <20201209174338.GB6660@merkur.fritz.box>
In-Reply-To: <20201209174338.GB6660@merkur.fritz.box>
From: Li Feng <fengli@smartx.com>
Date: Thu, 10 Dec 2020 22:56:59 +0800
Message-ID: <CAHckoCxunkqV6=-KKwbcB9_hbY0HUV7k+syHnHvwKnqXx6FDtw@mail.gmail.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::e41;
 envelope-from=fengli@smartx.com; helo=mail-vs1-xe41.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Feng Li <lifeng1519@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Kyle Zhang <kyle@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=8810=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=881:43=E5=86=99=E9=81=93=EF=BC=9A
>
> Am 09.12.2020 um 10:33 hat Daniel P. Berrang=C3=A9 geschrieben:
> > On Tue, Dec 08, 2020 at 03:38:22PM +0100, Kevin Wolf wrote:
> > > Am 08.12.2020 um 13:59 hat Li Feng geschrieben:
> > > > This patch addresses this issue:
> > > > When accessing a volume on an NFS filesystem without supporting the=
 file lock,
> > > > tools, like qemu-img, will complain "Failed to lock byte 100".
> > > >
> > > > In the original code, the qemu_has_ofd_lock will test the lock on t=
he
> > > > "/dev/null" pseudo-file. Actually, the file.locking is per-drive pr=
operty,
> > > > which depends on the underlay filesystem.
> > > >
> > > > In this patch, make the 'qemu_has_ofd_lock' with a filename be more=
 generic
> > > > and reasonable.
> > > >
> > > > Signed-off-by: Li Feng <fengli@smartx.com>
> > >
> > > Do you know any way how I could configure either the NFS server or th=
e
> > > NFS client such that locking would fail? For any patch related to thi=
s,
> > > it would be good if I could even test the scenario.
> >
> > One could write a qtest that uses an LD_PRELOAD to replace the standard
> > glibc fcntl() function with one that returns an error for locking comma=
nds.
>
> Sounds a bit ugly, but for regression testing it could make sense.
>
> However, part of the testing would be to verify that we our checks
> actually match the kernel code, which this approach couldn't solve.
>
Hi, Kevin and Daniel.

How about this patch? I think it's very straightforward.
Except we need a mock syscall test case.

> Kevin
>

