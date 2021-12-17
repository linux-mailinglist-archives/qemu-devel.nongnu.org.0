Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2918478817
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:49:18 +0100 (CET)
Received: from localhost ([::1]:57652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9ra-0001j5-1l
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:49:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9p4-00080H-A9; Fri, 17 Dec 2021 04:46:42 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:53153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9p2-0005u6-Le; Fri, 17 Dec 2021 04:46:42 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBE3k-1mmdDo2U3C-00CmHp; Fri, 17 Dec 2021 10:46:34 +0100
Message-ID: <8c19cee3-d3ea-6a26-c68f-5195cf9e620a@vivier.eu>
Date: Fri, 17 Dec 2021 10:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] hw/virtio/vhost: Fix typo in comment.
Content-Language: fr
To: lagarcia@linux.ibm.com, qemu-trivial@nongnu.org
References: <a10a0ddab65b474ebea1e1141abe0f4aa463909b.1637668012.git.lagarcia@br.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <a10a0ddab65b474ebea1e1141abe0f4aa463909b.1637668012.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JLU0841/ntms43jpLRHDLC0YgftIESBkvoHlnKqL2vbK0DoQBKY
 HXUFB4nE5lZt5jh5tGPHTF9fK3rhrVjIo1ZgZnKlVSrDNja1plEwWX7Xp8BFMsAE4zaRbZg
 dZ2sDmH58Mszm1zou6bvhqdnrz98FZIqJmP6SO3224hHvUTzVScm7q/wiJeuTYdDD+XW1JC
 od3SS7/CgB9sJVMCuHQ3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E4XXD0FyMf4=:vQunIvZrImsCYQYcSEw8E7
 fZW1nlWxqzC0+l3wAu88LIF2c+zUdboxNU8muy8umgfsNNocHZcHq5GytfGgQikCPrXn0r3lX
 6pA8Ts3qzjCtFoG7SvkscqjN9MXcJhhb2IaVe5dQHdfMaSDzWEGAHioXckneZvEmH8EikcHaM
 hXdML0/wmxbWdTqpJMxAlUXmOyIMeJ3ApY4Y+rkoz9NtngLcKaPnA8spy2eDrFmYSSdLapE3V
 lf7p/3c0VrcsvtlMfI0LvNMWH2PEtbEfKzLl7+NmzxvOSABVs61HKEm8B8wjtc+d8E1nhqcCq
 WmQ917TuykE2WbeWM3ETZPx/7Oz+k74FXao91XsYxcg1c3aG0uG/553rGbq+7XPnC1Hwflk/t
 eHkW7TmUYBR34hzHllXktnaGJTDhob4aI98uANMmTIXoyJbMMpiZOjVBTz+b8fT8/pISz5iNo
 RxmWpoMinFELGMKkFUBmerF7nFNVAVUrPZsOLkNlSS0yasSOT3lhLfn99+rcDtgobhnIRZAL4
 HQ+AyTZkJjmRcOf4HgaHOTnxYPFJVVKaAc2XQ1o/4kLQanO5v1lVoSqD6jd+1WVvQtY7p03ob
 UL+1ng/QteddEbU6JmYF8G3OeEIsvcp2/WmwDMPlU+uDE3uzp4MkZMIKLrZSv0iS3UfQX29si
 TmFTSTwMZWefZIxeEuPZ3ZQ50ZS//xfwPsui29SFFJq/VoCbWpFbaYvmVhLJOV5ePZPI=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/11/2021 à 12:48, lagarcia@linux.ibm.com a écrit :
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/virtio/vhost.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 437347ad01..20913cf8fb 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -313,7 +313,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
>        * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
>        * incremental memory mapping API via IOTLB API. For platform that
>        * does not have IOMMU, there's no need to enable this feature
> -     * which may cause unnecessary IOTLB miss/update trnasactions.
> +     * which may cause unnecessary IOTLB miss/update transactions.
>        */
>       return virtio_bus_device_iommu_enabled(vdev) &&
>              virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent



