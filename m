Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F95A4034
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 02:03:13 +0200 (CEST)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSSFD-0003C5-R9
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 20:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oSSCK-0001Xv-LX; Sun, 28 Aug 2022 20:00:12 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:40683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oSSCI-0007Qw-VO; Sun, 28 Aug 2022 20:00:12 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-324ec5a9e97so159112237b3.7; 
 Sun, 28 Aug 2022 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=6r8Jdot3rGRDELOePp4ArWG1XhKaykNjo3Xb4SixSmM=;
 b=fdbRyCtbOrnTIJv+jadvsygus0aoI/QzRKyooVy2O5k5YSS5hy87FnEzav5dpEQQa2
 K8TjHQxzblNM7y1Tk1B6JiPx3UpDDedXf4nn2IpL+Jk6QxeqLWsd42LPSSBRXUa0efn4
 Qe9f7yQ1d2qE0nehk4NC0peA1jkqxxp5XdKTRlo4nUBvtdQ8yZqC76r+1ifWi1H+KAG1
 /Qy8pZ4s6DB2ZeOtfuIBdCJBX90RlGXRt2VcTEhoPrhz3fKHmu0+fQ+owhTlInUS6NIG
 cMgnCf3BGm9t0ewE9VWc+BDg+2aB7G6oaa8eGlXkW1jtbofPFwZKjsMoZQSWjeWQTh3b
 Bw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=6r8Jdot3rGRDELOePp4ArWG1XhKaykNjo3Xb4SixSmM=;
 b=MrXrTDoQcNG3jasaCdCDZjUJNEnpqPOjwPNB6KWHjFW/IF4juYIQlcROK4b4mQsknK
 wSZD2k2CdngvOovrKIrXaHu2xSmOE9ZHsoTqyfldnWUbVhjyDakNZBiex8UPFha4+0FB
 MatjCTmYgYJ7t79bHZ3iVfyrwNgQZFECmKUNogTDm/vujUS3t24mPOg9HAQ28WtpZRod
 9ERXFnD20dNWwX+tycw6uIISLtdvcrlqoEbbyG28QrIhE1ZiWUMoqgJb8JVbGy6K0zX9
 YDgkp7TiIBRm/7WMwk3BeVtj8vq+QHJCIDjevqJHMHHPORLAEhyGJq+BMcj0fUtYxoi8
 cNtA==
X-Gm-Message-State: ACgBeo1HBbKnqjN8x3fb5Z7H0bW6UnXCnIRwxNHcKWAmIWmH2vOBWwDI
 mduRh50cDv8LnS5va8HH4igH5izWCnwDJOKb2KoGcw3amPh5jyaf
X-Google-Smtp-Source: AA6agR6Kv/+GVS5qU01+XC1a8BjxoHQ/23F1y1WLAYhKCyfwPzX7DUxbzyzMPtiq3LEHGSWB+mD2Ot/xN5HnT32zA/I=
X-Received: by 2002:a81:7382:0:b0:328:306f:26d2 with SMTP id
 o124-20020a817382000000b00328306f26d2mr8134704ywc.486.1661731208534; Sun, 28
 Aug 2022 17:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220826162131.8352-1-faithilikerun@gmail.com>
In-Reply-To: <20220826162131.8352-1-faithilikerun@gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 29 Aug 2022 08:00:00 +0800
Message-ID: <CAAAx-8LywipH6VaOOqhGGbcet4cSm+T-zs-OFPWXrvCsGz5tKg@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] config: add check to block layer
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1130.google.com
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

Sam Li <faithilikerun@gmail.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8827=E6=97=
=A5=E5=91=A8=E5=85=AD 00:21=E5=86=99=E9=81=93=EF=BC=9A
>
> Putting zoned/non-zoned BlockDrivers on top of each other is not
> allowed.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block.c                          | 14 ++++++++++++++
>  block/file-posix.c               | 13 +++++++++++++
>  block/raw-format.c               |  1 +
>  include/block/block_int-common.h |  5 +++++
>  4 files changed, 33 insertions(+)
>
> diff --git a/block.c b/block.c
> index bc85f46eed..dad2ed3959 100644
> --- a/block.c
> +++ b/block.c
> @@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_bs, B=
lockDriverState *child_bs,
>          return;
>      }
>
> +    /*
> +     * Non-zoned block drivers do not follow zoned storage constraints
> +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zo=
ned
> +     * drivers in a graph.
> +     */
> +    if (!parent_bs->drv->supports_zoned_children &&
> +        child_bs->bl.zoned =3D=3D BLK_Z_HM) {
> +        error_setg(errp, "Cannot add a %s child to a %s parent",
> +                   child_bs->bl.zoned =3D=3D BLK_Z_HM ? "zoned" : "non-z=
oned",
> +                   parent_bs->drv->supports_zoned_children ?
> +                   "support zoned children" : "not support zoned childre=
n");
> +        return;
> +    }
> +
>      if (!QLIST_EMPTY(&child_bs->parents)) {
>          error_setg(errp, "The node %s already has a parent",
>                     child_bs->node_name);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index e3efba6db7..ec8672d33c 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -777,6 +777,19 @@ static int raw_open_common(BlockDriverState *bs, QDi=
ct *options,
>              goto fail;
>          }
>      }
> +#ifdef CONFIG_BLKZONED
> +    /*
> +     * The kernel page chache does not reliably work for writes to SWR z=
ones
> +     * of zoned block device because it can not guarantee the order of w=
rites.
> +     */
> +

Apology. Should add the device constraint condition line:
+    if (strcmp(bs->drv->format_name, "zoned_host_device") =3D=3D 0) {

> +    if (!(s->open_flags & O_DIRECT)) {
> +        error_setg(errp, "driver=3Dzoned_host_device was specified, but =
it "
> +                         "requires cache.direct=3Don, which was not spec=
ified.");
> +        ret =3D -EINVAL;
> +        return ret; /* No host kernel page cache */
> +    }

+        }

> +#endif
>
>      if (S_ISBLK(st.st_mode)) {
>  #ifdef BLKDISCARDZEROES
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 6b20bd22ef..9441536819 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, Bdrv=
Child *c,
>  BlockDriver bdrv_raw =3D {
>      .format_name          =3D "raw",
>      .instance_size        =3D sizeof(BDRVRawState),
> +    .supports_zoned_children =3D true,
>      .bdrv_probe           =3D &raw_probe,
>      .bdrv_reopen_prepare  =3D &raw_reopen_prepare,
>      .bdrv_reopen_commit   =3D &raw_reopen_commit,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index 8541f36123..1bb5caa3be 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -127,6 +127,11 @@ struct BlockDriver {
>       */
>      bool is_format;
>
> +    /*
> +     * Set to true if the BlockDriver supports zoned children.
> +     */
> +    bool supports_zoned_children;
> +
>      /*
>       * Drivers not implementing bdrv_parse_filename nor bdrv_open should=
 have
>       * this field set to true, except ones that are defined only by thei=
r
> --
> 2.37.2
>

