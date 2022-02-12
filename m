Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF434B3792
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 20:12:28 +0100 (CET)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIxoo-0000pQ-KQ
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 14:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nIxn6-00007V-D8
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 14:10:40 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:37283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nIxn4-00057A-71
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 14:10:39 -0500
Received: from [192.168.100.1] ([82.142.19.58]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQeDw-1nggwh3ID0-00NgsF; Sat, 12 Feb 2022 20:10:33 +0100
Message-ID: <fb85259b-fa43-844f-2051-35cc1055c41a@vivier.eu>
Date: Sat, 12 Feb 2022 20:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, kraxel@redhat.com,
 mst@redhat.com
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20220211221319.193404-13-chouhan.shreyansh2702@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH 12/25] virtio-snd: Add VIRTIO_SND_R_JACK_INFO handler
In-Reply-To: <20220211221319.193404-13-chouhan.shreyansh2702@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a0MxDgXiIhKUSVyDjASUkxuIyHdMs+efb6y47eW2TBi/lIhuCPr
 zh9NNzDAlGSmm3NiOGWhZQG767JmnfoEOg4pXxrdZVjszrLPTIeOMIYEPlHEBfwJlgVvrPM
 WRz4tp1f7L98rT62uopf1eTWK5WqI1PCuxv7v4oxLI20+nwKMOASQaBoPgukQntslVbts5G
 oCbNePLSCrDvmeWViabLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IkDsa21s/3s=:D7HH02IyqOHdPiSOKoWCT/
 v0qQ8Bjl2BE5wgVlNg8tMp2moae/dU07lbzdVuDKcJhAJv2AgYN4t58GLshXlQNCHYmX0kTCn
 Ih1nnllhsM30dSuimS8RO4M2Q/E3hIziiHmb5aKZjeB5hC7MIRHlXq7dIudg8gYvSCU3VOM55
 Ed1UgGWnzAymD5Zba7P8/QMvrFHEd4fdHs19uRl5j3HhMJ/ilKbZAOVdjCXYrOPG8VMP0bP94
 xTUfzVnwLXqwyNHw3bA/CuoLQKDwtzw//iLyfn+cJuHkpjdUJfwfCR49x6M1dDBWUAwVpEunD
 Rpe6SvNAQgFuJQOFgaip7AjdFuQH9Bxky5bDIKi4H2dLJRxpwEMzbSLo2Z+aI8H9hG9SF7XuF
 27LWsdZJGqHww00GS9Fhz9rLV+T4kGUJz1cs6iEkw6Z5x8Kg++B1QJzmyQRFuliA08T2myPeW
 7zap80Z3SFC8SlBrpr7PRjDN1fXzD8bfaTTfj7HsSJwYMYAS/CIlynsRuJucMSMWQNpnAlMlI
 ms4lvHkXjQV2/9TsIp/9f0eV/AR0RTZ4PgZCyofBZbUJu+uWLlRtpP1T3xdjdD/uWPmKBblsA
 Ln4yHKUHLzMlVAuaqbGOfZz0TFpzua9AJRc5nl9CGd/mWf6gbwU1skpiHJPOrBnGNgPQuJEUv
 mKfQsx7iuVO+PXiryy7hYHG8rWgsI+yogUuYJxf9e1lXBT1x+1DVoJk0kJn1F9uqBa94=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/02/2022 à 23:13, Shreyansh Chouhan a écrit :
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
> ---
>   hw/audio/virtio-snd.c | 81 +++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
> index a87922f91b..c2af26f3cb 100644
> --- a/hw/audio/virtio-snd.c
> +++ b/hw/audio/virtio-snd.c
> @@ -92,6 +92,80 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
>   {
>       return vdev->host_features;
>   }
> +/*
> + * Get a specific jack from the VirtIOSound card.
> + *
> + * @s: VirtIOSound card device.
> + * @id: Jack id
> + */
> +static virtio_snd_jack *virtio_snd_get_jack(VirtIOSound *s, uint32_t id)
> +{
> +    if (id >= s->snd_conf.jacks) {
> +        return NULL;
> +    }
> +    return s->jacks[id];
> +}
> +
> +/*
> + * Handles VIRTIO_SND_R_JACK_INFO.
> + * The function writes the info structs and response to the virtqueue element.
> + * Returns the used size in bytes.
> + *
> + * @s: VirtIOSound card
> + * @elem: The request element from control queue
> + */
> +static uint32_t virtio_snd_handle_jack_info(VirtIOSound *s,
> +                                            VirtQueueElement *elem)
> +{
> +    virtio_snd_query_info req;
> +    size_t sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
> +    assert(sz == sizeof(virtio_snd_query_info));
> +
> +    virtio_snd_hdr resp;
> +
> +    if (iov_size(elem->in_sg, elem->in_num) <
> +        sizeof(virtio_snd_hdr) + req.count * req.size) {
> +        virtio_snd_err("jack info: buffer too small got: %lu needed: %lu\n",
> +                       iov_size(elem->in_sg, elem->in_num),
> +                       sizeof(virtio_snd_hdr) + req.count * req.size);
> +        resp.code = VIRTIO_SND_S_BAD_MSG;
> +        goto done;
> +    }
> +
> +    virtio_snd_jack_info *jack_info = g_new0(virtio_snd_jack_info, req.count);
> +    for (int i = req.start_id; i < req.count + req.start_id; i++) {
> +        virtio_snd_jack *jack = virtio_snd_get_jack(s, i);
> +        if (!jack) {
> +            virtio_snd_err("Invalid jack id: %d\n", i);
> +            resp.code = VIRTIO_SND_S_BAD_MSG;
> +            goto done;
> +        }
> +
> +        jack_info[i - req.start_id].hdr.hda_fn_nid = jack->hda_fn_nid;
> +        jack_info[i - req.start_id].features = jack->features;
> +        jack_info[i - req.start_id].hda_reg_defconf = jack->hda_reg_defconf;
> +        jack_info[i - req.start_id].hda_reg_caps = jack->hda_reg_caps;
> +        jack_info[i - req.start_id].connected = jack->connected;
> +        memset(jack_info[i - req.start_id].padding, 0,
> +               sizeof(jack_info[i - req.start_id].padding));
> +    }
> +
> +    resp.code = VIRTIO_SND_S_OK;
> +done:
> +    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
> +    assert(sz == sizeof(virtio_snd_hdr));
> +
> +    if (resp.code == VIRTIO_SND_S_BAD_MSG) {
> +        g_free(jack_info);
> +        return sz;
> +    }
> +
> +    sz = iov_from_buf(elem->in_sg, elem->in_num, sizeof(virtio_snd_hdr),
> +                      jack_info, sizeof(virtio_snd_jack_info) * req.count);
> +    assert(sz == req.count * req.size);
> +    g_free(jack_info);
> +    return sizeof(virtio_snd_hdr) + sz;
> +}
>   
>   /* The control queue handler. Pops an element from the control virtqueue,
>    * checks the header and performs the requested action. Finally marks the
> @@ -102,6 +176,7 @@ static uint64_t virtio_snd_get_features(VirtIODevice *vdev, uint64_t features,
>    */
>   static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>   {
> +    VirtIOSound *s = VIRTIO_SOUND(vdev);
>       virtio_snd_hdr ctrl;
>   
>       VirtQueueElement *elem = NULL;
> @@ -131,7 +206,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>               /* error */
>               virtio_snd_err("virtio snd ctrl could not read header\n");
>           } else if (ctrl.code == VIRTIO_SND_R_JACK_INFO) {
> -            virtio_snd_log("VIRTIO_SND_R_JACK_INFO");
> +            sz = virtio_snd_handle_jack_info(s, elem);
> +            goto done;
>           } else if (ctrl.code == VIRTIO_SND_R_JACK_REMAP) {
>               virtio_snd_log("VIRTIO_SND_R_JACK_REMAP");
>           } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
> @@ -156,8 +232,9 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>           virtio_snd_hdr resp;
>           resp.code = VIRTIO_SND_S_OK;
>           sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
> -        virtqueue_push(vq, elem, sz);
>   
> +done:
> +        virtqueue_push(vq, elem, sz);
>           virtio_notify(vdev, vq);
>           g_free(iov2);
>           g_free(elem);

This patch has a warning:

.../hw/audio/virtio-snd.c: In function 'virtio_snd_handle_ctrl':
.../include/qemu/iov.h:49:16: error: 'jack_info' may be used uninitialized in this function 
[-Werror=maybe-uninitialized]
    49 |         return iov_from_buf_full(iov, iov_cnt, offset, buf, bytes);
       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...hw/audio/virtio-snd.c:135:27: note: 'jack_info' was declared here
   135 |     virtio_snd_jack_info *jack_info = g_new0(virtio_snd_jack_info, req.count);
       |                           ^~~~~~~~~

Thanks,
Laurent

