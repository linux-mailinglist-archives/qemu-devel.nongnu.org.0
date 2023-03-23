Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC16C69B2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:39:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfL9I-00016p-KJ; Thu, 23 Mar 2023 09:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfL9G-00016L-Kn; Thu, 23 Mar 2023 09:38:34 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfL9E-0002aO-Gj; Thu, 23 Mar 2023 09:38:34 -0400
Received: by mail-ed1-x533.google.com with SMTP id r11so86698132edd.5;
 Thu, 23 Mar 2023 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679578710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWBcKLRnvFLHZ95dKYMRwjcB81tNMw0nKAjX/UoFdyM=;
 b=jjWsCwUjJU/wngnLjTstZYLUOK/6F3ez5gZ/XBZ8TmNBcn5i46pDMZV6Y5V5avM9bf
 jH9z6QsxRNrw3YbZyKgnKZhtKqtIbaLllQZU+Z5FG+VpFjBTUlfRirswGw+lHmagf2zB
 8iydCsDA+2xiDyKCJiCr83fhzyA9xB2iCeMIsIKQVqc2tcuzBT97lm3vT/ar6Afdie+O
 PwoYLPonm2eFFO49H/jUxcT13/0nTxk/W+iKMbsyBtjhxSvwUybCyHYwKyfxXQoUbt2m
 oBPoHTpljPoLQoFY3NEsQU4wlzSpn1nstQmi9f/ei3Ajam8WbbZ/aTWw/k4ex96P+etz
 iHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679578710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWBcKLRnvFLHZ95dKYMRwjcB81tNMw0nKAjX/UoFdyM=;
 b=KxSUVk7ODh4DKjuLL/nFQa2IOy0TqDqLVuqaluVlbgpdQdt07+rc8eaAr82KoRO4uC
 ODDUTn3DaE0NbNUNpYbhPBJkwmGDZlhaXq9bscLkKC37bU3Zr+O2C/kQyKkIMnhsKMcV
 8mlUERslUefhQliyDa/GwvbpFMAqUOXKoYe2gU0+ZeDWrHLj5HhHlTAp4qCUre1AQxYp
 ogxqp0AoHViGiooMx8hh5x3xsaLYWA/rlFJbo/nNC2Sl/AV5x+qMb02kJ/0R+zP864iI
 1t69ObT5vDci7FsTjLR5sqleIuGPrvDYCl5gDAspt2pS/Bq7YtL4ucgnHokCecRZckHZ
 LcZg==
X-Gm-Message-State: AO0yUKUJkLjDXbotCAj+/8/eWvF0CpFrY2q8zU6w3aiYwU6/8a5ES4Pt
 0lHUUskomhqHfXjtwsze6WHMhNzDFwpGVBw1+Io=
X-Google-Smtp-Source: AK7set/z07jNc+URMlpH1Ic9X2Oxsw2o5ITLjBd8+X7nspYUypDuYBhdJxGtaGF76bhjSGP/IC0eNN8sd2fWcDTY5PI=
X-Received: by 2002:a17:906:668c:b0:8b1:3c31:efe6 with SMTP id
 z12-20020a170906668c00b008b13c31efe6mr3364110ejo.3.1679578709798; Thu, 23 Mar
 2023 06:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230323052828.6545-1-faithilikerun@gmail.com>
 <3983f8bc-5be2-bb3c-a5cd-647550f577a0@bjorling.me>
In-Reply-To: <3983f8bc-5be2-bb3c-a5cd-647550f577a0@bjorling.me>
From: Sam Li <faithilikerun@gmail.com>
Date: Thu, 23 Mar 2023 21:38:03 +0800
Message-ID: <CAAAx-8Kq4JiA3rgjNuueBxWPiyKtQXy8-YCv04QOgbj=0DTXaA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Add zoned storage emulation to virtio-blk driver
To: =?UTF-8?Q?Matias_Bj=C3=B8rling?= <m@bjorling.me>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 kvm@vger.kernel.org, 
 hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com, 
 Hanna Reitz <hreitz@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=faithilikerun@gmail.com; helo=mail-ed1-x533.google.com
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

Matias Bj=C3=B8rling <m@bjorling.me> =E4=BA=8E2023=E5=B9=B43=E6=9C=8823=E6=
=97=A5=E5=91=A8=E5=9B=9B 21:26=E5=86=99=E9=81=93=EF=BC=9A
>
> On 23/03/2023 06.28, Sam Li wrote:
> > This patch adds zoned storage emulation to the virtio-blk driver.
> >
> > The patch implements the virtio-blk ZBD support standardization that is
> > recently accepted by virtio-spec. The link to related commit is at
> >
> > https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090=
ad15db65af8d7d981
> >
> > The Linux zoned device code that implemented by Dmitry Fomichev has bee=
n
> > released at the latest Linux version v6.3-rc1.
> >
> > Aside: adding zoned=3Don alike options to virtio-blk device will be
> > considered in following-up plan.
> >
> > v7:
> > - address Stefan's review comments
> >    * rm aio_context_acquire/release in handle_req
> >    * rename function return type
> >    * rename BLOCK_ACCT_APPEND to BLOCK_ACCT_ZONE_APPEND for clarity
> >
> > v6:
> > - update headers to v6.3-rc1
> >
> > v5:
> > - address Stefan's review comments
> >    * restore the way writing zone append result to buffer
> >    * fix error checking case and other errands
> >
> > v4:
> > - change the way writing zone append request result to buffer
> > - change zone state, zone type value of virtio_blk_zone_descriptor
> > - add trace events for new zone APIs
> >
> > v3:
> > - use qemuio_from_buffer to write status bit [Stefan]
> > - avoid using req->elem directly [Stefan]
> > - fix error checkings and memory leak [Stefan]
> >
> > v2:
> > - change units of emulated zone op coresponding to block layer APIs
> > - modify error checking cases [Stefan, Damien]
> >
> > v1:
> > - add zoned storage emulation
> >
> > Sam Li (4):
> >    include: update virtio_blk headers to v6.3-rc1
> >    virtio-blk: add zoned storage emulation for zoned devices
> >    block: add accounting for zone append operation
> >    virtio-blk: add some trace events for zoned emulation
> >
> >   block/qapi-sysemu.c                          |  11 +
> >   block/qapi.c                                 |  18 +
> >   hw/block/trace-events                        |   7 +
> >   hw/block/virtio-blk-common.c                 |   2 +
> >   hw/block/virtio-blk.c                        | 405 ++++++++++++++++++=
+
> >   include/block/accounting.h                   |   1 +
> >   include/standard-headers/drm/drm_fourcc.h    |  12 +
> >   include/standard-headers/linux/ethtool.h     |  48 ++-
> >   include/standard-headers/linux/fuse.h        |  45 ++-
> >   include/standard-headers/linux/pci_regs.h    |   1 +
> >   include/standard-headers/linux/vhost_types.h |   2 +
> >   include/standard-headers/linux/virtio_blk.h  | 105 +++++
> >   linux-headers/asm-arm64/kvm.h                |   1 +
> >   linux-headers/asm-x86/kvm.h                  |  34 +-
> >   linux-headers/linux/kvm.h                    |   9 +
> >   linux-headers/linux/vfio.h                   |  15 +-
> >   linux-headers/linux/vhost.h                  |   8 +
> >   qapi/block-core.json                         |  62 ++-
> >   qapi/block.json                              |   4 +
> >   19 files changed, 769 insertions(+), 21 deletions(-)
> >
>
>
> Hi Sam,
>
> I applied your patches and can report that they work with both SMR HDDs
> and ZNS SSDs. Very nice work!
>
> Regarding the documentation (docs/system/qemu-block-drivers.rst.inc). Is
> it possible to expose the host's zoned block device through something
> else than virtio-blk? If not, I wouldn't mind seeing the documentation
> updated to show a case when using the virtio-blk driver.
>
> For example (this also includes the device part):
>
> -device virtio-blk-pci,drive=3Ddrive0,id=3Dvirtblk0 \
> -blockdev
> host_device,node-name=3Ddrive0,filename=3D/dev/nullb0,cache.direct=3Don``
>
> It might also be nice to describe the shorthand for those that likes to
> pass in the parameters using only the -drive parameter.
>
>   -drive driver=3Dhost_device,file=3D/dev/nullb0,if=3Dvirtio,cache.direct=
=3Don

Hi Matias,

I'm glad it works. Thanks for your feedback!

For the question, this patch is exposing the zoned interface through
virtio-blk only. It's a good suggestion to put a use case inside
documentation. I will add it in the subsequent patch.

Thanks,
Sam

