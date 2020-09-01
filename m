Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCF258C42
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 12:03:25 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD38O-0002nH-GC
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 06:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD34d-0005KP-Ia; Tue, 01 Sep 2020 05:59:31 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD34b-0004T6-Mb; Tue, 01 Sep 2020 05:59:31 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTRIg-1k131S21lM-00TjQv; Tue, 01 Sep 2020 11:59:14 +0200
Subject: Re: [PATCH v3 05/10] hw/virtio/vhost-user:Remove dead assignment in
 scrub_shadow_regions()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
 <20200827110311.164316-6-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ef4df6da-ce4d-a834-7fa2-9b070e85d045@vivier.eu>
Date: Tue, 1 Sep 2020 11:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827110311.164316-6-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ds7Uu46sB+KomZkRFrjwYOzMweJAWscMYLm26l5u5gznVYAVFNH
 y0Ws6qzFnZwNZw9dom72DyNkuVSGhqpkYIkaImPp8Rprb+LAYyMwSG7SI8jJW6N0MgLA1Co
 dIlj8/44WEsqp1N1UvxMiJmeLlDKUkTJm21oD1ilSAqVq1f4F8TEiuJjE/1LiP/1Q/TF03d
 D8hnNmmnQwCkC4lESwJlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qqibe/VkjZE=:4L0DNvWE89Yy4WbRwyo/r5
 idw7rZvpMhM1sgz/hmKV0gT96ENMp2XTC0eyMkxtaIzGo2BNNtpuE7WBSEGjC5Gq2Hdg3byyk
 /Jwe1fbe6g8sDide5Nbbpw3ERPpjn0eYswC76m5KGlOfcj2mYLfNCMCDrxmcB6pBfceByd9Wu
 O1HPROfzrxzxeH+Bk7xvW16545rlIaBNu5L0XhoWoTof6P3aFUzDd3zvtu91aH8+iLxFxrnqx
 6+e0dYFvW0OjlfV5CSNyhU/zcJxmv9QuIbbQkg0slMey0dAO6xCr2EJA6FMTrAdBfuIM+tBzJ
 k0V4wBFBx2yZtXf4t5E8GP8k2Yo535B2cCEqDroSiQb++6bAljuWVDCKM7QLosa8Li+0ipTX8
 OmNKI1qwEv6Pbwc3oN0xAaddXdB4FvydQurMh3JQGATDfjm18j9SBnQ+HtG8pLftRIdsLcybS
 Lib0CGIURJ+S3aDRgocYK1Fmug5RHwDAg4Fe1QrkiXSd69tuede+aMl3nKAVlfFib6HVWFzPV
 o74EMWGkvsTE/TBSKq2i+EXs/BJSgtdt1U0wpDYA+0JwAzGP3SefSV0LrMAT0mOgGDlWlUeFS
 cBRifkBZ7SeiDZgPGh5JHc0Ds8pdi3oK70C7DIXNRG/251Ey9Uja1kCHDmwR6yaovE1KRY79+
 YptHxHN+kISSh+TcgNXjhqy6gt4I/t92kwno1CVeV0hutzUCeiXHuES1geGehsLOEn1sAOpUL
 MEbnN/ndw6volZoCplxLTR6t4zQRYQBl22n1ZqulTtWYeWhhH8cEwsrkVv1c+CrntLr1Vmc9C
 rzFFhNdeGoiotlley3J+zyN4RJ/yYOJc/88tVQm9GXuPItswwv9Uh1znhUYdTRfOJ71/GcU
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:59:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
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
Cc: Euler Robot <euler.robot@huawei.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, pannengyuan@huawei.com,
 zhang.zhanghailiang@huawei.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/08/2020 à 13:03, Chen Qun a écrit :
> Clang static code analyzer show warning:
> hw/virtio/vhost-user.c:606:9: warning: Value stored to 'mr' is never read
>         mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
>         ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  hw/virtio/vhost-user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index d7e2423762..9c5b4f7fbc 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -603,7 +603,7 @@ static void scrub_shadow_regions(struct vhost_dev *dev,
>       */
>      for (i = 0; i < dev->mem->nregions; i++) {
>          reg = &dev->mem->regions[i];
> -        mr = vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
> +        vhost_user_get_mr_data(reg->userspace_addr, &offset, &fd);
>          if (fd > 0) {
>              ++fd_num;
>          }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


