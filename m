Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEE58431F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:32:59 +0200 (CEST)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5VS-0001cM-1R
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oH5Rn-0005Of-6d; Thu, 28 Jul 2022 11:29:11 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:36350 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oH5Rj-00058j-QT; Thu, 28 Jul 2022 11:29:10 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-05 (Coremail) with SMTP id zQCowAB3fLA4q+JiBAjCEw--.4353S2;
 Thu, 28 Jul 2022 23:28:56 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH for-7.1 0/3] hw/nvme: misc ioeventfd fixes
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220728082522.3161739-1-its@irrelevant.dk>
Date: Thu, 28 Jul 2022 23:28:55 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Content-Transfer-Encoding: 7bit
Message-Id: <CD3C62CF-02C3-47F7-8241-2BC9F7975FB2@ict.ac.cn>
References: <20220728082522.3161739-1-its@irrelevant.dk>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowAB3fLA4q+JiBAjCEw--.4353S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY17k0a2IF6F4UM7kC6x804xWl14x267AK
 xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
 6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
 1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
 0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
 80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxE
 wVAFwVW5WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUx-
 B_UUUUU
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

at 4:25 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> From: Klaus Jensen <k.jensen@samsung.com>
> 
> A set of fixes/changes to the ioeventfd support.
> 
> Klaus Jensen (3):
>  hw/nvme: skip queue processing if notifier is cleared
>  hw/nvme: unregister the event notifier handler on the main loop
>  hw/nvme: do not enable ioeventfd by default
> 
> hw/nvme/ctrl.c | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
> 
> -- 
> 2.36.1

Looks good to me as well.

Reviewed-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>


