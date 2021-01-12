Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B02F3B3D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:55:45 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPlY-0002p9-Ba
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPjf-0000mQ-PS; Tue, 12 Jan 2021 14:53:47 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPje-0008NR-0J; Tue, 12 Jan 2021 14:53:47 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPaQU-1kdsRi3avC-00MdZv; Tue, 12 Jan 2021 20:53:41 +0100
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201210172834.178052-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a028ed7d-e5b5-30af-3acf-57aecab97841@vivier.eu>
Date: Tue, 12 Jan 2021 20:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201210172834.178052-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8qO0rVLaRThd/utssdXcFA41HkEeCRnTYwJLsFbRb7KNJiCaE4W
 apzLdBSdi1LuOn5qmS/+zoV+rSS2gA7OjRblskph4UAMKdL0vtdawV3K9DPHkSQu+10vNKF
 f2rO8xPwB97VopaH5Bvpj6RpkJfyWTsKDFPFJJtgzhxeA8rBNPs3P7Gfu6/6rSboO52nrH0
 Bgy2uJ/7BpNsfXrloDArg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aDzHYhBSo7M=:6aGCHPhoXHEOrfPBkeOCt7
 msNQRtg1STyiCjQWPlGMDvOefRc2K5N7dI5IJU3TZPMgJiG4PRMjtTF0HzgLCqZ59dTVP/8yz
 6CyTCe3tW+l3M6mvFUOJFf9PaILcL/4ecufWfaGN9dSA3bRWWO6jo6B8TzRY165s4ZG7IYgzt
 pjxpqgt22J5WQvJ40N8zimgT9hwVXHGa/QNcEU4glDS7CPNS3n+UeZZkIzUxnHA9d5rcORSyq
 4Dd6KGoPjnOA16Q7DTBdvUbCsBjQM3Yyr4TB7vjI2wJXg10viMn+zuyadgPhifBCOceEMf216
 KTdj4EwugKQgCRXQCBeegp2vFeDAmihS0vHrcplyAXt+0xGFib6OmI7mhgoRTnKJz+QZaMTn9
 keX8DfB7hRSCchG8IXHIy5T956bti7u0x4TlCDAdObQ9iqZHnZvKCkPrx4rPl3vAOGH07NjxD
 QOf5W0VTgQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/12/2020 à 18:28, Philippe Mathieu-Daudé a écrit :
> Replace I/O write error reported with error_report() by
> qemu_log_mask(GUEST_ERROR) which allow filtering.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/virtio-pci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index f863f69ede4..094c36aa3ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -27,6 +27,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> +#include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"
> @@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
>          virtio_queue_set_vector(vdev, vdev->queue_sel, val);
>          break;
>      default:
> -        error_report("%s: unexpected address 0x%x value 0x%x",
> -                     __func__, addr, val);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: unexpected address 0x%x value 0x%x\n",
> +                      __func__, addr, val);
>          break;
>      }
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

