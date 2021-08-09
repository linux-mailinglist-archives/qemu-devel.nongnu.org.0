Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E403E4D2B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:38:49 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDB6m-000690-Gf
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDB5n-0005T3-S3
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:37:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDB5m-0004iP-3O
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:37:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id x14so3799731edr.12
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 12:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jIFH/qVSph39RSOiVPYwFKGoLZyJ7Xk5kpGDRrG/S3c=;
 b=VipZwz5/IbB6DaLmOajXSNX6IdmGACEBNLFkc6hD+Y2ZRheYYSvVUqdZMO7aj2lwxx
 p2p2Ej79cEwnsUweF9tv+7ewn2MMXmWmB3QHnDFL4P12mLOrwK9gU8J8Hq2Xco1cqLw9
 7ivsSH+yUpffja2Dwc/oBZE8z8WQhbsbBWAOoDt0dklwIjhLHZMhJe0kshx5Cnryty7o
 nYsXejZkmmkBUjuB8jgX5mH14SQ9V8Yjto5jto7b3ykebYLUmi49zSzqZ/7AYoagMQCp
 kxbptQclVt4YKTCrJYyHJPPdHewkDUcErYmjSrDx0VDTikpB5Gvus4YzZr4HVc7mpeNR
 kzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jIFH/qVSph39RSOiVPYwFKGoLZyJ7Xk5kpGDRrG/S3c=;
 b=asB1uhgT3HQuvC+/C3wLj3OdDCJWnopgEMrTB4mwTth4aK5AAgYvRWfB6/8U38o4gn
 TkD9l8YL/F/CXvpnwislWPSe4v70y/cHe9WNFxyl3nHpYuavkAT0Jychui3f4SOGItEJ
 A8mD41xW8mCReOYCkAMkHHSbDmk6Abd3yQQu70VxtROjCeoOIXiLXoPVy/eftWddcv8Z
 VmD9D+vzbPdNby0xnI1f8oshGHXQ4mD6/pGB6E2/zMEq3CiLUa6FDiaaQuwnAUubVQ22
 wRQDs6c7cCr13IC4FoihEwbOdduB978A7v0vceNYTX41CnWmRROU4SPBYxhztQLnIbMH
 B3/Q==
X-Gm-Message-State: AOAM532FZ6BQfT8U4i1wFo0Ylt8oVIGlWCgvcdMPf0SPZ0uY/7Iy7TQH
 xOFp4o8er3b2+QLT4DudefrtaCibP8yTJsehuSPtsw==
X-Google-Smtp-Source: ABdhPJxrXc3TcJ9VILCSxbVA7mRQwsifN9ESm5cvJp1GPeS0MRMHXRFxiIFM3zZ6WN4QQxYVwYBqmxbcxgTFrU/njA0=
X-Received: by 2002:a50:f615:: with SMTP id c21mr32558091edn.146.1628537864178; 
 Mon, 09 Aug 2021 12:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210809111621.54454-1-alxndr@bu.edu>
 <CAFEAcA8F07vzmOGdTEcQeemGCszDU3nCWH7ehvkBWWQMxm8QgQ@mail.gmail.com>
 <20210809190559.rqo7253wbcrq7r36@mozz.bu.edu>
 <20210809193004.qwdqjbew4oe6jbqy@mozz.bu.edu>
In-Reply-To: <20210809193004.qwdqjbew4oe6jbqy@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 20:36:59 +0100
Message-ID: <CAFEAcA8OdAb65ub9i8tYjtUWUTshBvnaUZ9bqs4UOm4K_0t0Dw@mail.gmail.com>
Subject: Re: [PATCH] fuzz: avoid building twice, when running on gitlab
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 at 20:30, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 210809 1506, Alexander Bulekov wrote:
> > On 210809 1925, Peter Maydell wrote:
> > > On Mon, 9 Aug 2021 at 12:18, Alexander Bulekov <alxndr@bu.edu> wrote:
> > > >
> > > > On oss-fuzz, we build twice, to put together a build that is portab=
le to
> > > > the runner containers. On gitlab ci, this is wasteful and contribut=
es to
> > > > timeouts on the build-oss-fuzz job. Avoid building twice on gitlab,=
 at
> > > > the remote cost of potentially missing some cases that break oss-fu=
zz
> > > > builds.
> > > >
> > > > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > > ---
> > > >
> > > > From a couple test runs it looks like this can shave off 15-20 minu=
tes.
> > > >
> > > >  scripts/oss-fuzz/build.sh | 24 +++++++++++++-----------
> > > >  1 file changed, 13 insertions(+), 11 deletions(-)
> > >
> > > I tried a test run with this, but it still hit the 1 hour timeout:
> > >
> > > https://gitlab.com/qemu-project/qemu/-/pipelines/350387482
> >
> > It also timed out for me with a 120 minute timeout:
> > https://gitlab.com/a1xndr/qemu/-/jobs/1488160601
> >
> > The log has almost exactly the same number of lines as yours, so I'm
> > guessing one of the qtests is timing out with --enable-sanitizers .

>
> Building locally:
> $ CC=3Dclang-11 CXX=3Dclang++-11 ../configure --enable-fuzzing \
>     --enable-debug --enable-sanitizers
> $ make check-qtest-i386 check-unit
>
> Same as on gitlab, this times out shortly after outputting
> "sh: 1: exec: ./storage-daemon/qemu-storage-daemon: not found"
>
> Manually running qos-test, the same way check-qtest-i386 invokes it:
>
> $ QTEST_QEMU_BINARY=3D./qemu-system-i386 QTEST_QEMU_STORAGE_DAEMON_BINARY=
=3D./storage-daemon/qemu-storage-daemon tests/qtest/qos-test --tap -k -m qu=
ick < /dev/null
>
> # starting vhost-user backend: exec ./storage-daemon/qemu-storage-daemon =
--blockdev driver=3Dfile,node-name=3Ddisk0,filename=3Dqtest.XRAzzu --export=
 type=3Dvhost-user-blk,id=3Ddisk0,addr.type=3Dunix,addr.path=3D/tmp/qtest-9=
4561-sock.NdKWpt,node-name=3Ddisk0,writable=3Don,num-queues=3D1
> sh: 1: exec: ./storage-daemon/qemu-storage-daemon: not found
> # starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-94561.soc=
k -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-94561.qmp,id=3Dcha=
r0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -M pc  -device vhost-u=
ser-blk-pci,id=3Ddrv0,chardev=3Dchar1,addr=3D4.0 -object memory-backend-mem=
fd,id=3Dmem,size=3D256M,share=3Don  -M memory-backend=3Dmem -m 256M -charde=
v socket id=3Dchar1,path=3D/tmp/qtest-94561-sock.NdKWpt  -accel qtest
>
> *timeout*

vhost-user timing out in realize I suspect. I see that as
an intermittent hang in non-sanitizer configs.

vhost-user folk: Can we either look at fixing this or else disable
the test ? (Stack backtraces available in the other email thread.)

thanks
-- PMM

