Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675359D00C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 06:27:17 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQLVT-0003OG-TX
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 00:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oQLTY-0001dD-N1; Tue, 23 Aug 2022 00:25:16 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:40723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oQLTW-0000wQ-NF; Tue, 23 Aug 2022 00:25:16 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-324ec5a9e97so348301057b3.7; 
 Mon, 22 Aug 2022 21:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=VS11kRvrs6idxWi+JPPjUhxAySPJDff02W2QC3XhTGg=;
 b=c8hm08ydZaXIwlJUVjHA+L85dssW2oo6bJQU9lurqNIdyVaxo8XHIQwNPFs4YW48Wg
 JeGja7W8KkAQ8eThzqvaePyGDv8SaGPH9jCStrW73cgtoS3DYSd7IGPWWISkllIm4a3i
 IagLcTSFG4YAMAzsb8Io8qq/Znjs1X/7bN58JLsNYCYW0ZJn+aqUKzG481FvDe20NtYC
 Msbrs3xnGGN74cIn+vFPiy06OA7nkGMwEoc2XxwbNl8sLqnjd0Ob6DWO6MYoy5Wmj1zI
 c6opGH2s0UGbwsEczPuYsz2wuEd4NpE+8XQEulHy+vCVe8g/RGdwdvMhAbSJBRBoJSSZ
 IQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=VS11kRvrs6idxWi+JPPjUhxAySPJDff02W2QC3XhTGg=;
 b=yK4WiOQ+b7lqL9Iz/NasQFnZ3pYlZHZNJVKsovDEAh4+tRuleoNHIWO0Gf1bK/jeRf
 3koffVuY7H8y9Lgnfkp1RODsFNhy90ARVD4SY1uPVcfeGdlY1JXuLfH1CkFW4ddlZyew
 n8Md0cni+4b7VpLcMEHOww1zP8vuXjCv8z+7yxVxkcBcFsVKKVSItaHk5j51YvXTQDmK
 VfUCAPZ2YpgXAFOwfQYclRjrer0VvGqUjjy7pdgjMtZkkAc6m7BuXvNPNR5L4+g7F1Vm
 fJ6ySzf7cql8zGla0s+KAO8V8lWPZMkBqodL1PSecZRCG5bReCouIMn60luMcvsJegaB
 hojw==
X-Gm-Message-State: ACgBeo2wVKE39/3Gqriis5WR3q/9TRr5gHLv5Iqq9/z6zgJYIeef5BH+
 qfngvNXfbl0jbRRjUygjICuGmP0hfIPKIdfJRPU=
X-Google-Smtp-Source: AA6agR5jeWswxdJ8tGycpFgkUSvWGr7TjR+xqLllP8QDEYeCX3gS8bzYlUeLpmBVG3Zyu8oMzLVVqTkjcLn305lSoOs=
X-Received: by 2002:a25:b5c9:0:b0:67b:a397:5e24 with SMTP id
 d9-20020a25b5c9000000b0067ba3975e24mr21785893ybg.108.1661228713133; Mon, 22
 Aug 2022 21:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-7-faithilikerun@gmail.com> <YwQlTFHqKqjurCgb@fedora>
In-Reply-To: <YwQlTFHqKqjurCgb@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 23 Aug 2022 12:25:23 +0800
Message-ID: <CAAAx-8LMr3wCghUMPXSJkoOXffP8OvYa9CNNs7xtr2rUaR=heQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] config: add check to block layer
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, 
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu block <qemu-block@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x112e.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8823=E6=
=97=A5=E5=91=A8=E4=BA=8C 08:54=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Aug 16, 2022 at 02:25:20PM +0800, Sam Li wrote:
> > Putting zoned/non-zoned BlockDrivers on top of each other is not
> > allowed.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block.c                          | 14 ++++++++++++++
> >  block/raw-format.c               |  1 +
> >  include/block/block_int-common.h |  5 +++++
> >  3 files changed, 20 insertions(+)
> >
> > diff --git a/block.c b/block.c
> > index bc85f46eed..affe6c597e 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_bs,=
 BlockDriverState *child_bs,
> >          return;
> >      }
> >
> > +    /*
> > +     * Non-zoned block drivers do not follow zoned storage constraints
> > +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-=
zoned
> > +     * drivers in a graph.
> > +     */
> > +    if (!parent_bs->drv->supports_zoned_children &&
> > +        child_bs->bl.zoned !=3D BLK_Z_HM) {
>

Should be:
+if (!parent_bs->drv->supports_zoned_children &&
+        child_bs->bl.zoned =3D=3D BLK_Z_HM)

> Is this logical expression correct:
>
>   If the parent does not support zoned children and the child is not
>   zoned, fail with an error.
>
> ?

No. It should be:

If the parent does not support zoned children and the child is zoned,
fail with an error.  It should handle the case where a filter node is
inserted above a raw block driver with a zoned_host_device child.

There are some QEMU command-line constraints for the zoned devices. I
was wondering where to add such support so that it can print an error
message for users:
1. cache.direct=3D setting
2. mix zoned/non-zoned drivers

>
> > +        error_setg(errp, "Cannot add a %s child to a %s parent",
> > +                   child_bs->bl.zoned =3D=3D BLK_Z_HM ? "zoned" : "non=
-zoned",
> > +                   parent_bs->drv->supports_zoned_children ?
> > +                   "support zoned children" : "not support zoned child=
ren");
> > +        return;
> > +    }
> > +
> >      if (!QLIST_EMPTY(&child_bs->parents)) {
> >          error_setg(errp, "The node %s already has a parent",
> >                     child_bs->node_name);
> > diff --git a/block/raw-format.c b/block/raw-format.c
> > index 6b20bd22ef..9441536819 100644
> > --- a/block/raw-format.c
> > +++ b/block/raw-format.c
> > @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, Bd=
rvChild *c,
> >  BlockDriver bdrv_raw =3D {
> >      .format_name          =3D "raw",
> >      .instance_size        =3D sizeof(BDRVRawState),
> > +    .supports_zoned_children =3D true,
> >      .bdrv_probe           =3D &raw_probe,
> >      .bdrv_reopen_prepare  =3D &raw_reopen_prepare,
> >      .bdrv_reopen_commit   =3D &raw_reopen_commit,
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index de44c7b6f4..4c44592b59 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -126,6 +126,11 @@ struct BlockDriver {
> >       */
> >      bool is_format;
> >
> > +    /*
> > +     * Set to true if the BlockDriver supports zoned children.
> > +     */
> > +    bool supports_zoned_children;
> > +
> >      /*
> >       * Drivers not implementing bdrv_parse_filename nor bdrv_open shou=
ld have
> >       * this field set to true, except ones that are defined only by th=
eir
> > --
> > 2.37.1
> >

