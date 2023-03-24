Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C16C8092
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfdQq-0002ug-JT; Fri, 24 Mar 2023 05:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdQn-0002u2-19; Fri, 24 Mar 2023 05:09:53 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfdQb-0001LN-83; Fri, 24 Mar 2023 05:09:51 -0400
Received: by mail-lf1-x132.google.com with SMTP id bi9so1279696lfb.12;
 Fri, 24 Mar 2023 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679648967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bExAs9CIOLpAF0dWKqp9tY5dY/sIMxBCBYy+25wFdBs=;
 b=R87NYbW/TzmDnNb0GJYjxXGdz3QEhmZwamo283aNZb66VxA7P5bl1s5gzcnGY9GJiI
 Nu0lJgdOk/IHxdXRjvDcywMN1Tkqb9TI/on/ynC5gWm4M7AjFd1UFnx8WSlBupJAviUO
 acraWT1BguLtnvYQyYSNhJA0eJyE9IOOOVBwC/mWXTmoSZ28j7+IkFbiuii3eOnIkqJD
 INr/ti4OviBh6uxgHDJ4sKqYbE/RUk8cH1LylhjlGukMTMME8KoDdSP2M46ifi6QZgl5
 rbzSCxiZz+Z84fSbN/W0pdRp4KCAkYb6wt3x4fF4UsIV72JdsED0zY+ymRTR2vGOcY4R
 t1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679648967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bExAs9CIOLpAF0dWKqp9tY5dY/sIMxBCBYy+25wFdBs=;
 b=74fP1RnND0V7enfW4owEw+7pQ2F1/kUDP2gckBDpbik84MZ3xmjDKNE5enywIH6Kwl
 3MYnjrVKKNXgwQK5d+QMjfwfJq34UE0jBSBxUG6vCJSUiCeIZJ7+ECg01uyARH4SWIE/
 A5we6jcQtdPtZEukxTEr+aUeLYlIzYAk++TBN4/T2KpCuZyRySlCnF+CJG07JOLPAAWu
 +MiA4a0Lj04Kh5aWxtuzKbCQ33UCoI8ZA4ab1J9fcZBzENXJeVkBbh9b4xMHHYJEOkp/
 S1vVR2pnxpEbZtw/3o6m9WROxgMj6xbuErPyqfpoxlqKaFnayA7SKr9aeLlXYdCNVleR
 m0ow==
X-Gm-Message-State: AAQBX9cGKTEh8PuuKjlqtY2Bi72CaRaFzGcop4xj948dpXs/GdBl+0TU
 uwkd8tNVYbnrqkPyHz055a1olD4NkCeGcKG0CdaCRxg8XV8V2imv
X-Google-Smtp-Source: AKy350ZEMkFDlvW7/SD2LRaGNICZoYW/2BWSvtlpid7rOSdNYYjC7Mk2AcYqKw5rxAZa7vNZ4U5Se3Cqx7GiincGHII=
X-Received: by 2002:a17:906:868b:b0:934:b24e:26ba with SMTP id
 g11-20020a170906868b00b00934b24e26bamr893012ejx.7.1679644957702; Fri, 24 Mar
 2023 01:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230323050834.5199-1-faithilikerun@gmail.com>
 <20230323050834.5199-7-faithilikerun@gmail.com>
 <20230323193106.GD1459474@fedora>
In-Reply-To: <20230323193106.GD1459474@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 24 Mar 2023 16:02:11 +0800
Message-ID: <CAAAx-8J+fKzdPocf0L+WZ7VxE_q5m6UEK-g7RRX2YYtDhaw8wA@mail.gmail.com>
Subject: Re: [PATCH v17 6/8] qemu-iotests: test new zone operations
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, damien.lemoal@opensource.wdc.com, 
 Fam Zheng <fam@euphon.net>, hare@suse.de, dmitry.fomichev@wdc.com, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=faithilikerun@gmail.com; helo=mail-lf1-x132.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=BA=94 03:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Mar 23, 2023 at 01:08:32PM +0800, Sam Li wrote:
> > The new block layer APIs of zoned block devices can be tested by:
> > $ tests/qemu-iotests/check zoned
> > Run each zone operation on a newly created null_blk device
> > and see whether it outputs the same zone information.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  tests/qemu-iotests/tests/zoned     | 86 ++++++++++++++++++++++++++++++
> >  tests/qemu-iotests/tests/zoned.out | 53 ++++++++++++++++++
> >  2 files changed, 139 insertions(+)
> >  create mode 100755 tests/qemu-iotests/tests/zoned
> >  create mode 100644 tests/qemu-iotests/tests/zoned.out
> >
> > diff --git a/tests/qemu-iotests/tests/zoned b/tests/qemu-iotests/tests/=
zoned
> > new file mode 100755
> > index 0000000000..53097e44d9
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/zoned
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
> > +. ../common.rc
> > +. ../common.filter
> > +. ../common.qemu
> > +
> > +# This test only runs on Linux hosts with raw image files.
> > +_supported_fmt raw
> > +_supported_proto file
> > +_supported_os Linux
> > +
> > +IMG=3D"--image-opts -n driver=3Dhost_device,filename=3D/dev/nullb0"
> > +QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
> > +
> > +echo "Testing a null_blk device:"
> > +echo "case 1: if the operations work"
> > +sudo modprobe null_blk nr_devices=3D1 zoned=3D1
>
> I took a look at how existing qemu-iotests use sudo. The run it in
> non-interactive mode and skip the test if sudo is unavailable.
>
> Please do something like this to check for sudo support:
>
>   sudo -n true || _notrun 'Password-less sudo required'
>
> Then always use "sudo -n ...".

Ok. Then, passwordless sudo demands setup on Linux otherwise the
script will not run just as existing qemu-iotests does.

>
>
> > +sudo chmod 0666 /dev/nullb0
> > +
> > +echo "(1) report the first zone:"
> > +$QEMU_IO $IMG -c "zrp 0 1"
> > +echo
> > +echo "report the first 10 zones"
> > +$QEMU_IO $IMG -c "zrp 0 10"
> > +echo
> > +echo "report the last zone:"
> > +$QEMU_IO $IMG -c "zrp 0x3e70000000 2" # 0x3e70000000 / 512 =3D 0x1f380=
000
> > +echo
> > +echo
> > +echo "(2) opening the first zone"
> > +$QEMU_IO $IMG -c "zo 0 268435456"  # 268435456 / 512 =3D 524288
> > +echo "report after:"
> > +$QEMU_IO $IMG -c "zrp 0 1"
> > +echo
> > +echo "opening the second zone"
> > +$QEMU_IO $IMG -c "zo 268435456 268435456" #
> > +echo "report after:"
> > +$QEMU_IO $IMG -c "zrp 268435456 1"
> > +echo
> > +echo "opening the last zone"
> > +$QEMU_IO $IMG -c "zo 0x3e70000000 268435456"
> > +echo "report after:"
> > +$QEMU_IO $IMG -c "zrp 0x3e70000000 2"
> > +echo
> > +echo
> > +echo "(3) closing the first zone"
> > +$QEMU_IO $IMG -c "zc 0 268435456"
> > +echo "report after:"
> > +$QEMU_IO $IMG -c "zrp 0 1"
> > +echo
> > +echo "closing the last zone"
> > +$QEMU_IO $IMG -c "zc 0x3e70000000 268435456"
> > +echo "report after:"
> > +$QEMU_IO $IMG -c "zrp 0x3e70000000 2"
> > +echo
> > +echo
> > +echo "(4) finishing the second zone"
> > +$QEMU_IO $IMG -c "zf 268435456 268435456"
> > +echo "After finishing a zone:"
> > +$QEMU_IO $IMG -c "zrp 268435456 1"
> > +echo
> > +echo
> > +echo "(5) resetting the second zone"
> > +$QEMU_IO $IMG -c "zrs 268435456 268435456"
> > +echo "After resetting a zone:"
> > +$QEMU_IO $IMG -c "zrp 268435456 1"
> > +
> > +# success, all done
> > +echo "*** done"
> > +rm -f $seq.full
> > +status=3D0
> > diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/te=
sts/zoned.out
> > new file mode 100644
> > index 0000000000..b2d061da49
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/zoned.out
> > @@ -0,0 +1,53 @@
> > +QA output created by zoned
> > +Testing a null_blk device:
> > +case 1: if the operations work
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
 [type: 2]
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
 [type: 2]
> > +
> > +
> > +(3) closing the first zone
> > +report after:
> > +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
> > +
> > +closing the last zone
> > +report after:
> > +start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1,=
 [type: 2]
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
> > --
> > 2.39.2
> >

