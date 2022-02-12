Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FA4B379E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 20:23:35 +0100 (CET)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIxza-0006OR-1P
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 14:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nIxxC-0005ZO-FL
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 14:21:06 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:37531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nIxxA-0000Wq-8t
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 14:21:06 -0500
Received: from [192.168.100.1] ([82.142.19.58]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M4aEC-1nKce5354I-001gsZ; Sat, 12 Feb 2022 20:20:59 +0100
Message-ID: <e46f8443-de0d-6078-4e61-28f7b9576413@vivier.eu>
Date: Sat, 12 Feb 2022 20:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 14/25] virtio-snd: Add VIRTIO_SND_R_PCM_INFO handler
Content-Language: fr
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, kraxel@redhat.com,
 mst@redhat.com
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20220211221319.193404-15-chouhan.shreyansh2702@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220211221319.193404-15-chouhan.shreyansh2702@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ekfPnrjeNarWg58Odg/w1NeNrS3r8cW5lo6hZ4pItiU/0A9AJfy
 r7rdQO9bh25OWHpjnSrw9oEDfmiWNlY2zJo/U3fDs26rNXGMYfFUBBgRjOOSpFaweY4xwcg
 GBHtMoTmna86+zTE+NFuObJPoEBNM5M8O6s9F0anFg8VwiktgeTM1vlXeJRM/4+ejIKq/+D
 KZROsSuU746jZ1Aqnef0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xDHjyJAyFIQ=:oE+rkSt+Bpk0+0cRAvygmn
 HDcGkGOIKqOCRQ5U9j47R0eyWSmM56bPBN7gb7v5qAp5uvmnf/QerMvY1jTI7DIaXh49MEaRz
 mJ/8iUc7DMJokjCg1UUkcVmbLRTmgGnpey2/SQFPthO6Eki4qMIB239HmkWn8B94+FsdHtzWO
 P9xkHQK33/mpl38zaXcnergRfOAdHyUaSrSzrFWiVtrQd4g9v4x8hfU8nmwvpBrJUsoKafokY
 Aapewqu+9U080tFymIzzppbTSUvZC96rpfeZjNofHdP+SUSEdO43tGYvKCTurEJTgeCTsesnw
 9yDPtNZ0aVUBvvUvdq1XVTBilVPM738BS3HoCGaEel3shoYKURnLy6Gan/Q7Rrx0vFWuCpbzV
 ATNiLUMOMPqSoOxFBPqbQ6GkJDv1gTlcV1+IvsFqf+tlAe8nV/Dg0YHonr8h6qqt+noRO8nz3
 UqK+sQs44gBapRftIyYx6QWtED81nG2IURgCpB5wjz76o4lOwnUvHJJCWAj+YMgYTV+WZl66h
 OfDDd6vspR+QiZYlGIo7YekK0fyC8F/oLPkgqpLH8ijnf8tWphtKGbp5K6ryc1itttRyIjIZN
 Vb/k9RMVBfiT35Bh8vZEyDP+qbQgyuSFj2iIKFG1dG2jocuPWQBQhipPo4q2yLoMwzTP5NvQ8
 MiTkE2oGM6PUBcQ+qqapoDP5N17gwZ5h66o8xRKoAORLtQVr1xXNysWbP3x+vyy2x4lU=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
>   hw/audio/virtio-snd.c | 88 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/audio/virtio-snd.c b/hw/audio/virtio-snd.c
> index aec3e86db2..a53a6be168 100644
> --- a/hw/audio/virtio-snd.c
> +++ b/hw/audio/virtio-snd.c
> @@ -188,6 +188,91 @@ static uint32_t virtio_snd_handle_jack_remap(VirtIOSound *s,
>       return sz;
>   }
>   
> +/*
> + * Get a specific stream from the virtio sound card device.
> + *
> + * @s: VirtIOSound card device
> + * @stream: Stream id
> + *
> + * Returns NULL if function fails.
> + * TODO: Make failure more explicit. Output can be NULL if the stream number
> + *       is valid but the stream hasn't been allocated yet.
> + */
> +static virtio_snd_pcm_stream *virtio_snd_pcm_get_stream(VirtIOSound *s,
> +                                                        uint32_t stream)
> +{
> +    if (stream >= s->snd_conf.streams) {
> +        virtio_snd_err("Invalid stream request %d\n", stream);
> +        return NULL;
> +    }
> +    return s->streams[stream];
> +}
> +
> +/*
> + * Handle the VIRTIO_SND_R_PCM_INFO request.
> + * The function writes the info structs to the request element.
> + * Returns the used size in bytes.
> + *
> + * @s: VirtIOSound card device
> + * @elem: The request element from control queue
> + */
> +static uint32_t virtio_snd_handle_pcm_info(VirtIOSound *s,
> +                                           VirtQueueElement *elem)
> +{
> +    virtio_snd_query_info req;
> +    uint32_t sz;
> +    sz = iov_to_buf(elem->out_sg, elem->out_num, 0, &req, sizeof(req));
> +    assert(sz == sizeof(virtio_snd_query_info));
> +
> +    virtio_snd_hdr resp;
> +    if (iov_size(elem->in_sg, elem->in_num) <
> +        sizeof(virtio_snd_hdr) + req.size * req.count) {
> +        virtio_snd_err("pcm info: buffer too small, got: %lu, needed: %lu\n",
> +                iov_size(elem->in_sg, elem->in_num),
> +                sizeof(virtio_snd_pcm_info));
> +        resp.code = VIRTIO_SND_S_BAD_MSG;
> +        goto done;
> +    }
> +
> +    virtio_snd_pcm_stream *stream;
> +    virtio_snd_pcm_info *pcm_info = g_new0(virtio_snd_pcm_info, req.count);
> +    for (int i = req.start_id; i < req.start_id + req.count; i++) {
> +        stream = virtio_snd_pcm_get_stream(s, i);
> +
> +        if (!stream) {
> +            virtio_snd_err("Invalid stream id: %d\n", i);
> +            resp.code = VIRTIO_SND_S_BAD_MSG;
> +            goto done;
> +        }
> +
> +        pcm_info[i - req.start_id].hdr.hda_fn_nid = stream->hda_fn_nid;
> +        pcm_info[i - req.start_id].features = stream->features;
> +        pcm_info[i - req.start_id].formats = stream->formats;
> +        pcm_info[i - req.start_id].rates = stream->rates;
> +        pcm_info[i - req.start_id].direction = stream->direction;
> +        pcm_info[i - req.start_id].channels_min = stream->channels_min;
> +        pcm_info[i - req.start_id].channels_max = stream->channels_max;
> +
> +        memset(&pcm_info[i].padding, 0, sizeof(pcm_info[i].padding));
> +    }
> +
> +    resp.code = VIRTIO_SND_S_OK;
> +done:
> +    sz = iov_from_buf(elem->in_sg, elem->in_num, 0, &resp, sizeof(resp));
> +    assert(sz == sizeof(virtio_snd_hdr));
> +
> +    if (resp.code == VIRTIO_SND_S_BAD_MSG) {
> +        g_free(pcm_info);
> +        return sz;
> +    }
> +
> +    sz = iov_from_buf(elem->in_sg, elem->in_num, sizeof(virtio_snd_hdr),
> +                      pcm_info, sizeof(virtio_snd_pcm_info) * req.count);

Same problem here:

In file included from ../../../Projects/qemu-next/hw/audio/virtio-snd.c:7:
.../hw/audio/virtio-snd.c: In function 'virtio_snd_handle_ctrl':
.../include/qemu/iov.h:49:16: error: 'pcm_info' may be used uninitialized in this function 
[-Werror=maybe-uninitialized]
    49 |         return iov_from_buf_full(iov, iov_cnt, offset, buf, bytes);
       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.../hw/audio/virtio-snd.c:238:26: note: 'pcm_info' was declared here
   238 |     virtio_snd_pcm_info *pcm_info = g_new0(virtio_snd_pcm_info, req.count);
       |                          ^~~~~~~~

> +    assert(sz == req.size * req.count);
> +    g_free(pcm_info);
> +    return sizeof(virtio_snd_hdr) + sz;
> +}
> +
>   /* The control queue handler. Pops an element from the control virtqueue,
>    * checks the header and performs the requested action. Finally marks the
>    * element as used.
> @@ -233,7 +318,8 @@ static void virtio_snd_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>               sz = virtio_snd_handle_jack_remap(s, elem);
>               goto done;
>           } else if (ctrl.code == VIRTIO_SND_R_PCM_INFO) {
> -            virtio_snd_log("VIRTIO_SND_R_PCM_INFO");
> +            sz = virtio_snd_handle_pcm_info(s, elem);
> +            goto done;
>           } else if (ctrl.code == VIRTIO_SND_R_PCM_SET_PARAMS) {
>               virtio_snd_log("VIRTIO_SND_R_PCM_SET_PARAMS");
>           } else if (ctrl.code == VIRTIO_SND_R_PCM_PREPARE) {


