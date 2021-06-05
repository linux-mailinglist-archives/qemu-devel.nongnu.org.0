Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF06139CAC3
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:36:16 +0200 (CEST)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpc5f-0003fg-Ly
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpc4S-0002fX-94; Sat, 05 Jun 2021 15:35:00 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:37009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpc4Q-0003Ji-Db; Sat, 05 Jun 2021 15:35:00 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MC3H1-1lfU811u9d-00CUgo; Sat, 05 Jun 2021 21:34:52 +0200
Subject: Re: [PATCH v2] vhost-vdpa: Remove redundant declaration of
 address_space_memory
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com, philmd@redhat.com,
 jasowang@redhat.com
References: <20210517123246.999-1-xieyongji@bytedance.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <97d7c8f7-2b49-cb86-57e4-de6e4377bc91@vivier.eu>
Date: Sat, 5 Jun 2021 21:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517123246.999-1-xieyongji@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8L+08pMH0ruyPoxUOX8wok7v5NVebnTX6ykvMZunZXSMjFWZfTU
 RdLv4FVLG3Zti1YUUsttOO5cNLk7PujNhlelJH+nYe/3AS5Dvh/ygOzgbWvIfupBrS/k/XP
 6w7I/WEVu/zfrEhcpLuJJ3Kyma+oWy9gHjB/ApkwS+AxuUOR8yclnUSf3lpS6m+MQC8WnkY
 2sOlIut+iMGgSYXiLH8EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7cjGslOw46E=:FINERTml6XV7PuGwigcwgW
 Y9S+2Ehgc/AYJhDGYWk6LjSYvIB3CZgZfGTKMCi+1KuC3/ai8R4zh0mfFaBQNTGWZ1fmTuksO
 3hOtd1kZpBknf7c2vT99HMtUTUGF/0SJrJDPHnmOO2+MnOG5ZwDmA0p8ex9Lr/7dU/pm7+5IS
 wBnIby3KYuCB3BAEl+izBrUJlgOpElujygJp/Gq0Kg0Snwyy0eLo/fse8k9ncDpBYUuSCO2uA
 XrHzlG1ddnHPIA5LyLOAsyAUKRozqnk/0YrgrBftIJ5+2Wwq/hmbBDf2rSl5eeVMOYpUwgWpt
 319K9yXO1ke6XypFEMopQBUR2pnFDOrmJ1VueXwrhzdgAYfpsJ8xT+eUZKvCJ4XOn6wsjszfZ
 NSQTKeCRwvCwkmCojAwfrP9kt0txhN3vK8bHeKObHHEujfqIIMlMloMgjDJHzfkSt0FFYx5tG
 kuVrj4AK7as+ITmCeQdFaa2ybDjbWNWRJzR5thqJLfrRAt9KDPgWpxaLGm/bjICi7gJD7dSKn
 84ElpupAKfc3dlCV4V82nk=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/05/2021 à 14:32, Xie Yongji a écrit :
> The symbol address_space_memory are already declared in
> include/exec/address-spaces.h. So let's add this header file
> and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.
> 
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 1 +
>  include/hw/virtio/vhost-vdpa.h | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8f2fb9f10b2a..ee51863d280b 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -18,6 +18,7 @@
>  #include "hw/virtio/vhost-backend.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/vhost-vdpa.h"
> +#include "exec/address-spaces.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "trace.h"
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 28ca65018ed7..ae9ee7adb2d0 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -21,5 +21,4 @@ typedef struct vhost_vdpa {
>      struct vhost_dev *dev;
>  } VhostVDPA;
>  
> -extern AddressSpace address_space_memory;
>  #endif
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

