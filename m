Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A035FE839
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 06:52:00 +0200 (CEST)
Received: from localhost ([::1]:32816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojCfu-0005zB-UP
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 00:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1ojCdS-0004J9-NH
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 00:49:26 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:37548 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1ojCdQ-0006tb-8G
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 00:49:26 -0400
Received: from smtpclient.apple (unknown [159.226.43.11])
 by APP-05 (Coremail) with SMTP id zQCowACnrbVE6khj0PDrBA--.44456S2;
 Fri, 14 Oct 2022 12:49:09 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 0/3] iothread and irqfd support
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <CAJSP0QXu_cG6ErLZMsmdPc2iGtMCRKD8Kxp4vQQ8fjHLgORJhA@mail.gmail.com>
Date: Fri, 14 Oct 2022 12:49:06 +0800
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-devel <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <DFDEAF7C-5664-4E99-9877-7A499AB16EBA@ict.ac.cn>
References: <20220826111834.3014912-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QViGDCNrdPNPnT87go=ofCxTE7cWMGHFnOH5v+8rw8BGA@mail.gmail.com>
 <Y0bRsLWaSaUnPFqM@cormorant.local>
 <ce082eb5-e362-87f7-c4fc-bc786515017c@ict.ac.cn>
 <CAJSP0QXu_cG6ErLZMsmdPc2iGtMCRKD8Kxp4vQQ8fjHLgORJhA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowACnrbVE6khj0PDrBA--.44456S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5W7k0a2IF6F4UM7kC6x804xWl14x267AK
 xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
 6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gc
 CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
 r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
 Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
 6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeXdbUUUUU=
X-Originating-IP: [159.226.43.11]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I also came across the Interrupt Coalescing feature in NVMe (5.21.1.8 in
Spec 1.4c). It seems to suggest an algorithm based on thresholds for the
maximum interrupt delay time and minimum number of coalesced interrupts.

Klaus, based on your experience, how does this algorithm work? Is is
commonly used by controllers and drivers?


