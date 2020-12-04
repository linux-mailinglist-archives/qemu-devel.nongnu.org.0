Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96F2CEC94
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 11:57:45 +0100 (CET)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl8mX-0004tv-0E
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 05:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kl8ku-0004DE-Jg
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:56:05 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:39944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kl8kp-0006iO-6U
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 05:56:04 -0500
Received: by mail-vs1-xe42.google.com with SMTP id x4so2991850vsp.7
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 02:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KfTRN4zhZjsnfDEHRuHkE2Myqz8uarITYoqE4+SWi7I=;
 b=fDpMAbIQXr7lP8wnzI3SRPMtYAC9qK3cRVXjZHPgRwR0gma034lHw9yKFoCrF9IMv8
 SqCr1NMSDDuJYxrDjHlOvn+VbhxiE0mre8UudkYM4jZb2OubahL4hpAPOLp0CsRzEKJ4
 qlBjcpFpt0VmDMyvFfRO7kCAKR2KFz/owZtkvomk+UlRDVbSynnBw2GRDBZTPuOpYT0U
 NkC+AuJihbsUqSriKn6sh2Xh4cOIDUkJTAmc2XLBY+Aah+vAHqiLCf2Cy+FBN7h6lFA2
 Jh4pPg+d3KwJm+RxePvLI1IBKcVrjokiK/W2Iyf7xrr9GOB5gIIdI61gbVxRGSYpNv6F
 uVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KfTRN4zhZjsnfDEHRuHkE2Myqz8uarITYoqE4+SWi7I=;
 b=Kc3HQU7/2/xIx4boTUuE//cF7/7uGLsZAT2+tashRLCD84w9jiVav5h/jjS6/WZxjd
 Yuj3XXRhHuFb4HYzle3NIIqkq+8MxpkOOP6qdqxmWg6pGbSt0+SJFdAvZzo3rhzOBmPU
 WN49QKvukoUt+BN/B5vZanb9bk0D4HFkU1AvQR7dKtZZUgwQMigr3zRc1C2CYUwJjJh5
 zQoir45HlSiLAOrgji+RaKlGNut3p6Psv9/HEDt900kcmJmNUT+vcgN+lip9xw7X/488
 Yl2UaW3/slJdcVz9sLs5kXYz6M+59B6cdqu2Lkde1zHSk2pQtvrEspNfdLFPI7H83UjW
 4XAg==
X-Gm-Message-State: AOAM530svBNfV7mBrdoRgs+pgiDHTjQyanwKhNTjtWyG6ObO7z9dx6xP
 KpZXTjZEQSGaclOO1to4z9jtRyFXExm+neYRtrIQbA==
X-Google-Smtp-Source: ABdhPJwGTX47doohtDagbQM6kReAgine7349+VdbbUc6La8UOgNmq0ByiazPLKE3Nq0SmvqHep5lAcda+AeK70NC/iY=
X-Received: by 2002:a67:fc51:: with SMTP id p17mr2376173vsq.38.1607079356033; 
 Fri, 04 Dec 2020 02:55:56 -0800 (PST)
MIME-Version: 1.0
References: <1607077703-32344-1-git-send-email-fengli@smartx.com>
 <20201204104016.GC4833@merkur.fritz.box>
In-Reply-To: <20201204104016.GC4833@merkur.fritz.box>
From: Li Feng <fengli@smartx.com>
Date: Fri, 4 Dec 2020 18:55:44 +0800
Message-ID: <CAHckoCwJz0NTLWTpz0tApLe9qm-ZYYrE3-OmQmQCyfk4gtGUOA@mail.gmail.com>
Subject: Re: [PATCH] file-posix: check the use_lock
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::e42;
 envelope-from=fengli@smartx.com; helo=mail-vs1-xe42.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Thanks for your reply.

In my scenario, my NFS server doesn't support the file lock.
And when I set the file.locking =3D false, the Qemu still reports:
qemu-system-x86_64: -drive
file=3D/tmp/nfs/a,format=3Draw,cache=3Dnone,aio=3Dnative,if=3Dnone,id=3Ddri=
ve-virtio-disk1,file.locking=3Don:
Failed to lock byte 100

I will look at the iotest 182 and try to add a test.

Thanks,
Feng Li

Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Am 04.12.2020 um 11:28 hat Li Feng geschrieben:
> > When setting the file.locking =3D false, we shouldn't set the lock.
> >
> > Signed-off-by: Li Feng <fengli@smartx.com>
>
> This looks right to me, but can you add a test for this scenario to
> iotest 182? This would both demonstrate the effect of the bug (I think
> it would be that files are locked after reopen even with locking=3Doff?)
> and make sure that we won't have a regression later. Mentioning the
> effect in the commit message would be good, too.
>
> Kevin
>
> >  block/file-posix.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index d5fd1dbcd2..806764f7e3 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -3104,7 +3104,7 @@ static int raw_check_perm(BlockDriverState *bs, u=
int64_t perm, uint64_t shared,
> >      }
> >
> >      /* Copy locks to the new fd */
> > -    if (s->perm_change_fd) {
> > +    if (s->perm_change_fd && s->use_lock) {
> >          ret =3D raw_apply_lock_bytes(NULL, s->perm_change_fd, perm, ~s=
hared,
> >                                     false, errp);
> >          if (ret < 0) {
> > --
> > 2.24.3
> >
>

