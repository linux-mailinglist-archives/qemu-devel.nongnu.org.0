Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E9428074
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:02:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpFB-00022S-Pb
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:02:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hTpCw-0007y8-BI
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hTpCv-0004qs-2y
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:00:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1hTpCu-0004qB-SQ
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:00:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id f8so6677159wrt.1
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CKyA6Bg44rX00vvSTAF0V3G+sPTFf5oonteW5tTFfrU=;
	b=lmwiZJatdrRmM33G6QbGeEai1UEkm8mnJt1dE5JqOKzEpNCHwoZuxsMpmW6U2XhqrJ
	c2iYK6kys8kbB8x5PMgfVctd37xHy0g0ZKzReqxbIEOzE8NT5n/3Fr56l/5qvlfo5n/E
	cuR8Xe1ugkbJea+mxsAHpMT5+9XC+hOKci3P9fOSGyG+klBGhuMgwS9c4sFyqxCcgKcH
	033JOXYFK7Og/1uJDfTQozVAavbbKANeFrIYkWZtSzb7cCpcS5FstsTy3NIuwp66v3VQ
	x7QVdkM+/7mLk2d6wsSRRfnkP/EcyqdF8H3K8aniq/aDeFSF1wt65HpgozAOg10YwSxp
	IIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CKyA6Bg44rX00vvSTAF0V3G+sPTFf5oonteW5tTFfrU=;
	b=nHPCFy8VJvYkv5OvB4S4h3qY453W3kruyg5TwyDr33zIb07b0w72GA9tRuxV7Gt58i
	3B3LKhx3V/uHuGSrWGnmqD9RLXADMP9jRUBzvAWPGycNVQipahEhW6iWp5/gN9ORBgyK
	xnW7kQ3yE02wHmYCKwo5jGokq7ievS05sZuLElf/rJeDD2VlwqG23XF05aqCWWz1EXGN
	4PbLnEG3gXyPp0gRfOuNLkuRDsUMNuBmltDXvAtCzveDDwMCKHDYuhCSZdUhLSSvEL7m
	FrWY1Rn+d9Pqs9LLXhFQzisIhR2L+AnVOYBokSSU05rQYQqXjiLmdXXbTB9SFg39uwsv
	a69g==
X-Gm-Message-State: APjAAAUibHoncrAPfeIWMS08bMYAy7KXd3ty2gUptLFSGbctdKyzdnq1
	0YM90anp3V/3dtH2EtxSj+sFbuknGn0Syy1ztJ4=
X-Google-Smtp-Source: APXvYqzgcdfd9o3BvrgBcIOHuSUTp5a2VvX2yH9ijHobLzkVE3MEVh4Pndb5XoxfQiiL/ieHbp+hD5Ilybcv1onlVwM=
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr1381930wrn.209.1558623635174; 
	Thu, 23 May 2019 08:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190523110434.23830-1-gert.wollny@collabora.com>
	<CAJ+F1C+=89nSeEyiBowdOsqr5HBtvvNnXp3ZWHBGV_WYYH9kgA@mail.gmail.com>
	<721f520106a799afe003b3b8d3ce4de12daf04f5.camel@collabora.com>
	<CAJ+F1C+vjg47SyBdb7EtvM3JFPpddkko=gXGbsGNqbn0M1u1-Q@mail.gmail.com>
	<40e8ac9325e9c0d4326cfef841b6be1ca65e6040.camel@collabora.com>
In-Reply-To: <40e8ac9325e9c0d4326cfef841b6be1ca65e6040.camel@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 23 May 2019 17:00:23 +0200
Message-ID: <CAJ+F1CLbmvjRX9Zj_P4G2U9Nzq8RdDxXHwqP_onnP1=b-KfndA@mail.gmail.com>
To: Gert Wollny <gert.wollny@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: Re: [Qemu-devel] [PATCH] virtio_gpu_3d: make it possible to
 configure the fence poll time
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, May 23, 2019 at 4:54 PM Gert Wollny <gert.wollny@collabora.com> wro=
te:
>
> Am Donnerstag, den 23.05.2019, 16:37 +0200 schrieb Marc-Andr=C3=A9 Lureau=
:
> > Hi
> >
> > On Thu, May 23, 2019 at 4:17 PM Gert Wollny <
> > gert.wollny@collabora.com> wrote:
> > > Am Donnerstag, den 23.05.2019, 16:01 +0200 schrieb Marc-Andr=C3=A9
> > > Lureau:
> > > > Hi
> > > >
> > > > On Thu, May 23, 2019 at 3:27 PM Gert Wollny <
> > > > gert.wollny@collabora.com> wrote:
> > > > > The default fence poll time of 10ms (100 Hz) is sufficent for
> > > > > normal
> > > > > work loads, but if one wants to play games within the virtual
> > > > > machine
> > > > > this value might be too high, so make it possible to configure
> > > > > this
> > > > > value by using the environment variable QEMU_VIRGL_POLL_FREQ
> > > > > where
> > > > > the
> > > > > poll is given in Hz. To acommodate higher poll frequencies also
> > > > > change
> > > > > the timer to use micro seconds as base instead of milliseconds.
> > > > >
> > > > >
> > > >
> > > > This is what VIRGL_RENDERER_THREAD_SYNC helps with. You don't
> > > > need to
> > > > do regular polling, but I think it is currently limited to
> > > > Linux/eventfd only.
> > >
> > > As far as I can see only vtest uses this, not qemu.
> >
> > I don't think there is anything preventing qemu from using it, except
> > the portability which should be taken care more carefully.
>
> But to actually use it would need quite some work, wouldn't it? (I'm
> thinking of your series:
> http://qemu.11.n7.nabble.com/PATCH-00-18-virgl-use-a-seperate-rendering-t=
hread-tt429557.html
> )
>

I think you could use VIRGL_RENDERER_THREAD_SYNC, without using a
seperate thread for virgl.

You need to register the pollfd virgl_renderer_get_poll_fd() with the
main loop, but other than that it should, in theory, work.



--=20
Marc-Andr=C3=A9 Lureau

