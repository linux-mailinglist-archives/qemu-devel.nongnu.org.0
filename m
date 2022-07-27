Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17ED582926
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:57:47 +0200 (CEST)
Received: from localhost ([::1]:48436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGiTr-0000N6-0r
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiNC-0002PJ-GU; Wed, 27 Jul 2022 10:50:55 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGiN8-00080D-Q0; Wed, 27 Jul 2022 10:50:53 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 123so7792944ybv.7;
 Wed, 27 Jul 2022 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SgQcACQ1MTx0eGdzOJU9m+EZFwn74WsgvryQXFSkmM=;
 b=i2suq4bCe1rAWBRp97Mqrz8KxhJvlBQZkdsHURX/v+4Xoog3QLRT3g/VPkeRe3B/Fr
 WejfEm5ppc9ZdusEQaR5oxqz1/lYjeOASDSq7tJiSlS/+uROIbOC8B2YZ5GOt+IZ2Mer
 zXpOmIE0VPgLx+t4DDacSl1+ZeNW8fJCrdlx/dWpwMAPqI6JOYUKJ4ICqCviBOKt3Cju
 cAAdXvg1ES1Q6doArEoQAHC68ZPEgjZpy3fdUXjVnfAeXJVgd8IB8YNQEv3qbfMsYZPd
 uRzgeh3yYvmXu1MiMG6lmsvBE1n4aK69bFtn605EH9NtH8FJd+bTA1QfHenGvVQHTKPU
 hHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SgQcACQ1MTx0eGdzOJU9m+EZFwn74WsgvryQXFSkmM=;
 b=l6+uPmvMCZvs+24chMYVg2LnzTEfeCfCjh81Y8djECm5mUUZUH3Wxa93LzBvmkYc/y
 Q/oLqTLr/6+JUAaJkKRIEvkXR+Xt5k0zktOffI4km3miQ3HGXuo04w6mVJ5YZyIk9s53
 PQeNhEC/ehLfAXl4MXY+c0S4Mi9fHsTPpw3Ca6pqPhBqi/RlmbAFf8Gu/Syu9o1cZXQs
 RYgH+R0BWP5q4q9s3zkeC3v1DCwcF/Xmvxs/bS1BEDNzUv+fFvYvgdlYyJTehBMDE/hi
 JVyazaQtSjPBWb2leBBZVnjGjTnB6id9yiTBkPg+ZyXWhng3kXCqCM+Xy/RRga77NtHW
 /yzg==
X-Gm-Message-State: AJIora9eeRJl3q59wq6922b+dLkgSwK4PSWpezEzxougK00Lhwo11qid
 pEJv+nQig/ufKBIzPnKGppI0zcUMND3SbZE/PK0=
X-Google-Smtp-Source: AGRyM1uXrp+Z9fxkm3wcTnRTl7ewKcLXnTqz0fD9g3V9qPK4E8jj/Ggyb2jBJWX+85fMvB2jgIRZZe2x0vv/XV78lKs=
X-Received: by 2002:a5b:c87:0:b0:66f:2298:4ed7 with SMTP id
 i7-20020a5b0c87000000b0066f22984ed7mr17717115ybq.207.1658933449558; Wed, 27
 Jul 2022 07:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-8-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-8-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 10:50:38 -0400
Message-ID: <CAJSP0QVTGa0smONqrFXJW=tVpDcax+M4j3-tQFYeK23QL3FBnA@mail.gmail.com>
Subject: Re: [RFC v4 7/9] config: add check to block layer
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Mon, 11 Jul 2022 at 22:22, Sam Li <faithilikerun@gmail.com> wrote:
>
> Putting zoned/non-zoned BlockDrivers on top of each other is not
> allowed.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block.c                          | 7 +++++++
>  block/file-posix.c               | 2 ++
>  include/block/block_int-common.h | 5 +++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/block.c b/block.c
> index 2c00dddd80..0e24582c7d 100644
> --- a/block.c
> +++ b/block.c
> @@ -7945,6 +7945,13 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
>          return;
>      }
>
> +    if (parent_bs->drv->is_zoned != child_bs->drv->is_zoned) {
> +        error_setg(errp, "Cannot add a %s child to a %s parent",
> +                   child_bs->drv->is_zoned ? "zoned" : "non-zoned",
> +                   parent_bs->drv->is_zoned ? "zoned" : "non-zoned");
> +        return;
> +    }

Please explain the rationale:

/*
 * Non-zoned block drivers do not follow zoned storage constraints
(i.e. sequential writes
 * to zones). Refuse mixing zoned and non-zoned drivers in a graph.
 */

> +
>      if (!QLIST_EMPTY(&child_bs->parents)) {
>          error_setg(errp, "The node %s already has a parent",
>                     child_bs->node_name);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 42708012ff..e9ad1d8e1e 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3924,6 +3924,7 @@ static BlockDriver bdrv_host_device = {
>      .format_name        = "host_device",
>      .protocol_name        = "host_device",
>      .instance_size      = sizeof(BDRVRawState),
> +    .is_zoned = false,

In C static struct fields are automatically initialized to 0/false.
This line can be omitted.

>      .bdrv_needs_filename = true,
>      .bdrv_probe_device  = hdev_probe_device,
>      .bdrv_parse_filename = hdev_parse_filename,
> @@ -3971,6 +3972,7 @@ static BlockDriver bdrv_zoned_host_device = {
>          .format_name = "zoned_host_device",
>          .protocol_name = "zoned_host_device",
>          .instance_size = sizeof(BDRVRawState),
> +        .is_zoned = true,
>          .bdrv_needs_filename = true,
>          .bdrv_probe_device  = hdev_probe_device,
>          .bdrv_parse_filename = hdev_parse_filename,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 6037871089..29f1ec9184 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -141,6 +141,11 @@ struct BlockDriver {
>       */
>      bool is_format;
>
> +    /*
> +     * Set to true if the BlockDriver is a zoned block driver.
> +     */
> +    bool is_zoned;

This isn't powerful enough to express the constraints.
block/raw-format.c supports both non-zoned and zoned children (after
your patch) but it won't pass the check.

Perhaps add bool supports_zoned_children and change the check to:

if (child_bs->drv->is_zoned &&
!parent_bs->drv->supports_zoned_children) { ...refuse... }

Then raw-format would work on top of zoned_host_device as well as
still working on non-zoned BDSes.

Stefan

