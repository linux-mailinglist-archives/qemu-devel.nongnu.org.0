Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1FB50FBAF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:06:50 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJ1s-0004jQ-OP
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njIXG-0000EZ-2v; Tue, 26 Apr 2022 06:35:19 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njIXD-0007pJ-5n; Tue, 26 Apr 2022 06:35:08 -0400
Received: from [192.168.100.1] ([82.142.9.138]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSLEm-1nL3Yk04Do-00SdKk; Tue, 26 Apr 2022 12:35:02 +0200
Message-ID: <735751c6-c230-5013-7a65-0d210094fd74@vivier.eu>
Date: Tue, 26 Apr 2022 12:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] vdpa: Add missing tracing to batch mapping functions
Content-Language: fr
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220405063628.853745-1-eperezma@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220405063628.853745-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TQ08cczoIqRhfYX3Bl1xgcH2ir5QXFf5iG0EE46yYo8EmkY8lc+
 +AVW26RJULpVWicQhA6oUx4VftMrLLcZBthUH/TUOH5w9tuMWyedPJRS5BuWAyrQyKrIvW2
 caQJhYH1sPxblUYBeWQdpsmRgj4O77J6AFHIhYm0Pt/r4YqNThhk6n749Q1HgH55oBaGs66
 tjqk23DBZlwumvQD0ed0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IOrkHfOVDms=:tvZLdUvSGGgNg/08qIKmC+
 +qzUEnnzyPEEO2mW7bXgk+C3L0RO7xnVt0Q8yduxucpC0+snTLXajzpF5WGDJro584sKWlV8n
 3DG3BDJU0c4YGY99QQI2wx7pQQwf1keyuijoygcL2VAb8qbEE4R+goZ4Dwk+W0HOYXPUkRQzx
 duu46/hUJCAlvMJGb9iipg8rdlIjELGnbJ7Vkce3A7Odgcq77iVhd+PKDPP+rjgJ1iju6tV05
 ZKKrdVSOifUMBZ2YE5HSnmresjYYoW/V0peW2hGYNIphynWOVZ64fcvJYcLIYdLoLDO7bJbt0
 739LB3R6+65VXAZjJvFoWgsp3XpFsTPZwPCJPl7vH1rJHqPro89TZrgCfzww/i1dF+S/1ALKi
 OaEe3wjgWeDscS1/dOKFAmTU8lEl+g4sE/YyDNow8UJswbOCJipNeLlA3AwHCMtw1gzIACyKl
 M+aCb/NiPvMw14a5sqhgr/3ym88w7hqIZUu3YGvpcNTs3WDWSlbxRPAew0vVCDrCGV80CzsCg
 KYX0hlxI9JJjWS4BtfmHKzUJZDNgYLuOY60zxR9gUCQXznghJ1Prvl5s+PUEvqh0G0xxl29eJ
 tdB2N21gGfS4EYfh6Hc0Bv/7AjJz8+GT9BA9Qw7ahhgh5WHhgYcBNwaEc1AQM/4p6VOumOtjt
 pYLLjCeY/fFlPVFCq83lnWbKsT6X6oa0K7sDghiL/l5wtmlDCq9QOvE86ryTGLM4A5Gk=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/04/2022 à 08:36, Eugenio Pérez a écrit :
> These functions were not traced properly.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 2 ++
>   hw/virtio/trace-events | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8adf7c0b92..9e5fe15d03 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -129,6 +129,7 @@ static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
>           .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
>       };
> 
> +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>                        fd, errno, strerror(errno));
> @@ -163,6 +164,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>       msg.type = v->msg_type;
>       msg.iotlb.type = VHOST_IOTLB_BATCH_END;
> 
> +    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>                        fd, errno, strerror(errno));
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index a5102eac9e..333348d9d5 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -25,6 +25,8 @@ vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"
>   # vhost-vdpa.c
>   vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
>   vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> +vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> +vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
>   vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
>   vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
> --
> 2.27.0
> 
> 

Applied to my trivial-patches branch.

(I know you have an (identicial) v7 of this patch in a series, but as this one is reviewed, acked 
and sent to trivial I've merged it).


Thanks,
Laurent



