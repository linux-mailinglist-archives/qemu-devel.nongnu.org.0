Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AE3C92DC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:13:43 +0200 (CEST)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3mCL-0002Hz-UQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3mBF-0001TI-RL; Wed, 14 Jul 2021 17:12:33 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m3mBD-00015f-C2; Wed, 14 Jul 2021 17:12:33 -0400
Received: by mail-qt1-x836.google.com with SMTP id v14so2914667qtc.8;
 Wed, 14 Jul 2021 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yIc+FPYm2aZ1EvwRcwVsnrugfjny71xlcewDJgS6hsA=;
 b=A742Dc1Ng7QwmDsTY6hC2bhdhsyko3wzkkazCGF/uQjRDSsPXNG5DX8OGmwwQ3krrw
 w8awZvs2NKG2tfCA+s1GSiapHq77CVl5ygH4tKZzTahmgchctwoDYcOqou8s3LVL+KjR
 3cJ49b+Dc/ee2wc0sK3ZyYUPCuhOqUmF5NdmtRGPLcllzG3eJL97xeSbqog9PwobnAUy
 2omUc0MUUJbezofdXBt2upPr5MWIzHrQQnuZBQ4582wBi4zt4UleWA3Bin1qXoi9mfLL
 iElwJnHC61vn5G/XDa/m0WYGRVuab0OvBV4iKaATUzB68HcaXgJOgho3A3ZtinDdmMcx
 M6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yIc+FPYm2aZ1EvwRcwVsnrugfjny71xlcewDJgS6hsA=;
 b=Dl8LFFA56Jy5OPT2opekBrUzWbV5ezp68p/rN3d8oW/pSepIcxPG92iMRnyfN0RS5Y
 XU871beuXs4ARLM9jYhWTx47QUR9af9pN/YLxEESv74zZT9Vg/xdirvYvTVdWbzZyBhc
 eKjZeSFU5sWjiDHkip1+N7ylJ3Eutscd+FPA7kX8ftj6NFH0SSD/i9zNqNIk6R7/9J/z
 QkKr99jzaiJ32JmXygnUP2AMJfJ/dto282R2gezR9aFu6dImErezdHvUQtnlel6XAUMn
 A2yyZTSaPlFloggxbI16/Cdn8T81Gy55xJsGx1NBpMwxt4kZ14DgJ/E+uydEom/lY4Hn
 NKtA==
X-Gm-Message-State: AOAM531AJqokQy44+r7jgdA/yIxPwBIy+KsPxGq6OwUP7FDrxdPomYUN
 RfY3CrTPFQ+pCv438tyr5AU=
X-Google-Smtp-Source: ABdhPJzyoVfJr43M3FrC/lS7nSrM/SGI8itRAb/tCIXKagwnOkDnD7nlBrP/nuFpY25qT2L6NoZakA==
X-Received: by 2002:aed:2064:: with SMTP id 91mr57933qta.318.1626297149408;
 Wed, 14 Jul 2021 14:12:29 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id i2sm1593882qko.43.2021.07.14.14.12.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Jul 2021 14:12:28 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Host folder sharing via USB issue
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <de0b7543-1f4b-7eb4-fc8a-d8643e79b7da@virtuozzo.com>
Date: Wed, 14 Jul 2021 17:12:27 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A694DB2-9B16-4478-9C36-2FCDF1D8A724@gmail.com>
References: <F120718F-C548-47C7-BAF7-ABFEC1F9E8CD@gmail.com>
 <de0b7543-1f4b-7eb4-fc8a-d8643e79b7da@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU devel list <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jul 14, 2021, at 6:35 AM, Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com> wrote:
>=20
> 14.07.2021 00:04, Programmingkid wrote:
>> Hi I have noticed that host folder sharing via USB has recently =
stopped working. After doing some git bisecting I found this as the =
patch that seems to be the issue:
>> 25f78d9e2de528473d52acfcf7acdfb64e3453d4 is the first bad commit
>> commit 25f78d9e2de528473d52acfcf7acdfb64e3453d4
>> Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Date:   Thu Jun 10 15:05:34 2021 +0300
>>     block: move supports_backing check to =
bdrv_set_file_or_backing_noperm()
>>          Move supports_backing check of bdrv_reopen_parse_backing to =
called
>>     (through bdrv_set_backing_noperm()) =
bdrv_set_file_or_backing_noperm()
>>     function. The check applies to general case, so it's appropriate =
for
>>     bdrv_set_file_or_backing_noperm().
>>          We have to declare backing support for two test drivers, =
otherwise new
>>     check fails.
>>          Signed-off-by: Vladimir Sementsov-Ogievskiy =
<vsementsov@virtuozzo.com>
>>     Message-Id: <20210610120537.196183-7-vsementsov@virtuozzo.com>
>>     Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>  block.c                          | 29 +++++++++++++++--------------
>>  tests/unit/test-bdrv-drain.c     |  1 +
>>  tests/unit/test-bdrv-graph-mod.c |  1 +
>>  3 files changed, 17 insertions(+), 14 deletions(-)
>> To reproduce this issue run this command:
>> qemu-system-i386 -usb -device usb-storage,drive=3Dfat16 -drive =
file=3Dfat:rw:fat-type=3D16:"<path to host =
folder>",id=3Dfat16,format=3Draw,if=3Dnone
>> Results:
>> Unexpected error in bdrv_set_file_or_backing_noperm() at =
../block.c:3159:
>> qemu-system-i386: -drive file=3Dfat:rw:fat-type=3D16:<host folder =
path>,id=3Dfat16,format=3Draw,if=3Dnone: Driver 'vvfat' of node =
'#block057' does not support backing files
>> Abort trap: 6
>> Expected results:
>> QEMU start running normally.
>> Please let me know if you need more information.
>> Thank you.
>=20
> Hi!
>=20
> Look at bt:
>=20
> #0  0x00007fd34f6939d5 in raise () at /lib64/libc.so.6
> #1  0x00007fd34f67c8a4 in abort () at /lib64/libc.so.6
> #2  0x000055e446d967aa in error_handle_fatal (errp=3D0x55e447652680 =
<error_abort>, err=3D0x55e448d17a20) at ../util/error.c:40
> #3  0x000055e446d968da in error_setv
>    (errp=3D0x55e447652680 <error_abort>, src=3D0x55e446f8755b =
"../block.c", line=3D3158, func=3D0x55e446f89c20 <__func__.64> =
"bdrv_set_file_or_backing_noperm", err_class=3DERROR_CLASS_GENERIC_ERROR, =
fmt=3D0x55e446f88458 "Driver '%s' of node '%s' does not support backing =
files", ap=3D0x7ffc31aba090, suffix=3D0x0) at ../util/error.c:73
> #4  0x000055e446d96ab8 in error_setg_internal
>    (errp=3D0x55e447652680 <error_abort>, src=3D0x55e446f8755b =
"../block.c", line=3D3158, func=3D0x55e446f89c20 <__func__.64> =
"bdrv_set_file_or_backing_noperm", fmt=3D0x55e446f88458 "Driver '%s' of =
node '%s' does not support backing files") at ../util/error.c:97
> #5  0x000055e446c411cf in bdrv_set_file_or_backing_noperm =
(parent_bs=3D0x55e448ceebe0, child_bs=3D0x55e448d21e40, is_backing=3Dtrue,=
 tran=3D0x55e448d16c20, errp=3D0x55e447652680 <error_abort>) at =
../block.c:3158
> #6  0x000055e446c41377 in bdrv_set_backing_noperm (bs=3D0x55e448ceebe0, =
backing_hd=3D0x55e448d21e40, tran=3D0x55e448d16c20, errp=3D0x55e447652680 =
<error_abort>) at ../block.c:3218
> #7  0x000055e446c413ae in bdrv_set_backing_hd (bs=3D0x55e448ceebe0, =
backing_hd=3D0x55e448d21e40, errp=3D0x55e447652680 <error_abort>) at =
../block.c:3227
> #8  0x000055e446c1bd37 in enable_write_target (bs=3D0x55e448ceebe0, =
errp=3D0x7ffc31aba360) at ../block/vvfat.c:3191
> #9  0x000055e446c16fe8 in vvfat_open (bs=3D0x55e448ceebe0, =
options=3D0x55e448cf4330, flags=3D155650, errp=3D0x7ffc31aba360) at =
../block/vvfat.c:1236
> #10 0x000055e446c3df37 in bdrv_open_driver (bs=3D0x55e448ceebe0, =
drv=3D0x55e4475e9760 <bdrv_vvfat>, node_name=3D0x0, =
options=3D0x55e448cf4330, open_flags=3D155650, errp=3D0x7ffc31aba470) at =
../block.c:1550
> #11 0x000055e446c3e8ee in bdrv_open_common (bs=3D0x55e448ceebe0, =
file=3D0x0, options=3D0x55e448cf4330, errp=3D0x7ffc31aba470) at =
../block.c:1827
> #12 0x000055e446c427b6 in bdrv_open_inherit
>    (filename=3D0x55e448ce4300 "fat:rw:fat-type=3D16:/tmp", =
reference=3D0x0, options=3D0x55e448cf4330, flags=3D40962, =
parent=3D0x55e448ce75a0, child_class=3D0x55e4475099c0 <child_of_bds>, =
child_role=3D19, errp=3D0x7ffc31aba670)
>    at ../block.c:3747
> #13 0x000055e446c419f5 in bdrv_open_child_bs
>    (filename=3D0x55e448ce4300 "fat:rw:fat-type=3D16:/tmp", =
options=3D0x55e448cec9f0, bdref_key=3D0x55e446f884d0 "file", =
parent=3D0x55e448ce75a0, child_class=3D0x55e4475099c0 <child_of_bds>, =
child_role=3D19, allow_none=3Dtrue, errp=3D0x7ffc31aba670) at =
../block.c:3387
> #14 0x000055e446c42568 in bdrv_open_inherit
>    (filename=3D0x55e448ce4300 "fat:rw:fat-type=3D16:/tmp", =
reference=3D0x0, options=3D0x55e448cec9f0, flags=3D8194, parent=3D0x0, =
child_class=3D0x0, child_role=3D0, errp=3D0x55e447652688 <error_fatal>) =
at ../block.c:3694
> #15 0x000055e446c42cf6 in bdrv_open (filename=3D0x55e448ce4300 =
"fat:rw:fat-type=3D16:/tmp", reference=3D0x0, options=3D0x55e448ce4f00, =
flags=3D0, errp=3D0x55e447652688 <error_fatal>) at ../block.c:3840
> #16 0x000055e446c5fcaf in blk_new_open (filename=3D0x55e448ce4300 =
"fat:rw:fat-type=3D16:/tmp", reference=3D0x0, options=3D0x55e448ce4f00, =
flags=3D0, errp=3D0x55e447652688 <error_fatal>) at =
../block/block-backend.c:435
> #17 0x000055e446beca1d in blockdev_init (file=3D0x55e448ce4300 =
"fat:rw:fat-type=3D16:/tmp", bs_opts=3D0x55e448ce4f00, =
errp=3D0x55e447652688 <error_fatal>) at ../blockdev.c:609
> #18 0x000055e446bed900 in drive_new (all_opts=3D0x55e448ac4850, =
block_default_type=3DIF_IDE, errp=3D0x55e447652688 <error_fatal>) at =
../blockdev.c:993
> #19 0x000055e446abd69e in drive_init_func (opaque=3D0x55e448bd4d40, =
opts=3D0x55e448ac4850, errp=3D0x55e447652688 <error_fatal>) at =
../softmmu/vl.c:613
> #20 0x000055e446da26d9 in qemu_opts_foreach (list=3D0x55e4475e8960 =
<qemu_drive_opts>, func=3D0x55e446abd66a <drive_init_func>, =
opaque=3D0x55e448bd4d40, errp=3D0x55e447652688 <error_fatal>) at =
../util/qemu-option.c:1137
> #21 0x000055e446abd8e7 in configure_blockdev (bdo_queue=3D0x55e44757a2a0=
 <bdo_queue>, machine_class=3D0x55e448bd4c90, snapshot=3D0) at =
../softmmu/vl.c:672
> #22 0x000055e446ac1b75 in qemu_create_early_backends () at =
../softmmu/vl.c:1925
> #23 0x000055e446ac5c1f in qemu_init (argc=3D6, argv=3D0x7ffc31abae58, =
envp=3D0x7ffc31abae90) at ../softmmu/vl.c:3636
> #24 0x000055e4466b3c71 in main (argc=3D6, argv=3D0x7ffc31abae58, =
envp=3D0x7ffc31abae90) at ../softmmu/main.c:49
> (gdb) fr 5
> #5  0x000055e446c411cf in bdrv_set_file_or_backing_noperm =
(parent_bs=3D0x55e448ceebe0, child_bs=3D0x55e448d21e40, is_backing=3Dtrue,=
 tran=3D0x55e448d16c20, errp=3D0x55e447652680 <error_abort>) at =
../block.c:3158
> 3158            error_setg(errp, "Driver '%s' of node '%s' does not =
support backing "
>=20
>=20
> (gdb) fr 7
> #7  0x000055e446c413ae in bdrv_set_backing_hd (bs=3D0x55e448ceebe0, =
backing_hd=3D0x55e448d21e40, errp=3D0x55e447652680 <error_abort>) at =
../block.c:3227
> 3227        ret =3D bdrv_set_backing_noperm(bs, backing_hd, tran, =
errp);
> (gdb) p bs->drv
> $1 =3D (BlockDriver *) 0x55e4475e9760 <bdrv_vvfat>
>=20
>=20
> Hmm. Really vvfat doesn't seem to support backing files. But it does =
create a node with vvfat_write_target driver and set it as backing of =
itself (of vvfat node I mean).. And I don't see, where is this backing =
used.
>=20
>=20
> Looking at git history, I see commit a8a4d15c1c34d of 2017, which =
describes that this fake backing file doesn't work anyway.
>=20
> So, if just remove this backing file, bug doesn't reproduce. But I =
think better fix is to deprecate vvfat (recommend use virtio-fs instead =
for sharing) and drop it after deprecation period.
>=20
>=20
>=20
> Use it with no guarantee:) :
>=20
> diff --git a/block/vvfat.c b/block/vvfat.c
> index ae9d387da7..34bf1e3a86 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3098,26 +3098,6 @@ static int coroutine_fn =
vvfat_co_block_status(BlockDriverState *bs,
>     return BDRV_BLOCK_DATA;
> }
> -static int coroutine_fn
> -write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t =
bytes,
> -                    QEMUIOVector *qiov, int flags)
> -{
> -    int ret;
> -
> -    BDRVVVFATState* s =3D *((BDRVVVFATState**) bs->opaque);
> -    qemu_co_mutex_lock(&s->lock);
> -    ret =3D try_commit(s);
> -    qemu_co_mutex_unlock(&s->lock);
> -
> -    return ret;
> -}
> -
> -static BlockDriver vvfat_write_target =3D {
> -    .format_name        =3D "vvfat_write_target",
> -    .instance_size      =3D sizeof(void*),
> -    .bdrv_co_pwritev    =3D write_target_commit,
> -};
> -
> static void vvfat_qcow_options(BdrvChildRole role, bool =
parent_is_format,
>                                int *child_flags, QDict *child_options,
>                                int parent_flags, QDict =
*parent_options)
> @@ -3133,7 +3113,6 @@ static int enable_write_target(BlockDriverState =
*bs, Error **errp)
> {
>     BDRVVVFATState *s =3D bs->opaque;
>     BlockDriver *bdrv_qcow =3D NULL;
> -    BlockDriverState *backing;
>     QemuOpts *opts =3D NULL;
>     int ret;
>     int size =3D sector2cluster(s, s->sector_count);
> @@ -3184,13 +3163,6 @@ static int enable_write_target(BlockDriverState =
*bs, Error **errp)
>     unlink(s->qcow_filename);
> #endif
> -    backing =3D bdrv_new_open_driver(&vvfat_write_target, NULL, =
BDRV_O_ALLOW_RDWR,
> -                                   &error_abort);
> -    *(void**) backing->opaque =3D s;
> -
> -    bdrv_set_backing_hd(s->bs, backing, &error_abort);
> -    bdrv_unref(backing);
> -
>     return 0;
>  err:
> @@ -3205,17 +3177,10 @@ static void vvfat_child_perm(BlockDriverState =
*bs, BdrvChild *c,
>                              uint64_t perm, uint64_t shared,
>                              uint64_t *nperm, uint64_t *nshared)
> {
> -    if (role & BDRV_CHILD_DATA) {
> -        /* This is a private node, nobody should try to attach to it =
*/
> -        *nperm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
> -        *nshared =3D BLK_PERM_WRITE_UNCHANGED;
> -    } else {
> -        assert(role & BDRV_CHILD_COW);
> -        /* The backing file is there so 'commit' can use it. vvfat =
doesn't
> -         * access it in any way. */
> -        *nperm =3D 0;
> -        *nshared =3D BLK_PERM_ALL;
> -    }
> +    assert(role & BDRV_CHILD_DATA);
> +    /* This is a private node, nobody should try to attach to it */
> +    *nperm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
> +    *nshared =3D BLK_PERM_WRITE_UNCHANGED;
> }
>  static void vvfat_close(BlockDriverState *bs)
>=20

I could not apply the patch directly so I had to apply it by hand. This =
is what I used:

---
 block/vvfat.c | 42 ++++--------------------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index ae9d387da7..430dcc3ce8 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3098,25 +3098,6 @@ static int coroutine_fn =
vvfat_co_block_status(BlockDriverState *bs,
     return BDRV_BLOCK_DATA;
 }
=20
-static int coroutine_fn
-write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t =
bytes,
-                    QEMUIOVector *qiov, int flags)
-{
-    int ret;
-
-    BDRVVVFATState* s =3D *((BDRVVVFATState**) bs->opaque);
-    qemu_co_mutex_lock(&s->lock);
-    ret =3D try_commit(s);
-    qemu_co_mutex_unlock(&s->lock);
-
-    return ret;
-}
-
-static BlockDriver vvfat_write_target =3D {
-    .format_name        =3D "vvfat_write_target",
-    .instance_size      =3D sizeof(void*),
-    .bdrv_co_pwritev    =3D write_target_commit,
-};
=20
 static void vvfat_qcow_options(BdrvChildRole role, bool =
parent_is_format,
                                int *child_flags, QDict *child_options,
@@ -3133,7 +3114,6 @@ static int enable_write_target(BlockDriverState =
*bs, Error **errp)
 {
     BDRVVVFATState *s =3D bs->opaque;
     BlockDriver *bdrv_qcow =3D NULL;
-    BlockDriverState *backing;
     QemuOpts *opts =3D NULL;
     int ret;
     int size =3D sector2cluster(s, s->sector_count);
@@ -3184,13 +3164,6 @@ static int enable_write_target(BlockDriverState =
*bs, Error **errp)
     unlink(s->qcow_filename);
 #endif
=20
-    backing =3D bdrv_new_open_driver(&vvfat_write_target, NULL, =
BDRV_O_ALLOW_RDWR,
-                                   &error_abort);
-    *(void**) backing->opaque =3D s;
-
-    bdrv_set_backing_hd(s->bs, backing, &error_abort);
-    bdrv_unref(backing);
-
     return 0;
=20
 err:
@@ -3205,17 +3178,10 @@ static void vvfat_child_perm(BlockDriverState =
*bs, BdrvChild *c,
                              uint64_t perm, uint64_t shared,
                              uint64_t *nperm, uint64_t *nshared)
 {
-    if (role & BDRV_CHILD_DATA) {
-        /* This is a private node, nobody should try to attach to it */
-        *nperm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
-        *nshared =3D BLK_PERM_WRITE_UNCHANGED;
-    } else {
-        assert(role & BDRV_CHILD_COW);
-        /* The backing file is there so 'commit' can use it. vvfat =
doesn't
-         * access it in any way. */
-        *nperm =3D 0;
-        *nshared =3D BLK_PERM_ALL;
-    }
+    assert(role & BDRV_CHILD_DATA);
+    /* This is a private node, nobody should try to attach to it */
+    *nperm =3D BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
+    *nshared =3D BLK_PERM_WRITE_UNCHANGED;
 }
=20
 static void vvfat_close(BlockDriverState *bs)
--=20
2.24.3 (Apple Git-128)


This patch works. It was tested with Windows 2000, Mac OS 10.4, and Mac =
OS 9.2.

I do agree with Balaton about the virtio-fs suggestion. It is pretty =
much only for Linux. It would take a tremendous amount of work to make =
virtio-fs to work on Windows and Mac OS. The vvfat option uses two =
technologies that pretty much everyone can use: USB and the FAT file =
system. Virtio-fs would only be a good solution for Linux guests.

Thank you.=

