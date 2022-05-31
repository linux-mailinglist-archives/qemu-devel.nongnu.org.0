Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658DD538FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:44:14 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0IH-0005v8-EK
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nw08Y-0008BB-QP
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:34:11 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nw08X-0004yI-5P
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:34:10 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-30c1b401711so72415027b3.2
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w07ch0NmnKw0xz+Yt3G+fFHZQnedwOtICFPhkLdoc6M=;
 b=BmVFc8+yUGt1RgO5hQK3KWq5suCy4lCf91Yb+Db92iFlmxBpxI32sjTd7C8Fqlqmr9
 nz5gUA0H2rFp+vAtDBI6YuyfvoORvnG5pbsm6qHwPgXlgZrEixblpnmsaDCoZ7fTSZTt
 XhrtBA5Jco9LuMFKfJQ2I5SE/lWyMx81IC6HIbpdwwfh6D3j/lueDKTIHMwL6F/hcUfQ
 gb466C7Dsc83wgbBRN0VAWnb6ufEGMJSo+uccmwvHV8JXkWPgiG/n7Ent4o0eIa87ys1
 M7Fwmyz/vjfjOxe3G7UqRWvT8DB1j8iJXynBgRbbWaRMxJheOTjP3m9IWPkzUHUlndBt
 ROtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w07ch0NmnKw0xz+Yt3G+fFHZQnedwOtICFPhkLdoc6M=;
 b=bLnESD/ApGAbz3WWgb5tRMZSWDBmdxSp+5lT68A7NZu+5iXZ/+xAeIgdtAr43rpcYY
 dl5P+iijYMcV3UeOOLkggqXUWEdetx22UdLw8ckwhx+1PEs6hjnGSAXW3r8Dy+LnmTZe
 aVPWuoAPd/aKnIzltIbXfFokEaRrfR3Tbh3WkgtgcMN23ovzN71EGK+QuGX7GqRvOQoS
 jGOXsvDOsJWcBTcwo9FtVHQsUm9DPDhNaTu3SZyIy0E4ud7pen4LZravbk4K/uKmzOQX
 7sJvH8rJO3trfMp7+QV1pn53f2KcodS8prYw1QVkgrjm6WAAZS2ouxQiTCSVRNxJTEBo
 jfHQ==
X-Gm-Message-State: AOAM531fQqlzzDZuy6F0AL1WHzFq8d9ne3h1mHEbBocg+ix4yVtuNufG
 FqvMbohXEGIcwmEyVXaCFI4LGnn3nxK6GQRuanQ=
X-Google-Smtp-Source: ABdhPJx4QE1Fx9QESQT/4QmWfLDZcCwvbaKUXO+rrYGZEykSESgEh2/8rd8iYl91+O5ByQFm9rFwKN4HSfM1uRiK5Qg=
X-Received: by 2002:a0d:cd04:0:b0:300:4784:caa3 with SMTP id
 p4-20020a0dcd04000000b003004784caa3mr34881289ywd.231.1653996847838; Tue, 31
 May 2022 04:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220531105011.111082-1-faithilikerun@gmail.com>
 <YpX8q9XrnTehFu7N@stefanha-x1.localdomain>
In-Reply-To: <YpX8q9XrnTehFu7N@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 31 May 2022 19:34:03 +0800
Message-ID: <CAAAx-8KBk2tzaJRfYtAbsAGSAvY4z+SsV2BxtRBO7mqVvmLW_w@mail.gmail.com>
Subject: Re: [PATCH v6] Use io_uring_register_ring_fd() to skip fd operations
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1134.google.com
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

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=8831=E6=
=97=A5=E5=91=A8=E4=BA=8C 19:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, May 31, 2022 at 06:50:11PM +0800, Sam Li wrote:
> > Linux recently added a new io_uring(7) optimization API that QEMU
> > doesn't take advantage of yet. The liburing library that QEMU uses
> > has added a corresponding new API calling io_uring_register_ring_fd().
> > When this API is called after creating the ring, the io_uring_submit()
> > library function passes a flag to the io_uring_enter(2) syscall
> > allowing it to skip the ring file descriptor fdget()/fdput()
> > operations. This saves some CPU cycles.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/io_uring.c | 12 +++++++++++-
> >  meson.build      |  1 +
> >  2 files changed, 12 insertions(+), 1 deletion(-)
>
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block
>

Great! Sorry about the mistake before. I'm flushed.


> Stefan

