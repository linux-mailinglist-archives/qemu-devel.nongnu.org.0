Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6515EFDA4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:11:20 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odywI-0001W3-Mt
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odytq-0008KO-N9; Thu, 29 Sep 2022 15:08:48 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odyto-00059j-0Y; Thu, 29 Sep 2022 15:08:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6KpF-1pJGrz2RAn-016c4R; Thu, 29 Sep 2022 21:08:34 +0200
Message-ID: <4190fa52-e785-e780-0d41-cb51f8d9e1cc@vivier.eu>
Date: Thu, 29 Sep 2022 21:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] hw/virtio/vhost-shadow-virtqueue: Silence GCC error
 "maybe-uninitialized"
Content-Language: fr
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220910151117.6665-1-shentey@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220910151117.6665-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GT2/AZsiuumhkCx70Bid2+HhaVQNAJpgYJECVw5DhedcxJzmcGB
 Y8bidFO4aYY6yvWs/HvviaZ4UZgXmeFyn8wF7cMaddO9oe3DDCkIrHF5ncCIRx+t+ADzxTH
 7Dywh6xJ8yKvVKQSQtkuthh9snkF7fq09vLvYW20s/dLeTl0PtxGxTDV/NYz619eFXC3KR5
 qnTMhPQ0M/mO5Ol0z+BTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ULmHLlA7A0g=:gmAlA+3Y17L26JJBai127M
 bWyY27geC3NnIRrRvJKYFzEaF7AjObZ4pIoUxlYObDOTLROiTwV3LkAtM1PSoRXeqPLF7vuQ+
 dF3+DDtbj4dWNQERTW7g9wx76cyN3lTuiGys8R+X353AvVluNOMxFSU608GrOvbWUo3/arEEU
 26dSlc9DcZVwsyCRbpQmTxKiL9nD/ypSF57MZ0TctVC2iNxqS55j2uePAWM1z+fOe93VHlPVX
 IGICnvYWPWUmGVU/a0+eL6MchobQYkzpEBjXgIwy/K+5OYRRqtLlJbVQSNGa3MkksEaX0jt7C
 LDSTSg5LuKps/JCFm2v7Vn0w+24RS7vT5vtFCAQhUObOkXVUsy/ZjnHer40W4AiLuXQ3Fsar7
 NgJ1MyRzJA6IsUrnGPsnTOPUO1oiqwuvR5k614UlTWcs0eVQ5pIyuD90S9/hI5HjRNeVhtTI4
 sCcH22NVQBUS4UXqRYWc6jNUJCC5RsQzcniUGflEs/dS9SbS4xi5UKfwqxqWXTpVgUZL6cNS3
 uFZ2VRP9UwpCs6AeWbuPQnJMiPy7OQIcd8bl3VN/ufgl8DpbwkRxgTre7e1+18mO3+voZdPIj
 svRyzQekBWDOFtnB6YhtyAZzDstJD/zfkkcZZntH3a3Wq2GI2DKRyQQM1Uv6A/UqoAQkjSEBC
 z8/Gu7NIOnyKJiCImCTKQKVO352SO7MtmPRA1KZOGXUiujH4vKzxqCZifLOS09nurc2Y5NCB9
 OaLAilYGMyxg0Z5te52t/D4N/BnLdC4UVn9YSrQMRKxcbdM6dhQlfrOc4yRjjywe4Y3Oz328A
 y4qwY3R
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 10/09/2022 à 17:11, Bernhard Beschow a écrit :
> GCC issues a false positive warning, resulting in build failure with -Werror:
> 
>    In file included from /usr/include/glib-2.0/glib.h:114,
>                     from src/include/glib-compat.h:32,
>                     from src/include/qemu/osdep.h:144,
>                     from ../src/hw/virtio/vhost-shadow-virtqueue.c:10:
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>        inlined from ‘vhost_handle_guest_kick’ at ../src/hw/virtio/vhost-shadow-virtqueue.c:292:42:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘elem’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_handle_guest_kick’:
>    ../src/hw/virtio/vhost-shadow-virtqueue.c:292:42: note: ‘elem’ was declared here
>      292 |             g_autofree VirtQueueElement *elem;
>          |                                          ^~~~
>    cc1: all warnings being treated as errors
> 
> There is actually no problem since "elem" is initialized in both branches.
> Silence the warning by initializig it with "NULL".
> 
> $ gcc --version
> gcc (GCC) 12.2.0
> 
> Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer elem ownership in vhost_handle_guest_kick")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index e8e5bbc368..596d4434d2 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -289,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
>           virtio_queue_set_notification(svq->vq, false);
>   
>           while (true) {
> -            g_autofree VirtQueueElement *elem;
> +            g_autofree VirtQueueElement *elem = NULL;
>               int r;
>   
>               if (svq->next_guest_avail_elem) {

Applied to my trivial-patches branch.

Thanks,
Laurent


