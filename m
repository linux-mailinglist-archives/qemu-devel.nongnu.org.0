Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9472C5A1E86
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 04:06:52 +0200 (CEST)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oROkF-0008Qu-5r
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 22:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oROhb-0006te-Cp; Thu, 25 Aug 2022 22:04:07 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39486 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oROhY-0003w8-NP; Thu, 25 Aug 2022 22:04:07 -0400
Received: from smtpclient.apple (unknown [159.226.43.11])
 by APP-05 (Coremail) with SMTP id zQCowACXnqYIKghjSTFIAA--.8431S2;
 Fri, 26 Aug 2022 10:03:52 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3 0/2] hw/nvme: add irqfd support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220825201454.259190-1-its@irrelevant.dk>
Date: Fri, 26 Aug 2022 10:03:51 +0800
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, stefanha@gmail.com,
 Klaus Jensen <k.jensen@samsung.com>
Content-Transfer-Encoding: 7bit
Message-Id: <22035CA1-E374-4DB7-809C-569E5BC41DC0@ict.ac.cn>
References: <20220825201454.259190-1-its@irrelevant.dk>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowACXnqYIKghjSTFIAA--.8431S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1UZFWUAF4xAF1xGFy3Jwb_yoW8Xw15pF
 W5WwnY9Fn7t34xuw4avr47AF15J395WrW5t3Z7G3W7Ar98Cr9FkFyjyF4Fvay5Gr4fWa95
 ZryIqr4Uua43ZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8JwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2a9aDUUUU
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

at 4:14 AM, Klaus Jensen <its@irrelevant.dk> wrote:

> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This is a re-spin of Jinhao's irqfd support series that fixes msix
> vector masking/unmasking to work correctly.
> 
> I kept being bugged out about that msi route not getting updated, so I
> hit the code into submission with a hammer.
> 
> I finally noticed the core issue:
> 
>  1. The vector notifiers was never set because msix is not enabled at
>     the point where nvme_init_pci() is called.
> 
>     Move this call to nvme_start_ctrl().
> 
> Since the unmask callback was suddenly getting called now, another fix
> was needed:
> 
>  2. Call kvm_irqchip_add_irqfd_notifier_gsi() in the unmask handler -
>     not in nvme_init_irq_notifier(). The vectors may potentially be
>     masked/unmasked and shall cause a pair of add_irqfd and
>     remove_irqfd calls. Removing it from nvme_init_irq_notifier() makes
>     sure we do not try to double add.
> 
> Now it does what it is supposed to; no hacks required :)
> 
> Jinhao Fan (2):
>  hw/nvme: support irq(de)assertion with eventfd
>  hw/nvme: use KVM irqfd when available
> 
> hw/nvme/ctrl.c       | 261 ++++++++++++++++++++++++++++++++++++++++---
> hw/nvme/nvme.h       |   6 +
> hw/nvme/trace-events |   3 +
> 3 files changed, 253 insertions(+), 17 deletions(-)
> 
> -- 
> 2.37.2

This patch series works well on my machine without a vIOMMU. 

Just to confirm my understanding, the workflow of updating msi route is:
Host driver update MSI msg and addr -> unmask callback get called ->
kvm_irqchip_update_msi_route() does the work. Right?



