Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6395828CD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:39:40 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiCK-0006x6-2T
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGi7z-00048q-HW; Wed, 27 Jul 2022 10:35:11 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGi7x-0005p2-PT; Wed, 27 Jul 2022 10:35:11 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id z132so11649881yba.3;
 Wed, 27 Jul 2022 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnpWXwgeQezE+fWOhhusIx5OH/H/ZebjZEmIDEhgZcI=;
 b=k0gvnzldY59p/hRfTEak5zru96IyOXTYTetCYvGe0AIFC7HFCW74zUHk5kbulEher1
 xldNvVp9L6z8CsFVozahXPEDQ1Zm2AGlJUNgcUEpuibnGJurEUSzrjRVcW1nZP9Hj8mZ
 gl6GUMNFqkvqMnzh4pbxbpPJkx5r2m5ih6gf2LXbh9IVybvdmhBidE3Kg2p36SAPbpWn
 eB16N6zh1krknAo3U6BVnc2owyr+x3NkMURLhaZg3GtxwsHdXE88sfNS7j8QZMha8/wW
 jpfPpd5wAYs0/PN1ZhYMcz/eKBp2RkvWSJLs430M0qWHfW6W1o1NPouWaaqXE6QDXSRk
 LYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnpWXwgeQezE+fWOhhusIx5OH/H/ZebjZEmIDEhgZcI=;
 b=V+71JXV8RDXlJeDYPFbB9uwwZJ0LDMyqTkPUg2ZLtfuApXAatkELJQyKDQN1DZ6jrq
 bc+rB9XmnxD/vxfwkG7DUkAt6icNekTCrU9B/KIIRb1qK/vF/Q9qwMavF5ZsMWQyNw9z
 9dTclFDIvDRam42Ck4Ncg4hF2d5AyoleqNv34z7LbSofN49qp4RfTgBREoIOfWxaI23D
 T2aXm3RO+2XbCEb1a+IJ1I32fymDguyafM1V91VxbyPHLNn11eTEn8+eUEIkVYsZHRua
 0jex1uxPuxQ3uUaH7BKo69VemdrCewljXAj8UR/AjOsfMcV/h3XpdPWvIhbFfsgw0d+M
 sEAw==
X-Gm-Message-State: AJIora8dz7gxxH3Bawjoc6Qq1EgQvBuIwTq8SAu39Qk1i4Tr3hjjiqsN
 eqPlTzxNHPLn2R2Ug+X5ytGb4lSgfiHiL0Ldz2g=
X-Google-Smtp-Source: AGRyM1uqdxMgZeSP7cw1anjqIjG3D2oaMBLbygcB1ikh22PgAsvuAFq18Zvia3twl6JEN8eYr9AzIsEXQS0MnPkYMBY=
X-Received: by 2002:a25:9203:0:b0:671:7127:8aab with SMTP id
 b3-20020a259203000000b0067171278aabmr6042014ybo.366.1658932508413; Wed, 27
 Jul 2022 07:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-6-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-6-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 10:34:56 -0400
Message-ID: <CAJSP0QVd0_njYR5ZT0VjGt=CgN8dZnXVZdjmh8uUhj3uO=DwUw@mail.gmail.com>
Subject: Re: [RFC v4 5/9] qemu-iotests: test new zone operations.
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
 Ming Lei <ming.lei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
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

On Mon, 11 Jul 2022 at 22:21, Sam Li <faithilikerun@gmail.com> wrote:
>
> We have added new block layer APIs of zoned block devices. Test it with:
> (1) Create a null_blk device, run each zone operation on it and see
> whether reporting right zone information.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  tests/qemu-iotests/tests/zoned.sh | 69 +++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/zoned.sh
>
> diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
> new file mode 100755
> index 0000000000..e14a3a420e
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/zoned.sh
> @@ -0,0 +1,69 @@
> +#!/usr/bin/env bash
> +#
> +# Test zone management operations.
> +#
> +
> +seq="$(basename $0)"
> +echo "QA output created by $seq"
> +status=1 # failure is the default!
> +
> +_cleanup()
> +{
> +  _cleanup_test_img
> +  sudo rmmod null_blk
> +}
> +trap "_cleanup; exit \$status" 0 1 2 3 15
> +
> +# get standard environment, filters and checks
> +. ./common.rc
> +. ./common.filter
> +. ./common.qemu
> +
> +# This test only runs on Linux hosts with raw image files.
> +_supported_fmt raw
> +_supported_proto file
> +_supported_os Linux
> +
> +QEMU_IO="build/qemu-io"
> +IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0"
> +QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
> +
> +echo "Testing a null_blk device"
> +echo "Simple cases: if the operations work"
> +sudo modprobe null_blk nr_devices=1 zoned=1

Jens & Ming Lei:

null_blk is not ideal for automated test cases because it requires
root and is global. If two tests are run at the same time they will
interfere with each other. There is no way to have independent
instances of the null_blk kernel module and the /dev/nullb0 device on
a single Linux system. I think this test case can be merged for now
but if there's time I suggest investigating alternatives.

Maybe the new Linux ublk_drv driver is a better choice if it supports
unprivileged operation with multiple independent block devices (plus
zoned storage!). It would be necessary to write a userspace null block
device that supports zoned storage if that doesn't exist already. I
have CCed Ming Lei and Jens Axboe for thoughts.

> +# hidden issues:
> +# 1. memory allocation error of "unaligned tcache chunk detected" when the nr_zone=1 in zone report
> +# 2. qemu-io: after report 10 zones, the program failed at double free error and exited.

What is this? It looks like a TODO list of bugs you hit? Have they
already been solved?

> +echo "report the first zone"
> +sudo $QEMU_IO $IMG -c "zr 0 0 1"
> +echo "report: the first 10 zones"
> +sudo $QEMU_IO $IMG -c "zr 0 0 10"
> +
> +echo "open the first zone"
> +sudo $QEMU_IO $IMG -c "zo 0 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zr 0 0 1"
> +echo "open the last zone"
> +sudo $QEMU_IO $IMG -c "zo 0x3e70000000 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zr 0x3e70000000 0 2"
> +
> +echo "close the first zone"
> +sudo $QEMU_IO $IMG -c "zc 0 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zr 0 0 1"
> +echo "close the last zone"
> +sudo $QEMU_IO $IMG -c "zc 0x3e70000000 0x80000"
> +echo "report after:"
> +sudo $QEMU_IO $IMG -c "zr 0x3e70000000 0 2"
> +
> +
> +echo "reset the second zone"
> +sudo $QEMU_IO $IMG -c "zrs 0x80000 0x80000"
> +echo "After resetting a zone:"
> +sudo $QEMU_IO $IMG -c "zr 0x80000 0 5"
> +
> +# success, all done
> +echo "*** done"
> +rm -f $seq.full
> +status=0

This patch is missing the .out reference file. Did you forget to git-add(1) it?

