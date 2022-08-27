Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDA5A35DC
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:33:17 +0200 (CEST)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRrFk-0007ob-4g
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRrBl-0005U9-63; Sat, 27 Aug 2022 04:29:09 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:46890 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRrBi-0001Qc-51; Sat, 27 Aug 2022 04:29:08 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-01 (Coremail) with SMTP id qwCowACHjCDE1QljeH6iAA--.3810S2;
 Sat, 27 Aug 2022 16:28:53 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
Date: Sat, 27 Aug 2022 16:28:51 +0800
Cc: qemu-devel@nongnu.org, its@irrelevant.dk, stefanha@gmail.com,
 Klaus Jensen <k.jensen@samsung.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <51168A9F-B342-47E5-B1EB-824B85772811@ict.ac.cn>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
 <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
 <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowACHjCDE1QljeH6iAA--.3810S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1fury7Xr1kAw15Jry7KFg_yoWkJFc_uF
 4SqFn7Cr48AFZFqa4DJw13Zr1jga4rXFyFvw17JF93X3s3X34kuwn2vrsayr4UGrW0gr9r
 uFn2gw1Sv3y2kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbwkYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8pnQUUUUUU==
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

at 11:34 PM, Keith Busch <kbusch@kernel.org> wrote:

> On Fri, Aug 26, 2022 at 11:12:04PM +0800, Jinhao Fan wrote:
>> Use KVM's irqfd to send interrupts when possible. This approach is
>> thread safe. Moreover, it does not have the inter-thread =
communication
>> overhead of plain event notifiers since handler callback are called
>> in the same system call as irqfd write.
>>=20
>> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> No idea what's going on here... This one is causing the following =
assert
> failure with --enable-kvm:
>=20
>  qemu-system-x86_64: ../accel/kvm/kvm-all.c:1781: =
kvm_irqchip_commit_routes: Assertion `ret =3D=3D 0' failed.
>=20
> I find it calls KVM_SET_GSI_ROUTING ioctl with gsi set to =
KVM_IRQ_ROUTING_MSI,
> and linux kernel returns EINVAL in that case. It's never set that way =
without
> this patch. Am I the only one seeing this?

nvme_start_ctrl() registers MSI-X masking handlers without checking
irq-eventfd. This causes nvme_kvm_vector_unmask() to be called when it =
is
not supposed to.=


