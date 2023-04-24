Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADAC6ED40F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 20:03:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0Wj-0002di-ST; Mon, 24 Apr 2023 14:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pr0Wc-0002d3-Ih
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:02:56 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pr0Wa-0000Nn-Fe
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:02:53 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so35606632a12.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682359370; x=1684951370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5l5dK6nH/wRmMeYaDPOFeHerf4zcI/4Sk8og2cdOps=;
 b=sK8/lgNP6MUTwQh4pZkScYm0LbbuZ9gPk+Ar+zJjAKltqiQMcFUUjqdIMUKhGANrt+
 QSXZIgpOD3COl+l1O9eLrR6m/q4BrLmoMPlEWra9LsnKxL9qme9XVuyhTbOaryP27R3j
 PsH/h5dxJE8DIHunYLbuvvHRR65k8qUlr4K5JBd0C4Dr3Ro3JZV5kDAl2tUHfH7h+Wcm
 nl9DI79e1xtbMYIEh9WbB3dnBd3OO4YtU0HAxOg4h0yS8Gw8saZ933D+vvFdjLyNctlE
 nnCJ6B8pjjyGQn2noqDRJXmwPr5a/ooZo8LiigqlaqONBW0MfZNcwsjNhbOHViVmtWmv
 vbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682359370; x=1684951370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5l5dK6nH/wRmMeYaDPOFeHerf4zcI/4Sk8og2cdOps=;
 b=CZyr4xIFB93BqAeoZNVt5iOqTW4a3n1ZhhkYi1tT00/qZmOtIGC47aDqEBj4UKhGll
 n6J0VU+okB/FQIPucHQp9mjZdRju2biiA+O63rP6sU9B3ermkmJmXS2Hi1hC8Vm5kQq2
 L/jsXKFEtvix0gzjFJMIyQmanYvZimmbWHeeZ/A5P3KwGiyvVIvt/DAiXF7mg9hUcrCn
 SMOH83Lp1HOwW76kVyL2vSqUyuqLXCaNq2/BNuhH2kC61WPuj6EFRey+dIy+rxwk/c0b
 xLzQCfMxNbMC2c+13DQPfFgTk40rJD/hLhH8hN7EU8Wc4oRLm39Fm4J5na26sl1Tb5W+
 FCug==
X-Gm-Message-State: AAQBX9e2EgvFjvAV/Uhqw87u2r5Di3jE72u3Z7Q1mYgtZV8U/zZzZgGg
 oVyiHXw431qv9hFWl39TdFX5i+VTbgOLDUmH9L/diy+ReFxf+W4/
X-Google-Smtp-Source: AKy350YXvJ4sve5LlsRCW25Pt1qYgpCrKjHdcHKGnqLo4FrTma+EIxVl65lV+iPeVaF0V9NciTciTBqry3Wgy2UrulM=
X-Received: by 2002:a17:906:1d51:b0:953:7d80:c40e with SMTP id
 o17-20020a1709061d5100b009537d80c40emr11585644ejh.0.1682359369580; Mon, 24
 Apr 2023 11:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230420120948.436661-1-stefanha@redhat.com>
 <e7775d5f-292c-2a88-afaa-5731ee1bc897@linaro.org>
 <20230424175251.GA298880@fedora>
In-Reply-To: <20230424175251.GA298880@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 25 Apr 2023 02:02:21 +0800
Message-ID: <CAAAx-8LkKXALsL=hVvb7yLazjV+pt2A11kyV1xZ-uMRvhP51zg@mail.gmail.com>
Subject: Re: [PULL 00/20] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=faithilikerun@gmail.com; helo=mail-ed1-x52f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=BA=8C 01:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Apr 21, 2023 at 08:01:56PM +0100, Richard Henderson wrote:
> > On 4/20/23 13:09, Stefan Hajnoczi wrote:
> > > The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8=
e9d6b4:
> > >
> > >    Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> > >
> > > for you to fetch changes up to 36e5e9b22abe56aa00ca067851555ad8127a79=
66:
> > >
> > >    tracing: install trace events file only if necessary (2023-04-20 0=
7:39:43 -0400)
> > >
> > > ----------------------------------------------------------------
> > > Pull request
> > >
> > > Sam Li's zoned storage work and fixes I collected during the 8.0 free=
ze.
> > >
> > > ----------------------------------------------------------------
> > >
> > > Carlos Santos (1):
> > >    tracing: install trace events file only if necessary
> > >
> > > Philippe Mathieu-Daud=C3=A9 (1):
> > >    block/dmg: Declare a type definition for DMG uncompress function
> > >
> > > Sam Li (17):
> > >    block/block-common: add zoned device structs
> > >    block/file-posix: introduce helper functions for sysfs attributes
> > >    block/block-backend: add block layer APIs resembling Linux
> > >      ZonedBlockDevice ioctls
> > >    block/raw-format: add zone operations to pass through requests
> > >    block: add zoned BlockDriver check to block layer
> > >    iotests: test new zone operations
> > >    block: add some trace events for new block layer APIs
> > >    docs/zoned-storage: add zoned device documentation
> > >    file-posix: add tracking of the zone write pointers
> > >    block: introduce zone append write for zoned devices
> > >    qemu-iotests: test zone append operation
> > >    block: add some trace events for zone append
> > >    include: update virtio_blk headers to v6.3-rc1
> > >    virtio-blk: add zoned storage emulation for zoned devices
> > >    block: add accounting for zone append operation
> > >    virtio-blk: add some trace events for zoned emulation
> > >    docs/zoned-storage:add zoned emulation use case
> > >
> > > Thomas De Schampheleire (1):
> > >    tracetool: use relative paths for '#line' preprocessor directives
> >
> > 32 failed CI jobs:
> > https://gitlab.com/qemu-project/qemu/-/pipelines/844927626/failures
>
> Hi Sam,
> I have dropped the zoned storage patches from the block pull request.
> Please take a look at the diff below and squash the fixes into your
> original commits.
>
> Once you have reworked your patch series, please retest them and then
> resend so we can merge them in the next block pull request.

Thanks! I will do that ASAP.


Sam

