Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77D2421926
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:20:58 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVOL-0000iq-Pm
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXVEo-0002Zv-Mo
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXVEm-0003bL-Az
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QJNd4R3fHuASm6DHAb5VmUDSNlq6aXshqyq8TY3Ab1Y=;
 b=a9vy++qt4GUPqYsoeXtNqv0NUVCRdrQA6/xa+qmbRFzWGPMSzEwtlUbrVyBbAhzahUX6x8
 Dh6fl2menrOt1SZhMIwrQrBUaAbQ2id6tw6nzNzgHTRmriSBk3eTZM/Uh7fJ9aZ73u3Rci
 lPv9Mk+t93qiTScBfv3HUowFsOyS3rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-nHZ0sL5lOAW7I64dCHfA0A-1; Mon, 04 Oct 2021 17:11:01 -0400
X-MC-Unique: nHZ0sL5lOAW7I64dCHfA0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37FBF802947;
 Mon,  4 Oct 2021 21:11:00 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02DD860853;
 Mon,  4 Oct 2021 21:10:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7DE15220BDB; Mon,  4 Oct 2021 17:10:59 -0400 (EDT)
Date: Mon, 4 Oct 2021 17:10:59 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 09/13] virtiofsd: Specify size of notification buffer
 using config space
Message-ID: <YVtt49qZAy+AYMf5@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-10-vgoyal@redhat.com>
 <YVsQyxaPHyChcOel@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVsQyxaPHyChcOel@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 03:33:47PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:33AM -0400, Vivek Goyal wrote:
> > Daemon specifies size of notification buffer needed and that should be
> > done using config space.
> > 
> > Only ->notify_buf_size value of config space comes from daemon. Rest of
> > it is filled by qemu device emulation code.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> > ---
> >  hw/virtio/vhost-user-fs.c                  | 27 +++++++++++++++++++
> >  include/hw/virtio/vhost-user-fs.h          |  2 ++
> >  include/standard-headers/linux/virtio_fs.h |  2 ++
> >  tools/virtiofsd/fuse_virtio.c              | 31 ++++++++++++++++++++++
> >  4 files changed, 62 insertions(+)
> > 
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index 6bafcf0243..68a94708b4 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -36,15 +36,41 @@ static const int user_feature_bits[] = {
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >  
> > +static int vhost_user_fs_handle_config_change(struct vhost_dev *dev)
> > +{
> > +    return 0;
> > +}
> > +
> > +const VhostDevConfigOps fs_ops = {
> > +    .vhost_dev_config_notifier = vhost_user_fs_handle_config_change,
> > +};
> > +
> >  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
> >  {
> >      VHostUserFS *fs = VHOST_USER_FS(vdev);
> >      struct virtio_fs_config fscfg = {};
> > +    Error *local_err = NULL;
> > +    int ret;
> > +
> > +    /*
> > +     * As of now we only get notification buffer size from device. And that's
> > +     * needed only if notification queue is enabled.
> > +     */
> > +    if (fs->notify_enabled) {
> > +        ret = vhost_dev_get_config(&fs->vhost_dev, (uint8_t *)&fs->fscfg,
> > +                                   sizeof(struct virtio_fs_config),
> > +                                   &local_err);
> > +        if (ret) {
> > +            error_report_err(local_err);
> > +            return;
> > +        }
> > +    }
> >  
> >      memcpy((char *)fscfg.tag, fs->conf.tag,
> >             MIN(strlen(fs->conf.tag) + 1, sizeof(fscfg.tag)));
> >  
> >      virtio_stl_p(vdev, &fscfg.num_request_queues, fs->conf.num_request_queues);
> > +    virtio_stl_p(vdev, &fscfg.notify_buf_size, fs->fscfg.notify_buf_size);
> >  
> >      memcpy(config, &fscfg, sizeof(fscfg));
> >  }
> > @@ -316,6 +342,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
> >                  sizeof(struct virtio_fs_config));
> >  
> >      vuf_create_vqs(vdev, true);
> > +    vhost_dev_set_config_notifier(&fs->vhost_dev, &fs_ops);
> >      ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
> >                           VHOST_BACKEND_TYPE_USER, 0, errp);
> >      if (ret < 0) {
> > diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
> > index 95dc0dd402..3b114ee260 100644
> > --- a/include/hw/virtio/vhost-user-fs.h
> > +++ b/include/hw/virtio/vhost-user-fs.h
> > @@ -14,6 +14,7 @@
> >  #ifndef _QEMU_VHOST_USER_FS_H
> >  #define _QEMU_VHOST_USER_FS_H
> >  
> > +#include "standard-headers/linux/virtio_fs.h"
> >  #include "hw/virtio/virtio.h"
> >  #include "hw/virtio/vhost.h"
> >  #include "hw/virtio/vhost-user.h"
> > @@ -37,6 +38,7 @@ struct VHostUserFS {
> >      struct vhost_virtqueue *vhost_vqs;
> >      struct vhost_dev vhost_dev;
> >      VhostUserState vhost_user;
> > +    struct virtio_fs_config fscfg;
> >      VirtQueue **req_vqs;
> >      VirtQueue *hiprio_vq;
> >      VirtQueue *notification_vq;
> > diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standard-headers/linux/virtio_fs.h
> > index b7f015186e..867d18acf6 100644
> > --- a/include/standard-headers/linux/virtio_fs.h
> > +++ b/include/standard-headers/linux/virtio_fs.h
> > @@ -17,6 +17,8 @@ struct virtio_fs_config {
> >  
> >  	/* Number of request queues */
> >  	uint32_t num_request_queues;
> > +	/* Size of notification buffer */
> > +	uint32_t notify_buf_size;
> >  } QEMU_PACKED;
> >  
> >  /* For the id field in virtio_pci_shm_cap */
> 
> Please put all the include/standard-headers/linux/ changes into a single
> commit that imports these changes from linux.git. Changes to this header
> shouldn't be hand-written, use scripts/update-linux-headers.sh instead.

Will do. These changes are not in kernel yet. So will use
update-linux-headers.sh when changes are upstreamed. But agreed,
that this change should be in separate patch even for review
purpose (before it is merged in kernel).

> 
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index f5b87a508a..3b720c5d4a 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -856,6 +856,35 @@ static bool fv_queue_order(VuDev *dev, int qidx)
> >      return false;
> >  }
> >  
> > +static uint64_t fv_get_protocol_features(VuDev *dev)
> > +{
> > +    return 1ull << VHOST_USER_PROTOCOL_F_CONFIG;
> > +}
> > +
> > +static int fv_get_config(VuDev *dev, uint8_t *config, uint32_t len)
> > +{
> > +    struct virtio_fs_config fscfg = {};
> > +    unsigned notify_size, roundto = 64;
> > +    union fuse_notify_union {
> > +        struct fuse_notify_poll_wakeup_out  wakeup_out;
> > +        struct fuse_notify_inval_inode_out  inode_out;
> > +        struct fuse_notify_inval_entry_out  entry_out;
> > +        struct fuse_notify_delete_out       delete_out;
> > +        struct fuse_notify_store_out        store_out;
> > +        struct fuse_notify_retrieve_out     retrieve_out;
> > +    };
> > +
> > +    notify_size = sizeof(struct fuse_out_header) +
> > +              sizeof(union fuse_notify_union);
> > +    notify_size = ((notify_size + roundto) / roundto) * roundto;
> 
> Why is the size rounded to 64 bytes?

Hmm.., I really can't remember why did I do that. Maybe I thought it
is just nice to round it to 64 bytes. I can get rid of this rounding
if it s not making sense.

Vivek



