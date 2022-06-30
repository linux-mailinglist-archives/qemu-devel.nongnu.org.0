Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393E456175F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 12:12:58 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6rAO-00010m-T6
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 06:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o6r97-0008RQ-3u; Thu, 30 Jun 2022 06:11:37 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1o6r92-0005Lf-Jq; Thu, 30 Jun 2022 06:11:36 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3177f4ce3e2so174006147b3.5; 
 Thu, 30 Jun 2022 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eH62iYpw57rskahAqZe1F2gVjBrQ59ERQgZ48eOxgVg=;
 b=UWm7npl8VxBiXzsVjlw92Q/Ofi5SK91w7q37nSNop7L8GGGEUsrHkVugA3eeKLtcB5
 4pv4j894VIeQ4pMJDC7iOhDjAO0DkReFH3uXXuN/m+4/1C/wiGiBSrklpFbkOwIe89pW
 EZoeRqKE9HFrdVt0v6GrVwYCp3wTOWi0KU130ZfpY9MFqjD2d/qgRsDmsS0b9CXQ4in8
 /1dNkgE8pQHz50l0xBoTblBU8T+7jlt5jmy5TSMyoFXN+Pi/HzJppM9A00jqo+V0Xe5c
 wtOwCxWZNXIUjEx6KSc5LhA8Fq/e9Uyn8OQiALjoHIGGmc6qYZm8ZcM7gqEc37KxZrkE
 DKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eH62iYpw57rskahAqZe1F2gVjBrQ59ERQgZ48eOxgVg=;
 b=EOK4dH7AzMitVNNBCYE9dMDFExNgwEAQZ5DkuPq2r8SABKDpcGogDpqfWslpvhp6Ko
 7wyptEbYweCs09SADJY+Y/7PUdHwsAURIULGwtWKE6VOM3C/Svv0wtWZVRRnzbyCmZki
 DxRXHik2B0W8nGtrYf5D2wFCjNlYssMw4lrb0nzJeQZitKLnJg3m1FNZaPCtUZxOV4kn
 ap6gnPQGr0hGItIADEkFt5Cj0mm7LOsJ+Ls6Ix3uw4/whSbr9Sr3SDgSy3L8tavd3zS9
 Z0S+L032uJzIDQ2iBwHMrky7L2c1NGZaI30XHQDW56PwLqKrQ9D2CbB4zbs5RAYzAEZE
 RWsQ==
X-Gm-Message-State: AJIora+DoCGZruhbKAOcEPXQIms0nzTQncPD8G/y2N265RzZy7xYvG9u
 gl8GXhIsQk6y89J0svVENeQ4jEf4/RVn2A4qeoM=
X-Google-Smtp-Source: AGRyM1uhpWisAtOH/6FCZqtCQiXysHoOSEYZOsBQLFJRoxXtOeIoRvH1hsV+NzJeVVLhJFuYjdT2aLqlZT2rv6WjCyY=
X-Received: by 2002:a81:524d:0:b0:317:9f17:15bd with SMTP id
 g74-20020a81524d000000b003179f1715bdmr9519093ywb.156.1656583891057; Thu, 30
 Jun 2022 03:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-6-faithilikerun@gmail.com>
 <Yrq5j3TQs8crLRVn@stefanha-x1.localdomain>
 <CAAAx-8JTDjSUw+AAnp5mc2TUoX8GS85sE--BqyBMEsgbG0fGQw@mail.gmail.com>
In-Reply-To: <CAAAx-8JTDjSUw+AAnp5mc2TUoX8GS85sE--BqyBMEsgbG0fGQw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 30 Jun 2022 11:11:19 +0100
Message-ID: <CAJSP0QWRvJ5iu8_L2AL5A-FF53OvzWt5uZncSjxZCac7Lb1LhA@mail.gmail.com>
Subject: Re: [RFC v3 5/5] qemu-iotests: add zone operation tests.
To: Sam Li <faithilikerun@gmail.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
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

On Tue, 28 Jun 2022 at 10:35, Sam Li <faithilikerun@gmail.com> wrote:
>
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8828=
=E6=97=A5=E5=91=A8=E4=BA=8C 16:20=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Mon, Jun 27, 2022 at 08:19:17AM +0800, Sam Li wrote:
> > > diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/t=
ests/zoned.sh
> > > new file mode 100755
> > > index 0000000000..262c0b5427
> > > --- /dev/null
> > > +++ b/tests/qemu-iotests/tests/zoned.sh
> > > @@ -0,0 +1,49 @@
> > > +#!/usr/bin/env bash
> > > +#
> > > +# Test zone management operations.
> > > +#
> > > +
> > > +QEMU_IO=3D"build/qemu-io"
> > > +IMG=3D"--image-opts driver=3Dzoned_host_device,filename=3D/dev/nullb=
0"
> > > +QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
> > > +
> > > +echo "Testing a null_blk device"
> > > +echo "Simple cases: if the operations work"
> > > +sudo modprobe null_blk nr_devices=3D1 zoned=3D1
> >
> > Please use bash's "trap" command to remove null_blk on exit. That way
> > cleanup happens whether the script exits successfully or not. See
> > tests/qemu-iotests/108 for an example.
>
> Noted. Should I just include "rmmod null_blk" in _cleanup()? I'm a
> little confused about the normal way to write qemu-iotests.

Yes, please. There are a few related issues here:

1. Cleaning up
qemu-iotests must not assume the environment is set up in a specific
way before ./check is launched and they must clean up after themselves
(whether the test succeeds or fails).

This is important so that tests are idempotent and do not leak
resources or change the state of the system, which could affect future
test runs.

2. Parallelism
Multiple instances of tests should be able to run at the same time.
This is a problem with null_blk because two tests that change the
state of /dev/nullb0 at the same time will interfere with each other
and fail.

I don't know if there is a good solution already implemented in
qemu-iotests. Maybe Kevin can answer this question?

3. Skipping tests on unsupported systems
Tests with specific requirements can use the following functions to
run only when the configuration is supported:

  _supported_fmt raw
  _supported_proto file
  _supported_os Linux

This means the test only runs on Linux hosts with raw image files. On
BSD, macOS, etc the test will be skipped. It will also be skipped if
./check was invoked with -qcow2 or another disk image format that is
not raw.

The test script can also check whether the system supports necessary
features and then skip tests when they are not available:

  if ! ...check for foo ...; then
    _notrun "cannot find dependency foo"
  fi

> >
> > > +# success, all done
> > > +sudo rmmod null_blk
> > > +echo "*** done"
> > > +#rm -f $seq.full
> >
> > Why is this commented out?
> I should just remove it. seq is not used.

Okay. I only found small remnants of $seq.full in common.rc and the
tests themselves don't seem to use it. It may be something that early
qemu-iotests or event xfstests had that's no longer needed.

Stefan

