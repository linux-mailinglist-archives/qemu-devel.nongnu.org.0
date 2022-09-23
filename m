Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BEA5E7C53
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:53:00 +0200 (CEST)
Received: from localhost ([::1]:50552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obj6x-0002SQ-Sz
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1obj1n-0007Rl-8b
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:47:39 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:52348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1obj1h-0002DH-TZ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:47:39 -0400
Received: from [192.168.178.42] (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C2B06660223B;
 Fri, 23 Sep 2022 14:47:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663940852;
 bh=KiWEqvnP2VOR/TvxGuJMZP+kQYTU0mS3sVNpCs8YcEU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oau52RUFT1UG7afBFIMZBi/IouRE1ke+VyjMRMmJlcR7hq8hVrELtcqBV2MsCX+h3
 XsiwFJnGAhhLj8sRxSUFo7pAaChZkxoj++A5sHS3UPkKaVnzF5qMBOi17aN2jiQn2n
 cpStIeydimQNYFKVZivc550SN3Z2VYKCtTn7uu1QdDiM9mJNj6mh3Qr6ZDyFu/SYgU
 3lX2ypG+6Bbv/DJtdaoRB1iD7LmlueUJLmcmxD6ol/Vvnj1I0zFvrL289nSdchHZF+
 gdpmdGedjQaZJzBEHY0LdihdjX6PL4/YxpDtkwK86+7X0hZOJ/XEfrmHrvKjTNlKnj
 QUftab2kfvGLw==
Message-ID: <5957857a-6fa0-423b-d5e8-64b22c74ef32@collabora.com>
Date: Fri, 23 Sep 2022 15:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] virtio-gpu: Resource UUID
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com,
 dmitry.osipenko@collabora.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220921110326.226981-1-antonio.caggiano@collabora.com>
 <CAJ+F1C+0Q5Q70gktghLUMcxYzXM0f+jFkdG7EPET9OohqpAuwA@mail.gmail.com>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
In-Reply-To: <CAJ+F1C+0Q5Q70gktghLUMcxYzXM0f+jFkdG7EPET9OohqpAuwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi Marc-André,

On 23/09/2022 10:38, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Sep 21, 2022 at 1:24 PM Antonio Caggiano 
> <antonio.caggiano@collabora.com <mailto:antonio.caggiano@collabora.com>> 
> wrote:
> 
>     Enable resource UUID feature and implement command resource assign UUID.
>     This is done by introducing a hash table to map resource IDs to their
>     UUIDs.
> 
>     Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com
>     <mailto:antonio.caggiano@collabora.com>>
>     ---
>       hw/display/trace-events        |  1 +
>       hw/display/virtio-gpu-base.c   |  2 ++
>       hw/display/virtio-gpu-virgl.c  | 11 ++++++++++
>       hw/display/virtio-gpu.c        | 40 ++++++++++++++++++++++++++++++++++
>       include/hw/virtio/virtio-gpu.h |  4 ++++
>       5 files changed, 58 insertions(+)
> 
>     diff --git a/hw/display/trace-events b/hw/display/trace-events
>     index 0c0ffcbe42..6632344322 100644
>     --- a/hw/display/trace-events
>     +++ b/hw/display/trace-events
>     @@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res,
>     uint64_t size) "res 0x%x, size %" P
>       virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
>       virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
>       virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
>     +virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
>       virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
>       virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
>       virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
>     diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
>     index a29f191aa8..157d280b14 100644
>     --- a/hw/display/virtio-gpu-base.c
>     +++ b/hw/display/virtio-gpu-base.c
>     @@ -216,6 +216,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev,
>     uint64_t features,
>               features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>           }
> 
>     +    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
>     +
>           return features;
>       }
> 
>     diff --git a/hw/display/virtio-gpu-virgl.c
>     b/hw/display/virtio-gpu-virgl.c
>     index 73cb92c8d5..7adb6be993 100644
>     --- a/hw/display/virtio-gpu-virgl.c
>     +++ b/hw/display/virtio-gpu-virgl.c
>     @@ -43,6 +43,10 @@ static void
>     virgl_cmd_create_resource_2d(VirtIOGPU *g,
>           args.nr_samples = 0;
>           args.flags = VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
>           virgl_renderer_resource_create(&args, NULL, 0);
>     +
>     +    struct virtio_gpu_simple_resource *res = g_new0(struct
>     virtio_gpu_simple_resource, 1);
>     +    res->resource_id = c2d.resource_id;
>     +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>       }
> 
>       static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>     @@ -67,6 +71,10 @@ static void
>     virgl_cmd_create_resource_3d(VirtIOGPU *g,
>           args.nr_samples = c3d.nr_samples;
>           args.flags = c3d.flags;
>           virgl_renderer_resource_create(&args, NULL, 0);
>     +
>     +    struct virtio_gpu_simple_resource *res = g_new0(struct
>     virtio_gpu_simple_resource, 1);
>     +    res->resource_id = c3d.resource_id;
>     +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>       }
> 
>       static void virgl_cmd_resource_unref(VirtIOGPU *g,
>     @@ -452,6 +460,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>               /* TODO add security */
>               virgl_cmd_ctx_detach_resource(g, cmd);
>               break;
>     +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
>     +        virtio_gpu_resource_assign_uuid(g, cmd);
>     +        break;
>           case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
>               virgl_cmd_get_capset_info(g, cmd);
>               break;
>     diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>     index 20cc703dcc..67e39fa839 100644
>     --- a/hw/display/virtio-gpu.c
>     +++ b/hw/display/virtio-gpu.c
>     @@ -937,6 +937,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
>           virtio_gpu_cleanup_mapping(g, res);
>       }
> 
>     +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
>     +                                     struct virtio_gpu_ctrl_command
>     *cmd)
>     +{
>     +    struct virtio_gpu_simple_resource *res;
>     +    struct virtio_gpu_resource_assign_uuid assign;
>     +    struct virtio_gpu_resp_resource_uuid resp;
>     +    QemuUUID *uuid = NULL;
>     +
>     +    VIRTIO_GPU_FILL_CMD(assign);
>     +    virtio_gpu_bswap_32(&assign, sizeof(assign));
>     +    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
>     +
>     +    res = virtio_gpu_find_check_resource(g, assign.resource_id,
>     false, __func__, &cmd->error);
>     +    if (!res) {
>     +        return;
> 
> 
> I think we need:
>          cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
> 

That should be already handled by the virtio_gpu_find_check_resource 
function.

>     +    }
>     +
>     +    memset(&resp, 0, sizeof(resp));
>     +    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
>     +
>     +    uuid = g_hash_table_lookup(g->resource_uuids,
>     GUINT_TO_POINTER(assign.resource_id));
>     +    if (!uuid) {
>     +        uuid = g_new(QemuUUID, 1);
>     +        qemu_uuid_generate(uuid);
>     +        g_hash_table_insert(g->resource_uuids,
>     GUINT_TO_POINTER(assign.resource_id), uuid);
>     +    }
>     +
>     +    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
>     +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
>     +}
>     +
>       void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
>                                          struct virtio_gpu_ctrl_command
>     *cmd)
>       {
>     @@ -985,6 +1016,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
>           case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
>               virtio_gpu_resource_detach_backing(g, cmd);
>               break;
>     +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
>     +        virtio_gpu_resource_assign_uuid(g, cmd);
>     +        break;
>           default:
>               cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
>               break;
>     @@ -1343,6 +1377,8 @@ void virtio_gpu_device_realize(DeviceState
>     *qdev, Error **errp)
>           QTAILQ_INIT(&g->reslist);
>           QTAILQ_INIT(&g->cmdq);
>           QTAILQ_INIT(&g->fenceq);
>     +
>     +    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL,
>     g_free);
> 
> 
> hmm, we are missing an unrealize function, we are leaking. Could you 
> look at fixing it?
> 

Thanks for the hint! I submitted PATCH v2.

>       }
> 
>       void virtio_gpu_reset(VirtIODevice *vdev)
>     @@ -1368,6 +1404,10 @@ void virtio_gpu_reset(VirtIODevice *vdev)
>               g_free(cmd);
>           }
> 
>     +    if (g->resource_uuids) {
>     +        g_hash_table_remove_all(g->resource_uuids);
>     +    }
>     +
>           virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
>       }
> 
>     diff --git a/include/hw/virtio/virtio-gpu.h
>     b/include/hw/virtio/virtio-gpu.h
>     index 2e28507efe..41aed312f5 100644
>     --- a/include/hw/virtio/virtio-gpu.h
>     +++ b/include/hw/virtio/virtio-gpu.h
>     @@ -189,6 +189,8 @@ struct VirtIOGPU {
>               QTAILQ_HEAD(, VGPUDMABuf) bufs;
>               VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
>           } dmabuf;
>     +
>     +    GHashTable *resource_uuids;
>       };
> 
>       struct VirtIOGPUClass {
>     @@ -258,6 +260,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
>                                         uint32_t *niov);
>       void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
>                                           struct iovec *iov, uint32_t
>     count);
>     +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
>     +                                     struct virtio_gpu_ctrl_command
>     *cmd);
>       void virtio_gpu_process_cmdq(VirtIOGPU *g);
>       void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
>       void virtio_gpu_reset(VirtIODevice *vdev);
>     -- 
>     2.34.1
> 
> 
> 
> lgtm otherwise
> 
> -- 
> Marc-André Lureau

-- 
Kind regards,
Antonio Caggiano

