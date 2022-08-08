Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F458CA00
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:59:17 +0200 (CEST)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3Hp-0006bn-8Q
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oL3F6-0002ce-8D; Mon, 08 Aug 2022 09:56:28 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oL3F4-0003ns-KJ; Mon, 08 Aug 2022 09:56:27 -0400
Received: by mail-yb1-xb33.google.com with SMTP id y127so13704675yby.8;
 Mon, 08 Aug 2022 06:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=ZWDm6eBPj8815sTPvZwypH9H9k9KFPIJOVUz+/yGp2I=;
 b=iUJetYpILAf9KWQxEJOQOz5G7COcaBMW6fPXWBeQWIoVKF9JVZKgYyHQGQ/pn8hL2l
 EyJ2uq4KZ8LgmWCfAab+SY59/t9+OLhR5Q/iYoCUK4m7Okzx0jV/t0IxGP0KTfyLIJMg
 EqFstpBdzD36SIt/1kmgcxch8xTFTKm0U5D45ds/YnqsqsMyoPNti3NQRqh+QsscRiXp
 zI0u7yyejqsosDAI2I0bvsdPA4rs0P6dIqS7t+QKOFMxHQmbA9O73h+LcpB2Az2R9hVo
 K8FhasIV+89Kn7x/xaxLFqCoX/3uMD8bzZGCIsTBfLatLo9y3Q2ljurC3+SzA38FUEA4
 xosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ZWDm6eBPj8815sTPvZwypH9H9k9KFPIJOVUz+/yGp2I=;
 b=IVqHwkCQ+Hi38vQTDJ/N/Rtz4ZLWJvEP13gXqVyAnRdWieBBikS4weq65pBDpQjk0G
 Ue3S2KA29JPXjzhLOVqxkOJtEBppt7IO3zW1WC9veY+F3H3o1SYA11Sl7QHHzkqkq6xj
 q/23TkZ0HLDEgoZYnaGn6+BRaPKZjoC063Xo+IB/3DoydctPCeMHgLNVMM5t/4gPkfHi
 /PG74TW7yGhHwgXleB8pUnumFs8eqmnl5InCXoxJHlvqM+cIPRIJjZk51yXhdl1YYqgB
 uhtdmFNmZ3pJUAZQ7uFYYtKuX9sVv7qYpIPiOFczWlPPuA0jYq39JqGjSCogPjwH73DS
 K0Wg==
X-Gm-Message-State: ACgBeo1CJm93yuEi9sgVqkELfAce+fTA+wZVbFASMnsjAEBusBY6BgfZ
 cb0sXeNFWikAatO/RcWX6uG+aA7+YOd/h7MkJy8=
X-Google-Smtp-Source: AA6agR6niGu3FXcPdyd8SjyZzzIA2HWeGJ1tWPqiNUcDuGtnIu05GSs5ajwXFpgmzLyNSXC9jf+/BIBulK59mcYWa3E=
X-Received: by 2002:a25:3b54:0:b0:671:7553:c64 with SMTP id
 i81-20020a253b54000000b0067175530c64mr16003129yba.122.1659966984952; Mon, 08
 Aug 2022 06:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220805075751.77499-1-faithilikerun@gmail.com>
 <20220805075751.77499-3-faithilikerun@gmail.com> <Yu5eprPN7WrJFvuy@fedora>
In-Reply-To: <Yu5eprPN7WrJFvuy@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 8 Aug 2022 21:56:14 +0800
Message-ID: <CAAAx-8+NVWy7K-Pq_Qe5OWa=GqWnoJ9RMBDxq2JHHuivCamsQQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] file-posix: introduce get_sysfs_long_val for the
 long sysfs attribute
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>, 
 Hannes Reinecke <hare@suse.de>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Eric Blake <eblake@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb33.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=80 21:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Aug 05, 2022 at 03:57:45PM +0800, Sam Li wrote:
> > Use sysfs attribute files to get the long value of zoned device
> > information.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  block/file-posix.c | 37 +++++++++++++++++++++++--------------
> >  1 file changed, 23 insertions(+), 14 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 48cd096624..a40eab64a2 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1210,29 +1210,27 @@ static int hdev_get_max_hw_transfer(int fd, str=
uct stat *st)
> >  #endif
> >  }
> >
> > -static int hdev_get_max_segments(int fd, struct stat *st)
> > -{
> > +/*
> > + * Get zoned device information (chunk_sectors, zoned_append_max_bytes=
,
> > + * max_open_zones, max_active_zones) through sysfs attribute files.
> > + */
> > +static long get_sysfs_long_val(int fd, struct stat *st,
> > +                               const char *attribute) {
>
> Is the fd argument used or can it be removed?

Yes, it can be removed.

