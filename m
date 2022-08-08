Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C758C18D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 04:25:40 +0200 (CEST)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKsSY-0006HX-Tn
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 22:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oKsQI-00043S-Vv
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 22:23:18 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:44820 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oKsQG-0005Aa-BP
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 22:23:18 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-01 (Coremail) with SMTP id qwCowACX3JyIc_BiTVPvBg--.4236S2;
 Mon, 08 Aug 2022 10:23:05 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
Date: Mon, 8 Aug 2022 10:23:03 +0800
Cc: its@irrelevant.dk,
 kbusch@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <851FC42E-DA19-4142-9AA6-39E2E384F618@ict.ac.cn>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
To: qemu-devel <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowACX3JyIc_BiTVPvBg--.4236S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF1kAw1ktw4xWFyruFyUZFb_yoWDCwc_uF
 ZYkr97Za1kXw4kKw12qws8Xr1agrWIkF1jyFWvvFy2q34IqasFvr4kGr42vrZxt398u3s8
 uFZ8Kr18GFnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbwxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-Originating-IP: [221.220.143.85]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

at 12:35 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
> {
>     if (cq->irq_enabled) {
>         if (msix_enabled(&(n->parent_obj))) {
> +            /* Initialize CQ irqfd */
> +            if (!cq->irqfd_enabled && n->params.ioeventfd && cq->cqid =
!=3D 0) {
> +                int ret =3D nvme_init_cq_irqfd(cq);
> +                if (ret =3D=3D 0) {
> +                    cq->irqfd_enabled =3D true;
> +                }
> +            }
> +

Another question:

In this version I left irqfd initialization to the first assertion of an
irq. But I think it is better to initialize irqfd at cq creation time so =
we
won=E2=80=99t bother checking it at each irq assertion. However if I put =
these code
in nvme_init_cq(), irqfd does not work properly. After adding some
tracepoints I found the MSI messages in MSI-X table changed after
nvme_init_cq(). Specifically, the `data` field does not seem correct at =
the
time when nvme_init_cq() is called.

Keith, you must be familiar with how the nvme driver initializes CQs. =
Could
you give some information on when I can safely use the contents in the =
MSI-X
table?=


