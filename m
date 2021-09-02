Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9BA3FF08A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:54:10 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLp2X-0007mh-C7
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groche@genymobile.com>)
 id 1mLoqL-0003pP-Br
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:41:33 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groche@genymobile.com>)
 id 1mLoqH-0004X4-8v
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:41:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1797621wmb.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=genymobile.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E8qhKf/2WmhBRPPg/MeGqvsbLZvE/r19P4USKlf4sSs=;
 b=BD4W3ts4aGOFjdqqEO+bDf3C0jI99/Q91yXWs7MJSL5489yXCD9JCTGN9/gV4ODtT8
 kNtJny+8QjEok5FIQc7rfw3/RgQ4JsT3FNcz9FKV7HXMW02Q4tF3YWfitO7rqORZtfke
 afQryvNsdK7gA4IFdRFMd54VYwq3X2bG6ZbvXvK2biwLCA5Str8vGt+YggHhA8WQXCPn
 J+GtMzSlSfggcerzSCXkRrWcYxn/S9X1rz5QNHFv0jA4TgZWWKsrhmr7pUpAkusdY54C
 7ESGyh5J+i6u+5vNge41V7HlkuynRa0lY9duWd3EIZmpvYoLk5TiIMg1XEDcLCGaMh/5
 jFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E8qhKf/2WmhBRPPg/MeGqvsbLZvE/r19P4USKlf4sSs=;
 b=WpCg8HxUxfNIsVkKX9wZDxqE/dnwcUQ+NZx8a/vbtCQhNZ0xGgRsTPOCnf3/Uvnxr1
 HGgePF6ymccOCB7Hi8YxPzLJ9vbJcLJXlYJqbiriI6FlfXkqy/XGPJEzYWw9xtaaA7yr
 S0iRDC2tZOBZ9VbhJQZXpk76QdNuVxEp/jyNBbQnwquUdwgtJlUYzTRPozmiDCOohT8J
 TkdAXx/ggEb/I0hhDV+9h4KwiuUavDRZjWLnrsvgSqbH29zeQOY9zasEpYwDKm9Qh+Bq
 uM7VHe4hAStvbQhizlbWoQuhAFljyaBOvwMbdf5iF8Cbzy0BoL5GqDqB1+Mp3XRq/IbU
 kyiQ==
X-Gm-Message-State: AOAM530qnRKEbvujmP1upF5+lFsqrLCwdjX3gDFy/4AP8s3mrR/dedO7
 AuadK9nL7bAUN4S0YMBQATHwcAu6zc/Lv6M6OfCYcg==
X-Google-Smtp-Source: ABdhPJyxSCjU00EkDZOvum7OuxflNySwEIPxSMUThB3uNzj1WuFjtVARbvMFzdsbF0gu7EAndIHU2S8RmZM+PVzVqZI=
X-Received: by 2002:a1c:c913:: with SMTP id f19mr3740568wmb.86.1630597281884; 
 Thu, 02 Sep 2021 08:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210831141727.347597-1-groche@genymobile.com>
 <ed17db68-127c-94b3-a2f7-1f9a18c67d64@redhat.com>
In-Reply-To: <ed17db68-127c-94b3-a2f7-1f9a18c67d64@redhat.com>
From: Guillaume Roche <groche@genymobile.com>
Date: Thu, 2 Sep 2021 17:41:10 +0200
Message-ID: <CANU2yPdDWy_+BbmDzn3nFqFLJbNRNSRO+AveJsnP4zYXK3OxQQ@mail.gmail.com>
Subject: Re: [PATCH] block/vvfat: Fix ro shared folder
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=groche@genymobile.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

Le mar. 31 ao=C3=BBt 2021 =C3=A0 18:06, Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> a =C3=A9crit :
>
> Hi Guillaume,
>
> On 8/31/21 4:17 PM, Guillaume Roche wrote:
> > QEMU exits in error when passing a vfat shared folder in read-only mode=
.
> >
> > To fix this issue, this patch removes any potential write permission
> > from cumulative_perms, when a read-only block device is in use.
> >
> > Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D918950
> >
> > Signed-off-by: Guillaume Roche <groche@genymobile.com>
> > ---
> > This is an attempt to fix this behavior, but it feels a bit hacky to me
> > since this patch checks for the vvfat format in a generic function.
>
> What about implementing bdrv_vvfat::bdrv_check_perm()?

Thanks for this feedback. I had a look at your suggestion, but I'm a
bit confused.

As I understand it, bdrv_node_refresh_perm() calls
bdrv_get_cumulative_perm() (which I patched to remove the write
permission) then it checks the permissions.
Afterwards, it calls bdrv_drv_set_perm() that in turn calls
bs->drv->bdrv_check_perm(). So even if I implement
bdrv_vvfat::bdrv_check_perm(), I will get the permission error before
it is called.

Could you elaborate a bit on what you have in mind please?

Regards,
Guillaume

>
> > However, I'd be glad to have some advice to make it better. Anyway, I
> > ran the block tests to ensure this does not introduce any regression.
> >
> > To add some context: I know that this can be worked around by setting
> > the shared folder in rw mode. But our use-case requires using both
> > shared and VM snapshots, and QEMU prevents using snapshot with a rw
> > shared folder.
> >
> >  block.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/block.c b/block.c
> > index e97ce0b1c8..3f59e3843f 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -2383,6 +2383,12 @@ void bdrv_get_cumulative_perm(BlockDriverState *=
bs, uint64_t *perm,
> >          cumulative_shared_perms &=3D c->shared_perm;
> >      }
> >
> > +    /* Discard write permission if vvfat block device is read-only */
> > +    const char *format =3D bdrv_get_format_name(bs);
> > +    if (format !=3D NULL && strncmp(format, "vvfat", 5) =3D=3D 0 && bd=
rv_is_read_only(bs)) {
> > +        cumulative_perms &=3D ~BLK_PERM_WRITE;
> > +    }
> > +
> >      *perm =3D cumulative_perms;
> >      *shared_perm =3D cumulative_shared_perms;
> >  }
> >
>

