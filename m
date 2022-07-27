Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C354582970
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:18:05 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGinS-00016X-T6
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oGikR-0007B3-1k; Wed, 27 Jul 2022 11:14:56 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oGikP-00031K-GD; Wed, 27 Jul 2022 11:14:54 -0400
Received: by mail-yb1-xb34.google.com with SMTP id 123so7916872ybv.7;
 Wed, 27 Jul 2022 08:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YTW5gVMsDhqrBiHxLkDbWXMcxYQHnrcWZnj+3AXeKJo=;
 b=PCE1s+52/AaQcgNkprq1uuzLi86PzdAV2llVa5Ta/J6Y2sWLXsBhWj5hU2wL7Bezb1
 nDanDuC+daxlxfsrNpcptbWNHuWHlUwz73l1YP4bT51iZwTeLmHJupB5m5vb/YGActG9
 utnwSo3zp8v7ZNRBL2PCAcCmGUenj7yV1NzzGXifdj1W1UX4VJcUPAy3EKXEMQsnaLqU
 xcB0SQ6q8NxgCRiMeHqSSQ/VQUrhRE+BXKY3EQRbjuLorQkUj9lOutVVeP8MHwYllgb8
 ndmeV0vXG7hZWIZ/OTmSlXySPJwPUtk9Ii5c9N6bbMXUVVqLyrekdOqCiUGqAqWNtlC2
 Z8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YTW5gVMsDhqrBiHxLkDbWXMcxYQHnrcWZnj+3AXeKJo=;
 b=rlIP5AdKYLReoAacDU9g79XU4+j1k3wsOmwLm+0RSYE0nVmhqvQkWi3n2H4DoFiT0W
 QTT09EmlEd0auGxFJM88J69tgUa/N/R7t/uEdec89lPBhOYyyH9fuMD75woGylknnb6p
 OCi98C9W+/zU4Zyk2r+zmKX6YeSUnAC6zwORBcJfgmMQ0r10JCw2WY/gi5aAzW09V3jx
 YDOH8YZJLqAd8CPG4Z9pDucUmN3WKdIhdcxIS3XnhPvlxpMwOCLtsZV5ylETI398udso
 SltA+8JEntmZASb4/lYKFQEPr1QCWqSQ6v1uRqnJBCTk9hBjAobROf3bjevnzyATZfKN
 dC+w==
X-Gm-Message-State: AJIora+IyZg+uqbk/w7qowBk0b6JJiq4KSqSJ4uiKCo88mVWLBZH4c0M
 XvdrjY6RNrqJItCExmo+Sl0RwykQo3dkLdq94BA=
X-Google-Smtp-Source: AGRyM1t4El6ZcVDJr+brBkLk0aoGCY4tb2VS9GsbyxgoK7dM/1Wd+3ffSxwqLN6j4XE3jDtdv1o/5z5JsROQBY3dg0w=
X-Received: by 2002:a05:6902:1348:b0:671:78a4:471f with SMTP id
 g8-20020a056902134800b0067178a4471fmr5925610ybu.242.1658934891367; Wed, 27
 Jul 2022 08:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <CAJSP0QUhg-5xioYmJzmjeXqPrZ_GB1dMxQj230neQp2mUNEMcw@mail.gmail.com>
In-Reply-To: <CAJSP0QUhg-5xioYmJzmjeXqPrZ_GB1dMxQj230neQp2mUNEMcw@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 27 Jul 2022 23:14:56 +0800
Message-ID: <CAAAx-8KXBc1D1dL+fEXtWAJ9fpZmx+GYpyUROo3JVqUQCdHZUg@mail.gmail.com>
Subject: Re: [RFC v4 0/9] Add support for zoned device
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb34.google.com
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

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8827=E6=
=97=A5=E5=91=A8=E4=B8=89 23:06=E5=86=99=E9=81=93=EF=BC=9A
>
> This patch series introduces the concept of zoned storage to the QEMU
> block layer. Documentation is needed so that users and developers know
> how to use and maintain this feature.
>
> As a minimum, let's document how to pass through zoned block devices on L=
inux:
>
> diff --git a/docs/system/qemu-block-drivers.rst.inc
> b/docs/system/qemu-block-drivers.rst.inc
> index dfe5d2293d..f6ba05710a 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -430,6 +430,12 @@ Hard disks
>    you may corrupt your host data (use the ``-snapshot`` command
>    line option or modify the device permissions accordingly).
>
> +Zoned block devices
> +  Zoned block devices can be passed through to the guest if the emulated
> +  storage controller supports zoned storage. Use ``--blockdev
> +  zoned_host_device,node-name=3Ddrive0,filename=3D/dev/nullb0`` to pass =
through
> +  ``/dev/nullb0`` as ``drive0``.
> +
>  Windows
>  ^^^^^^^
>
> For developers there should be an explanation of the zoned storage
> APIs and how BlockDrivers declare support. It should also mention the
> status of pass through (implemented in the zoned_host_device driver)
> vs zone emulation (not implemented in the QEMU block layer) so
> developers understand the block layer's zoned storage capabilities.
> You can add a docs/devel/zoned-storage.rst file to document this or
> let me know if you want me to write it.

I will write the document and address the issues in the reviews, which
should be in the next revision.
Thanks for reviewing!

Have a good day!
Sam

