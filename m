Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274D5790F2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 04:40:56 +0200 (CEST)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDdAN-0004ac-Ge
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 22:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDd8s-00036V-Bh
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 22:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDd8l-0006Xy-8U
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 22:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658198354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JGUNzam/80Z/+2YPm6DECVd1NC32OLlVDQe3TVFU3pY=;
 b=GkSW7p/SjcdsO+X1zm/khtpWa4DIBK6Xgs0A2aZBhGGX7qz6zZNaMv8PUyOP1rSOUy4QN0
 ZwXwzCcoahSILLfIQxAsKs8VC50G4lDveGKgs79JDobSm/CHr6niS3rggGqrcf0EilP+PP
 JZI3BULviCpZYWnCbNT6i4ZQ5vnzF9Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-KzOJX8v4PQ20FufvSGFX8w-1; Mon, 18 Jul 2022 22:39:13 -0400
X-MC-Unique: KzOJX8v4PQ20FufvSGFX8w-1
Received: by mail-pj1-f70.google.com with SMTP id
 o6-20020a17090a678600b001ef87826a62so3926696pjj.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 19:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JGUNzam/80Z/+2YPm6DECVd1NC32OLlVDQe3TVFU3pY=;
 b=aGDoQ4SJuSxlYYTljyqha12egAEDduxMCLSYAVE5by2etjvSLhqJEKfsktZcUS5kRe
 ELCZLU3RfHW7ijyo0LgfyitRIVY7n8cAojqg4z/qQooEJ8pUvgAMo3Vdpe6K1mm7EtgG
 xb8g+602DLzWeXW8aV41WCNTMYyIBqqXG5fTZjI3vdnJKbV/t5o00WkuMN4ddHmlo4Ei
 5XJ/LHHTLdp9u2sYgy9c0TTdT93uC8SwoKJva42HsmO2WhgFUfR+Oj3iEUVBMFHGZP6u
 WjIiVHcS+NaODWJD6DvNKxflol2yEzvspMmAayIes5whSPoGjc1EiTz8qQT93MIMn8Br
 ykjA==
X-Gm-Message-State: AJIora/WFzFhXOt2+skJN5fe6y8w6mVH0lO9Ot5AXudzEXRPzo2qmEZ+
 R1ueLlCWEYSh7Z5jNmiy1I1e6TLLxIicqHwJdJ7RExsoyIYHb/b0b7pYriKIbijGcQh9JT+B9TM
 om3Aky/kw9VDL+38=
X-Received: by 2002:a63:1b49:0:b0:411:c101:eda5 with SMTP id
 b9-20020a631b49000000b00411c101eda5mr26760465pgm.600.1658198352292; 
 Mon, 18 Jul 2022 19:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ssM/duOEs9tZvOB8B56eue3P7lxjFKh/enkkG7KCvcqKcJV38cWwCY1jP8JtX8KBt2O7vw0g==
X-Received: by 2002:a63:1b49:0:b0:411:c101:eda5 with SMTP id
 b9-20020a631b49000000b00411c101eda5mr26760438pgm.600.1658198351872; 
 Mon, 18 Jul 2022 19:39:11 -0700 (PDT)
Received: from [10.72.13.162] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170902654800b0016bd5da20casm10170502pln.134.2022.07.18.19.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 19:39:11 -0700 (PDT)
Message-ID: <114122cc-8dde-552b-34f5-836efaba5564@redhat.com>
Date: Tue, 19 Jul 2022 10:39:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 16/19] vdpa: Buffer CVQ support on shadow virtqueue
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220718102949.2868267-1-eperezma@redhat.com>
 <20220718102949.2868267-17-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220718102949.2868267-17-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/7/18 18:29, Eugenio Pérez 写道:
> Introduce the control virtqueue support for vDPA shadow virtqueue. This
> is needed for advanced networking features like rx filtering.
>
> Virtio-net control VQ copies the descriptors to qemu's VA, so we avoid
> TOCTOU with the guest's or device's memory every time there is a device
> model change.  Otherwise, the guest could change the memory content in
> the time between qemu and the device read it.
>
> To demonstrate command handling, VIRTIO_NET_F_CTRL_MACADDR is
> implemented.  If the virtio-net driver changes MAC the virtio-net device
> model will be updated with the new one, and a rx filtering change event
> will be raised.
>
> More cvq commands could be added here straightforwardly but they have
> not been tested.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 211 +++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 204 insertions(+), 7 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2e3b6b10d8..3915b148c4 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -33,6 +33,9 @@ typedef struct VhostVDPAState {
>       NetClientState nc;
>       struct vhost_vdpa vhost_vdpa;
>       VHostNetState *vhost_net;
> +
> +    /* Control commands shadow buffers */
> +    void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
>       bool started;
>   } VhostVDPAState;
>   
> @@ -131,6 +134,8 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
>   {
>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>   
> +    qemu_vfree(s->cvq_cmd_out_buffer);
> +    qemu_vfree(s->cvq_cmd_in_buffer);
>       if (s->vhost_net) {
>           vhost_net_cleanup(s->vhost_net);
>           g_free(s->vhost_net);
> @@ -190,24 +195,191 @@ static NetClientInfo net_vhost_vdpa_info = {
>           .check_peer_type = vhost_vdpa_check_peer_type,
>   };
>   
> +static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
> +{
> +    VhostIOVATree *tree = v->iova_tree;
> +    DMAMap needle = {
> +        /*
> +         * No need to specify size or to look for more translations since
> +         * this contiguous chunk was allocated by us.
> +         */
> +        .translated_addr = (hwaddr)(uintptr_t)addr,
> +    };
> +    const DMAMap *map = vhost_iova_tree_find_iova(tree, &needle);
> +    int r;
> +
> +    if (unlikely(!map)) {
> +        error_report("Cannot locate expected map");
> +        return;
> +    }
> +
> +    r = vhost_vdpa_dma_unmap(v, map->iova, map->size + 1);
> +    if (unlikely(r != 0)) {
> +        error_report("Device cannot unmap: %s(%d)", g_strerror(r), r);
> +    }
> +
> +    vhost_iova_tree_remove(tree, map);
> +}
> +
> +static size_t vhost_vdpa_net_cvq_cmd_len(void)
> +{
> +    /*
> +     * MAC_TABLE_SET is the ctrl command that produces the longer out buffer.
> +     * In buffer is always 1 byte, so it should fit here
> +     */
> +    return sizeof(struct virtio_net_ctrl_hdr) +
> +           2 * sizeof(struct virtio_net_ctrl_mac) +
> +           MAC_TABLE_ENTRIES * ETH_ALEN;
> +}
> +
> +static size_t vhost_vdpa_net_cvq_cmd_page_len(void)
> +{
> +    return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host_page_size());
> +}
> +
> +/** Copy and map a guest buffer. */
> +static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
> +                                   const struct iovec *out_data,
> +                                   size_t out_num, size_t data_len, void *buf,
> +                                   size_t *written, bool write)
> +{
> +    DMAMap map = {};
> +    int r;
> +
> +    if (unlikely(!data_len)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s buffer\n",
> +                      __func__, write ? "in" : "out");
> +        return false;
> +    }
> +
> +    *written = iov_to_buf(out_data, out_num, 0, buf, data_len);
> +    map.translated_addr = (hwaddr)(uintptr_t)buf;
> +    map.size = vhost_vdpa_net_cvq_cmd_page_len() - 1;
> +    map.perm = write ? IOMMU_RW : IOMMU_RO,
> +    r = vhost_iova_tree_map_alloc(v->iova_tree, &map);
> +    if (unlikely(r != IOVA_OK)) {
> +        error_report("Cannot map injected element");
> +        return false;
> +    }
> +
> +    r = vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_len(), buf,
> +                           !write);
> +    if (unlikely(r < 0)) {
> +        goto dma_map_err;
> +    }
> +
> +    return true;
> +
> +dma_map_err:
> +    vhost_iova_tree_remove(v->iova_tree, &map);
> +    return false;
> +}
> +
>   /**
> - * Forward buffer for the moment.
> + * Copy the guest element into a dedicated buffer suitable to be sent to NIC
> + *
> + * @iov: [0] is the out buffer, [1] is the in one
> + */
> +static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> +                                        VirtQueueElement *elem,
> +                                        struct iovec *iov)
> +{
> +    size_t in_copied;
> +    bool ok;
> +
> +    iov[0].iov_base = s->cvq_cmd_out_buffer;
> +    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
> +                                vhost_vdpa_net_cvq_cmd_len(), iov[0].iov_base,
> +                                &iov[0].iov_len, false);
> +    if (unlikely(!ok)) {
> +        return false;
> +    }
> +
> +    iov[1].iov_base = s->cvq_cmd_in_buffer;
> +    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> +                                sizeof(virtio_net_ctrl_ack), iov[1].iov_base,
> +                                &in_copied, true);
> +    if (unlikely(!ok)) {
> +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
> +        return false;
> +    }
> +
> +    iov[1].iov_len = sizeof(virtio_net_ctrl_ack);
> +    return true;
> +}
> +
> +/**
> + * Do not forward commands not supported by SVQ. Otherwise, the device could
> + * accept it and qemu would not know how to update the device model.
> + */
> +static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *out,
> +                                            size_t out_num)
> +{
> +    struct virtio_net_ctrl_hdr ctrl;
> +    size_t n;
> +
> +    n = iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
> +    if (unlikely(n < sizeof(ctrl))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid legnth of out buffer %zu\n", __func__, n);
> +        return false;
> +    }
> +
> +    switch (ctrl.class) {
> +    case VIRTIO_NET_CTRL_MAC:
> +        switch (ctrl.cmd) {
> +        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
> +            return true;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
> +                          __func__, ctrl.cmd);
> +        };
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
> +                      __func__, ctrl.class);
> +    };
> +
> +    return false;
> +}
> +
> +/**
> + * Validate and copy control virtqueue commands.
> + *
> + * Following QEMU guidelines, we offer a copy of the buffers to the device to
> + * prevent TOCTOU bugs.
>    */
>   static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>                                               VirtQueueElement *elem,
>                                               void *opaque)
>   {
> -    unsigned int n = elem->out_num + elem->in_num;
> -    g_autofree struct iovec *dev_buffers = g_new(struct iovec, n);
> +    VhostVDPAState *s = opaque;
>       size_t in_len, dev_written;
>       virtio_net_ctrl_ack status = VIRTIO_NET_ERR;
> +    /* out and in buffers sent to the device */
> +    struct iovec dev_buffers[2] = {
> +        { .iov_base = s->cvq_cmd_out_buffer },
> +        { .iov_base = s->cvq_cmd_in_buffer },
> +    };
> +    /* in buffer used for device model */
> +    const struct iovec in = {
> +        .iov_base = &status,
> +        .iov_len = sizeof(status),
> +    };
>       int r;


I got this:

FAILED: libcommon.fa.p/net_vhost-vdpa.c.o
cc -m64 -mcx16 -Ilibcommon.fa.p -I../dtc/libfdt -I../slirp 
-I../slirp/src -I/usr/include/capstone -I/usr/include/pixman-1 
-I/usr/include/libpng16 -I/usr/include/libmount -I/usr/include/blkid 
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include 
-I/usr/include/gio-unix-2.0 -fdiagnostics-color=auto -Wall -Winvalid-pch 
-Werror -std=gnu11 -O2 -g -isystem /home/devel/git/qemu/linux-headers 
-isystem linux-headers -iquote . -iquote /home/devel/git/qemu -iquote 
/home/devel/git/qemu/include -iquote /home/devel/git/qemu/tcg/i386 
-pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes 
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes 
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration 
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k 
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs 
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi 
-fstack-protector-strong -fPIE -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 
-DNCURSES_WIDECHAR=1 -MD -MQ libcommon.fa.p/net_vhost-vdpa.c.o -MF 
libcommon.fa.p/net_vhost-vdpa.c.o.d -o libcommon.fa.p/net_vhost-vdpa.c.o 
-c ../net/vhost-vdpa.c
../net/vhost-vdpa.c: In function ‘vhost_vdpa_net_handle_ctrl_avail’:
../net/vhost-vdpa.c:427:12: error: ‘r’ may be used uninitialized in this 
function [-Werror=maybe-uninitialized]
   427 |     return r;
       |            ^
cc1: all warnings being treated as errors


> +    bool ok;
>   
> -    memcpy(dev_buffers, elem->out_sg, elem->out_num);
> -    memcpy(dev_buffers + elem->out_num, elem->in_sg, elem->in_num);
> +    ok = vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);


I think it's good idea to let this function return int instead of a boolean.

Thanks


> +    if (unlikely(!ok)) {
> +        goto out;
> +    }
>   
> -    r = vhost_svq_add(svq, &dev_buffers[0], elem->out_num, &dev_buffers[1],
> -                      elem->in_num, elem);
> +    ok = vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
> +    if (unlikely(!ok)) {
> +        goto out;
> +    }
> +
> +    r = vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, elem);
>       if (unlikely(r != 0)) {
>           if (unlikely(r == -ENOSPC)) {
>               qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device queue\n",
> @@ -224,6 +396,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
>       dev_written = vhost_svq_poll(svq);
>       if (unlikely(dev_written < sizeof(status))) {
>           error_report("Insufficient written data (%zu)", dev_written);
> +        goto out;
> +    }
> +
> +    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> +    if (status != VIRTIO_NET_OK) {
> +        goto out;
> +    }
> +
> +    status = VIRTIO_NET_ERR;
> +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> +    if (status != VIRTIO_NET_OK) {
> +        error_report("Bad CVQ processing in model");
>       }
>   
>   out:
> @@ -234,6 +418,12 @@ out:
>       }
>       vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
>       g_free(elem);
> +    if (dev_buffers[0].iov_base) {
> +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].iov_base);
> +    }
> +    if (dev_buffers[1].iov_base) {
> +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_base);
> +    }
>       return r;
>   }
>   
> @@ -266,6 +456,13 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
>       if (!is_datapath) {
> +        s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
> +                                            vhost_vdpa_net_cvq_cmd_page_len());
> +        memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
> +        s->cvq_cmd_in_buffer = qemu_memalign(qemu_real_host_page_size(),
> +                                            vhost_vdpa_net_cvq_cmd_page_len());
> +        memset(s->cvq_cmd_in_buffer, 0, vhost_vdpa_net_cvq_cmd_page_len());
> +
>           s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
>           s->vhost_vdpa.shadow_vq_ops_opaque = s;
>       }


