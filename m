Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0CF6027C1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:00:34 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiSe-00078o-Oh
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oki9z-0003ia-Jl; Tue, 18 Oct 2022 04:41:15 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oki9x-0004AM-Ir; Tue, 18 Oct 2022 04:41:15 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id h25so6168121vkc.6;
 Tue, 18 Oct 2022 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UiNphEzLyuCVAv/Rl0pRQL4IcJGg46KkU6eeENN59o=;
 b=idBu9PhKHzRkFa9yBiN5rVH3p7uZ+o+WNl7UBHmjaS3oHDdNB0rSNV18dfqM8ssKWM
 XG6fGmLHdeIVTE2QlQzMmRRX52r5emdl0JP8+Q43Don4CgeeL1RAhTtZ/cbViqWUNL8m
 mrXK7q76VDN8wcTQiKeBrM+XZfhX+gvW+TijZJssfkXk4CYM67nlJBeISJu5mFyESFFq
 4rTJgjLIhh89mx4xRAJki1l45PnHmFoJbsWpzeLkEktDaJqNn+La/NKjBT4qY1k3J+2A
 h2lxGIc8xRXmS5504K4bWGHKd/jrj85+e+5XYuoIpMEM/DV94uAx8mvbQRMFJrXiW8gY
 bDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UiNphEzLyuCVAv/Rl0pRQL4IcJGg46KkU6eeENN59o=;
 b=7bE0vjYRkOw7qXud8VHXxcVj5DyLKL2AtT8ZsnN0I2IRlh4USVCMj2dCzudWJS+k+T
 NruwS8SdgXHMdFxUE/1GYVeiPuNr7htOVybFwnGgv3c+H0AJ2u5ku/7sdt7po/Nymf42
 Xdoi0qVBWo6Q0DDeNs+oZKzZ0XCDIMv2iGq2isj6OIMOpWtcP0i40cXX0MIngLlW/Bol
 SsEpD6PdAgu1sJ7WNgx5YMH6CzHGm+SFZU5wz1kYFgKr6D4HpVk0xZWDXumGRj8l02Uw
 Lhw37NBTdvi/Kxscce+XQVHLOQ0ot7K4HanIfPvsHm9ZqEqCXKjC8VLiQDUJpY+RmVEH
 tk2g==
X-Gm-Message-State: ACrzQf3QUL8sJ1P472Xyn9REhQ6D3u3ZM3Z+kiEah1RixCzbcFn9nJkU
 aPbBfgnkVyTJ09HC/gITQinQpm7YfC5nehuLn0A=
X-Google-Smtp-Source: AMsMyM6R6w0AEu1zHxBdPyg1yl2lydavCeTAK8tU2hqQuHlWcAXEdqoafpwaf67CokZVnfhVwC2RRRHOe1p4TCrTkuY=
X-Received: by 2002:a1f:9cc5:0:b0:3a2:bd20:8fc6 with SMTP id
 f188-20020a1f9cc5000000b003a2bd208fc6mr828686vke.22.1666082471581; Tue, 18
 Oct 2022 01:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-7-faithilikerun@gmail.com>
 <0e24771f0db95ffbd2ff413f24a4dfdc4674b89e.camel@wdc.com>
In-Reply-To: <0e24771f0db95ffbd2ff413f24a4dfdc4674b89e.camel@wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 18 Oct 2022 16:41:30 +0800
Message-ID: <CAAAx-8Kdz--HDTZ0c8iu2KD0Ntn2Tp_ohUWu6vCzaALD2Wi+zw@mail.gmail.com>
Subject: Re: [PATCH v12 6/7] qemu-iotests: test new zone operations
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, 
 "hare@suse.de" <hare@suse.de>, "armbru@redhat.com" <armbru@redhat.com>, 
 "stefanha@redhat.com" <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>, 
 "kwolf@redhat.com" <kwolf@redhat.com>, 
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Dmitry Fomichev <Dmitry.Fomichev@wdc.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=88=
17=E6=97=A5=E5=91=A8=E4=B8=80 08:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, 2022-10-16 at 22:51 +0800, Sam Li wrote:
> > We have added new block layer APIs of zoned block devices.
> > Test it with:
> > Create a null_blk device, run each zone operation on it and see
> > whether reporting right zone information.
>
> change this to "whether the logs show the correct zone information"?
>
> >
>
> Could you please describe how to run this specific set of tests
> in more detail?

I just run this script on the terminal directly and redirect the
result to the output file.

Maybe?
+ Run each zone operation on a newly created null_blk device and see
+ whether the logs show the correct zone information.

>
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  tests/qemu-iotests/tests/zoned.out | 53 ++++++++++++++++++
> >  tests/qemu-iotests/tests/zoned.sh  | 86 ++++++++++++++++++++++++++++++
> >  2 files changed, 139 insertions(+)
> >  create mode 100644 tests/qemu-iotests/tests/zoned.out
> >  create mode 100755 tests/qemu-iotests/tests/zoned.sh
> >
> > diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-
> > iotests/tests/zoned.out
> > new file mode 100644
> > index 0000000000..0c8f96deb9
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/zoned.out
> > @@ -0,0 +1,53 @@
> > +QA output created by zoned.sh
> > +Testing a null_blk device:
> > +Simple cases: if the operations work
> > +(1) report the first zone:
> > +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
> > +
> > +report the first 10 zones
> > +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
> > +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type=
: 2]
> > +start: 0x100000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:1, [ty=
pe: 2]
> > +start: 0x180000, len 0x80000, cap 0x80000, wptr 0x180000, zcond:1, [ty=
pe: 2]
> > +start: 0x200000, len 0x80000, cap 0x80000, wptr 0x200000, zcond:1, [ty=
pe: 2]
> > +start: 0x280000, len 0x80000, cap 0x80000, wptr 0x280000, zcond:1, [ty=
pe: 2]
> > +start: 0x300000, len 0x80000, cap 0x80000, wptr 0x300000, zcond:1, [ty=
pe: 2]
> > +start: 0x380000, len 0x80000, cap 0x80000, wptr 0x380000, zcond:1, [ty=
pe: 2]
> > +start: 0x400000, len 0x80000, cap 0x80000, wptr 0x400000, zcond:1, [ty=
pe: 2]
> > +start: 0x480000, len 0x80000, cap 0x80000, wptr 0x480000, zcond:1, [ty=
pe: 2]
> > +
> > +report the last zone:
> > +start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1,=
 [type:
> > 2]
> > +
> > +
> > +(2) opening the first zone
> > +report after:
> > +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:3, [type: 2]
> > +
> > +opening the second zone
> > +report after:
> > +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:3, [type=
: 2]
> > +
> > +opening the last zone
> > +report after:
> > +start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:3,=
 [type:
> > 2]
> > +
> > +
> > +(3) closing the first zone
> > +report after:
> > +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
> > +
> > +closing the last zone
> > +report after:
> > +start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1,=
 [type:
> > 2]
> > +
> > +
> > +(4) finishing the second zone
> > +After finishing a zone:
> > +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [ty=
pe: 2]
> > +
> > +
> > +(5) resetting the second zone
> > +After resetting a zone:
> > +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type=
: 2]
> > +*** done
> > diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-
> > iotests/tests/zoned.sh
> > new file mode 100755
> > index 0000000000..fced0194c5
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/zoned.sh
> > @@ -0,0 +1,86 @@
> > +#!/usr/bin/env bash
> > +#
> > +# Test zone management operations.
> > +#
> > +
> > +seq=3D"$(basename $0)"
> > +echo "QA output created by $seq"
> > +status=3D1 # failure is the default!
> > +
> > +_cleanup()
> > +{
> > +  _cleanup_test_img
> > +  sudo rmmod null_blk
> > +}
> > +trap "_cleanup; exit \$status" 0 1 2 3 15
> > +
> > +# get standard environment, filters and checks
> > +. ./common.rc
> > +. ./common.filter
> > +. ./common.qemu
> > +
> > +# This test only runs on Linux hosts with raw image files.
> > +_supported_fmt raw
> > +_supported_proto file
> > +_supported_os Linux
> > +
> > +QEMU_IO=3D"build/qemu-io"
> > +IMG=3D"--image-opts -n driver=3Dzoned_host_device,filename=3D/dev/null=
b0"
> > +QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
> > +
> > +echo "Testing a null_blk device:"
> > +echo "case 1: if the operations work"
> > +sudo modprobe null_blk nr_devices=3D1 zoned=3D1
> > +
> > +echo "(1) report the first zone:"
> > +sudo $QEMU_IO $IMG -c "zrp 0 1"
> > +echo
> > +echo "report the first 10 zones"
> > +sudo $QEMU_IO $IMG -c "zrp 0 10"
> > +echo
> > +echo "report the last zone:"
> > +sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2" # 0x3e70000000 / 512 =3D 0x=
1f380000
> > +echo
> > +echo
> > +echo "(2) opening the first zone"
> > +sudo $QEMU_IO $IMG -c "zo 0 268435456"  # 268435456 / 512 =3D 524288
> > +echo "report after:"
> > +sudo $QEMU_IO $IMG -c "zrp 0 1"
> > +echo
> > +echo "opening the second zone"
> > +sudo $QEMU_IO $IMG -c "zo 268435456 268435456" #
> > +echo "report after:"
> > +sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> > +echo
> > +echo "opening the last zone"
> > +sudo $QEMU_IO $IMG -c "zo 0x3e70000000 268435456"
> > +echo "report after:"
> > +sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
> > +echo
> > +echo
> > +echo "(3) closing the first zone"
> > +sudo $QEMU_IO $IMG -c "zc 0 268435456"
> > +echo "report after:"
> > +sudo $QEMU_IO $IMG -c "zrp 0 1"
> > +echo
> > +echo "closing the last zone"
> > +sudo $QEMU_IO $IMG -c "zc 0x3e70000000 268435456"
> > +echo "report after:"
> > +sudo $QEMU_IO $IMG -c "zrp 0x3e70000000 2"
> > +echo
> > +echo
> > +echo "(4) finishing the second zone"
> > +sudo $QEMU_IO $IMG -c "zf 268435456 268435456"
> > +echo "After finishing a zone:"
> > +sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> > +echo
> > +echo
> > +echo "(5) resetting the second zone"
> > +sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
> > +echo "After resetting a zone:"
> > +sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> > +
> > +# success, all done
> > +echo "*** done"
> > +rm -f $seq.full
> > +status=3D0
>

