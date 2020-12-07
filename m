Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361882D0E72
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:52:58 +0100 (CET)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmE8W-0005Or-SC
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1kmE6D-0004kO-M0; Mon, 07 Dec 2020 05:50:33 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1kmE6C-0003Sg-4l; Mon, 07 Dec 2020 05:50:33 -0500
Received: by mail-pg1-x542.google.com with SMTP id m9so8573270pgb.4;
 Mon, 07 Dec 2020 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g7/5yvVKH5uRLH/UOlAqzuzD/CqtLI8h7QX5y+SnVS8=;
 b=Vl662Yd3hB2hsKeF027MGHks2pxLh3Ju0r2om9LhZkYxi6IOp2O/2eo6VVNONnL0hO
 QiEVmfu5QwtThY8RVcCGzUCyHmICZOQHoSUfZflPGeaTlWgpB2H0PXUpYyxi6Ip6+h4N
 bQ0/0c3V33z1pWDAX0aLxIl/m+Vswib2s24evxsZ3M/oTI8U3uvQmTe7lBBHQtSHYQH0
 I4lpqv2c3/1TfC1wUD4yLsxH7gXCq4vKA1F/ybXW8n51IX3QYur5w7cQYQqS+5ZhrgoR
 yNJ1Sc4AzXUGGUrEz8nfiO9QuZ3HU8+0sG0MkBYFogNtw1+AxVzTw3l1xQyqEj1MtgAa
 /JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g7/5yvVKH5uRLH/UOlAqzuzD/CqtLI8h7QX5y+SnVS8=;
 b=dvAduz5EMH+gHzVVi1ZQ2Foea5OkL9cacbGr6pgV08WBPBlUhQRJFvdxea0ywKtSU+
 cxdda78cpkgWTF8kKC5/UroZY7fnVZ/QsIOqYR0aseyvc+FBZ8WXQOZqZWqnUfDGYYh1
 KO984uOC4L4yPmdFvtGDriM7GBq5EjjfIailV7vtgqefBGJGsoq1ro0ezygQ+TmYvG+J
 pMfCgZBMB030zCShaRdptjfbNT9xrCBHHhEX8DH6GE8tJ1oQLPDevyZJvHuXbmGxGRMP
 UxOd5R86qHtwWP9SRL9Lq2jdcebviqayerQcOpJbEJOBckaj7Fy0/vskcxdL1JKbRcVu
 Nm5Q==
X-Gm-Message-State: AOAM531luulH3Q/DumxlOx7WxGHffCwvpKVLkJo1ne15wqI4h9pKbG1T
 E43sd+sQDn3sK6VgSS7wJ2OOhNHx442qCgk0no4=
X-Google-Smtp-Source: ABdhPJxAZKC6F0QXUxleVyo+vHFbVBgdKB5qa3ODTGB2tdJA6An4x1Qrzk087PjnG+zY06/WlwLRV/NmK3Jt+zx23w8=
X-Received: by 2002:a17:902:7001:b029:da:bbb6:c7e2 with SMTP id
 y1-20020a1709027001b02900dabbb6c7e2mr15700420plk.50.1607338228716; Mon, 07
 Dec 2020 02:50:28 -0800 (PST)
MIME-Version: 1.0
References: <1607077703-32344-1-git-send-email-fengli@smartx.com>
 <20201204104016.GC4833@merkur.fritz.box>
 <CAHckoCwJz0NTLWTpz0tApLe9qm-ZYYrE3-OmQmQCyfk4gtGUOA@mail.gmail.com>
In-Reply-To: <CAHckoCwJz0NTLWTpz0tApLe9qm-ZYYrE3-OmQmQCyfk4gtGUOA@mail.gmail.com>
From: Feng Li <lifeng1519@gmail.com>
Date: Mon, 7 Dec 2020 18:50:01 +0800
Message-ID: <CAEK8JBAu0jStwRgD=_hNDn1cHzxPXZyvHmikUtKcriCNvHxDKA@mail.gmail.com>
Subject: Re: [PATCH] file-posix: check the use_lock
To: Li Feng <fengli@smartx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=lifeng1519@gmail.com; helo=mail-pg1-x542.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Kyle Zhang <kyle@smartx.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

I have read the 182 test, and I'm very confused about the test.
I'm not familiar with the permissions and locks in the qemu.
Could you give me more tips about how to complete the test?

Li Feng <fengli@smartx.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=884=E6=97=A5=E5=
=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:55=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Kevin,
> Thanks for your reply.
>
> In my scenario, my NFS server doesn't support the file lock.
> And when I set the file.locking =3D false, the Qemu still reports:
> qemu-system-x86_64: -drive
> file=3D/tmp/nfs/a,format=3Draw,cache=3Dnone,aio=3Dnative,if=3Dnone,id=3Dd=
rive-virtio-disk1,file.locking=3Don:
> Failed to lock byte 100
>
> I will look at the iotest 182 and try to add a test.
>
> Thanks,
> Feng Li
>
> Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:40=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Am 04.12.2020 um 11:28 hat Li Feng geschrieben:
> > > When setting the file.locking =3D false, we shouldn't set the lock.
> > >
> > > Signed-off-by: Li Feng <fengli@smartx.com>
> >
> > This looks right to me, but can you add a test for this scenario to
> > iotest 182? This would both demonstrate the effect of the bug (I think
> > it would be that files are locked after reopen even with locking=3Doff?=
)
> > and make sure that we won't have a regression later. Mentioning the
> > effect in the commit message would be good, too.
> >
> > Kevin
> >
> > >  block/file-posix.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > index d5fd1dbcd2..806764f7e3 100644
> > > --- a/block/file-posix.c
> > > +++ b/block/file-posix.c
> > > @@ -3104,7 +3104,7 @@ static int raw_check_perm(BlockDriverState *bs,=
 uint64_t perm, uint64_t shared,
> > >      }
> > >
> > >      /* Copy locks to the new fd */
> > > -    if (s->perm_change_fd) {
> > > +    if (s->perm_change_fd && s->use_lock) {
> > >          ret =3D raw_apply_lock_bytes(NULL, s->perm_change_fd, perm, =
~shared,
> > >                                     false, errp);
> > >          if (ret < 0) {
> > > --
> > > 2.24.3
> > >
> >

