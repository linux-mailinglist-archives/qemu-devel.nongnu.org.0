Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AFB5A2B75
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:42:10 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbTF-00012Z-HD
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRayY-0003pb-9B; Fri, 26 Aug 2022 11:10:28 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:40298 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRayV-0004y4-I4; Fri, 26 Aug 2022 11:10:25 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-05 (Coremail) with SMTP id zQCowADX3KRP4ghjEUB5AA--.15513S2;
 Fri, 26 Aug 2022 23:10:09 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 3/3] hw/nvme: add iothread support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220826111834.3014912-4-fanjinhao21s@ict.ac.cn>
Date: Fri, 26 Aug 2022 23:10:06 +0800
Cc: Klaus Jensen <its@irrelevant.dk>, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B37413A3-5A2E-404A-8BB0-DF618FCBE324@ict.ac.cn>
References: <20220826111834.3014912-1-fanjinhao21s@ict.ac.cn>
 <20220826111834.3014912-4-fanjinhao21s@ict.ac.cn>
To: qemu-devel <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowADX3KRP4ghjEUB5AA--.15513S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKryUCF47uw1fuFy3Ar45trb_yoWDGrgEgF
 s8Xas7XayDuw1avw4Y9r1Yqa1ft3yjqr1rG3y5A3Wxt3ykXa1fZr10gF13CayDC345u3W7
 WFW5C3WkA3WqgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
 106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
 xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
 xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
 JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU86OJ5UUUUU==
X-Originating-IP: [221.220.143.85]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

at 7:18 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> @@ -4979,7 +5007,13 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>         }
>     }
>     n->cq[cqid] =3D cq;
> -    cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, =
cq);
> +
> +    if (cq->cqid) {
> +        cq->timer =3D aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, =
SCALE_NS,
> +                                  nvme_post_cqes, cq);
> +    } else {
> +        cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, =
nvme_post_cqes, cq);
> +    }
>=20
>     /*
>      * Only enable irq eventfd for IO queues since we always emulate =
admin
> @@ -4988,6 +5022,13 @@ static void nvme_init_cq(NvmeCQueue *cq, =
NvmeCtrl *n, uint64_t dma_addr,
>     if (cqid && n->params.irq_eventfd) {
>         nvme_init_irq_notifier(n, cq);
>     }
> +
> +    if (cq->cqid) {
> +        cq->timer =3D aio_timer_new(n->ctx, QEMU_CLOCK_VIRTUAL, =
SCALE_NS,
> +                                  nvme_post_cqes, cq);
> +    } else {
> +        cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, =
nvme_post_cqes, cq);
> +    }
> }

Duplicated initialization of cq->timer.=


