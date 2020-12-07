Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6C2D1048
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:16:40 +0100 (CET)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFRX-0004Nb-RV
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmEhv-0005yR-G3
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:29:34 -0500
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:35639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmEhr-0005w9-Kd
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:29:31 -0500
Received: by mail-vs1-xe43.google.com with SMTP id v8so7360297vso.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FCwoKRZr8/+Pmet9HlmO0AEwQfMBfUQQYfr0iZK8ITQ=;
 b=RY2PYARouwPMU+vuh0dZ9x7fQpRWZ2J4mRjouz78YnSpANV0e6WhkkBJnh92Y0+GyF
 8nJg80PNA5KZCAaUnVJeG+1uYEjqLUcjA4UjniNtU1Frw9RtQtKsQbDLCpw/n//Nu2ju
 BBlSvsOutAx5TbTXMo80KauWhokNrx4zkEfcpz0LiwaXpOuJiUkyiDGEK809qiFyJPJJ
 xLyTpYY5ftjNsNcijs5VUTApJVMlJFRNp+tv4i1xr0/YsVlNjpcSiXTvx8K/GCY1i8zT
 bzeT/0MhApwo7hqxJYRzHiMdCwaq6DEIt4/rjPLPLWf2CCzQWbk7ixmsti0JtullInTO
 Tbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FCwoKRZr8/+Pmet9HlmO0AEwQfMBfUQQYfr0iZK8ITQ=;
 b=KFsLoSDtUxxNXaVqQHDmLs3FRB7SQgl+Dm5QkQD2cqn3aPgeMILy7SFbgJooHx4V0K
 h67/wb3D3jWNIkFZNdl5tVXB9/ZSyTn1ajWdI0gLFcRwp9iG1BGKoSGuRZtxLMwRi/MP
 FpMsJlMBlgiVaxUZ2lfUhRTdep1RePQlCS/PGLyKkPzroLhy/Thu3eBQsX4KiHoCWUig
 YyXCbu+1jQEswogatyqpcgP58aNBSSaMGuIxlm1z7GPglrCVT0ZMTCPSnzsOIbkR5P7i
 JZjze+xj4/W4hJbgHZPwdTXpNNbMWDc0FkM8GWxjzFY+Cxhu5CARkhSt746JluKN59ye
 vLWw==
X-Gm-Message-State: AOAM531AiUKckYK2e5c0H7RUF/1sD9J9ClYFcJ2GpULuxly6E61orRsV
 BWbMZm/UGPiB6Ho7iL2QCNCe/5VASqlI4/2jGpSflQ==
X-Google-Smtp-Source: ABdhPJznYoxn2dxMca3mgqVUbnYu4GtSvqy6E4epsC3jCNrlACZ1I1VpFUKzMZE+m1cVyPC7DkHc5KpVpNhzoJB42F4=
X-Received: by 2002:a67:fdcb:: with SMTP id l11mr1309112vsq.38.1607340565227; 
 Mon, 07 Dec 2020 03:29:25 -0800 (PST)
MIME-Version: 1.0
References: <1607077703-32344-1-git-send-email-fengli@smartx.com>
 <20201204104016.GC4833@merkur.fritz.box>
 <CAHckoCwJz0NTLWTpz0tApLe9qm-ZYYrE3-OmQmQCyfk4gtGUOA@mail.gmail.com>
 <CAEK8JBAu0jStwRgD=_hNDn1cHzxPXZyvHmikUtKcriCNvHxDKA@mail.gmail.com>
 <20201207111702.GA5281@merkur.fritz.box>
In-Reply-To: <20201207111702.GA5281@merkur.fritz.box>
From: Li Feng <fengli@smartx.com>
Date: Mon, 7 Dec 2020 19:29:13 +0800
Message-ID: <CAHckoCxidupT=RwZB6fGxV6KYbRutVDzbV3nEd1K5X1ED0sevQ@mail.gmail.com>
Subject: Re: [PATCH] file-posix: check the use_lock
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::e43;
 envelope-from=fengli@smartx.com; helo=mail-vs1-xe43.google.com
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
Cc: Feng Li <lifeng1519@gmail.com>, Kyle Zhang <kyle@smartx.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kevin,

OK, thanks for your reply, I will send out the v2 patch.

Thanks,
Feng Li

Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=887=E6=97=A5=
=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=887:17=E5=86=99=E9=81=93=EF=BC=9A
>
> Am 07.12.2020 um 11:50 hat Feng Li geschrieben:
> > Hi Kevin,
> >
> > I have read the 182 test, and I'm very confused about the test.
> > I'm not familiar with the permissions and locks in the qemu.
> > Could you give me more tips about how to complete the test?
>
> Hm, actually, to produce a failure, we would have to have a filesystem
> in the host that doesn't support locks. I don't even know how to get
> such a filesystem manually, and it's probably completely impossible in a
> test case without root permissions.
>
> So maybe just add a more detailed description of the bug to the commit
> message, and we'll have to apply it without a test.
>
> Kevin
>
> > Li Feng <fengli@smartx.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:55=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > Hi Kevin,
> > > Thanks for your reply.
> > >
> > > In my scenario, my NFS server doesn't support the file lock.
> > > And when I set the file.locking =3D false, the Qemu still reports:
> > > qemu-system-x86_64: -drive
> > > file=3D/tmp/nfs/a,format=3Draw,cache=3Dnone,aio=3Dnative,if=3Dnone,id=
=3Ddrive-virtio-disk1,file.locking=3Don:
> > > Failed to lock byte 100
> > >
> > > I will look at the iotest 182 and try to add a test.
> > >
> > > Thanks,
> > > Feng Li
> > >
> > > Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=884=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:40=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > Am 04.12.2020 um 11:28 hat Li Feng geschrieben:
> > > > > When setting the file.locking =3D false, we shouldn't set the loc=
k.
> > > > >
> > > > > Signed-off-by: Li Feng <fengli@smartx.com>
> > > >
> > > > This looks right to me, but can you add a test for this scenario to
> > > > iotest 182? This would both demonstrate the effect of the bug (I th=
ink
> > > > it would be that files are locked after reopen even with locking=3D=
off?)
> > > > and make sure that we won't have a regression later. Mentioning the
> > > > effect in the commit message would be good, too.
> > > >
> > > > Kevin
> > > >
> > > > >  block/file-posix.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > > > index d5fd1dbcd2..806764f7e3 100644
> > > > > --- a/block/file-posix.c
> > > > > +++ b/block/file-posix.c
> > > > > @@ -3104,7 +3104,7 @@ static int raw_check_perm(BlockDriverState =
*bs, uint64_t perm, uint64_t shared,
> > > > >      }
> > > > >
> > > > >      /* Copy locks to the new fd */
> > > > > -    if (s->perm_change_fd) {
> > > > > +    if (s->perm_change_fd && s->use_lock) {
> > > > >          ret =3D raw_apply_lock_bytes(NULL, s->perm_change_fd, pe=
rm, ~shared,
> > > > >                                     false, errp);
> > > > >          if (ret < 0) {
> > > > > --
> > > > > 2.24.3
> > > > >
> > > >
> >
>

