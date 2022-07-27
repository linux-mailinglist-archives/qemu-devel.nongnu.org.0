Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA0581DD4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 04:58:46 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGXG1-0001tx-4d
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 22:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGXEK-0000Vb-N7
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 22:57:00 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:38304 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oGXEH-0006oi-9i
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 22:57:00 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-01 (Coremail) with SMTP id qwCowABHjZ1jqeBixyHhAg--.3679S2;
 Wed, 27 Jul 2022 10:56:36 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: Add iothread support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YuAtWPjAu2j+ttvo@kbusch-mbp.dhcp.thefacebook.com>
Date: Wed, 27 Jul 2022 10:56:35 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1FBBC9E0-81BD-47EA-92A0-DDBFDFDFA33F@ict.ac.cn>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
 <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
 <Yt/+GfYPyeM4gFdq@kbusch-mbp.dhcp.thefacebook.com>
 <2606E835-E12F-4AE2-8CBC-7267016AAB7B@ict.ac.cn>
 <YuAtWPjAu2j+ttvo@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowABHjZ1jqeBixyHhAg--.3679S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWfXF4xXr45Ww4kAry7Jrb_yoW3XFbE9F
 n5uayfGa17Z3yY9Fy5KrnrAr47J3yxXryFv39FvryYg39YqF95trnagr45u3WrXFWkXFyr
 GrWqqr1Fvry8WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbwxYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUc_-PUUUUU
X-Originating-IP: [159.226.43.13]
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

at 2:07 AM, Keith Busch <kbusch@kernel.org> wrote:

> MSI-x uses MMIO for masking, so there's no need for an NVMe specific =
way to
> mask these interrupts. You can just use the generic PCIe methods to =
clear the
> vector's enable bit. But no NVMe driver that I know of is making use =
of these
> either, though it should be possible to make linux start doing that.

I believe we need to handle MSI-x masking in the NVMe controller after =
we
switch to irqfd. Before that QEMU=E2=80=99s MSI-x emulation logic helps =
us handle
masked interrupts. But with irqfd, we bypass QEMU=E2=80=99s MSI-x and =
let the kernel
send the interrupt directly. Therefore qemu-nvme needs to do some
bookkeeping about which interrupt vectors are masked.
msix_set_vector_notifiers helps us do that.=


