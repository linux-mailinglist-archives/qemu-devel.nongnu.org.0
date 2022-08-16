Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2ED594E52
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 03:56:46 +0200 (CEST)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNloz-0008Cp-8G
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 21:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oNlnZ-0006mt-6U
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:55:17 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:33044 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oNlnV-0006j5-VL
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 21:55:16 -0400
Received: from smtpclient.apple (unknown [159.226.43.11])
 by APP-05 (Coremail) with SMTP id zQCowAAnR3zy+PpiLeqBGQ--.3922S2;
 Tue, 16 Aug 2022 09:54:59 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 0/4] hw/nvme: add irqfd support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
Date: Tue, 16 Aug 2022 09:54:58 +0800
Cc: its@irrelevant.dk,
 Keith Busch <kbusch@kernel.org>,
 stefanha@gmail.com
Content-Transfer-Encoding: 7bit
Message-Id: <BD58CA13-C2BD-42FF-B38E-991C050AD190@ict.ac.cn>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
To: qemu-devel <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAAnR3zy+PpiLeqBGQ--.3922S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr48JF43Zr4rZF1UuF15Arb_yoWkXrbE9F
 10y34rC3WUXanavFyDAF17ZrW8K3yrGw12q3WqqF1IqrWY9r98Wr1vvr1UZFW8XFW5Xr1f
 Xrs8JryfWry2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbwxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-Originating-IP: [159.226.43.11]
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

at 11:37 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> This patch series changes qemu-nvme's interrupt emulation to use event
> notifiers, which can ensure thread-safe interrupt delivery when iothread
> is used. In the first two patches, I convert qemu-nvme's IO emulation
> logic to send irq via eventfd, so that the actual assertion and
> deassertion is always done in the main loop thread with BQL held. In the
> third patch, support is added to send irq via KVM irqfd, bypassing
> qemu's MSI-x emulation. In the last patch, I add MSI-x mask handlers
> when irqfd is enabled so that qemu-nvme knows which vector is masked
> even when qemu's MSI-x emulation is bypassed.
> 
> Jinhao Fan (4):
>  hw/nvme: avoid unnecessary call to irq (de)assertion functions
>  hw/nvme: add option to (de)assert irq with eventfd
>  hw/nvme: use irqfd to send interrupts
>  hw/nvme: add MSI-x mask handlers for irqfd
> 
> hw/nvme/ctrl.c       | 251 +++++++++++++++++++++++++++++++++++++++----
> hw/nvme/nvme.h       |   7 ++
> hw/nvme/trace-events |   3 +
> 3 files changed, 243 insertions(+), 18 deletions(-)
> 
> -- 
> 2.25.1

Ping~

Thanks!


