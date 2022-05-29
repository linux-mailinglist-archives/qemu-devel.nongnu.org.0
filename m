Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EE553704B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 10:15:46 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvE5P-0000Bd-SD
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 04:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nvE2T-0007uV-BI
 for qemu-devel@nongnu.org; Sun, 29 May 2022 04:12:41 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nvE2M-0006w3-6z
 for qemu-devel@nongnu.org; Sun, 29 May 2022 04:12:38 -0400
Received: by mail-ej1-x635.google.com with SMTP id me2so2688920ejb.9
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0BdnG76lQMFwc96+2fkswihlJQrzxCDYfen1Yl9MsQ=;
 b=tyNgMRb5Wtc+n2mcXDwXD0d05dNhRGl5gC9Sl1AotSrl3OudkF/MpyMf/Z4jHW4prK
 uoSBdwxNgPIR29huOvzzktDVw/8OfZ1+q3gKUhDHNYB1dgNtI99io3tReY2hsAhqbeAf
 bxsWwBvmG0yqgCJIcZuAVI8zPBdmDgokVhQbNd2AfJhzJWo6O8yEEpfAv6Mn57Ugv5cE
 K7y7AZbBqg9yA7M0ql4tY+ajWYGwgHNwwjFC5vlFz9ab9SLwvy+1kgGWmsqQtS89sxtP
 BkavawkZB0XEa8vXqFp4hL9TaqSVeFrDBgHRZ1W16lxAXk3c09zHeE4jKpfn69g35k9F
 ZPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0BdnG76lQMFwc96+2fkswihlJQrzxCDYfen1Yl9MsQ=;
 b=cwBUQnNfE8BCTHJTXov8QUz7s3HjYqoT/DNf8BjRUBsd4hSMmBy23/rDNMl6JBCOYH
 NtG7FdgJT2f5eEy8t+uvxG9KsIrEPjSdznbxyFaOAU9D3NiQOlR+7H7IJzEfaKvge+bR
 D5xdOb6N2HkKn9tqsmvph+01dxTNZcljoZ6dm/YX+S3iuIcmqnAj73Jj0XJI/BcsL6wy
 VaUvsq0Z9aIK44ckP1WQRlSV9gNAvRkD+uTSOOvPsQn8cEZklhnH60OBxE1B02qdBiIE
 Oj4XchjFBNdhpuUcQPmyiskkG/2PsOew0Po/qvMxo/t8MJGsMvC9dm51BHO6AHPhaoqO
 6akw==
X-Gm-Message-State: AOAM533FRzAbW+6lo8txCjTk6WboT31HsNu7VJNRVL383TG+PwY5P0hd
 y/bTrBpbk6gzN9Qd+vG/qQFMYAd6re8ERipJrPr4
X-Google-Smtp-Source: ABdhPJzAtT8h3C/i8PkxN2vmGPAQvBkdwANojUKYxsSR/o/OKYiO5KMDITRyF677xlWgZO/AZVmf7bPFtqzVWqH4hz4=
X-Received: by 2002:a17:907:72c1:b0:6ff:c5f:6b7d with SMTP id
 du1-20020a17090772c100b006ff0c5f6b7dmr19591696ejc.676.1653811951199; Sun, 29
 May 2022 01:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220523084611.91-1-xieyongji@bytedance.com>
 <20220523084611.91-7-xieyongji@bytedance.com>
 <YpDvZRUMAuhQLbJe@redhat.com>
In-Reply-To: <YpDvZRUMAuhQLbJe@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Sun, 29 May 2022 16:13:21 +0800
Message-ID: <CACycT3tYMiSYJY=djMf2kOpSPhYW9dcpgQTdrN7a+9C4g++DdQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] vduse-blk: Implement vduse-blk export
To: Kevin Wolf <kwolf@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 27, 2022 at 11:34 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 23.05.2022 um 10:46 hat Xie Yongji geschrieben:
> > This implements a VDUSE block backends based on
> > the libvduse library. We can use it to export the BDSs
> > for both VM and container (host) usage.
> >
> > The new command-line syntax is:
> >
> > $ qemu-storage-daemon \
> >     --blockdev file,node-name=drive0,filename=test.img \
> >     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> >
> > After the qemu-storage-daemon started, we need to use
> > the "vdpa" command to attach the device to vDPA bus:
> >
> > $ vdpa dev add name vduse-export0 mgmtdev vduse
> >
> > Also the device must be removed via the "vdpa" command
> > before we stop the qemu-storage-daemon.
> >
> > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  MAINTAINERS                   |   4 +-
> >  block/export/export.c         |   6 +
> >  block/export/meson.build      |   5 +
> >  block/export/vduse-blk.c      | 307 ++++++++++++++++++++++++++++++++++
> >  block/export/vduse-blk.h      |  20 +++
> >  meson.build                   |  13 ++
> >  meson_options.txt             |   2 +
> >  qapi/block-export.json        |  28 +++-
> >  scripts/meson-buildoptions.sh |   4 +
> >  9 files changed, 385 insertions(+), 4 deletions(-)
> >  create mode 100644 block/export/vduse-blk.c
> >  create mode 100644 block/export/vduse-blk.h
>
> > diff --git a/qapi/block-export.json b/qapi/block-export.json
> > index 0685cb8b9a..e4bd4de363 100644
> > --- a/qapi/block-export.json
> > +++ b/qapi/block-export.json
> > @@ -177,6 +177,23 @@
> >              '*allow-other': 'FuseExportAllowOther' },
> >    'if': 'CONFIG_FUSE' }
> >
> > +##
> > +# @BlockExportOptionsVduseBlk:
> > +#
> > +# A vduse-blk block export.
> > +#
> > +# @num-queues: the number of virtqueues. Defaults to 1.
> > +# @queue-size: the size of virtqueue. Defaults to 256.
> > +# @logical-block-size: Logical block size in bytes. Range [512, PAGE_SIZE]
> > +#                      and must be power of 2. Defaults to 512 bytes.
> > +#
> > +# Since: 7.1
> > +##
> > +{ 'struct': 'BlockExportOptionsVduseBlk',
> > +  'data': { '*num-queues': 'uint16',
> > +            '*queue-size': 'uint16',
> > +            '*logical-block-size': 'size'} }
> > +
> >  ##
> >  # @NbdServerAddOptions:
> >  #
> > @@ -280,6 +297,7 @@
> >  # @nbd: NBD export
> >  # @vhost-user-blk: vhost-user-blk export (since 5.2)
> >  # @fuse: FUSE export (since: 6.0)
> > +# @vduse-blk: vduse-blk export (since 7.1)
> >  #
> >  # Since: 4.2
> >  ##
> > @@ -287,7 +305,8 @@
> >    'data': [ 'nbd',
> >              { 'name': 'vhost-user-blk',
> >                'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
> > -            { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
> > +            { 'name': 'fuse', 'if': 'CONFIG_FUSE' },
> > +            { 'name': 'vduse-blk', 'if': 'CONFIG_VDUSE_BLK_EXPORT' } ] }
> >
> >  ##
> >  # @BlockExportOptions:
> > @@ -295,7 +314,8 @@
> >  # Describes a block export, i.e. how single node should be exported on an
> >  # external interface.
> >  #
> > -# @id: A unique identifier for the block export (across all export types)
> > +# @id: A unique identifier for the block export (across the host for vduse-blk
> > +#      export type or across all export types for other types)
>
> I find this sentence a bit confusing, but more importantly, it shows
> that you are using one value for two different purposes: The ID to
> identfy the export within QEMU (must be distinct from any other exports
> in the same QEMU process, but can overlap with names used by other
> processes), and the VDUSE name to uniquely identify it on the host (must
> be distinct from other VDUSE devices on the same host, but can overlap
> with other export types like NBD in the same process).
>
> We can fix this on top, but I would suggest having a separate option for
> the VDUSE device name, like BlockExportOptionsNbdBase contains a 'name'
> option for the export name that is different from the export ID in QEMU.
>

Yes, we discussed whether we need a separate option before. I think I
can send a patch to do it.

Thanks,
Yongji

